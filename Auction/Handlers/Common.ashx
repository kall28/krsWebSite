<%@ WebHandler Language="C#" Class="Common" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;
using System.Web.Script.Serialization;
using Framework.EnterpriseLibrary.Adapters;
using InfiAuction.Entities;
using InfiAuction.Helper;
using InfiAuction.Model;

public class Common : IHttpHandler, IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        InfiModel objInfiModel = new InfiModel();
        context.Response.ContentType = "application/json; charset =utf-8";
        try
        {
            switch (context.Request.QueryString["mode"].ToString())
            {
                case "ntf":
                    if (context.Request.QueryString["Id"] != null)
                    {
                        objInfiModel.MessageStatus(Convert.ToInt32(context.Request.QueryString["Id"]),0,
                            HelperConstants.MessageStatusType.Notification);
                    }
                    else
                    {
                        IList<Inbox> objlstMsg = new List<Inbox>();
                        if (HttpContext.Current.Session[WebConstants.SessionVar.LoggedinUserCustomerId.ToString()] != null)
                        {
                            objlstMsg = objInfiModel.GetMessages(
                                Convert.ToInt32(HttpContext.Current.Session[WebConstants.SessionVar.LoggedinUserCustomerId.ToString()]),
                                HelperConstants.MessageStatusType.Notification);
                        }
                        JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
                        context.Response.Write(javaScriptSerializer.Serialize(objlstMsg));
                    }
                    break;
            }
        }
        catch (Exception ex)
        {
            LoggingAdapter.WriteLog("Process Request Client" + ex.Message + Environment.NewLine);
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}