<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_Registration, App_Web_registration.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="xupnlUser" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <script type="text/javascript">

                function ShowCompanySummary() {
                    //divConfirm.innerHTML += "</br></br></br><p>hellooooooooooooooooooooooooooooooooooooo</p>"
                    HideModalBox('#divConfirm');
                    ShowModalBox('#RegCnf');
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

                function lnkbtnRegister_Click() {

                    if ($("#ContentPlaceHolder1_xtxtAddress").val() == "") {
                        $("#ContentPlaceHolder1_xtxtAddress").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtAddress"), "Please Enter address.", "bottom");
                        return false;
                    }
                        //else if ($("#ContentPlaceHolder1_xddlCountry option:selected").index() <= 0) {
                        //    $("#ContentPlaceHolder1_xddlCountry").focus();
                        //    ShowToolTip($("#ContentPlaceHolder1_xddlCountry"), "please select Country", "bottom");
                        //    return false;
                        //}
                    else if ($("#ContentPlaceHolder1_xddlState option:selected").index() <= 0) {
                        $("#ContentPlaceHolder1_xddlState").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xddlState"), "please select State", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xddlCity option:selected").index() <= 0) {
                        $("#ContentPlaceHolder1_xddlCity").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xddlCity"), "please select State", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtPincode").val() == "") {
                        $("#ContentPlaceHolder1_xtxtPincode").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtPincode"), "Please Enter Pincode.", "bottom");
                        return false;
                    }
                        //else if ($("#ContentPlaceHolder1_xddlTitle option:selected").index() <= 0) {
                        //    $("#ContentPlaceHolder1_xddlTitle").focus();
                        //    ShowToolTip($("#ContentPlaceHolder1_xddlTitle"), "Please select Title.", "bottom");
                        //    return false;
                        //}
                    else if ($("#ContentPlaceHolder1_xtxtFirstName").val() == "") {
                        $("#ContentPlaceHolder1_xtxtFirstName").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtFirstName"), "Please Enter FirstName.", "bottom");
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtLastName").val() == "") {
                        $("#ContentPlaceHolder1_xtxtLastName").focus();
                        ShowToolTip($("#ContentPlaceHolder1_xtxtLastName"), "Please Enter LastName.", "bottom");
                        return false;
                    }
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
                        ShowToolTip($("#ContentPlaceHolder1_xtxtEmail"), "Please Enter ValidEmailAddress", "bottom");
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

                    //else if (!validateEmail($("#ContentPlaceHolder1_xtxtConfirmEmail").val())) {
                    //    $("#ContentPlaceHolder1_xtxtConfirmEmail").focus();
                    //    ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmEmail"), "Please Enter Correct ConfirmEmail", "bottom");
                    //    return false;
                    //}
                    //else if ($("#ContentPlaceHolder1_xtxtConfirmEmail").val() != $("#ContentPlaceHolder1_xtxtEmail").val()) {
                    //    $("#ContentPlaceHolder1_xtxtConfirmEmail").focus();
                    //    ShowToolTip("#ContentPlaceHolder1_xtxtConfirmEmail", "Please check Email and ConfirmEmail does not match", "bottom");
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
                                <label>Full Name</label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtFirstName" runat="server" CssClass="imw48p"
                                        MaxLength="50" ondrop="return false;" onpaste="return false" onkeydown="return IsCharacter(event);"
                                        autocomplete="off" placeholder="First Name"></asp:TextBox>

                                    <asp:TextBox ID="xtxtLastName" runat="server" CssClass="imw48p fr"
                                        MaxLength="50" ondrop="return false;" onpaste="return false" onkeydown="return IsCharacter(event);"
                                        autocomplete="off" placeholder="Last Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="formRow">
                                <label>Address</label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtAddress" runat="server" CssClass="imw100p"
                                        TextMode="MultiLine" placeholder="Address" MaxLength="6" ondrop="return false;" onkeypress="return RestrictText(event);" onpaste="return false"
                                        autocomplete="off"></asp:TextBox>
                                    <br class="cl" />
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
                            <div class="formRow">
                                <label>Email</label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtEmail" runat="server" CssClass="imw100p"
                                        placeholder="Email" MaxLength="50" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div class="formRow">
                                <label>Mobile <em class="markRed">*</em></label>
                                <div class="formRow1">
                                    <asp:TextBox ID="xtxtCountryCode" runat="server" CssClass="imw27p" Visible="false"
                                        Enabled="false"></asp:TextBox>
                                    <asp:TextBox ID="xtxtMobileNo" runat="server" CssClass="imw100p"
                                        placeholder="Mobile" MaxLength="10" onkeydown="return IsNumeric(event);"
                                        autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div>
                                <div id="divPublish" runat="server" class="formRow buyRegis chkBlk">
                                    <label></label>
                                    <div class="formRow1">
                                        <asp:CheckBox ID="xchkPublish" runat="server" Checked="true" />
                                        <p for="xchkPublish">Published</p>
                                    </div>
                                </div>
                                <div id="divIsDemo" runat="server" class="formRow buyRegis chkBlk">
                                    <label></label>
                                    <div class="formRow1">
                                        <asp:CheckBox ID="xchkDemo" runat="server" />
                                        <p for="xchkDemo">Set as Demo</p>
                                    </div>
                                </div>

                            </div>

                            <div class="formRow">
                                <label></label>
                                <div class="formRow1">
                                    <asp:LinkButton ID="xlnkbtnRegister" runat="server" CssClass="btnRed"
                                        OnClientClick="javascript: return lnkbtnRegister_Click();"
                                        OnClick="xlnkbtnRegister_Click">REGISTER</asp:LinkButton>
                                    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                                </div>
                            </div>
                            <br class="cl" />
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="xhdnEmail" runat="server" />
            <div class="modal fade" id="divConfirm" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="btnClose" runat="server" class="close"
                                onclick="javascript:link_click('H');">
                                &times;</button>
                            <h4 class="modal-title" id="H1" runat="server">Congratulations!</h4>
                        </div>
                        <div class="modal-body">
                            <p id="pRegMsg" runat="server">
                                Welcome to Infinia as our registered Buyer.
                                <br />
                                Your User name and password will be sent to your registered email id shortly. 
                            </p>
                        </div>
                        <div class="modal-footer" id="divFooter" runat="server">
                            <a class="btnRed" href="#" id="lnkNext" runat="server"
                                onclick="javascript: return false;" visible="false">ADD MORE USERS</a>
                            <a class="btnRed" href="#" id="lnkClose" runat="server"
                                visible="false">NO</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="RegCnf" role="dialog">
                <div class="modal-dialog altCont">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="Button1" runat="server" class="close"
                                onclick="javascript:link_click('H');">
                                &times;</button>
                            <h4 class="modal-title" id="H2">CONFIRMATION OF COMPANY SET UP</h4>
                        </div>
                        <div style="overflow-y: auto; overflow-x: hidden; height: 350px;">
                            <br />
                            <img src="../images/icon-confirmation.png" />
                            <hr>
                            <div class="sub-heading">
                                Congratulations! Your company has been set up.
                            <br />
                                Your User id and Password has been sent to your registered email id. Please use
                            that to log on to Renepay.
                            </div>
                            <div class="modal-body">
                                <p id="p1" runat="server">
                                </p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a class="btnRed" href="#" id="btncloseCnf" onclick="javascript: link_click('H');" runat="server" visible="true">Close</a>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

