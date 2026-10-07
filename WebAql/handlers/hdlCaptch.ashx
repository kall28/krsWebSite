<%@ WebHandler Language="C#" Class="hdlCaptch" %>

using System;
using System.Web;
using System.Web.SessionState;
//using App.Lib.Web;

public class hdlCaptch : IHttpHandler, IRequiresSessionState {

	public void ProcessRequest (HttpContext context) {
		// Change the response headers to output a JPEG image.
		context.Response.ContentType = "text/jpeg";
		//WebAppUserManager.GetCaptchaImage(context.Response.OutputStream);
	}

	public bool IsReusable {
		get {
			return false;
		}
	}

}