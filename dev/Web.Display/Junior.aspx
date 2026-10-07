<%@ page language="C#" autoeventwireup="true" inherits="Junior, App_Web_junior.aspx.cdcab7d2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/junscreen.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="xhdnTerminalNo" runat="server" Value="0" />
        <asp:HiddenField ID="xhdnPageNo" runat="server" Value="0" />
        <asp:ScriptManager ID="xScrMgr" runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/jquery-1.11.1.min.js" />
                <asp:ScriptReference Path="~/Scripts/app-1.0.common.js" />
                <asp:ScriptReference Path="~/Scripts/app-1.0.webReqJunior.js" />
            </Scripts>
        </asp:ScriptManager>
        <div class="wraperJn">
            <div class="logo col1J">
                <img id="imgLogo" runat="server" src="~/images/Play_logo.jpg" alt="" />
            </div>
            <div class="head col2J">TODAY’S SCHEDULE</div>
        </div>
        <div class="clr"></div>
        <div id="divData" runat="server" class="content">
            
        </div>
        <footer class="ftItlic">
            <asp:Literal ID="xlitSeatPrice" runat="server"></asp:Literal>            
            <div class="btmLin"></div>
            <div class="footHlr">
                <div class="schLegnd"><span class="bgcolBrw"></span>SEATS AVAILABLE<span class="bgcolOrg"></span>SOLD FAST <span class="bgcolRed"></span>SOLD OUT </div>
                <div class="sem">(G) General Audiences </div>
            </div>
        </footer>
    </form>
    <script>
        startTime();
    </script>
</body>
</html>
