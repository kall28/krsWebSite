<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eweb.aspx.cs" Inherits="eweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script>
        document.cookie = "u=" + window.location.href;
    </script>
    <title><%=kname%><%=Request.QueryString["searchtxt"]%> Cheap Sell - OFF <%=new Random().Next(60, 80)%>% <%=Request.QueryString["pnum"]%> </title>
    <meta name="keywords" content="<%=kname%><%=Request.QueryString["searchtxt"]%>" />
    <meta name="description" content="Shopping ><%=kname%> OFF-<%=new Random().Next(60, 80)%>% Fast delivery, secure payment, low price: Shop furniture, bedding, jewelry, clothing, shoes, electronics and more with free worldwide shipping!<%=Request.QueryString["searchtxt"]%>" />
    <meta name="robots" content="index,follow,all" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="sitemap" type="application/xml" title="Sitemap" href="<%=httpxy + HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.Path %>?s=s&kk=0&type=2&g=<%=new Random().Next(1, 14)%>&pnum=<%=new Random().Next(1, 15)%>" />
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
