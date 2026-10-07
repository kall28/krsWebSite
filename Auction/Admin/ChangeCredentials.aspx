<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_ChangeCredentials, App_Web_changecredentials.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<style>
        #ContentPlaceHolder1_xtxtOldPassword {
            padding: 2%;
            margin-bottom: 0%;
        }

        #ContentPlaceHolder1_xtxtNewPasswrod {
            padding: 2%;
            margin-bottom: 0%;
        }

        #ContentPlaceHolder1_xtxtConfirmPasswrod {
            padding: 2%;
            margin-bottom: 0%;
        }

        #ContentPlaceHolder1_xtxtPassword {
            padding: 2%;
            margin-bottom: 0%;
        }
    </style>--%>

    <style>
        #accordion .glyphicon-minus, .glyphicon-plus {
            color: #333;
            font-family: "Glyphicons Halflings";
            font-style: normal;
            margin-right: 10px;
        }

        #accordion .panel-default > .panel-heading {
            border-color: #fff;
            color: #e4a823;
            border-radius: 0;
            background: #fff; /* Old browsers */
        }

        #accordion h5 {
            font-size: 15px;
        }

        #accordion .panel-title {
            font-size: 18px;
            /*color : #fff;*/
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
            else if ($("#ContentPlaceHolder1_xtxtPassword").val() == "") {
                $("#ContentPlaceHolder1_xtxtPassword").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtPassword"), "Please enter Password.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtPassword").val().length < 8) {
                $("#ContentPlaceHolder1_xtxtPassword").focus();
                ShowToolTip("#ContentPlaceHolder1_xtxtPassword", "Please enter atleast 8 characters", "bottom");
                return false;
            }
            else if (!validatePassword($("#ContentPlaceHolder1_xtxtPassword").val())) {
                $("#ContentPlaceHolder1_xtxtPassword").focus();
                ShowToolTip("#ContentPlaceHolder1_xtxtPassword", "Please enter alphanumeric password", "bottom");
                return false;
            }
            ShowProgress();
            return true;
        }

        function lnkbtnSubmit_Pwd_Click() {

            if ($("#ContentPlaceHolder1_xtxtOldPassword").val() == "") {
                $("#ContentPlaceHolder1_xtxtOldPassword").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtOldPassword"), "Please enter old Password.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtNewPasswrod").val() == "") {
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

        function xlnkbtnSubmit_Email_Click() {

            if ($("#ContentPlaceHolder1_xtxtEmail").val() == "") {
                $("#ContentPlaceHolder1_xtxtEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtEmail"), "Please enter old Email.", "bottom");
                return false;
            }
            else if (!validateEmail($("#ContentPlaceHolder1_xtxtEmail").val())) {
                $("#ContentPlaceHolder1_xtxtEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtEmail"), "Please Enter Valid Email Address", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtNewEmail").val() == "") {
                $("#ContentPlaceHolder1_xtxtNewEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtNewEmail"), "Please enter new Email.", "bottom");
                return false;
            }
            else if (!validateEmail($("#ContentPlaceHolder1_xtxtNewEmail").val())) {
                $("#ContentPlaceHolder1_xtxtNewEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtNewEmail"), "Please Enter Valid New Email Address", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtConfirmEmail").val() == "") {
                $("#ContentPlaceHolder1_xtxtConfirmEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmEmail"), "Please enter confirm Email.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtNewEmail").val() != $("#ContentPlaceHolder1_xtxtConfirmEmail").val()) {
                $("#ContentPlaceHolder1_xtxtConfirmEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmEmail"), "Confirm email does not match.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtVerifyPWD").val() == "") {
                $("#ContentPlaceHolder1_xtxtVerifyPWD").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtVerifyPWD"), "Please enter Password.", "bottom");
                return false;
            }
            ShowProgress();
            return true;
        }


        function xlnkbtnSubmit_Mob_Click() {

            if ($("#ContentPlaceHolder1_xtxtMobile").val() == "") {
                $("#ContentPlaceHolder1_xtxtMobile").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMobile"), "Please enter old Mobile number.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtMobile").val().length < 10) {
                $("#ContentPlaceHolder1_xtxtMobile").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMobile"), "Please Enter valid MobileNo .", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtNewMobile").val() == "") {
                $("#ContentPlaceHolder1_xtxtNewMobile").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtNewMobile"), "Please enter new Mobile number.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtNewMobile").val().length < 10) {
                $("#ContentPlaceHolder1_xtxtNewMobile").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtNewMobile"), "Please Enter valid MobileNo .", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtConfirmMobile").val() == "") {
                $("#ContentPlaceHolder1_xtxtConfirmMobile").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmMobile"), "Please re-enter Mobile number.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtNewMobile").val() != $("#ContentPlaceHolder1_xtxtConfirmMobile").val()) {
                $("#ContentPlaceHolder1_xtxtConfirmMobile").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmMobile"), "Confirm mobile does not match.", "bottom");
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

        //for accordion
        function toggleChevron(e) {
            $(e.target)
                .prev('.panel-heading')
                .find("i.indicator")
                .toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
        }
        //$('#accordion').on('hidden.bs.collapse', toggleChevron);
        //$('#accordion').on('shown.bs.collapse', toggleChevron);

        $(document).ready(function () {
            $('#collapseOne').on('hidden.bs.collapse', function () {
                //setclass("#col1", 'glyphicon-chevron-up', 'glyphicon-chevron-down');
                setclass($("#col1"), 'glyphicon glyphicon-plus', 'glyphicon glyphicon-minus');


            });
            $('#collapseOne').on('shown.bs.collapse', function () {
                //setclass("#col1", 'glyphicon-chevron-down', 'glyphicon-chevron-up');
                setclass($("#col1"), 'glyphicon glyphicon-minus', 'glyphicon glyphicon-plus');
            });

            $('#collapseTwo').on('hidden.bs.collapse', function () {
                //setclass("#col2", 'glyphicon-chevron-up', 'glyphicon-chevron-down');
                setclass("#col2", 'glyphicon glyphicon-plus', 'glyphicon glyphicon-minus');
            });
            $('#collapseTwo').on('shown.bs.collapse', function () {
                //setclass("#col2", 'glyphicon-chevron-down', 'glyphicon-chevron-up');
                setclass("#col2", 'glyphicon glyphicon-minus', 'glyphicon glyphicon-plus');
            });

            $('#collapseThree').on('hidden.bs.collapse', function () {
                //setclass("#col3", 'glyphicon-chevron-up', 'glyphicon-chevron-down');
                setclass("#col3", 'glyphicon glyphicon-plus', 'glyphicon glyphicon-minus');
            });
            $('#collapseThree').on('shown.bs.collapse', function () {
                //setclass("#col3", 'glyphicon-chevron-down', 'glyphicon-chevron-up');
                setclass("#col3", 'glyphicon glyphicon-minus', 'glyphicon glyphicon-plus');
            });

        });
        function setclass(control, addclass, removeclass) {
            $(control).addClass(addclass);
            $(control).removeClass(removeclass);
        }

        //$(document).ready(function () {
        //    //toggle the componenet with class accordion_body
        //    $(".accordion_head").click(function () {
        //        //alert($(this).attr('id'));
        //        if ($(this).next('.accordion_body').is(':visible')) {
        //            $(this).next(".accordion_body").slideUp(300);
        //            $(this).children(".plusminus").text('+');
        //        }
        //        else {
        //            if ($('.accordion_body').is(':visible')) {
        //                $(".accordion_body").slideUp(300);
        //                $(".plusminus").text('+');
        //            }
        //            $(this).next(".accordion_body").slideDown(300);
        //            $(this).removeClass("chatAlert");
        //            $('#' + $(this).attr('id').replace('div', 'ulChat')).scrollTop($('#' + $(this).attr('id').replace('div', 'ulChat'))[0].scrollHeight);
        //            $(this).children(".plusminus").text('-');
        //        }
        //    });
        //});
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
    <asp:UpdatePanel ID="xupnlMain" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div class="clmn1">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                    <i id="col1" class="glyphicon glyphicon-plus"></i>Change Password</a>
                                <%-- <div class="innerBxhead bgGrey"></div>--%>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                                <asp:UpdatePanel ID="xupnlChangePassword" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="buyRegis innerBxbody changePassword">
                                            <div class="formRow">
                                                <label>Old Password</label>
                                                <div class="formRow1">
                                                    <asp:TextBox ID="xtxtOldPassword" runat="server" CssClass="imw70p"
                                                        TextMode="Password" autocomplete="off"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="formRow">
                                                <label>
                                                    <span class="fl">New Password</span>
                                                    <div class="toolTip">
                                                        <a href="#" onclick="javascript:return false;">?
			                                              <div class="toolTipCont" style="width: 345px;">
                                                              Password with minimum of 8 characters 
                                                              including 1 alphanumeric character.
                                                            </div>
                                                        </a>
                                                    </div>
                                                </label>
                                                <div class="formRow1">
                                                    <asp:TextBox ID="xtxtNewPasswrod" runat="server" CssClass="imw70p"
                                                        TextMode="Password" autocomplete="off"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="formRow">
                                                <label>Confirm Password</label>
                                                <div class="formRow1">
                                                    <asp:TextBox ID="xtxtConfirmPasswrod" runat="server" CssClass="imw70p"
                                                        TextMode="Password" autocomplete="off"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="formRow">
                                                <label></label>
                                                <div class="formRow1">
                                                    <asp:LinkButton ID="xlnkbtnSubmitPwd" runat="server" CssClass="btnRed"
                                                        OnClientClick="javascript: return lnkbtnSubmit_Pwd_Click();"
                                                        OnClick="xlnkbtnSubmit_Click">SUBMIT</asp:LinkButton>
                                                </div>
                                            </div>
                                            <br class="cl" />
                                            <asp:Literal ID="xlitChangePWD" runat="server"></asp:Literal>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                    <i id="col2" class="glyphicon glyphicon-plus"></i>Change Email
                                </a>
                                <%--<div class="innerBxhead bgGrey"></div>--%>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                <asp:UpdatePanel ID="xupnlChangeEmail" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="buyRegis innerBxbody changePassword">

                                            <div class="formRow">
                                                <label>Old e-mail:</label>
                                                <div class="formRow1">
                                                    <asp:TextBox ID="xtxtEmail" runat="server" CssClass="imw70p"
                                                        autocomplete="off"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="formRow">
                                                <label>New e-mail:</label>
                                                <div class="formRow1">
                                                    <asp:TextBox ID="xtxtNewEmail" runat="server" CssClass="imw70p" TextMode="Password"
                                                        oncopy="return false" onpaste="return false" oncut="return false"
                                                        ondelete="return false" autocomplete="off"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="formRow">
                                                <label>Re-enter new e-mail:</label>
                                                <div class="formRow1">
                                                    <asp:TextBox ID="xtxtConfirmEmail" runat="server" CssClass="imw70p"
                                                        oncopy="return false" onpaste="return false" oncut="return false" ondelete="return false"
                                                        autocomplete="off"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="formRow">
                                                <label>Password</label>
                                                <div class="formRow1">
                                                    <asp:TextBox ID="xtxtVerifyPWD" runat="server" CssClass="imw70p"
                                                        TextMode="Password" autocomplete="off"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="formRow">
                                                <label></label>
                                                <div class="formRow1">
                                                    <asp:LinkButton ID="xlnkbtnSubmitEmail" runat="server" CssClass="btnRed"
                                                        OnClientClick="javascript: return xlnkbtnSubmit_Email_Click();"
                                                        OnClick="xlnkbtnSubmitEmail_Click">SUBMIT</asp:LinkButton>
                                                </div>
                                            </div>
                                            <br class="cl" />
                                            <asp:Literal ID="xlitChangeEmail" runat="server"></asp:Literal>
                                        </div>
                                        <br class="cl" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>

                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <%-- <div class="innerBxhead bgGrey"></div>--%>
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                    <i id="col3" class="glyphicon glyphicon-plus"></i>Change Mobile Number 

                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                <asp:UpdatePanel ID="xupnlChangeMobile" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="buyRegis innerBxbody changePassword">
                                            <div class="formRow">
                                                <label>Old Mobile Number</label>
                                                <div class="formRow1">
                                                    <asp:TextBox ID="xtxtMobile" runat="server" CssClass="imw70p" MaxLength="10" autocomplete="off"
                                                        onkeydown="return IsNumeric(event);"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="formRow">
                                                <label>New Mobile Number</label>
                                                <div class="formRow1">
                                                    <asp:TextBox ID="xtxtNewMobile" runat="server" oncopy="return false" TextMode="Password"
                                                        onpaste="return false" oncut="return false" ondelete="return false"
                                                        CssClass="imw70p" MaxLength="10" autocomplete="off" onkeydown="return IsNumeric(event);"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="formRow">
                                                <label>Re-enter mobile number</label>
                                                <div class="formRow1">
                                                    <asp:TextBox ID="xtxtConfirmMobile" runat="server" CssClass="imw70p" MaxLength="10"
                                                        autocomplete="off" onkeydown="return IsNumeric(event);"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="formRow" id="divOTP" runat="server" style="display: none">
                                                <label>OTP</label>
                                                <div class="formRow1">
                                                    <asp:TextBox ID="xtxtOTP" runat="server" CssClass="imw70p" autocomplete="off"
                                                        onkeydown="return IsNumeric(event);"></asp:TextBox>

                                                    <asp:LinkButton ID="xlnkbtnResend" runat="server" CssClass="btnGrey" Visible="false"
                                                        OnClick="xllnkResend_Click">RESEND OTP</asp:LinkButton>
                                                </div>
                                            </div>
                                            <div class="formRow">
                                                <label></label>
                                                <div class="formRow1">
                                                    <asp:LinkButton ID="xlnkbtnSubmitMob" runat="server" CssClass="btnRed"
                                                        OnClientClick="javascript: return xlnkbtnSubmit_Mob_Click();"
                                                        OnClick="xlnkbtnSubmitMob_Click">SUBMIT</asp:LinkButton>
                                                    <asp:LinkButton ID="xlnkbtnSubmitMobFinal" runat="server" CssClass="btnRed" Visible="false"
                                                        OnClientClick="javascript: return ValidateOTP();"
                                                        OnClick="xlnkbtnSubmitMobFinal_Click">SUBMIT</asp:LinkButton>
                                                    <asp:Literal ID="xlitScrMobile" runat="server"></asp:Literal>
                                                </div>
                                            </div>
                                            <br class="cl" />
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br class="cl" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

