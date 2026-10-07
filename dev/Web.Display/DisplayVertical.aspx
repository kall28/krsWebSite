<%@ page language="C#" autoeventwireup="true" inherits="_DisplayVertical, App_Web_displayvertical.aspx.cdcab7d2" %>

<html>
<head runat="server">
    <meta charset="UTF-8">
    <title></title>
    <link href="Styles/main-1.0.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="xhdnTerminalNo" runat="server" Value="0" />
    <asp:HiddenField ID="xhdnPageNo" runat="server" Value="0" />
    <asp:ScriptManager ID="xScrMgr" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/jquery-1.11.1.min.js" />
            <asp:ScriptReference Path="~/Scripts/app-1.0.common.js" />
            <asp:ScriptReference Path="~/Scripts/app-1.1.webReq.vertical.js" />
        </Scripts>
    </asp:ScriptManager>
    <div class="wraper">
        <header>
            <div class="logo"><img id="imdlogo" runat="server" 
                src="~/images/Play_logo.jpg" width="200" height="116" alt=""/><div class='clr'></div></div>
            <div class="head"> TODAY’S SCHEDULE<div class='clr'></div></div>
        </header>
        <div id="divData" runat="server" class="content">
            
        </div>
    </div>
    <%--<footer>
        <div class="footHlr">
            <div class="convfee" id="divMerquee" runat="server"></div>  
            <div class="schLegnd"><span class="bgcolBlue"></span>KURSI TERSEDIA<span class="bgcolOrg"></span>TERJUAL CEPAT <span class="bgcolRed"></span>HABIS TERJUAL </div>
        </div>
        <div class="footDtl">(SU) SEMUA UMUR | (13+) 13 THN KEATAS (17+) 17 THN KEATAS | (21+) 21 THN KEATAS</div>
    </footer>--%>    
    </form>
    <script>
        startTime();  
    </script>
</body>
</html>
