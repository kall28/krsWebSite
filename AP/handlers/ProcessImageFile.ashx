<%@ WebHandler Language="C#" Class="ProcessImageFile" %>

using System;
using System.Web;
using System.Web.SessionState;

using Lib.Common.Entities;
using Lib.Common.Logger;
using Lib.Core.Org.Entities;
using Lib.Module.Gallery;
using Lib.Module.Gallery.Settings.Collections;

public class ProcessImageFile : IHttpHandler, IRequiresSessionState {

	public void ProcessRequest(HttpContext context)
	{
		context.Response.ContentType = "text/plain";
		string strUniqueId = string.Empty;
		string strImage = string.Empty;
		string strPath = string.Empty;
		context.Response.AddHeader("Access-Control-Allow-Origin", "*");
		ErrorTrace errorTrace = new ErrorTrace();
		AppSourceDetails appSourceDetails;
		try
		{
			appSourceDetails = WebSessionHelper.GetAppSourceDetails();
			if (appSourceDetails != null)
			{
				if (HttpContext.Current.Session[context.Request["ref"].ToString()] != null
							&& context.Request.Files.Count > 0)
				{
					strUniqueId = Guid.NewGuid().ToString().Replace("-", string.Empty);
					HttpPostedFile file = context.Request.Files[0];
					GalleryManager galleryManager = new GalleryManager(appSourceDetails.OrgCode.Code);
					galleryManager.UploadedNewFileName = strUniqueId;

					switch (context.Request["mode"].ToString())
					{
						case "cmn-tempimg":
							errorTrace = galleryManager.UploadImage(
								ImageType.CMN_TempImage, file);
							break;
						case "cnt-pimg":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_CommonImage, file);
							break;
						case "cnt-ppanel":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_PagePanelImage, file);
							break;
						case "cnt-pmenu":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_PageMenu, file);
							break;
						case "cnt-ppageimg":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_PageImage, file);
							break;
						case "cnt-ppagebanner":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_PageBanner, file);
							break;
						case "cnt-evnthumb":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_EventsThumbnail, file);
							break;
						case "cnt-evnbanner":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_EventsBanner, file);
							break;
						case "cnt-deptthumb":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_DepartmentsThumbnail, file);
							break;
						case "cnt-deptbanner":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_DepartmentsBanner, file);
							break;
						case "cnt-feedthumb":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_FeedThumbnail, file);
							break;
						case "cnt-feedbanner":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_FeedBanner, file);
							break;
						case "cnt-postthumb":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_PostThumbnail, file);
							break;
						case "cnt-postbanner":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_PostBanner, file);
							break;
						case "cnt-newsthumb":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_NewsThumbnail, file);
							break;
						case "cnt-newsbanner":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_NewsBanner, file);
							break;
						case "cnt-promothumb":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_PromoThumbnail, file);
							break;
						case "cnt-promobanner":
							errorTrace = galleryManager.UploadImage(
								ImageType.CNT_PromoBanner, file);
							break;
						case "ecm-prod":
							errorTrace = galleryManager.UploadImage(
								ImageType.ECM_ProdThumbnail, file);
							break;
						case "ecm-prodbanner":
							errorTrace = galleryManager.UploadImage(
								ImageType.ECM_ProdBanner, file);
							break;
						case "ent-entity":
							errorTrace = galleryManager.UploadImage(
								ImageType.ENT_EntityThumbnail, file);
							break;
						case "ent-entendo":
							errorTrace = galleryManager.UploadImage(
								ImageType.ENT_EntityEndorsement, file);
							break;
						case "ent-brthumb":
							errorTrace = galleryManager.UploadImage(
								ImageType.ENT_EntityBranchThumbnail, file);
							break;
						case "ent-brbanner":
							errorTrace = galleryManager.UploadImage(
								ImageType.ENT_EntityBranchBanner, file);
							break;
						case "mov-thumb":
							errorTrace = galleryManager.UploadImage(
								ImageType.MOV_MovieThumbnail, file);
							break;
						case "mov-banner":
							errorTrace = galleryManager.UploadImage(
								ImageType.MOV_MovieBanner, file);
							break;
						case "mov-people":
							errorTrace = galleryManager.UploadImage(
								ImageType.MOV_MoviePeople, file);
							break;
						case "mov-scicon":
							errorTrace = galleryManager.UploadImage(
								ImageType.MOV_ScreenClassIcon, file);
							break;
						case "mov-scthumb":
							errorTrace = galleryManager.UploadImage(
								ImageType.MOV_ScreenClassThumbnail, file);
							break;
						case "mov-fnbhumb":
							errorTrace = galleryManager.UploadImage(
								ImageType.MOV_FnBItemThumbnail, file);
							break;
						default:
							errorTrace.ErrDescription.SetErrorDescription(-200, "Invalid request mode.");
							break;
					}

					if (errorTrace.ErrDescription.ErrorCode == 0)
					{
						strImage = galleryManager.UploadedFileName;
					}
					else
					{
						strImage = "error";
					}
				}
				else
				{
					errorTrace.ErrDescription.SetErrorDescription(-201, "Session Timeout.");
					strImage = "error";
				}
			}
			else
			{
				strImage = "error";
			}
		}
		catch (Exception ex)
		{
			strImage = "error";
			errorTrace.SetErrorTrace("WEB-HND-IMG", "ProcessImageFile_ProcessRequest",
				-500, ex.Message, ex.StackTrace);
		}
		finally
		{
			context.Response.Write(strImage);
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