<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_ResetPassword, App_Web_resetpassword.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <style>
                #ContentPlaceHolder1_xtxtNewPasswrod {
                    padding: 2%;
                    margin-bottom: 0%;
                }

                #ContentPlaceHolder1_xtxtConfirmPasswrod {
                    padding: 2%;
                    margin-bottom: 0%;
                }
            </style>
            <style>
                .navbar {
                    border-width: 0 !important;
                }

                .sidebar-nav.navbar-collapse {
                    display: none;
                }

                .navbar-default {
                    box-shadow: 0 0 0 #e2e2e2;
                }

                #page-wrapper {
                    position: relative;
                    top: -85px;
                    z-index: 1001;
                }
            </style>

            <script type="text/javascript">
                function validatePassword(password) {
                    var regularExpression = /(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9])/;
                    if (!regularExpression.test(password)) {
                        return false;
                    }
                    else {
                        return true;
                    }
                }

                function lnkbtnSubmit_User_Click() {

                    if ($("#ContentPlaceHolder1_xtxtOldUserName").val() == "") {
                        $("#ContentPlaceHolder1_xtxtOldUserName").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtOldUserName"), "Please enter old UserName.", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtNewUserName").val() == "") {
                        $("#ContentPlaceHolder1_xtxtNewUserName").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtNewUserName"), "Please enter new UserName.", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtNewPasswrod").val() == "") {
                        $("#ContentPlaceHolder1_xtxtNewPasswrod").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtNewPasswrod"), "Please enter Password.", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtNewPasswrod").val().length < 8) {
                        $("#ContentPlaceHolder1_xtxtNewPasswrod").focus();
                        ShowToolTip("#ContentPlaceHolder1_xtxtNewPasswrod", "Please enter atleast 8 characters", "bottom");
                        return false;
                    }
                    else if (!validatePassword($("#ContentPlaceHolder1_xtxtNewPasswrod").val())) {
                        $("#ContentPlaceHolder1_xtxtNewPasswrod").focus();
                        ShowToolTip("#ContentPlaceHolder1_xtxtNewPasswrod", "Please enter alphanumeric password", "bottom");
                        return false;
                    }
                    ShowProgress();
                    return true;
                }
                function lnkbtnSubmit_Pwd_Click() {

                    //if ($("#ContentPlaceHolder1_xtxtUserName").val() == "") {
                    //    $("#ContentPlaceHolder1_xtxtUserName").focus();
                    //    ShowToolTip($("#ContentPlaceHolder1_xtxtUserName"), "Please enter User Name.", "bottom");
                    //    return false;
                    //}
                    //else 
                    if ($("#ContentPlaceHolder1_xtxtNewPasswrod").val() == "") {
                        $("#ContentPlaceHolder1_xtxtNewPasswrod").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtNewPasswrod"), "Please enter new Password.", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtNewPasswrod").val().length < 8) {
                        $("#ContentPlaceHolder1_xtxtNewPasswrod").focus();
                        ShowToolTip("#ContentPlaceHolder1_xtxtNewPasswrod", "Please enter atleast 8 characters", "bottom");
                        return false;
                    }
                    else if (!validatePassword($("#ContentPlaceHolder1_xtxtNewPasswrod").val())) {
                        $("#ContentPlaceHolder1_xtxtNewPasswrod").focus();
                        ShowToolTip("#ContentPlaceHolder1_xtxtNewPasswrod", "Please enter alphanumeric password", "bottom");
                        return false;
                    }
                        //else if ($("#ContentPlaceHolder1_xtxtNewPasswrod").val().length < 6) {
                        //    $("#ContentPlaceHolder1_xtxtNewPasswrod").focus();
                        //    ShowToolTip($("#ContentPlaceHolder1_xtxtNewPasswrod"), "Please enter minimum 6 character password .", "bottom");
                        //    return false;
                        //}
                    else if ($("#ContentPlaceHolder1_xtxtConfirmPasswrod").val() == "") {
                        $("#ContentPlaceHolder1_xtxtConfirmPasswrod").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmPasswrod"), "Please enter confirm Password.", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtNewPasswrod").val() != $("#ContentPlaceHolder1_xtxtConfirmPasswrod").val()) {
                        $("#ContentPlaceHolder1_xtxtConfirmPasswrod").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmPasswrod"), "Please enter confirm password same as new password.", "bottom");
                        return false;
                    }
                    ShowProgress();
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

            <div class="clmn1 imw100p fl" id="divMain" runat="server" visible="false">
                <div class="innerBx">
                    <div class="innerBxhead bgGrey">Reset Password</div>
                    <div id="divForm" class="innerBxbody brdGrey whiteBox buyRegis" runat="server">
                        <div class="sub-heading" id="divSubHeading" runat="server">
                            Please edit/fill in the details to reset your password.
                        </div>
                        <div class="formRow">
                            <br />
                            <label>User Name</label>
                            <div class="formRow1">
                                <asp:TextBox ID="xtxtUserName" runat="server" CssClass="imw70p" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>
                        <div class="formRow">
                            <label>New Password</label>
                            <div class="formRow1">
                                <asp:TextBox ID="xtxtNewPasswrod" TextMode="Password" runat="server" CssClass="imw70p" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>
                        <div class="formRow">
                            <label>Confirm Password</label>
                            <div class="formRow1">
                                <asp:TextBox ID="xtxtConfirmPasswrod" TextMode="Password" runat="server" CssClass="imw70p" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>

                        <div class="formRow">
                            <label></label>
                            <div class="formRow1">
                                <asp:LinkButton ID="xlnkbtnSubmitPwd" runat="server" CssClass="btnBlk immrt20"
                                    OnClientClick="javascript: return lnkbtnSubmit_Pwd_Click();"
                                    OnClick="xlnkbtnSubmit_Click">SUBMIT</asp:LinkButton>
                            </div>
                        </div>
                        <br class="cl" />
                    </div>
                    <br class="cl">
                </div>
                <div class="whiteBox">
                    <div class="sub-heading" id="divMsg" runat="server" visible="false">
                        Password changed successfully.<br />
                        <button id="btnClose" type="button" runat="server" onclick="javascript:ShowProgress(true);" onserverclick="btnClose_click">
                            Close</button>
                        <div>
                            <!--  -->
                            <%--<button id="btnLogin" type="button" runat="server" onclick="javascript:ShowProgress(true);" onserverclick="btnLogin_click">
                            Close</button>--%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clmn1 imw100p fl" id="divVerify" runat="server">
                <div class="innerBx">
                    <div class="innerBxhead bgGrey">Reset Password</div>
                    <div class="innerBxbody brdGrey whiteBox" style="min-height: 252px;">
                        <div class="buyRegis">
                            <p id="pmsgVer" runat="server">
                            </p>
                            <div id="divOTP" runat="server">
                                <div class="formRow">
                                    <label>Verification Code</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtOTP" runat="server" placeholder="Enter the code" MaxLength="50" CssClass="imw48p" ondrop="return false;" onkeydown="return IsNumeric(event);" autocomplete="off"></asp:TextBox>

                                        <asp:LinkButton ID="xlnkbtnResendOTP" runat="server" CssClass="btnGrey"
                                            OnClick="xlnkbtnResendOTP_Click" Visible="false">Resend OTP</asp:LinkButton>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label></label>
                                    <div class="formRow1">
                                        <asp:LinkButton ID="xlnkContinue" runat="server" CssClass="btnRed" OnClientClick="javascript: return ValidateOTP();"
                                            OnClick="xlnkContinue_Click">Submit</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="formRow">
                                <label></label>
                                <div class="formRow1">
                                    <asp:LinkButton ID="xlnkbtnResend" runat="server" CssClass="btnRed"
                                        OnClick="xlnkbtnResend_Click" Visible="false">Resend Link</asp:LinkButton>
                                    <asp:LinkButton ID="xlnkBtnRedirect" runat="server" CssClass="btnRed"
                                        OnClick="btnClose_click" Visible="false">Continue</asp:LinkButton>
                                    <asp:Literal ID="xlitErr" runat="server"></asp:Literal>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:UpdatePanel ID="xupnlCrfm" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="modal fade" id="divConfirm" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="xbtnClose" runat="server" class="close"
                                onclick="javascript: return false;">
                                &times;</button>
                            <h4 class="modal-title" id="H1" runat="server">Congratulations!</h4>
                        </div>
                        <div class="modal-body">
                            <p id="pRegMsg" runat="server">
                            </p>
                        </div>
                        <div class="modal-footer" style="display: none">
                            <a class="btnRed" href="#" id="lnkClose" runat="server"
                                onclick="javascript: return false;">Close</a>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

