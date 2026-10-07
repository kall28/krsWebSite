<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_RegistrationBuyerAdditionalDet, App_Web_registrationbuyeradditionaldet.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function lnkbtnRegister_Click() {

            //if ($("#ContentPlaceHolder1_xtxtName").val() == "") {
            //    $("#ContentPlaceHolder1_xtxtName").focus();
            //    ShowToolTip($("#ContentPlaceHolder1_xtxtName"), "Please Enter name.", "bottom");
            //    return false;
            //}
            if ($("#ContentPlaceHolder1_xddlOrgType option:selected").index() <= "0") {
                $("#ContentPlaceHolder1_xddlOrgType").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlOrgType", "Please select organizationtype", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlOrgType").val() == 0 && $("#ContentPlaceHolder1_xtxtOtherType").val() == '') {
                $("#ContentPlaceHolder1_xtxtOtherType").focus();
                ShowToolTip("#ContentPlaceHolder1_xtxtOtherType", "Please Enter Category", "bottom");
                return false;
            }
                //else if ($("#ContentPlaceHolder1_xtxtAddress").val() == "") {
                //    $("#ContentPlaceHolder1_xtxtAddress").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtAddress"), "Please Enter address.", "bottom");
                //    return false;
                //}
                //else if ($("#ContentPlaceHolder1_xddlCountry option:selected").index() <= 0) {
                //    $("#ContentPlaceHolder1_xddlCountry").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xddlCountry"), "Please select Country", "bottom");
                //    return false;
                //}
                //else if ($("#ContentPlaceHolder1_xddlState option:selected").index() <= 0) {
                //    $("#ContentPlaceHolder1_xddlState").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xddlState"), "Please select State.", "bottom");
                //    return false;
                //}
                //else if ($("#ContentPlaceHolder1_xddlCity option:selected").index() <= 0) {
                //    $("#ContentPlaceHolder1_xddlCity").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xddlCity"), "Please select City.", "bottom");
                //    return false;
                //}
                //else if ($("#ContentPlaceHolder1_xtxtPincode").val() == "") {
                //    $("#ContentPlaceHolder1_xtxtPincode").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtPincode"), "Please Enter Pincode.", "bottom");
                //    return false;
                //}
                //else if ($("#ContentPlaceHolder1_xddlTitle option:selected").index() <= 0) {
                //    $("#ContentPlaceHolder1_xddlTitle").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xddlTitle"), "Please select Title.", "bottom");
                //    return false;
                //}
                //else if ($("#ContentPlaceHolder1_xtxtFirstName").val() == "") {
                //    $("#ContentPlaceHolder1_xtxtFirstName").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtFirstName"), "Please Enter FirstName.", "bottom");
                //    return false;
                //}
                //else if ($("#ContentPlaceHolder1_xtxtLastName").val() == "") {
                //    $("#ContentPlaceHolder1_xtxtLastName").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtLastName"), "Please Enter LastName.", "bottom");
                //    return false;
                //}
                //    //else if ($("#ContentPlaceHolder1_xtxtDesignation").val() == "") {
                //    $("#ContentPlaceHolder1_xtxtDesignation").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtDesignation"), "Please Enter Designation.", "bottom");
                //    return false;
                //}
                //else if ($("#ContentPlaceHolder1_xtxtLandLineNo").val() == "") {
                //    $("#ContentPlaceHolder1_xtxtLandLineNo").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtLandLineNo"), "Please Enter LandLine Number", "bottom");
                //    return false;
                //}
                //else if ($("#ContentPlaceHolder1_xtxtMobileNo").val() == "") {
                //    $("#ContentPlaceHolder1_xtxtMobileNo").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtMobileNo"), "Please Enter Mobile Number", "bottom");
                //    return false;
                //}
                //    //var MobileLength = $("#ContentPlaceHolder1_xtxtMobileNo").val().length;
                //else if ($("#ContentPlaceHolder1_xtxtMobileNo").val().length < 10) {
                //    $("#ContentPlaceHolder1_xtxtMobileNo").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtMobileNo"), "Please Enter valid MobileNo .", "bottom");
                //    return false;
                //}
                //else if ($("#ContentPlaceHolder1_xtxtEmail").val() == "") {
                //    $("#ContentPlaceHolder1_xtxtEmail").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtEmail"), "Please Enter Email Address", "bottom");
                //    return false;
                //}
                //else if (!validateEmail($("#ContentPlaceHolder1_xtxtEmail").val())) {
                //    $("#ContentPlaceHolder1_xtxtEmail").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtEmail"), "Please Enter Valid Email Address", "bottom");
                //    return false;
                //}
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
                //else if (!$('#ContentPlaceHolder1_xchkTnC').is(':checked')) {
                //    $("#ContentPlaceHolder1_xchkTnC").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xchkTnC"), "Please accept terms & conditions", "right");
                //    //ShowToolTip($("#ContentPlaceHolder1_lblTnC"), "Please accept terms & conditions", "bottom");

                //    return false;
                //}
            else if ($("#ContentPlaceHolder1_xtxtYearOfInception").val() == "") {
                $("#ContentPlaceHolder1_xtxtYearOfInception").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtYearOfInception"), "Please Enter Year Of Inception.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlTurnOver option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlTurnOver").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlTurnOver", " Please Select Turnover", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtProfit").val() == "") {
                $("#ContentPlaceHolder1_xtxtProfit").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtProfit"), "Please Enter Profit afterTax.", "bottom");
                return false;
            }
            else if (($("#ContentPlaceHolder1_xddlBank option:selected").index() <= 0) && ($("#ContentPlaceHolder1_xddlBank1 option:selected").index() <= 0) && ($("#ContentPlaceHolder1_xddlBank2 option:selected").index() <= 0)) {
                $("#ContentPlaceHolder1_xddlBank").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlBank", " Please select at least one bank", "bottom");
                return false;
            }

            ShowProgress();
            return true;
        }

        function lnkbtnRegisterCancel_Click() {
            ShowProgress();
            return true;
        }

        function Email_Change() {
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
    <asp:UpdatePanel ID="xupnlSupplier" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="main supplier">
                <div class="topBlk">
                    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="<span id='spnCap'>Update your profile</span>"></asp:Literal>
                    </div>
                </div>
                <br class="cl">
                <div class="clmn1">
                    <div class="row1">
                        <div class="whiteBox">
                            <div class="innerMore">
                                <h2>We would like to know a bit more about you</h2>
                                <p class="txtCopy">Please provide the following information and help us to serve you better</p>
                            </div>
                            <br class="cl">
                            <div class="leftClmn">
                                <label>Organization Type</label>
                                <div class="styled-select fl selOrganization">
                                    <asp:DropDownList ID="xddlOrgType" runat="server" OnSelectedIndexChanged="xddlOrgType_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div id="xdivOther" runat="server" visible="false">
                                    <label>Other</label>
                                    <asp:TextBox ID="xtxtOtherType" runat="server" CssClass="imw97p" ondrop="return false;" autocomplete="off"></asp:TextBox>
                                </div>
                                <br class="cl">
                                <label style="display: none">Designation</label>
                                <asp:TextBox ID="xtxtDesignation" runat="server" CssClass="imw97p" Style="display: none"></asp:TextBox>
                                <label>Website URL</label>
                                <asp:TextBox ID="xtxtWebsite" runat="server" CssClass="imw97p"></asp:TextBox>

                                <label>Company Logo</label>
                                <ctrl:UploadFile ID="xctrlFULogo" runat="server" UserType="CMP" UploadDocType="CompanyLogo" UploadFileType="Img" />
                                <br />
                                <br class="cl" />
                                <label>Year Of Inception</label>
                                <asp:TextBox ID="xtxtYearOfInception" runat="server" CssClass="imw97p" onkeydown="IsNumeric(event);"></asp:TextBox>
                                <label>Turnover</label>
                                <div class="styled-select fl selOrganization">
                                    <asp:DropDownList ID="xddlTurnOver" runat="server">
                                        <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                        <asp:ListItem Value="0 to 5Cr" Text="0 to 5Cr"></asp:ListItem>
                                        <asp:ListItem Value="6cr to 25Cr" Text="6Cr to 25Cr"></asp:ListItem>
                                        <asp:ListItem Value="26cr to 50Cr" Text="26Cr to 50Cr"></asp:ListItem>
                                        <asp:ListItem Value="51cr to 100Cr" Text="51Cr to 100Cr"></asp:ListItem>
                                        <asp:ListItem Value="101cr to 500Cr" Text="101Cr to 500Cr"></asp:ListItem>
                                        <asp:ListItem Value="Above 500Cr" Text="Above 500Cr"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <p class="txtCopy" id="pRegInfo" runat="server">By clicking register, you are confirming that all information provided by you is accurate and that you are authorized by your company to provide this information</p>
                            </div>
                            <div class="rightClmn">
                            
                                <label>Profit after tax</label>
                                <asp:TextBox ID="xtxtProfit" runat="server" CssClass="imw97p" onkeypress="return IsAlphaNumeric(event);"></asp:TextBox>
                                <label>Credit Rating by</label>
                                <div class="styled-select fl selOrganization">
                                    <asp:DropDownList ID="xddlCredit" runat="server">
                                        <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                        <asp:ListItem Value="Crisil" Text="Crisil"></asp:ListItem>
                                        <asp:ListItem Value="CIBIL" Text="CIBIL"></asp:ListItem>
                                        <asp:ListItem Value="CARE" Text="CARE"></asp:ListItem>
                                        <asp:ListItem Value="ICRA" Text="ICRA"></asp:ListItem>
                                        <asp:ListItem Value="ONICRA" Text="ONICRA"></asp:ListItem>
                                        <asp:ListItem Value="SMERA" Text="SMERA"></asp:ListItem>
                                        <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <label>Credit Rating</label>
                                <asp:TextBox ID="xtxtRating" runat="server" CssClass="imw97p" onkeydown="RestrictText(event);"></asp:TextBox>
                                <asp:UpdatePanel ID="xuplBank" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <label>Banking with</label>
                                        <div class="styled-select fl selOrganization">
                                            <asp:DropDownList ID="xddlBank" runat="server" AutoPostBack="true" OnSelectedIndexChanged="xddlBank_SelectedIndexChanged">
                                                <asp:ListItem Text="Bank1" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="styled-select fl selOrganization">
                                            <asp:DropDownList ID="xddlBank1" runat="server" OnSelectedIndexChanged="xddlBank1_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Text="Bank2" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="styled-select fl selOrganization">
                                            <asp:DropDownList ID="xddlBank2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="xddlBank2_SelectedIndexChanged">
                                                <asp:ListItem Text="Bank3" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <br class="cl">
                        </div>
                        <br class="cl">
                        <br />
                        <asp:LinkButton ID="xlnkbtnRegister" runat="server" CssClass="btnBlk" OnClientClick="javascript:ShowProgress(true);"
                            OnClick="xlnkbtnRegister_Click">REGISTER</asp:LinkButton>
                        <asp:LinkButton ID="xlnkbtnCancel" runat="server" CssClass="btnBlk"
                            OnClick="xlnkbtnCancel_Click" OnClientClick="javascript: return lnkbtnRegisterCancel_Click();">CANCEL</asp:LinkButton>
                        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                        <br />
                        <br />
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
                            <h4 class="modal-title" id="H1">Welcome!</h4>
                        </div>
                        <div class="modal-body">
                            <p id="pRegMsg" runat="server">
                                Your username and password has been sent to your registered email ID. 
                            </p>
                        </div>
                        <div class="modal-footer">
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

