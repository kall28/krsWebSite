<%@ WebHandler Language="C#" Class="ProcessAcc" %>

using System;
using System.Web;
using System.Web.SessionState;

using Lib.Adapter.Security;
using Lib.Adapter.Security.Entities;
using Lib.Client.Entities;
using Lib.Client.Entities.Ent;
using Lib.Client.Entities.Requests.Org;
using Lib.Client.Entities.Vrf;
using Lib.Common.Entities;
using Lib.Common.Helpers;
using Lib.Common.Logger;
using Lib.Model;

public class ProcessAcc : IHttpHandler, IRequiresSessionState
{

	public void ProcessRequest(HttpContext context)
	{
		WebModel webModel = new WebModel();
		ErrorTrace errorTrace = new ErrorTrace();
		try
		{
			switch (context.Request["mode"].ToString())
			{
				case "cst-signin":
					if (context.Request["userName"] != null && context.Request["pwd"] != null)
					{
						if (context.Request["userName"].Trim() != string.Empty
							&& RegexHelper.IsEmail(context.Request["userName"].Trim()))
						{
							if (context.Request["pwd"].Trim() != string.Empty)
							{
								errorTrace = SignInUser(context.Request["userName"].Trim(),
									context.Request["pwd"].Trim());
							}
							else
							{
								errorTrace.ErrDescription.SetErrorDescription(301, "Please enter Password.");
							}
						}
						else
						{
							errorTrace.ErrDescription.SetErrorDescription(301, "Please enter your Email.");
						}
					}
					else
					{
						errorTrace.ErrDescription.SetErrorDescription(301, "Please enter your Email and Password.");
					}
					break;
				case "cst-verify":
					if (context.Request["firstName"] != null && context.Request["lastName"] != null && context.Request["email"] != null
							&& context.Request["mobileNo"] != null && context.Request["pwd"] != null)
					{
						if (context.Request["email"].Trim() != string.Empty
							&& RegexHelper.IsEmail(context.Request["email"].Trim()))
						{
							if (context.Request["mobileNo"].Trim() != string.Empty
							&& RegexHelper.IsMobile(context.Request["mobileNo"].Trim()))
							{
								if (context.Request["pwd"].Trim() != string.Empty)
								{
									errorTrace.ErrDescription = VerifyNewUser(
										context.Request["firstName"].Trim(), context.Request["lastName"].Trim(),
										context.Request["email"].Trim(), context.Request["mobileNo"].Trim(),
										context.Request["pwd"].Trim());									
								}
								else
								{
									errorTrace.ErrDescription.SetErrorDescription(301, "Please enter Password.");
								}
							}
							else
							{
								errorTrace.ErrDescription.SetErrorDescription(301, "Please enter your Mobile No.");
							}
						}
						else
						{
							errorTrace.ErrDescription.SetErrorDescription(301, "Please enter your Email.");
						}
					}
					else
					{
						errorTrace.ErrDescription.SetErrorDescription(301, "Please enter your Email and Password.");
					}
					break;
				case "cst-resend":
					errorTrace.ErrDescription = OTPRequestResend();
					break;
				case "cst-singup":
					if (context.Request["otp"] != null )
					{
						if (context.Request["otp"].Trim() != string.Empty)
						{
							errorTrace.ErrDescription = SignUpRequest(context.Request["otp"].Trim());
						}
						else
						{
							errorTrace.ErrDescription.SetErrorDescription(301, "Please enter OTP.");
						}
					}
					else
					{
						errorTrace.ErrDescription.SetErrorDescription(301, "Please enter OTP.");
					}
					break;
				case "cst-signout":
					WebSessionHelper.ClearSession();
					break;
				default:
					errorTrace.ErrDescription.SetErrorDescription(-200, "Invalid request mode.");
					break;
			}
		}
		catch (Exception ex)
		{
			errorTrace.SetErrorTrace("WEB-HND-ACC", "ProcessAcc_ProcessRequest",
				-500, ex.Message, ex.StackTrace);
		}
		finally
		{
			context.Response.ContentType = "text/plain";
			context.Response.AddHeader("Access-Control-Allow-Origin", "*");
			context.Response.Write(errorTrace.ErrDescription.ErrorCode == 0 ? "0" :
				errorTrace.ErrDescription.ErrorMessage);
			AppLogFileHelper.ProcessErrorTrace(new ErrorTraceLog
			{
				ErrTrace = errorTrace,
				LogFolderPath = WebSettings.ErrorLogFolderPathWeb
			});
		}
	}

	public bool IsReusable
	{
		get
		{
			return false;
		}
	}

