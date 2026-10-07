<%@ WebHandler Language="C#" Class="ProcessAcc" %>

using System;
using System.Web;
using System.Web.SessionState;

using Lib.Adapter.Security;
using Lib.Adapter.Security.Entities;
using Lib.Client.Entities;
using Lib.Client.Entities.Ent;
using Lib.Client.Entities.Requests.Org;
using Lib.Common.Entities;
using Lib.Common.Logger;
using Lib.Model;

public class ProcessAcc : IHttpHandler, IRequiresSessionState {

	public void ProcessRequest (HttpContext context) {
		string strUniqueId = string.Empty;
		string strImage = string.Empty;
		string strPath = string.Empty;
		WebModel webModel = new WebModel();
		ErrorTrace errorTrace = new ErrorTrace();
		EntityProfileData entityProfileData;
		EntityData<string> entityData;
		EntityDataTrace<string> cryptoDataTrace;
		EntityDataTrace<string> cryptoNewDataTrace;
		try
		{
			switch (context.Request["mode"].ToString())
			{
				case "ent-chpwd":
					entityProfileData = WebSessionHelper.GetSessionEntityDetails();
					if (entityProfileData != null)
					{
						cryptoDataTrace = CryptoManager.Encrypt(context.Request["pwd"].ToString(),
							WebSettings.AppSourceAuthKey);
						if (cryptoDataTrace.ErrTrace.ErrDescription.ErrorCode == 0)
						{
							cryptoNewDataTrace = CryptoManager.Encrypt(context.Request["newpwd"].ToString(),
								WebSettings.AppSourceAuthKey);
							if (cryptoNewDataTrace.ErrTrace.ErrDescription.ErrorCode == 0)
							{
								errorTrace.ErrDescription = webModel.UserPwdChange(
									WebCommonHelper.GetAppReqHeaderParams(),
									new UserPwdChangeRequest
									{
										EntityTypeConfigId = WebSettings.EntityTypeConfigId,
										UserConfigId = entityProfileData.ConfigId.ToString(),
										Pwd = cryptoDataTrace.EntityData.DataObject,
										NewPwd = cryptoNewDataTrace.EntityData.DataObject
									});
							}
							else
							{
								errorTrace = cryptoNewDataTrace.ErrTrace;
							}
						}
						else
						{
							errorTrace = cryptoDataTrace.ErrTrace;
						}
					}
					else
					{
						errorTrace.ErrDescription.SetErrorDescription(101,
							"Session timeout. Please login again.");
					}
					break;
				case "ent-fgpwd":
					errorTrace.ErrDescription = webModel.EntityUserPwdReset(
						WebCommonHelper.GetAppReqHeaderParams(),
						new EntityUserPwdResetRequest
						{
							EntityTypeConfigId = WebSettings.EntityTypeConfigId,
							UserName = context.Request["userName"].ToString()
						});
					break;
				default:
					errorTrace.ErrDescription.SetErrorDescription(-200, "Invalid request mode.");
					break;
			}
		}
		catch (Exception ex)
		{
			errorTrace.SetErrorTrace("WEB-HND-IMG", "ProcessImageFile_ProcessRequest",
				-500, ex.Message, ex.StackTrace);
		}
		finally
		{
			context.Response.ContentType = "text/plain";
			context.Response.AddHeader("Access-Control-Allow-Origin", "*");
			context.Response.Write(errorTrace.ErrDescription.ErrorCode==0? "0" :
				errorTrace.ErrDescription.ErrorMessage);
			AppLogFileHelper.ProcessErrorTrace(new ErrorTraceLog
			{
				ErrTrace = errorTrace,
				LogFolderPath = WebSettings.ErrorLogFolderPathWeb
			});
		}
	}

	public bool IsReusable {
		get {
			return false;
		}
	}

}