<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_RegistrationBuyer, App_Web_registrationbuyer.aspx.fdf7a39c" validaterequest="false" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function validatePassword(password) {
            var regularExpression = /(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9])/;
            if (!regularExpression.test(password)) {
                return false;
            }
            else {
                return true;
            }
        }

        function Onchange_Country(val) {
            var country = new Array();
            country = val.split('|');
            if (country.length > 0) {
                $("#ContentPlaceHolder1_xtxtCountryCodeLandLine").val(country[1]);
                $("#ContentPlaceHolder1_xtxtCountryCodeMobile").val(country[1]);
            }
            else {
                $("#ContentPlaceHolder1_xtxtCountryCodeLandLine").val
                $("#ContentPlaceHolder1_xtxtCountryCodeMobile").val('');
            }
        }

        function Onchange_City(val) {
            var city = new Array();
            city = val.split('|');
            if (city.length > 0) {
                $("#ContentPlaceHolder1_xtxtCityCodeLandLine").val(city[1]);
                //$("#ContentPlaceHolder1_xtxtCityCodeMobile").val(city[1]);                        
            }
            else {
                $("#ContentPlaceHolder1_xtxtCityCodeLandLine").val('');
                //$("#ContentPlaceHolder1_xtxtCityCodeMobile").val('');
            }
        }

        function lnkbtnRegister_Click() {
            if ($("#ContentPlaceHolder1_xtxtFirstName").val() == "") {
                $("#ContentPlaceHolder1_xtxtFirstName").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtFirstName"), "Please Enter FirstName.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtLastName").val() == "") {
                $("#ContentPlaceHolder1_xtxtLastName").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtLastName"), "Please Enter LastName.", "bottom");
                return false;
            }
            if ($("#ContentPlaceHolder1_xtxtName").val() == "") {
                $("#ContentPlaceHolder1_xtxtName").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtName"), "Please Enter company name.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtAddress").val() == "") {
                $("#ContentPlaceHolder1_xtxtAddress").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtAddress"), "Please Enter address.", "bottom");
                return false;
            }
                //else if ($("#ContentPlaceHolder1_xddlCountry option:selected").index() <= 0) {
                //    $("#ContentPlaceHolder1_xddlCountry").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xddlCountry"), "Please select Country", "bottom");
                //    return false;
                //}
            else if ($("#ContentPlaceHolder1_xddlState option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlState").focus();
                ShowToolTip($("#ContentPlaceHolder1_xddlState"), "Please select State.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlCity option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlCity").focus();
                ShowToolTip($("#ContentPlaceHolder1_xddlCity"), "Please select City.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtPincode").val() == "") {
                $("#ContentPlaceHolder1_xtxtPincode").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtPincode"), "Please Enter Pincode.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtEmail").val() == "") {
                $("#ContentPlaceHolder1_xtxtEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtEmail"), "Please Enter Email Address", "bottom");
                return false;
            }
            else if (!validateEmail($("#ContentPlaceHolder1_xtxtEmail").val())) {
                $("#ContentPlaceHolder1_xtxtEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtEmail"), "Please Enter Valid Email Address", "bottom");
                return false;
            }
                //else if ($("#ContentPlaceHolder1_xddlTitle option:selected").index() <= 0) {
                //    $("#ContentPlaceHolder1_xddlTitle").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xddlTitle"), "Please select Title.", "bottom");
                //    return false;
                //}

                //else if ($("#ContentPlaceHolder1_xtxtLastName").val() == "") {
                //    $("#ContentPlaceHolder1_xtxtLastName").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtLastName"), "Please Enter LastName.", "bottom");
                //    return false;
                //}
                //else if ($("#ContentPlaceHolder1_xtxtDesignation").val() == "") {
                //    $("#ContentPlaceHolder1_xtxtDesignation").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtDesignation"), "Please Enter Designation.", "bottom");
                //    return false;
                //}
                //else if ($("#ContentPlaceHolder1_xtxtLandLineNo").val() == "") {
                //    $("#ContentPlaceHolder1_xtxtLandLineNo").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtLandLineNo"), "Please Enter LandLine Number", "bottom");
                //    return false;
                //}
            else if ($("#ContentPlaceHolder1_xtxtMobileNo").val() == "") {
                $("#ContentPlaceHolder1_xtxtMobileNo").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMobileNo"), "Please Enter Mobile Number", "bottom");
                return false;
            }
                //var MobileLength = $("#ContentPlaceHolder1_xtxtMobileNo").val().length;
            else if ($("#ContentPlaceHolder1_xtxtMobileNo").val().length < 10) {
                $("#ContentPlaceHolder1_xtxtMobileNo").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMobileNo"), "Please Enter valid MobileNo .", "bottom");
                return false;
            }


                //else if (!validateEmail($("#ContentPlaceHolder1_xtxtConfirmEmail").val())) {
                //    $("#ContentPlaceHolder1_xtxtConfirmEmail").focus();
                //    //ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmEmail"), "Please Enter Correct ConfirmEmail", "bottom");
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmEmail"), "Please confirm email", "bottom");
                //    return false;
                //}
                //else if ($("#ContentPlaceHolder1_xtxtConfirmEmail").val() != $("#ContentPlaceHolder1_xtxtEmail").val()) {
                //    $("#ContentPlaceHolder1_xtxtConfirmEmail").focus();
                //    //ShowToolTip("#ContentPlaceHolder1_xtxtConfirmEmail", "Please check Email and ConfirmEmail does not match", "bottom");
                //    ShowToolTip("#ContentPlaceHolder1_xtxtConfirmEmail", "Email doesn't match", "bottom");
                //    return false;
                //}
            else if ($("#ContentPlaceHolder1_xtxtPWD").val() == "") {
                $("#ContentPlaceHolder1_xtxtPWD").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtPWD"), "Please enter password", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtPWD").val().length < 8) {
                $("#ContentPlaceHolder1_xtxtPWD").focus();
                ShowToolTip("#ContentPlaceHolder1_xtxtPWD", "Please enter atleast 8 characters", "bottom");
                return false;
            }
            else if (!validatePassword($("#ContentPlaceHolder1_xtxtPWD").val())) {
                $("#ContentPlaceHolder1_xtxtPWD").focus();
                ShowToolTip("#ContentPlaceHolder1_xtxtPWD", "Please enter alphanumeric password", "bottom");
                return false;
            }
                //else if ($("#ContentPlaceHolder1_xtxtPWD").val().length < 6) {
                //    $("#ContentPlaceHolder1_xtxtPWD").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtPWD"), "Please enter minimum 6 character password .", "bottom");
                //    return false;
                //}
            else if ($("#ContentPlaceHolder1_xtxtConfirmPWD").val() == "") {
                $("#ContentPlaceHolder1_xtxtConfirmPWD").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmPWD"), "Please enter confirm password", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtConfirmPWD").val() != $("#ContentPlaceHolder1_xtxtPWD").val()) {
                $("#ContentPlaceHolder1_xtxtConfirmPWD").focus();
                //ShowToolTip("#ContentPlaceHolder1_xtxtConfirmEmail", "Please check Email and ConfirmEmail does not match", "bottom");
                ShowToolTip("#ContentPlaceHolder1_xtxtConfirmPWD", "Password doesn't match", "bottom");
                return false;
            }
            else if (!$('#ContentPlaceHolder1_xchkTnC').is(':checked')) {
                $("#ContentPlaceHolder1_xchkTnC").focus();
                ShowToolTip($("#ContentPlaceHolder1_xchkTnC"), "Please accept terms & conditions", "right");
                //ShowToolTip($("#ContentPlaceHolder1_lblTnC"), "Please accept terms & conditions", "bottom");

                return false;
            }

            //else if ($("#ContentPlaceHolder1_xtxtYearOfInception").val() == "") {
            //    $("#ContentPlaceHolder1_xtxtYearOfInception").focus();
            //    ShowToolTip($("#ContentPlaceHolder1_xtxtYearOfInception"), "Please Enter Year Of Inception.", "bottom");
            //    return false;
            //}
            //else if ($("#ContentPlaceHolder1_xddlTurnOver option:selected").index() <= 0) {
            //    $("#ContentPlaceHolder1_xddlTurnOver").focus();
            //    ShowToolTip("#ContentPlaceHolder1_xddlTurnOver", " Please Select Turnover", "bottom");
            //    return false;
            //}
            //else if ($("#ContentPlaceHolder1_xtxtProfit").val() == "") {
            //    $("#ContentPlaceHolder1_xtxtProfit").focus();
            //    ShowToolTip($("#ContentPlaceHolder1_xtxtProfit"), "Please Enter Profit afterTax.", "bottom");
            //    return false;
            //}
            //else if (($("#ContentPlaceHolder1_xddlBank option:selected").index() <= 0) && ($("#ContentPlaceHolder1_xddlBank1 option:selected").index() <= 0) && ($("#ContentPlaceHolder1_xddlBank2 option:selected").index() <= 0)) {
            //    $("#ContentPlaceHolder1_xddlBank").focus();
            //    ShowToolTip("#ContentPlaceHolder1_xddlBank", " Please select at least one bank", "bottom");
            //    return false;
            //}

            ShowProgress();
            return true;
        }

        function lnkbtnRegisterCancel_Click() {
            ShowProgress();
            return true;
        }

        function Email_Change() {
            //alert("test");
            var OldEmail = "";
            var NewEmail = "";
            OldEmail = $("#ContentPlaceHolder1_xhdnEmail").val();
            NewEmail = $("#ContentPlaceHolder1_xtxtEmail").val();

            if (OldEmail != "") {
                if (OldEmail != NewEmail) {
                    $("#ContentPlaceHolder1_xdivCnfmEmail").attr('style', 'display:block;');
                }
                else {
                    $("#ContentPlaceHolder1_xtxtConfirmEmail").val(OldEmail);
                    $("#ContentPlaceHolder1_xdivCnfmEmail").attr('style', 'display:none;');
                }
            }
        }

    </script>

    <script type="text/javascript">

        function showAddress2() {
            $("#divAddress2").show();
            $("#divShowNewLine").hide();
            $("#divHideNewLine").show();
        }
        function hideAddress2() {
            $("#divAddress2").hide();
            $("#divShowNewLine").show();
            $("#divHideNewLine").hide();
        }

    </script>
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

    <asp:UpdatePanel ID="xupnlSupplier" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="clmn1 fl">
                <div class="row1">
                    <div class="whiteBox brdPink">
                        <div class="buyRegis">
                            <div class="formRow">
                                <label>Full Name <em class="markRed">*</em></label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtFirstName" runat="server" CssClass="imw48p"
                                        MaxLength="50" ondrop="return false;" onkeydown="return IsCharacter(event);"
                                        autocomplete="off" placeholder="First Name"></asp:TextBox>
                                    <asp:TextBox ID="xtxtLastName" runat="server" CssClass="imw48p fr"
                                        MaxLength="50" ondrop="return false;" onkeydown="return IsCharacter(event);"
                                        autocomplete="off" placeholder="Last Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="formRow">
                                <label>Company <em class="markRed">*</em></label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtName" runat="server" CssClass="imw100p" MaxLength="200"
                                        placeholder="Your company name" onkeypress="return RestrictText(event);" onpaste="return false"
                                        ondrop="return false;" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div class="formRow">
                                <label>Address <em class="markRed">*</em></label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtAddress" runat="server" CssClass="imw100p" onkeypress="return RestrictText(event);" onpaste="return false"
                                        TextMode="MultiLine" placeholder="Type your address" MaxLength="200" ondrop="return false;"
                                        autocomplete="off"></asp:TextBox>

                                    <div class="moreFields">
                                        <div class="imw32p fl bgGrey" style="display: none;">
                                            <div class="styled-select selOrganization">
                                                <asp:TextBox ID="xlblCountry" runat="server" CssClass="imw97p" Style="display: none" ReadOnly="true"></asp:TextBox>
                                                <asp:DropDownList ID="xddlCountry" runat="server" onchange="Onchange_Country(this.value);" OnSelectedIndexChanged="xddlCountry_SelectedIndexChanged"
                                                    AutoPostBack="true">
                                                    <asp:ListItem Text="Country" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="imw32p fl bgGrey">
                                            <div class="styled-select selOrganization">
                                                <asp:DropDownList ID="xddlState" runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="xddlState_SelectedIndexChanged">
                                                    <asp:ListItem Text="State" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="imw32p fl bgGrey">
                                            <div class="styled-select selOrganization">
                                                <asp:DropDownList ID="xddlCity" runat="server" onchange="Onchange_City(this.value);">
                                                    <asp:ListItem Text="City" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="imw32p fl">
                                            <asp:TextBox ID="xtxtPincode" runat="server" CssClass="imw100p"
                                                placeholder="PIN" onkeydown="IsNumeric(event);" MaxLength="6"
                                                ondrop="return false;" autocomplete="off"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ad-nw-ad" id="divShowNewLine" onclick="javascript:return showAddress2();return false;" style="display: none;"><i class="glyphicon glyphicon-plus fl"></i>Add another address </div>
                            <div class="ad-nw-ad" id="divHideNewLine" onclick="javascript:return hideAddress2();" style="display: none;"><i id="i1" class="glyphicon glyphicon-minus fl"></i>Add another address </div>
                            <div class="formRow" id="divAddress2" style="display: none;">
                                <label>Address2</label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtAddress2" runat="server" CssClass="imw100p" onkeypress="return RestrictText(event);"
                                        TextMode="MultiLine" placeholder="Address 2" MaxLength="200" ondrop="return false;"
                                        autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div class="formRow">
                                <label>State Code</label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtStateCode" runat="server" CssClass="imw48p"
                                        MaxLength="5" autocomplete="off" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            <%--//GST--%>
                            <div class="formRow">
                                <label>GST No</label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtGST" runat="server" CssClass="imw48p"
                                        placeholder="GST No" MaxLength="15" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div class="formRow">
                                <label>Email <em class="markRed">*</em></label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtEmail" runat="server" CssClass="imw100p"
                                        placeholder="Your email" MaxLength="50" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div class="formRow">
                                <label>Mobile <em class="markRed">*</em></label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtCountryCode" runat="server" Visible="false" CssClass="imw27p"
                                        Enabled="false"></asp:TextBox>
                                    <asp:TextBox ID="xtxtMobileNo" runat="server" CssClass="imw100p"
                                        placeholder="Your mobile" MaxLength="10" onpaste="return false;" onkeydown="return IsNumeric(event);"
                                        autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div class="formRow" id="divPassword" runat="server">
                                <label>
                                    <span class="fl">Password <em class="markRed">*</em></span>
                                    <div class="toolTip">
                                        <a href="#" onclick="javascript:return false;">?
			                      <div class="toolTipCont" style="width: 345px;">Create password with minimum of 8 characters including 1 alphanumeric character.</div>
                                        </a>
                                    </div>
                                </label>
                                <div class="formRow1">
                                    <asp:TextBox runat="server" ID="xtxtPWD" CssClass="imw48p" MaxLength="100"
                                        placeholder="Password" TextMode="Password" autocomplete="off"></asp:TextBox>
                                    <asp:TextBox ID="xtxtConfirmPWD" runat="server" CssClass="imw48p fr" MaxLength="100"
                                        placeholder="Confirm password" TextMode="Password" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div class="formRow buyRegis chkBlk">
                                <label></label>
                                <div class="formRow1">
                                    <asp:CheckBox ID="xchkTnC" runat="server" />
                                    <p id="Label1" for="xchkTnC">
                                        I have read the <a target="_blank" href="../Innerpages/TNC.aspx"
                                            class="termLink" style="display: inline;">terms and conditions</a> and I agree to abide by them
                                    </p>
                                </div>
                            </div>

                            <div id="divPublish" runat="server" class="formRow buyRegis chkBlk" visible="false">
                                <label></label>
                                <div class="formRow1">
                                    <asp:CheckBox ID="xchkPublish" runat="server" />
                                    <p for="xchkPublish">Published</p>
                                </div>
                            </div>
                            <div id="divIsDemo" runat="server" class="formRow buyRegis chkBlk" visible="false">
                                <label></label>
                                <div class="formRow1">
                                    <asp:CheckBox ID="xchkDemo" runat="server" />
                                    <p for="xchkDemo">Set as Demo</p>
                                </div>
                            </div>
                            <div class="formRow">
                                <label></label>
                                <div class="formRow1">
                                    <button type="button" id="xbtnRegister" runat="server" class="btnRed"
                                        onclick="javascript: if(!lnkbtnRegister_Click()){return false;}"
                                        onserverclick="xlnkbtnRegister_Click">
                                        REGISTER</button>
                                </div>
                            </div>
                        </div>
                        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                        <asp:Literal ID="xlitScript2" runat="server"></asp:Literal>
                        <br class="cl" />
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="xhdnEmail" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:UpdatePanel ID="xupnlCrfm" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="modal fade" id="divConfirm" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="btnClose" runat="server" class="close"
                                onclick="javascript:link_click('H');">
                                &times;</button>
                            <h4 class="modal-title" id="H1" runat="server">Welcome!</h4>
                        </div>
                        <div class="modal-body">
                            <p id="pRegMsg" runat="server">
                                Your username and password has been sent to your registered email ID. 
                            </p>
                        </div>
                        <div class="modal-footer" id="divFooter" runat="server">
                            <a class="btnRed" href="#" id="lnkCheckMail" runat="server" target="_blank"
                                visible="false">CHECK YOUR MAIL</a>
                            <a class="btnRed" href="#" id="lnkNext" runat="server"
                                onclick="javascript: return false;" visible="false">ADD ADDITIONAL USERS</a>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