	private ErrorTrace SignInUser(string userName, string password)
	{
		WebModel webModel = new WebModel();
		ErrorTrace errorTrace = new ErrorTrace();
		EntityData<EntityProfileData> entityData;
		EntityDataTrace<string> cryptoDataTrace;

		cryptoDataTrace = CryptoManager.Encrypt(password,
				WebSettings.AppSourceAuthKey);

		if (cryptoDataTrace.ErrTrace.ErrDescription.ErrorCode == 0)
		{
			entityData = webModel.UserLogin(
				WebCommonHelper.GetAppReqHeaderParams(),
				new UserLoginRequest
				{
					EntityTypeConfigId = WebSettings.EntityTypeConfigId,
					UserName = userName,
					Pwd = cryptoDataTrace.EntityData.DataObject
				});

			if (entityData.ErrDescription.ErrorCode == 0)
			{
				WebSessionHelper.SetVerifyUserData(null);
				WebSessionHelper.SetEntityUserSession(entityData.DataObject);
				WebCartHelper.RefresWishlist();
			}
			else
			{
				errorTrace.ErrDescription = entityData.ErrDescription;
			}
		}
		else
		{
			errorTrace.ErrDescription = cryptoDataTrace.ErrTrace.ErrDescription;
		}
		return errorTrace;
	}

	private ErrorDescription VerifyNewUser(string firstName, string lastName,
		string email, string mobileNo, string pwd)
	{
		ErrorDescription errorDescription = new ErrorDescription();
		WebModel webModel = new WebModel();
		EntityData<VerificationRef> entityData;
		EntityDataTrace<string> cryptoDataTrace;
		VerifyUserData verifyUserData;
		cryptoDataTrace = CryptoManager.Encrypt(pwd, WebSettings.AppSourceAuthKey);

		if (cryptoDataTrace.ErrTrace.ErrDescription.ErrorCode == 0)
		{
			entityData = webModel.ValidateNewUser(
				WebCommonHelper.GetAppReqHeaderParams(),
				new ValidateNewUserRequest
				{
					EntityTypeConfigId = WebSettings.EntityTypeConfigId,
					Email = email,
					MobileNo = mobileNo,
					Pwd = cryptoDataTrace.EntityData.DataObject,
					FullName = firstName + " " + lastName
				});

			if (entityData.ErrDescription.ErrorCode == 0)
			{
				verifyUserData = new VerifyUserData
				{
					UserDet = new UserData
					{
						FirstName = firstName,
						LastName = lastName,
						DisplayName = firstName,
						Email = email,
						MobileNo = mobileNo,
						Pwd = pwd
					},
					VerificationRefDet = entityData.DataObject
				};
				WebSessionHelper.SetVerifyUserData(verifyUserData);
			}
			else
			{
				errorDescription = entityData.ErrDescription;
			}
		}
		else
		{
			errorDescription = cryptoDataTrace.ErrTrace.ErrDescription;
		}
		return errorDescription;
	}

	private ErrorDescription OTPRequestResend()
	{
		WebModel appModel = new WebModel();
		EntityData<VerificationRef> verificationRefData = new EntityData<VerificationRef>();
		VerifyUserData verifyUserData;

		verifyUserData = WebSessionHelper.GetVerifyUserData();
		if (verifyUserData != null)
		{
			verificationRefData = appModel.ResendVerificationCode(
				WebCommonHelper.GetAppReqHeaderParams()
				, new ResendVerificationCodeRequest
				{
					EntityTypeConfigId = WebSettings.EntityTypeConfigId,
					ConfigId = verifyUserData.VerificationRefDet.ConfigId,
					UserName = verifyUserData.UserDet.Email
				});

			if (verificationRefData.ErrDescription.ErrorCode == 0)
			{
				verifyUserData.VerificationRefDet = verificationRefData.DataObject;
				WebSessionHelper.SetVerifyUserData(verifyUserData);
			}
		}
		else
		{
			verificationRefData.SetErrorDescription(201, "Invalid Request");
		}
		return verificationRefData.ErrDescription;
	}

	private ErrorDescription SignUpRequest(string OTP)
	{
		WebModel appModel = new WebModel();
		VerifyUserData verifyUserData;
		EntityDataTrace<string> cryptoDataTrace;
		EntityData<EntityProfileData> entityUserData = new EntityData<EntityProfileData>();

		verifyUserData = WebSessionHelper.GetVerifyUserData();
		if (verifyUserData != null)
		{
			cryptoDataTrace = CryptoManager.Encrypt(verifyUserData.UserDet.Pwd, WebSettings.AppSourceAuthKey);
			if (cryptoDataTrace.ErrTrace.ErrDescription.ErrorCode == 0)
			{
				entityUserData = appModel.CreateNewUser(
					WebCommonHelper.GetAppReqHeaderParams(),
					new CreateNewUserRequest
					{
						EntityTypeConfigId = WebSettings.EntityTypeConfigId,
						FirstName = verifyUserData.UserDet.FirstName,
						LastName = verifyUserData.UserDet.LastName,
						FullName = verifyUserData.UserDet.FirstName,
						Email = verifyUserData.UserDet.Email,
						MobileNo = verifyUserData.UserDet.MobileNo,
						Pwd = cryptoDataTrace.EntityData.DataObject,
						VerifyConfigId = verifyUserData.VerificationRefDet.ConfigId,
						VerifyValue = OTP
					});

				if (entityUserData.ErrDescription.ErrorCode == 0)
				{
					//WebSessionHelper.SetEntityUserSession(
					//		entityUserData.DataObject);
				}
			}
			else
			{
				entityUserData.ErrDescription = cryptoDataTrace.ErrTrace.ErrDescription;
			}
		}
		else
		{
			entityUserData.SetErrorDescription(201, "Invalid verification request.");
		}
		return entityUserData.ErrDescription;
	}
}