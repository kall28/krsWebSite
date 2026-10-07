<%@ page language="C#" autoeventwireup="true" inherits="VideoWall, App_Web_videowall.aspx.cdcab7d2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/main1.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="xScrMgr" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/jquery-1.11.1.min.js" />
            <%--<asp:ScriptReference Path="~/Scripts/jquery.vticker.min.js" />--%>
            <asp:ScriptReference Path="~/Scripts/jquery.easing.min.js" />
            <asp:ScriptReference Path="~/Scripts/jquery.easy-ticker.min.js" />
            <asp:ScriptReference Path="~/Scripts/app-1.0.common.js" />
            <asp:ScriptReference Path="~/Scripts/app-1.0.VideoWall.js" />
        </Scripts>
    </asp:ScriptManager>
    <div class="wraper">
        <header>
            <div class="head">
            TODAY’S SCHEDULE</div>
        </header>
        <div class="content">
            <%--<marquee behavior="scroll" direction="up"
                scrollamount="2" scrolldelay="20" height="450px">--%>
                <div class="col3" id="divData">
                    
                </div>
            <%--</marquee>--%>
        </div>        
    </div>
    <div class="footer"><div class="footHlr">
            <div class="schLegnd">
                <span class="bgcolBlue"></span>SEATS AVAILABLE<span class="bgcolOrg"></span>SOLD
                FAST <span class="bgcolRed"></span>SOLD OUT
            </div>
            <div class="footDtl">
                (13+) 13 YEARS AND UP | (17+) 17 YEARS AND UP | (21+) 21 YEARS AND OVER</div>
        </div>
        <header>
            <div class="head">
                CINEMA STATUS</div>
        </header>
        <div class="cinmSts" id="divStatus">
        </div></div>
    </form>
    <script>
        startTime();
        //startStatusTime();
        //GetShows();
    </script>
</body>
</html>
