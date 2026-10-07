<%@ WebHandler Language="C#" Class="ProcessAddress" %>

using System;
using System.Web;
using System.Web.SessionState;

using Lib.Adapter.Security;
using Lib.Adapter.Security.Entities;
using Lib.Client.Entities;
using Lib.Client.Entities.Org;
using Lib.Client.Entities.Requests.Org;
using Lib.Common.Entities;
using Lib.Common.Entities.Settings.Collections;
using Lib.Common.Helpers;
using Lib.Common.Logger;
using Lib.Core.Org.Entities;
using Lib.Model;

public class ProcessAddress : IHttpHandler, IRequiresSessionState
{
	public void ProcessRequest(HttpContext context)
	{
		WebModel webModel = new WebModel();
		ErrorTrace errorTrace = new ErrorTrace();
		try
		{
			if (WebSessionHelper.IsOrgUserSessionExists())
			{
				switch (context.Request["mode"].ToString())
				{
					case "add-add":
						if (context.Request["companyName"] != null && context.Request["firstName"] != null
								&& context.Request["lastName"] != null && context.Request["address1"] != null
								&& context.Request["address2"] != null && context.Request["street"] != null
								&& context.Request["landmark"] != null && context.Request["areaId"] != null)
						{
							if (context.Request["firstName"].Trim() != string.Empty)
							{
								if (context.Request["lastName"].Trim() != string.Empty)
								{
									if (context.Request["address1"].Trim() != string.Empty)
									{
										if (context.Request["areaId"].Trim() != string.Empty
												&& Convert.ToInt64(context.Request["areaId"]) > 0)
										{
											errorTrace.ErrDescription = AddAddress(context.Request["companyName"].Trim(),
												context.Request["firstName"].Trim(), context.Request["lastName"].Trim(),
												context.Request["address1"].Trim(), context.Request["address2"].Trim(),
												context.Request["street"].Trim(), context.Request["landmark"].Trim(),
												Convert.ToInt64(context.Request["areaId"]));
										}
										else
										{
											errorTrace.ErrDescription.SetErrorDescription(301, "Please select area.");
										}
									}
									else
									{
										errorTrace.ErrDescription.SetErrorDescription(301, "Please enter address.");
									}
								}
								else
								{
									errorTrace.ErrDescription.SetErrorDescription(301, "Please enter last name.");
								}
							}
							else
							{
								errorTrace.ErrDescription.SetErrorDescription(301, "Please enter first name.");
							}
						}
						else
						{
							errorTrace.ErrDescription.SetErrorDescription(301, "Invalid Parameters.");
						}
						break;
					case "add-upd":
						if (context.Request["addressId"] != null
								&& context.Request["companyName"] != null && context.Request["firstName"] != null
								&& context.Request["lastName"] != null && context.Request["address1"] != null
								&& context.Request["address2"] != null && context.Request["street"] != null
								&& context.Request["landmark"] != null && context.Request["areaId"] != null)
						{
							if (context.Request["addressId"].Trim() != string.Empty
								&& Convert.ToInt64(context.Request["addressId"]) > 0)
							{
								if (context.Request["firstName"].Trim() != string.Empty)
								{
									if (context.Request["lastName"].Trim() != string.Empty)
									{
										if (context.Request["address1"].Trim() != string.Empty)
										{
											if (context.Request["areaId"].Trim() != string.Empty
													&& Convert.ToInt64(context.Request["areaId"]) > 0)
											{
												errorTrace.ErrDescription = UpdateAddress(
													Convert.ToInt64(context.Request["addressId"]), context.Request["companyName"].Trim(),
													context.Request["firstName"].Trim(), context.Request["lastName"].Trim(),
													context.Request["address1"].Trim(), context.Request["address2"].Trim(),
													context.Request["street"].Trim(), context.Request["landmark"].Trim(),
													Convert.ToInt64(context.Request["areaId"]));
											}
											else
											{
												errorTrace.ErrDescription.SetErrorDescription(301, "Please select area.");
											}
										}
										else
										{
											errorTrace.ErrDescription.SetErrorDescription(301, "Please enter address.");
										}
									}
									else
									{
										errorTrace.ErrDescription.SetErrorDescription(301, "Please enter last name.");
									}
								}
								else
								{
									errorTrace.ErrDescription.SetErrorDescription(301, "Please enter first name.");
								}
							}
							else
							{
								errorTrace.ErrDescription.SetErrorDescription(301, "Please select address.");
							}
						}
						else
						{
							errorTrace.ErrDescription.SetErrorDescription(301, "Please enter your Email and Password.");
						}
						break;
					case "add-del":
						if (context.Request["addressId"] != null)
						{
							if (context.Request["addressId"].Trim() != string.Empty
								&& Convert.ToInt64(context.Request["addressId"]) > 0)
							{
								errorTrace.ErrDescription = DeleteAddress(
									Convert.ToInt64(context.Request["addressId"]));
							}
							else
							{
								errorTrace.ErrDescription.SetErrorDescription(301, "Please select address.");
							}
						}
						else
						{
							errorTrace.ErrDescription.SetErrorDescription(301, "Please enter your Email and Password.");
						}
						break;					
					default:
						errorTrace.ErrDescription.SetErrorDescription(200, "Invalid request mode.");
						break;
				}
			}
			else
			{
				errorTrace.ErrDescription.SetErrorDescription(201, "Session Timeout.");
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

	private ErrorDescription AddAddress(string companyName,
		string firstName, string lastName, string address1, string address2,
		string street, string landmark, long areaId)
	{
		WebModel webModel = new WebModel();
		ErrorDescription errorDescription = new ErrorDescription();

		errorDescription = webModel.AddUserAddress(
			WebCommonHelper.GetAppReqHeaderParams(),
			new UserAddressAddRequest
			{
				UserConfigId = WebSessionHelper.GetSessionOrgUserConfigId(),
				AddressTypeCode = companyName.Trim() == string.Empty ?
					AddressTypes.HMA_Home_Address : AddressTypes.OFA_Office_Address,
				CompanyName = companyName,
				FirstName = firstName,
				LastName = lastName,
				Address1 = address1,
				Address2 = address2,
				Street = street,
				Landmark = landmark,
				AreaId =  areaId,
				CityCode = "MUM",
				StateCode = "MH",
				CountryCode = "IND"
			});

		return errorDescription;
	}

	private ErrorDescription UpdateAddress(long addressId, string companyName,
		string firstName, string lastName, string address1, string address2,
		string street, string landmark, long areaId)
	{
		ErrorDescription errorDescription = new ErrorDescription();
		WebModel webModel = new WebModel();

		errorDescription = webModel.UpdateUserAddress(
			WebCommonHelper.GetAppReqHeaderParams(),
			new UserAddressUpdRequest
			{
				UserConfigId = WebSessionHelper.GetSessionOrgUserConfigId(),
				AddressId = addressId,
				AddressTypeCode = companyName.Trim() == string.Empty ?
					AddressTypes.HMA_Home_Address : AddressTypes.OFA_Office_Address,
				CompanyName = companyName,
				FirstName = firstName,
				LastName = lastName,
				Address1 = address1,
				Address2 = address2,
				Street = street,
				Landmark = landmark,
				AreaId =  areaId,
				CityCode = "MUM",
				StateCode = "MH",
				CountryCode = "IND"
			});

		return errorDescription;
	}

	private ErrorDescription DeleteAddress(long addressId)
	{
		ErrorDescription errorDescription = new ErrorDescription();
		WebModel webModel = new WebModel();

		errorDescription = webModel.UpdateUserAddressStatus(
				WebCommonHelper.GetAppReqHeaderParams()
				, new UserAddressStatusUpdRequest
				{
					UserConfigId = WebSessionHelper.GetSessionOrgUserConfigId(),
					AddressId = addressId,
					Status = DataStatusTypes.Deleted
				});

		return errorDescription;
	}
}