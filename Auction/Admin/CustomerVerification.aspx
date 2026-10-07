<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Admin_CustomerVerification, App_Web_customerverification.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .navbar
        {
            border-width: 0 !important;
        }

        .sidebar-nav.navbar-collapse
        {
            display: none;
        }

        .navbar-default
        {
            box-shadow: 0 0 0 #e2e2e2;
        }

        #page-wrapper
        {
            position: relative;
            top: -85px;
            z-index: 1001;
        }
    </style>
    <script>
        function lnkbtnRegister_Click() {
            if ($("#ContentPlaceHolder1_xtxtEmail").val() == "") {
                $("#ContentPlaceHolder1_xtxtEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtName"), "Please Enter name.", "bottom");
                return false;
            }
            return true;
        }
        function ValidateOTP() {
            if ($("#ContentPlaceHolder1_xtxtOTP").val() == "") {
                $("#ContentPlaceHolder1_xtxtOTP").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtOTP"), "Please enter OTP.", "bottom");
                return false;
            }
            ShowProgress();
            return true;
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.btnHelper').click(function () {
                $('.helpSlide').addClass('HelpMoveRight');
                $('.helpSlide').show();
                $('.helpBlockAll').css('display', 'block');
                $('.helpBlockAll').show();
                $('.helpSlide').stop().animate({ 'marginRight': '0px' }, 1000);
                return false;
            });
            $('.helpBlockAll').click(function () {
                $('.helpBlockAll').hide();
                $('.helpSlide').stop().animate({ 'marginRight': '-768px' }, 200);

            });

        });

    </script>
    <div class="clmn1 imw100p fl">
        <div class="innerBx">
            <%--<div class="innerBxhead bgGrey">My Profile</div>--%>
            <div class="innerBxhead bgGrey">Verify your Mobile Number</div>
            <div class="innerBxbody brdGrey whiteBox" style="min-height: 200px;">
                <div class="buyRegis">
                    <p id="pRegMsg" runat="server">
                    </p>
                    <div id="divOTP" runat="server" class="formRow" visible="false">
                        <label>Verification Code</label>
                        <div class="formRow1">
                            <asp:TextBox ID="xtxtOTP" runat="server" placeholder="Enter the code" MaxLength="50" CssClass="imw48p" ondrop="return false;" onkeydown="return IsNumeric(event);" autocomplete="off"></asp:TextBox>

                            <asp:LinkButton ID="xlnkbtnResendOTP" runat="server" CssClass="btnGrey"
                                OnClick="xlnkbtnResendOTP_Click" Visible="false">Resend OTP</asp:LinkButton>
                            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                        </div>
                    </div>
                    <div class="formRow">
                        <label>&nbsp</label>
                        <div class="formRow1 immrt20">
                            <asp:LinkButton ID="xlnkContinue" runat="server" CssClass="btnRed" OnClientClick="javascript: return ValidateOTP();"
                                OnClick="xlnkContinue_Click">Submit</asp:LinkButton>
                            <asp:LinkButton ID="xlnkBtnRedirect" runat="server" CssClass="btnRed" Visible="false"
                                OnClick="xlnkBtnRedirect_Click">Continue</asp:LinkButton>

                            <asp:LinkButton ID="xlnkbtnResendLink" runat="server" CssClass="btnGrey"
                                OnClick="xlnkbtnResendLink_Click" Visible="false">Resend Link</asp:LinkButton>
                            <asp:LinkButton ID="xlnkRedirectLink" runat="server" CssClass="btnRed" OnClientClick="javascript:link_click('H');"
                                OnClick="xlnkRedirectLink_Click" Visible="false">Continue</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:UpdatePanel ID="xupnlCrfm" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="modal fade" id="divMsgBoxPopUp" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="btnClose" class="close" onclick="javascript:link_click('H');">&times;</button>
                            <h4 class="modal-title" id="msgHeader1" runat="server"></h4>
                        </div>
                        <div class="modal-body">
                            <p id="msgBody1" runat="server"></p>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

