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
                case "fbk":
                        //int ErrorCode = 0;
                        //string lstrMsg = "Fail";
                        //InfiModel lobjInfiModel = new InfiModel();
                        //ErrorCode = lobjInfiModel.SendFeedbackMail(context.Request.QueryString["name"],
                            //Convert.ToInt64(context.Request.QueryString["mobile"]), context.Request.QueryString["message"],
                            //WebConstants.FeedbackEmailID);
                        //if (ErrorCode == 0)
                            //lstrMsg = "Success";
                        //else
                            //lstrMsg = "Fail";
                        //context.Response.ContentType = "text/html";
                        //context.Response.Write(ErrorCode);
                    int ErrorCode = 0;
                        string lstrMsg = "Fail";
                        InfiModel lobjInfiModel = new InfiModel();
                        string lstrname = "";
                        string lstrMob = "";
                        
                        //if (Session[WebConstants.SessionVar.LoggedinUser.ToString()] != null)
                        if (HttpContext.Current.Session[WebConstants.SessionVar.LoggedinUser.ToString()] != null)
                        {
                            IList<Customer> lobjCustomer = null;
                            //lobjCustomer = lobjInfiModel.GetCustomer(Convert.ToInt32(Session[WebConstants.SessionVar.LoggedinUserCustomerId.ToString()]));
                            lobjCustomer = lobjInfiModel.GetCustomer(Convert.ToInt32(HttpContext.Current.Session[WebConstants.SessionVar.LoggedinUserCustomerId.ToString()]));

                            lstrname = lobjCustomer[0].FirstName + " " + lobjCustomer[0].LastName;
                            lstrMob = lobjCustomer[0].AddressDet.MobileNo.ToString();

                        }
                        else
                        {
                            lstrname = context.Request.QueryString["name"];
                            lstrMob = context.Request.QueryString["mobile"];
                        }
                    
                        ErrorCode = lobjInfiModel.SendFeedbackMail(lstrname, Convert.ToInt64(lstrMob), context.Request.QueryString["message"], WebConstants.FeedbackEmailID);
                    
                        if (ErrorCode == 0)
                            lstrMsg = "Success";
                        else
                            lstrMsg = "Fail";
                        context.Response.ContentType = "text/html";
                        context.Response.Write(ErrorCode);
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