<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Admin_ProfileEdit, App_Web_profileedit.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function Cancel_Click() {
            window.location.href = strUrl + "Dashboard.aspx";
        }

        function btnEditMore_Click() {
            window.location.href = strUrl + "Admin/RegistrationSupplierAdditionalDet.aspx";
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

        function UpdateBuyer(CompanyId) {
            var msg = "";
            if ($("#txtFirstName").val() == "") {
                $("#txtFirstName").focus();
                msg = "Please Enter First Name.";
                ShowToolTip($("#txtFirstName"), msg, "bottom");
                return false;
            }
            else if ($("#txtLastName").val() == "") {
                $("#txtLastName").focus();
                msg = "Please Enter Last name.";
                ShowToolTip($("#txtLastName"), msg, "bottom");
                return false;
            }
            else if ($("#txtOrgName").val() == "") {
                $("#txtOrgName").focus();
                msg = "Please Enter company name.";
                ShowToolTip($("#txtOrgName"), msg, "bottom");
                return false;
            }
            else if ($("#txtAddress1").val() == "") {
                $("#txtAddress1").focus();
                msg = "Please Enter address.";
                ShowToolTip($("#txtAddress1"), msg, "bottom");
                return false;
            }
            var CompanyLogo = window["xctrlFULogo_GetUploadedFileName"]();
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'Admin/ProfileEdit.aspx/UpdateBuyer',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'CompanyId':'" + CompanyId + "', 'FirstName' : '" + $("#txtFirstName").val() + "', 'LastName' : '"
                    + $("#txtLastName").val() + "', 'CompanyName' : '" + $("#txtOrgName").val() + "', 'Address1' : '" + $("#txtAddress1").val()
                    + "', 'Address2' : '" + $("#txtAddress2").val() + "', 'altNumber' : '" + $("#txtPhoneNumber").val() + "','logo':'" + CompanyLogo + "'}",
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData == "0") {
                            ShowModalMsgBox("ReNePay", "Your profile updated successfully.");
                            //GetRFPSummary();
                            //setInterval(function () {

                            //  window.location = strUrl + "RFPCenter/RFPCenterRoom.aspx?Id=" + $("#ContentPlaceHolderMaster_xhdnRFPId").val();
                            //}, 5000);
                            // window.location = "Live.aspx";
                            //  $("#ContentPlaceHolder1_xbtnBidDetails").click();
                            // ShowModalBox("Error", newData);
                        }
                        else {
                            ShowModalMsgBox("Error", newData);
                        }
                        HideProgress();
                    }
                    catch (e) {
                        ShowModalMsgBox("Error", e.Message);
                        //ShowMessageBox(e.Message);
                        HideProgress();
                    }
                },
                error: ShowError
            });
        }

        function Validate() {
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
            if ($("#ContentPlaceHolder1_xtxtOrgName").val() == "") {
                $("#ContentPlaceHolder1_xtxtOrgName").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtOrgName"), "Please Enter name.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtAddress").val() == "") {
                $("#ContentPlaceHolder1_xtxtAddress").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtAddress"), "Please Enter address.", "bottom");
                return false;
            }

            else if ($("#ContentPlaceHolder1_xddlState option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlState").focus();
                ShowToolTip($("#ContentPlaceHolder1_xddlState"), "Please select State.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlCity option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlCity").focus();
                ShowToolTip($("#ContentPlaceHolder1_xddlCity"), "Please select City.", "up");
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

            var strType = $("input[name='ctl00$ContentPlaceHolder1$rdbCommissionType']:checked").val();
            if (strType == "V") {
                if ($("#ContentPlaceHolder1_xtxtCommissionVendor").val() == "") {
                    $("#ContentPlaceHolder1_xtxtCommissionVendor").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtCommissionVendor"), "Please Enter vendor commission", "bottom");
                    return false;
                }
            }

            ShowProgress();
            return true;
        }

        function UpdateSupplier(VendorId) {
            var msg = "";
            if ($("#txtFirstName").val() == "") {
                $("#txtFirstName").focus();
                msg = "Please Enter First Name.";
                ShowToolTip($("#txtFirstName"), msg, "bottom");
                return false;
            }
            else if ($("#txtLastName").val() == "") {
                $("#txtLastName").focus();
                msg = "Please Enter Last name.";
                ShowToolTip($("#txtLastName"), msg, "bottom");
                return false;
            }
            else if ($("#txtOrgName").val() == "") {
                $("#txtOrgName").focus();
                msg = "Please Enter company name.";
                ShowToolTip($("#txtOrgName"), msg, "bottom");
                return false;
            }
            else if ($("#txtAddress1").val() == "") {
                $("#txtAddress1").focus();
                msg = "Please Enter address.";
                ShowToolTip($("#txtAddress1"), msg, "bottom");
                return false;
            }
            else if ($("#txtMobile").val() == "") {
                $("#txtMobile").focus();
                msg = "Please Enter Mobile Number.";
                ShowToolTip($("#txtMobile"), msg, "bottom");
                return false;
            }
            var CatlogFile = window["xctrlCatlog_GetUploadedFileName"]();
            var AffiliationsFile = window["xctrlAffiliations_GetUploadedFileName"]();
            var AccediationsFile = window["xctrlAccediations_GetUploadedFileName"]();
            var AwardFile = window["xctrlAward_GetUploadedFileName"]();
            var OtherDocFile = window["xctrlOtherDoc_GetUploadedFileName"]();
            var logo = window["xctrlCompanyLogo_GetUploadedFileName"]();
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'Admin/ProfileEdit.aspx/UpdateSupplier',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'VendorId':'" + VendorId + "','logo' : '" + logo + "', 'FirstName' : '" + $("#txtFirstName").val() + "', 'LastName' : '"
                    + $("#txtLastName").val() + "', 'CompanyName' : '" + $("#txtOrgName").val() + "', 'Address1' : '" + $("#txtAddress1").val()
                    + "', 'Address2' : '" + $("#txtAddress2").val()
                    + "','Email' : '" + $("#txtEmail").val() + "','Mobile' : '" + $("#txtMobile").val() + "','altNumber' : '" + $("#txtPhoneNumber").val()
                    + "','Catlog':'" + $("#ContentPlaceHolder1_xtxtCatlog").val() + "', 'CatlogFile' : '" + CatlogFile
                    + "','Affiliations':'" + $("#ContentPlaceHolder1_xtxtAffiliations").val() + "','AffiliationsFile':'" + AffiliationsFile
                    + "','Accediations':'" + $("#ContentPlaceHolder1_xtxtAccediations").val() + "','AccediationsFile':'" + AccediationsFile
                    + "','Award':'" + $("#ContentPlaceHolder1_xtxtAward").val() + "','AwardFile':'" + AwardFile
                    + "','OtherDoc':'" + $("#ContentPlaceHolder1_xtxtOtherDoc").val() + "','OtherDocFile':'" + OtherDocFile + "'}",
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData == "0") {
                            ShowModalMsgBox("ReNePay", "Your profile updated successfully.");
                            //GetRFPSummary();
                            //setInterval(function () {

                            //  window.location = strUrl + "RFPCenter/RFPCenterRoom.aspx?Id=" + $("#ContentPlaceHolderMaster_xhdnRFPId").val();
                            //}, 5000);
                            // window.location = "Live.aspx";
                            //  $("#ContentPlaceHolder1_xbtnBidDetails").click();
                            // ShowModalBox("Error", newData);
                        }
                        else {

                            ShowModalMsgBox("Error", newData);
                        }
                        HideProgress();
                    }
                    catch (e) {
                        ShowModalMsgBox("Error", e.Message);
                        //ShowMessageBox(e.Message);
                        HideProgress();
                    }
                },
                error: ShowError
            });
        }

        function rdbType_change() {
            var strType = $("input[name='ctl00$ContentPlaceHolder1$rdbCommissionType']:checked").val();
            if (strType == "D") {
                $("#ContentPlaceHolder1_xtxtCommissionDefault").attr('style', 'display:block;');
                $("#ContentPlaceHolder1_xtxtCommissionVendor").attr('style', 'display:none;');
            }
            else {
                $("#ContentPlaceHolder1_xtxtCommissionDefault").attr('style', 'display:none;');
                $("#ContentPlaceHolder1_xtxtCommissionVendor").attr('style', 'display:block;');
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

    <asp:UpdatePanel ID="xUpnlBuyerDet" runat="server" UpdateMode="Conditional" Visible="false">
        <ContentTemplate>
            <div id="divBuyerPRO" runat="server">
                <div class="clmn1 fl">
                    <div class="innerBx">
                        <%--<div class="innerBxhead bgGrey">My Company</div>--%>
                        <div class="innerBxhead bgRed">My Company</div>
                        <div class='innerBxbody brdGrey whiteBox'>
                            <div class="buyRegis">
                                <div class="formRow">
                                    <label>Company Logo</label>
                                    <div class="formRow1">
                                        <ctrl:UploadFile ID="xctrlVendorLogo" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc" Visible="false"
                                            UploadFileType="Img" Caption="Upload Company Logo" />

                                        <ctrl:UploadFile ID="xctrlCompanyLogo" runat="server" Visible="false"
                                            UserType="CMP" UploadDocType="CompanyLogo" UploadFileType="Img" />
                                    </div>
                                </div>
                                <br />
                                <div class="formRow">
                                    <label>Full Name</label>
                                    <div class="formRow1">

                                        <asp:TextBox ID="xtxtFirstName" runat="server" MaxLength="50" class="imw48p"
                                            ondrop="return false;" onkeydown="return IsCharacter(event);"
                                            autocomplete="off" placeholder="First Name" />
                                        <asp:TextBox ID="xtxtLastName" runat="server" MaxLength="50" class="imw48p fr"
                                            ondrop="return false;" onkeydown="return IsCharacter(event);"
                                            autocomplete="off" placeholder="Last Name" />
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Company Name</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtOrgName" runat="server" class="imw100p" onkeypress="return RestrictText(event);" placeholder="Company Name" />
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Address</label>
                                    <div class="formRow1">
                                        <%--<asp:TextBox ID="xtxtAddress1" class="imw48p" runat="server"
                                            TextMode="MultiLine" placeholder="Type your address"></asp:TextBox>--%>
                                        <asp:TextBox ID="xtxtAddress1" runat="server" CssClass="imw100p"
                                            TextMode="MultiLine" placeholder="Address" MaxLength="6" onkeypress="return RestrictText(event);" ondrop="return false;"
                                            autocomplete="off"></asp:TextBox>
                                        <div class="moreFields">
                                            <div class="imw32p fl bgGrey" style="display: none;">
                                                <div class="styled-select selOrganization">
                                                    <asp:TextBox ID="xlblCountry" runat="server" CssClass="imw97p"
                                                        Style="display: none" ReadOnly="true"></asp:TextBox>
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
                                    <label>Website</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtwebsite" runat="server" class="imw100p" onkeypress="return RestrictText(event);" placeholder="Website" />
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
                                        <asp:TextBox ID="xtxtGST" runat="server" CssClass="imw100p"
                                            placeholder="GST No" MaxLength="15" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="ad-nw-ad" id="divShowNewLine" onclick="javascript:return showAddress2();" style="display: none;"><i id="iShowLine" class="glyphicon glyphicon-plus fl"></i>Address 2 </div>
                                <div class="ad-nw-ad" id="divHideNewLine" onclick="javascript:return hideAddress2();" style="display: none;"><i id="i1" class="glyphicon glyphicon-minus fl"></i>Address 2 </div>
                                <div class="formRow" id="divAddress2" style="display: none;">
                                    <label>Address2</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtAddress2" runat="server" CssClass="imw100p"
                                            TextMode="MultiLine" placeholder="Address 2" MaxLength="6" ondrop="return false;"
                                            autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formRow" style="display: none;">
                                    <label>Email</label>
                                    <div class="formRow1">
                                        <asp:TextBox class="imw100p" ID="xtxtEmail" runat="server" ReadOnly="false" placeholder="Email" />
                                    </div>
                                </div>
                                <div class="formRow" style="display: none;">
                                    <label>Mobile Number<em class="markRed">*</em></label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtCountryCode" runat="server" CssClass="imw27p" Visible="false"
                                            Enabled="false"></asp:TextBox>
                                        <asp:TextBox ID="xtxtMobileNo" class="imw100p" runat="server"
                                            ReadOnly="false" placeholder="Mobile" />
                                    </div>
                                </div>
                                <div class="formRow" style="display: none;">
                                    <label>Alternate contact number</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtPhoneNumber" runat="server" class="imw100p" onkeydown="IsNumeric(event);"
                                            MaxLength="12" placeholder="Alternate contact number" />
                                    </div>
                                </div>

                                <div id="divAdmin" class="formRow" runat="server">
                                    <label>commission  (%)</label>
                                    <div class="formRow1">
                                        <div class="imw100p fl">
                                            <asp:RadioButtonList ID="rdbCommissionType" runat="server" class="imw48p" RepeatDirection="Horizontal" RepeatColumns="2" CellPadding="20" CellSpacing="20" onchange="return rdbType_change()">
                                                <asp:ListItem Text="Default Commission" Value="D" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Vendor Commission" Value="V"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                        <div class="imw100p">
                                            <asp:TextBox ID="xtxtCommissionDefault" ReadOnly="true" runat="server" MaxLength="5" class="imw48p" onkeydown="return IsDecimal(event);" placeholder="Default Commission" />
                                            <asp:TextBox ID="xtxtCommissionVendor" runat="server" MaxLength="5" class="imw48p" onkeydown="return IsDecimal(event);" placeholder="Vendor Commission" />
                                        </div>
                                        <div class="moreFields">
                                            <div id="divPublish" class="imw32p fl" runat="server">
                                                <asp:CheckBox ID="xchkPublish" runat="server" Text="Published" />
                                            </div>
                                            <div id="divDemo" class="imw32p fl" runat="server">
                                                <asp:CheckBox ID="xchkDemo" runat="server" Text="Set as Demo" />
                                            </div>
                                            <div id="divActive" class="imw32p fl" runat="server">
                                                <asp:CheckBox ID="xchkActive" runat="server" Text="Active" />
                                            </div>
                                            <div id="divVerify" class="imw32p fl" runat="server" visible="false">
                                                <asp:CheckBox ID="xchkVerify" runat="server" Text="Verify" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br class="cl" />
                            </div>
                            <div id="divSupplierDoc" runat="server" class="buyRegis" visible="false">
                                <div class="formRow">
                                    <label>Upload Catalogue</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtCatlog" runat="server" CssClass="imw48p" placeholder="Enter Catalogue"></asp:TextBox>
                                        <ctrl:UploadFile ID="xctrlCatlog" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
                                            UploadFileType="Doc" Caption=" Upload Catalogue for Products and Services" />
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>TIN Number</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtTinCards" runat="server" CssClass="imw48p" placeholder="Enter TIN Number"></asp:TextBox>
                                        <ctrl:UploadFile ID="xctrlTinCards" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
                                            UploadFileType="Doc" Caption="Upload TIN Number Document" />
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Affiliations</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtAffiliations" runat="server" CssClass="imw48p" placeholder="Enter Affiliations"></asp:TextBox>
                                        <ctrl:UploadFile ID="xctrlAffiliations" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
                                            UploadFileType="Doc" Caption="Upload Affiliations Document" />
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Accreditations</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtAccediations" runat="server" CssClass="imw48p" placeholder="Enter Accreditations"></asp:TextBox>
                                        <ctrl:UploadFile ID="xctrlAccediations" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
                                            UploadFileType="Doc" Caption="Upload Accreditations Document" />
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Awards and Recognitions</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtAward" runat="server" CssClass="imw48p" placeholder="Enter Awards and Recognitions"></asp:TextBox>
                                        <ctrl:UploadFile ID="xctrlAward" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
                                            UploadFileType="Doc" Caption="Upload Award Document" />
                                    </div>
                                </div>
                                <%-- <div class="numberOffice fl">--%>

                                <%--<h2>Upload Document</h2>--%>
                                <div class="formRow">
                                    <label>Other Document</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtOtherDoc" runat="server" CssClass="imw48p" placeholder="Enter Other Documents"></asp:TextBox>
                                        <ctrl:UploadFile ID="xctrlOtherDoc" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc" CssClass="imw48p"
                                            UploadFileType="Doc" Caption="Upload Other Document" />
                                    </div>
                                </div>


                            </div>
                            <div class="formRow buyRegis ">
                                <label>&nbsp;</label>
                                <div class="formRow1">
                                    <asp:LinkButton ID="xlnkBtnSubmit" runat="server" OnClientClick="javascript: return Validate();" OnClick="xlnkBtnSubmit_Click" CssClass="btnRed">Submit</asp:LinkButton>
                                    <%--<input class="btnRed" type="button" id="btnSubmit" value="Submit" onclick="javascript:return UpdateBuyer({8});" />--%>
                                </div>
                            </div>
                            <br class="cl">
                        </div>
                        <br class="cl">
                    </div>
                </div>
            </div>
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            </div>
             <div class="modal fade" id="divConfirm" role="dialog">
                 <div class="modal-dialog">
                     <!-- Modal content-->
                     <div class="modal-content">
                         <div class="modal-header">
                             <button type="button" id="btnClose" runat="server" class="close"
                                 onclick="javascript:link_click('H');">
                                 &times;</button>
                             <h4 class="modal-title" id="H1" runat="server">Updated!</h4>
                         </div>
                         <div class="modal-body">
                             <p id="pRegMsg" runat="server">
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
    <asp:UpdatePanel ID="xUpnlSupplierDet" runat="server" UpdateMode="Conditional" Visible="false">
        <ContentTemplate>
            <div id="divSupplierDet" runat="server">
                <div class="clmn1 imw72p fl">
                    <div class="innerBx">
                        <div class="innerBxhead bgGrey">My Profile</div>
                        <div class='innerBxbody brdGrey whiteBox'>
                            <div class="buyRegis">
                                <%-- <div id="div2" runat="server">
                                    <label>Company Logo</label>
                                <ctrl:UploadFile ID="UploadFile1" runat="server" UserType="Company" UploadDocType="CompanyLogo" UploadFileType="Img" />
                                <br />
                                </div>--%>
                                <div class="formRow">
                                    <label>Company Logo</label>
                                    <div class="formRow1">
                                    </div>
                                </div>
                                <asp:Literal ID="xlitSupplierPro" runat="server"></asp:Literal>
                                <asp:Literal ID="xlitSupplierButton" runat="server"></asp:Literal>
                                <br class="cl">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="main supplier" id="div1" runat="server">
                <div class="topBlk">
                    <div class="mainHead fl">Manage your account</div>
                    <br class="cl">
                </div>
                <div class="clmn1">
                    <div class="row1">
                        <div class='whiteBox'>
                            <h2>My Profile</h2>
                            <div class="leftClmn">
                                <table style="width: 100%;">
                                    <caption>
                                        <label>Full Name</label>
                                        <tr>
                                            <td style="width: 50%">
                                                <label>First Name</label>
                                                <asp:TextBox ID="xtxtFirstNameVendor" runat="server" MaxLength="50" CssClass="imw97p" ondrop="return false;" onkeydown="return IsCharacter(event);" autocomplete="off"></asp:TextBox>
                                            </td>
                                            <td style="width: 50%">
                                                <label>Last Name</label>
                                                <asp:TextBox ID="xtxtLastNameVendor" runat="server" MaxLength="50" CssClass="imw97p" ondrop="return false;" onkeydown="return IsCharacter(event);" autocomplete="off"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </caption>
                                </table>
                                <label>Company Name</label>
                                <asp:TextBox runat="server" ID="xtxtNameVendor" lass="imw97p" ReadOnly="true" placeholder="Organization"></asp:TextBox>
                                <label>Address 1</label>
                                <asp:TextBox placeholder="Address" runat="server" ID="xtxtAddress1Vendor" TextMode="MultiLine" class="imw97p"></asp:TextBox>
                                </div>
                             <div class="rightClmn">
                                <label>Address 2</label>
                                <asp:TextBox placeholder="Address" runat="server" ID="xtxtAddress2Vendor" TextMode="MultiLine" class="imw97p"></asp:TextBox>

                                <label>Email</label>
                                <asp:TextBox runat="server" ID="xtxtEmailVendor" lass="imw97p" ReadOnly="true" placeholder="Email"></asp:TextBox>

                                <label>Mobile No</label>
                                <asp:TextBox runat="server" ID="xtxtMobileVendor" lass="imw97p" ReadOnly="true" placeholder="Mobile No"></asp:TextBox>
                                <label>Alternate contact number</label>
                                <asp:TextBox runat="server" ID="xtxtPhoneNumberVendor" lass="imw97p" placeholder="Alternate contact number"></asp:TextBox>

                                <br class="cl" />
                            </div>
                            <br class="cl">
                        </div>
                        <asp:LinkButton ID="xlnkbtnRegisterSupplier" runat="server" CssClass="btnBlk" OnClientClick="javascript:ShowProgress(true);"
                            OnClick="xlnkbtnRegisterSupplier_Click">Update</asp:LinkButton>
                       
                        <asp:LinkButton ID="xlnkbtnCancelSupplier" runat="server" CssClass="btnBlk"
                            OnClick="xlnkbtnCancelSupplier_Click" OnClientClick="javascript: return lnkbtnRegisterCancel_Click();">CANCEL</asp:LinkButton>
                    </div>
                </div>
            
            </div>--%>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

