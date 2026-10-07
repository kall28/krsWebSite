<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_RegistrationSupplier, App_Web_registrationsupplier.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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

        /*#ContentPlaceHolder1_xupnlSupplier {
    position: relative;
    top: -85px;
    z-index: 2000;
}*/
    </style>

    <asp:UpdatePanel ID="xupnlSupplier" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

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
                        $("#ContentPlaceHolder1_xtxtCountryCodeLandLine").val('');
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

                function validateCheckBox() {
                    if (!$("#chckCat input[type='checkbox']").is(":checked")) {
                        return false;
                    }

                    return true;
                }

                function GetCheckedCat() {
                    var checkedCat = [];
                    var checkBoxList = $("#chckCat input[type='checkbox']");
                    if (validateCheckBox()) {
                        for (var i = 0; i < checkBoxList.length; i++) {
                            if (checkBoxList[i].checked) {
                                checkedVendor.push(checkBoxList[i].value);
                            }
                        }
                    }

                    return checkedVendor;
                }

                function lnkbtnRegister_Click() {
                    if ($("#ContentPlaceHolder1_xtxtFirstName").val() == "") {
                        $("#ContentPlaceHolder1_xtxtFirstName").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtFirstName"), "Please Enter First Name.", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtLastName").val() == "") {
                        $("#ContentPlaceHolder1_xtxtLastName").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtLastName"), "Please Enter Last Name.", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtName").val() == "") {
                        $("#ContentPlaceHolder1_xtxtName").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtName"), "Please Enter company name.", "bottom");
                        return false;
                    }
                        //else if ($('#ContentPlaceHolder1_xctrlPAN_imgLogo').text() == "") {
                        //    $("#ContentPlaceHolder1_xctrlPAN_imgLogo").focus();
                        //    ShowToolTip($("#ContentPlaceHolder1_xctrlPAN_imgLogo"), "Please upload the relevant document.", "bottom");
                        //        return false;
                        //    }
                    else if ($("#ContentPlaceHolder1_xtxtAddress").val() == "") {
                        $("#ContentPlaceHolder1_xtxtAddress").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtAddress"), "Please Enter address.", "bottom");
                        return false;
                    }
                        //else if ($("#ContentPlaceHolder1_xddlCountry option:selected").index() <= 0) {
                        //    $("#ContentPlaceHolder1_xddlCountry").focus();
                        //    ShowToolTip("#ContentPlaceHolder1_xddlCountry", "Please Select Country", "bottom");
                        //    return false;
                        //}
                    else if ($("#ContentPlaceHolder1_xddlState option:selected").index() <= 0) {
                        $("#ContentPlaceHolder1_xddlState").focus();
                        ShowToolTip("#ContentPlaceHolder1_xddlState", "Please Select State", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xddlCity option:selected").index() <= 0) {
                        $("#ContentPlaceHolder1_xddlCity").focus();
                        ShowToolTip("#ContentPlaceHolder1_xddlCity", "Please Select City", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtPincode").val() == "") {
                        $("#ContentPlaceHolder1_xtxtPincode").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtPincode"), "Please Enter Pincode.", "bottom");
                        return false;
                    }
                        //else if ($("#ContentPlaceHolder1_xddlCat option:selected").index() <= 0) {
                        //    $("#ContentPlaceHolder1_xddlCat").focus();
                        //    ShowToolTip("#ContentPlaceHolder1_xddlCat", "Please Select Category", "bottom");
                        //    return false;
                        //}
                        //else if ($("#ContentPlaceHolder1_xddlCatSub  option:selected").index() <= 0) {
                        //    $("#ContentPlaceHolder1_xddlCatSub").focus();
                        //    ShowToolTip("#ContentPlaceHolder1_xddlCatSub", "Please Select Sub Category", "top");
                        //    return false;
                        //}
                        //else if ($("#ContentPlaceHolder1_xddlTitle option:selected").index() <= 0) {
                        //    $("#ContentPlaceHolder1_xddlTitle").focus();
                        //    ShowToolTip($("#ContentPlaceHolder1_xddlTitle"), "Please select Title.", "bottom");
                        //    return false;
                        //}

                        //else if ($("#ContentPlaceHolder1_xtxtDesignation").val() == "") {
                        //    $("#ContentPlaceHolder1_xtxtDesignation").focus();
                        //    ShowToolTip($("#ContentPlaceHolder1_xtxtDesignation"), "Please Enter Designation.", "bottom");
                        //    return false;
                        //}
                        //else if ($("#ContentPlaceHolder1_xtxtLandLineNo").val() == "") {
                        //    $("#ContentPlaceHolder1_xtxtLandLineNo").focus();
                        //    ShowToolTip($("#ContentPlaceHolder1_xtxtLandLineNo"), "Please Enter LandLineNo.", "bottom");
                        //    return false;
                        //}

                    else if ($("#ContentPlaceHolder1_xtxtEmail").val() == "") {
                        $("#ContentPlaceHolder1_xtxtEmail").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtEmail"), "Please Enter EmailAddress", "bottom");
                        return false;
                    }
                    else if (!validateEmail($("#ContentPlaceHolder1_xtxtEmail").val())) {
                        $("#ContentPlaceHolder1_xtxtEmail").focus();
                        ShowToolTip("#ContentPlaceHolder1_xtxtEmail", "Please Enter Correct EmailAddress", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtMobileNo").val() == "") {
                        $("#ContentPlaceHolder1_xtxtMobileNo").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtMobileNo"), "Please Enter MobileNo.", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtMobileNo").val().length < 10) {
                        $("#ContentPlaceHolder1_xtxtMobileNo").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtMobileNo"), "Please Enter valid MobileNo .", "bottom");
                        return false;
                    }

                    else if ($("#ContentPlaceHolder1_xtxtPassword").val() == "") {
                        $("#ContentPlaceHolder1_xtxtPassword").focus();
                        ShowToolTip("#ContentPlaceHolder1_xtxtPassword", "Please Enter Password", "bottom");
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
                        //else if ($("#ContentPlaceHolder1_xtxtPassword").val().length < 6) {
                        //    $("#ContentPlaceHolder1_xtxtPassword").focus();
                        //    ShowToolTip($("#ContentPlaceHolder1_xtxtPassword"), "Please enter minimum 6 character password .", "bottom");
                        //    return false;
                        //}
                    else if ($("#ContentPlaceHolder1_xtxtConfirmPass").val() == "") {
                        $("#ContentPlaceHolder1_xtxtConfirmPass").focus();
                        ShowToolTip("#ContentPlaceHolder1_xtxtConfirmPass", "Please Enter Confirm Password", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtConfirmPass").val() != $("#ContentPlaceHolder1_xtxtPassword").val()) {
                        $("#ContentPlaceHolder1_xtxtConfirmPass").focus();
                        //ShowToolTip("#ContentPlaceHolder1_xtxtConfirmEmail", "Please check Email and ConfirmEmail does not match", "bottom");
                        ShowToolTip("#ContentPlaceHolder1_xtxtConfirmPass", "Password doesn't match", "bottom");
                        return false;
                    }
                    else if (!$('#ContentPlaceHolder1_xchkTnC').is(':checked')) {
                        $("#ContentPlaceHolder1_xchkTnC").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xchkTnC"), "Please accept terms & conditions", "right");
                        return false;
                    }
                    //else if ($("#ContentPlaceHolder1_xtxtPAN").val() == "") {
                    //    $("#ContentPlaceHolder1_xtxtPAN").focus();
                    //    ShowToolTip($("#ContentPlaceHolder1_xtxtPAN"), "Please Enter PAN details.", "bottom");
                    //    return false;
                    //}

                    //var strCat = GetSelCat();
                    //if ($("#ContentPlaceHolder1_xddlCat option:selected").index() <= 0 && strCat == "") {
                    //    $("#ContentPlaceHolder1_xddlCat").focus();
                    //    ShowToolTip("#ContentPlaceHolder1_xddlCat", "Please Select Category", "bottom");
                    //    return false;
                    //}
                    //else if (strCat == "") {
                    //    $("#ContentPlaceHolder1_divSubCat").focus();
                    //    ShowToolTip("#ContentPlaceHolder1_divSubCat", "Please select sub ategory", "top");
                    //    return false;
                    //}
                    //$("#ContentPlaceHolder1_xhdnProdCat").val(strCat);

                    //=======================

                    //if (!$("#chckcat input[type='checkbox']").is(":checked")) {
                    //    $("#ContentPlaceHolder1_xddlCat").focus();
                    //     ShowToolTip("#ContentPlaceHolder1_xddlCat", "Please Select Category", "bottom");
                    //    return false;
                    //}
                    //var strCat = GetSelCat();
                    //$("#ContentPlaceHolder1_xhdnProdCat").val(strCat);
                    //var select = [];
                    //select = GetCheckedCat();
                    //var dataToPass = { arr: select };
                    //var jsonTxt = JSON.stringify(dataToPass);
                    //if (select.length > 0) {
                    ////if ($("#ContentPlaceHolder1_xddlCat option:selected").index() <= 0) {
                    ////    $("#ContentPlaceHolder1_xddlCat").focus();
                    ////    ShowToolTip("#ContentPlaceHolder1_xddlCat", "Please Select Category", "bottom");
                    ////    return false;
                    ////}
                    ////else {
                    ////    var strCat = GetSelCat();
                    ////    if (strCat == "") {
                    //        $("#ContentPlaceHolder1_divSubCat").focus();
                    //        ShowToolTip("#ContentPlaceHolder1_divSubCat", "Please select sub ategory", "top");
                    //        return false;
                    //    //}
                    //    //$("#ContentPlaceHolder1_xhdnProdCat").val(strCat);
                    //}
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
                                <label>Company Name <em class="markRed">*</em></label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtName" runat="server" CssClass="imw100p" placeholder="Company Name" MaxLength="200"
                                        onkeypress="return RestrictText(event);" onpaste="return false" ondrop="return false;" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div class="formRow">
                                <label>Address <em class="markRed">*</em></label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtAddress" runat="server" CssClass="imw100p" placeholder="Address" MaxLength="200"
                                        TextMode="MultiLine" onkeypress="return RestrictText(event);" onpaste="return false" ondrop="return false;"></asp:TextBox>
                                    <div class="moreFields">
                                        <div class="imw32p fl bgGrey">
                                            <label style="display: none;">Country</label>
                                            <div>
                                                <asp:TextBox ID="xlblCountry" runat="server" CssClass="imw100p"
                                                    Visible="false" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div id="divddlCountry" runat="server" class="styled-select selOrganization fr immr0"
                                                style="display: none">
                                                <asp:DropDownList ID="xddlCountry" runat="server"
                                                    onchange="Onchange_Country(this.value);" OnSelectedIndexChanged="xddlCountry_SelectedIndexChanged"
                                                    AutoPostBack="true">
                                                    <asp:ListItem Text="Country" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
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
                                                placeholder="PIN" onkeydown="IsNumeric(event);" MaxLength="6" ondrop="return false;"
                                                autocomplete="off"></asp:TextBox>
                                        </div>
                                    </div>
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
                                        placeholder="Email" MaxLength="50" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div class="formRow">
                                <label>Mobile <em class="markRed">*</em></label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtCountryCode" runat="server" Visible="false" CssClass="imw27p"
                                        Enabled="false"></asp:TextBox>
                                    <asp:TextBox ID="xtxtMobileNo" runat="server" CssClass="imw100p"
                                        placeholder="Mobile" MaxLength="10" onpaste="return false;" onkeydown="return IsNumeric(event);" autocomplete="off"></asp:TextBox>
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
                                    <asp:TextBox ID="xtxtPassword" runat="server" CssClass="imw48p" onkeydown="return IsAlphaNumeric(event);"
                                        placeholder="Password" TextMode="Password" autocomplete="off" MaxLength="100"></asp:TextBox>

                                    <asp:TextBox ID="xtxtConfirmPass" runat="server" CssClass="imw48p fr" MaxLength="100"
                                        placeholder="Confirm password" TextMode="Password" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br class="cl" />
                        <div class="formRow buyRegis chkBlk">
                            <label></label>
                            <div class="formRow1">
                                <asp:CheckBox ID="xchkTnC" runat="server" />
                                <p for="xchkTnC">
                                    I have read the <a target="_blank" href="../Innerpages/TNC.aspx" class="termLink"
                                        style="display: inline;">Terms and Conditions</a> and I agree to abide by them
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
                        <div id="divVerified" runat="server" class="formRow buyRegis chkBlk" visible="false">
                            <label></label>
                            <div class="formRow1">
                                <asp:CheckBox ID="xchkVerified" runat="server" />
                                <p for="xchkVerified">Verified</p>
                            </div>
                        </div>
                        <div runat="server" class="formRow buyRegis ">
                            <label></label>
                            <div class="formRow1">
                                <asp:LinkButton ID="xlnkbtnRegister" runat="server" CssClass="btnRed"
                                    OnClientClick="javascript: return lnkbtnRegister_Click();"
                                    OnClick="xlnkbtnRegister_Click">REGISTER</asp:LinkButton>
                                <asp:LinkButton ID="xlnkbtnUpdateProfile" runat="server" CssClass="btnRed"
                                    OnClick="xlnkbtnProfile_Click" Visible="false">EDIT MORE</asp:LinkButton>
                                <asp:LinkButton ID="xlnkbtnCancel" runat="server" CssClass="btnRed" Visible="false"
                                    OnClick="xlnkbtnCancel_Click">CANCEL</asp:LinkButton>
                            </div>
                            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                            <asp:Literal ID="xlitscrCat" runat="server"></asp:Literal>
                        </div>
                        <br class="cl" />
                        <br />
                        <br />
                    </div>
                </div>
            </div>
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
                            <button type="button" id="btnClose" runat="server" class="close"
                                onclick="javascript:link_click('H');">
                                &times;</button>
                            <h4 class="modal-title" id="H1" runat="server">Welcome!</h4>
                        </div>
                        <div class="modal-body">
                            <p id="pRegMsg" runat="server">
                                You have successfully registered on Renepay.
                                <br />
                                Your username and password has been sent to your registered email ID. 
                            </p>
                        </div>
                        <div class="modal-footer" id="divFooter" runat="server">
                            <a class="btnRed" href="#" id="lnkCheckMail" runat="server" target="_blank"
                                visible="false">CHECK YOUR MAIL</a>
                            <a class="btnRed" href="#" id="lnkNext" runat="server"
                                onclick="javascript: return false;" visible="false">ADD TO YOUR PROFILE</a>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

