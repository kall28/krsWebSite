<%@ page title="" language="C#" masterpagefile="~/SiteMasterMain.master" autoeventwireup="true" inherits="New_Innerpages_AboutUs, App_Web_aboutus.aspx.9ea04a4a" %>
<%@ MasterType VirtualPath="~/SiteMasterMain.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="indx-hdr">
        <div class="indx-banr">
            <img id="imgbanner" runat="server" src="~/images/bnr2.jpg" />
            <h2>about us</h2>
        </div>
        <div class="lgo-sgn">
            <div class="infilogo">
                <a href="#" onclick="javascript: link_click('H'); return false;">
                    <img id="imglogo" runat="server" src="~/images/ERFP_Logo.png" />
                </a>
            </div>
            <div class="sgnup">
                <a href="#" onclick="javascript: login_click(); return false;" id="lnkLogin" runat="server">
                    <img id="imgsignin" runat="server" src="~/images/ico-signin.png" /><span>Sign in</span></a>
            </div>
        </div>

    </div>


    <div class="pgHmHdr insd-wrapper" id="divAboutUs" runat="server">

        

        <div class="clr"></div>
    </div>
</asp:Content>

