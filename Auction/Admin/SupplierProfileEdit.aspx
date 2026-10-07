<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Admin_SupplierProfileEdit, App_Web_supplierprofileedit.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="../Scripts/plugins/select2.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/plugins/jquery.select2.js" type="text/javascript"></script>
    <script src="../Scripts/plugins/select2.full.js" type="text/javascript"></script>

    <link href="../Styles/morris.css" rel="stylesheet" />
    <script src="../Scripts/morris.min.js"></script>
    <script src="../Scripts/raphael-min.js"></script>

    <style>
        .scrollY .billInfo th {
            width: 20%;
        }

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

    <script>
        $(document).ready(function () {
            $("input").attr("autocomplete", "off");
            $(":input, a").attr("tabindex", "-1");
            $("#ContentPlaceHolder1_xddlStatelist").select2({ placeholder: 'Find and Select States' });

        });

        function ddlBank_change() {
            if ($("#ContentPlaceHolder1_xddlBank").val() == "0") {
                $('#ContentPlaceHolder1_DivOtherBank').attr("style", "display:block;");
            }
            else {
                $('#ContentPlaceHolder1_DivOtherBank').attr("style", "display:none;");
            }
        }

        function OnPanChange() {
            if ($('#ContentPlaceHolder1_xchkPanIndia').is(':checked')) {
                //$("#ContentPlaceHolder1_xdivCity").attr('style', 'display:none;');
                $("#ContentPlaceHolder1_xdivState").attr('style', 'display:none;');
            }
            else {
                //$("#ContentPlaceHolder1_xdivCity").attr('style', 'display:block;');
                $("#ContentPlaceHolder1_xdivState").attr('style', 'display:block;');
            }
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

        $(document).ready(function () {
            $('#collapseOne').on('hidden.bs.collapse', function () {
                setclass($("#col1"), 'glyphicon glyphicon-plus', 'glyphicon glyphicon-minus');
            });
            $('#collapseOne').on('shown.bs.collapse', function () {
                setclass($("#col1"), 'glyphicon glyphicon-minus', 'glyphicon glyphicon-plus');
            });

            $('#collapseTwo').on('hidden.bs.collapse', function () {
                setclass("#col2", 'glyphicon glyphicon-plus', 'glyphicon glyphicon-minus');
            });
            $('#collapseTwo').on('shown.bs.collapse', function () {
                setclass("#col2", 'glyphicon glyphicon-minus', 'glyphicon glyphicon-plus');
            });

            $('#collapseThree').on('hidden.bs.collapse', function () {
                setclass("#col3", 'glyphicon glyphicon-plus', 'glyphicon glyphicon-minus');
            });
            $('#collapseThree').on('shown.bs.collapse', function () {
                setclass("#col3", 'glyphicon glyphicon-minus', 'glyphicon glyphicon-plus');
            });

            $('#collapseFour').on('hidden.bs.collapse', function () {
                setclass("#col4", 'glyphicon glyphicon-plus', 'glyphicon glyphicon-minus');
            });
            $('#collapseFour').on('shown.bs.collapse', function () {
                setclass("#col4", 'glyphicon glyphicon-minus', 'glyphicon glyphicon-plus');
            });

        });
        function setclass(control, addclass, removeclass) {
            $(control).addClass(addclass);
            $(control).removeClass(removeclass);
        }

    </script>

    <script>
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

        function ValidateProfileDet() {
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
            else if ($("#ContentPlaceHolder1_xtxtMobileNo").val().length < 10) {
                $("#ContentPlaceHolder1_xtxtMobileNo").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMobileNo"), "Please Enter valid MobileNo .", "bottom");
                return false;
            }
            ShowProgress();
            return true;
        }

        function ValidateProductDet() {
            var strCat = GetSelCat();
            if ($("#ContentPlaceHolder1_xddlCat option:selected").index() <= 0 && strCat == "") {
                $("#ContentPlaceHolder1_xddlCat").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlCat", "Please Select Category", "bottom");
                return false;
            }
            else if (strCat == "") {
                $("#ContentPlaceHolder1_divSubCat").focus();
                ShowToolTip("#ContentPlaceHolder1_divSubCat", "Please select sub ategory", "top");
                return false;
            }
            $("#ContentPlaceHolder1_xhdnProdCat").val(strCat);

            //if (!$('#ContentPlaceHolder1_xchkPanIndia').is(':checked')) {
            //    var length = $('#ContentPlaceHolder1_xdddlDeliveryState').val();
            //    if (length == null) {
            //        $("#ContentPlaceHolder1_xdddlDeliveryState").focus();
            //        ShowToolTip("#ContentPlaceHolder1_xdddlDeliveryState", "Please select state.", "bottom");
            //        return false;
            //    }
            //}
            ShowProgress();
            return true;
        }

        function ValidateBankDet() {
            if ($("#ContentPlaceHolder1_xddlBank option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlBank").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlBank", "Please Select Bank", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlBank").val() == "0") {
                if ($.trim($("#ContentPlaceHolder1_txtOtherBank").val()) == "") {
                    ShowToolTip($("#ContentPlaceHolder1_txtOtherBank"), "Please Enter Bank Name.", "top");
                    return false;
                }
            }
            else if ($("#ContentPlaceHolder1_xtxtBranchName").val() == "") {
                $("#ContentPlaceHolder1_xtxtBranchName").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtBranchName"), "Please Enter BranchName.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlAccountType option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlAccountType").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlAccountType", "Please Select Account Type.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtAccountNo").val() == "") {
                $("#ContentPlaceHolder1_xtxtAccountNo").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtAccountNo"), "Please Enter Account Number.", "bottom");
                return false;
            }
            ShowProgress();
            return true;
        }

        function ValidateCommissionDet() {
            var strType = $("input[name='ctl00$ContentPlaceHolder1$rdbCommissionType']:checked").val();
            if (strType == "D") {
            }
            else {
                if ($("#ContentPlaceHolder1_xtxtCommissionVendor").val() == "") {
                    $("#ContentPlaceHolder1_xtxtCommissionVendor").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtCommissionVendor"), "Please Enter vendor commission.", "bottom");
                    return false;
                }
            }
            ShowProgress();
            return true;
        }
        function showSelectedCategory() {
            $("#ContentPlaceHolder1_divSelCat").show();
            $("#divShowCategory").hide();
            $("#divHideCategory").show();
        }
        function hideSelectedCategory() {
            $("#ContentPlaceHolder1_divSelCat").hide();
            $("#divShowCategory").show();
            $("#divHideCategory").hide();
        }
    </script>

    <asp:UpdatePanel ID="xupnlMain" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div class="clmn1">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                    <i id="col1" class="glyphicon glyphicon-plus"></i>My Company</a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                                <asp:UpdatePanel ID="xUpnlBuyerDet" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div id="divBuyerPRO" runat="server">
                                            <div class="clmn1 fl">
                                                <div>
                                                    <div class='innerBxbody whiteBox'>
                                                        <div class="buyRegis">
                                                            <div class="formRow">
                                                                <label>Company Logo</label>
                                                                <div class="formRow1">
                                                                    <ctrl:UploadFile ID="xctrlVendorLogo" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
                                                                        UploadFileType="Img" Caption="Upload Company Logo" />

                                                                    <ctrl:UploadFile ID="xctrlCompanyLogo" runat="server" Visible="false"
                                                                        UserType="CMP" UploadDocType="CompanyLogo" UploadFileType="Img" />
                                                                </div>
                                                            </div>
                                                            <br />
                                                            <div class="formRow">
                                                                <label>Full Name<em class="markRed">*</em></label>
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
                                                                <label>Company Name<em class="markRed">*</em></label>
                                                                <div class="formRow1">
                                                                    <asp:TextBox ID="xtxtOrgName" runat="server" class="imw100p" placeholder="Company Name" />
                                                                </div>
                                                            </div>

                                                            <div class="formRow">
                                                                <label>Address<em class="markRed">*</em></label>
                                                                <div class="formRow1">
                                                                    <asp:TextBox ID="xtxtAddress1" runat="server" CssClass="imw100p"
                                                                        TextMode="MultiLine" placeholder="Address" MaxLength="6" ondrop="return false;"
                                                                        autocomplete="off"></asp:TextBox>
                                                                    <div class="moreFields">
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
                                                             <div class="formRow">
                                                                <label>State Code</label>
                                                                <div class="formRow1">
                                                                    <asp:TextBox ID="xtxtStateCode" runat="server" CssClass="imw48p"
                                                                        MaxLength="5" autocomplete="off" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="formRow">
                                                                <label>Email<em class="markRed">*</em></label>
                                                                <div class="formRow1">
                                                                    <asp:TextBox class="imw100p" ID="xtxtEmail" runat="server" placeholder="Email" />
                                                                </div>
                                                            </div>
                                                            <div class="formRow">
                                                                <label>Mobile Number<em class="markRed">*</em></label>
                                                                <div class="formRow1">
                                                                    <asp:TextBox ID="xtxtCountryCode" runat="server" CssClass="imw27p" Visible="false"
                                                                        Enabled="false"></asp:TextBox>
                                                                    <asp:TextBox ID="xtxtMobileNo" class="imw100p" runat="server"
                                                                        placeholder="Mobile" />
                                                                </div>
                                                            </div>
                                                            <div class="formRow">
                                                                <label>Alternate contact number</label>
                                                                <div class="formRow1">
                                                                    <asp:TextBox ID="xtxtPhoneNumber" runat="server" class="imw100p" onkeydown="IsNumeric(event);"
                                                                        MaxLength="12" placeholder="Alternate contact number" />
                                                                </div>
                                                            </div>
                                                            <div class="formRow">
                                                                <label>Website</label>
                                                                <div class="formRow1">
                                                                    <asp:TextBox ID="xtxtWebsite" runat="server" class="imw100p" placeholder="Website" />
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
                                                                <label>Digital Signature</label>
                                                                <div class="formRow1">
                                                                    <asp:TextBox ID="xtxtDGS" runat="server" CssClass="imw48p"
                                                                        placeholder="Enter Digital Signature" MaxLength="10" autocomplete="off"></asp:TextBox>
                                                                    <ctrl:UploadFile ID="xctrlDgtalSignature" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
                                                                        UploadFileType="Doc" Caption="Upload Digital Signature Document" />
                                                                </div>
                                                            </div>
                                                            <div class="formRow" style="display: none">
                                                                <label></label>
                                                                <div class="formRow1">
                                                                    <asp:TextBox ID="xlblCountry" runat="server" CssClass="imw97p"
                                                                        Style="display: none" ReadOnly="true"></asp:TextBox>
                                                                    <div class="formRow1 termRadiobx">
                                                                        <div class="styled-select selOrganization fr immr0" id="divddlCountry" runat="server" style="display: none">
                                                                            <asp:DropDownList ID="xddlCountry" runat="server" onchange="Onchange_Country(this.value);" OnSelectedIndexChanged="xddlCountry_SelectedIndexChanged"
                                                                                AutoPostBack="true">
                                                                                <asp:ListItem Text="Country" Value="0"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <br class="cl" />
                                                            <div class="formRow">
                                                                <label>TIN Number</label>
                                                                <div class="formRow1">
                                                                    <asp:TextBox ID="xtxtTinCards" runat="server" CssClass="imw48p" placeholder="Enter TIN Number"></asp:TextBox>
                                                                    <ctrl:UploadFile ID="xctrlTinCards" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
                                                                        UploadFileType="Doc" Caption="Upload TIN Number Document" />
                                                                </div>
                                                            </div>
                                                            <div class="formRow">
                                                                <label>Upload Catalogue</label>
                                                                <div class="formRow1">
                                                                    <asp:TextBox ID="xtxtCatlog" runat="server" CssClass="imw48p" placeholder="Enter Catalogue"></asp:TextBox>
                                                                    <ctrl:UploadFile ID="xctrlCatlog" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
                                                                        UploadFileType="Doc" Caption=" Upload Catalogue for Products and Services" />
                                                                </div>
                                                            </div>
                                                            <div class="formRow" style="display: none;">
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
                                                            <div class="formRow" style="display: none;">
                                                                <label>Awards and Recognitions</label>
                                                                <div class="formRow1">
                                                                    <asp:TextBox ID="xtxtAward" runat="server" CssClass="imw48p" placeholder="Enter Awards and Recognitions"></asp:TextBox>
                                                                    <ctrl:UploadFile ID="xctrlAward" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
                                                                        UploadFileType="Doc" Caption="Upload Award Document" />
                                                                </div>
                                                            </div>
                                                            <div class="formRow">
                                                                <label>Other Document</label>
                                                                <div class="formRow1">
                                                                    <asp:TextBox ID="xtxtOtherDoc" runat="server" CssClass="imw48p" placeholder="Enter Other Documents"></asp:TextBox>
                                                                    <ctrl:UploadFile ID="xctrlOtherDoc" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc" CssClass="imw48p"
                                                                        UploadFileType="Doc" Caption="Upload Other Document" />
                                                                </div>
                                                            </div>
                                                            <div id="divUserStatus" class="formRow" runat="server" visible="false">
                                                                <label>Activate supplier checkbox:</label>
                                                                <div class="formRow1">
                                                                    <div class="moreFields">
                                                                        <div id="divPublish" class="imw32p fl" runat="server">
                                                                            <asp:CheckBox ID="xchkPublish" runat="server" Text="Published" />
                                                                        </div>
                                                                        <div id="divDemo" class="imw32p fl" runat="server">
                                                                            <asp:CheckBox ID="xchkDemo" runat="server" Text="set as Demo" />
                                                                        </div>
                                                                        <div id="divVerify" class="imw32p fl" runat="server">
                                                                            <asp:CheckBox ID="xchkVerify" runat="server" Text="Verify" />
                                                                        </div>
                                                                        <br class="cl" />
                                                                        <div id="divActivate" class="imw32p fl" runat="server">
                                                                            <asp:CheckBox ID="xchkActivate" runat="server" Text="Activate" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="formRow buyRegis ">
                                                            <label>&nbsp;</label>
                                                            <div class="formRow1">
                                                                <asp:LinkButton ID="xlnkBtnSubmitProf" runat="server" OnClick="xlnkBtnSubmitProf_Click" CssClass="btnRed" OnClientClick="javascript: return ValidateProfileDet();">Submit</asp:LinkButton>
                                                                <%----%>
                                                            </div>
                                                        </div>
                                                        <br class="cl">
                                                    </div>
                                                    <br class="cl">
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
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
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                    <i id="col2" class="glyphicon glyphicon-plus"></i>Product & Services
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                <asp:UpdatePanel ID="xupnlProfile" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div>
                                            <div>
                                                <div class="buyRegis innerBxbody whiteBox">
                                                    <script>
                                                        var catLst;

                                                        function FillSubCat() {
                                                            var subCatLst;
                                                            var str = "";
                                                            var catId = $("#ContentPlaceHolder1_xddlCat").val();

                                                            for (var i = 0; i < catLst.length; i++) {
                                                                if (catId == catLst[i].id) {
                                                                    subCatLst = catLst[i].subcat;
                                                                    break;
                                                                }
                                                            }

                                                            str = "<label class='imw100p'>Product Subcategory</label><div class='suppprofList'><table class='tableList' col='4'>";
                                                            if (subCatLst != null) {
                                                                $.each(subCatLst, function (index, subCat) {
                                                                    str += "<tr ><td id='chckcat'><input type='checkbox' id='chksc" + subCat.id
                                                                        + "' value='" + subCat.id + "' onclick=\"SubCat_select('chksc"
                                                                        + subCat.id + "')\" ";
                                                                    if (subCat.sel == 1) { str += " checked = 'checked' "; }
                                                                    str += " ></td><td>" + subCat.name
                                                                        + "</td></tr>";
                                                                });
                                                            }
                                                            str += "</table></div>"

                                                            $("#ContentPlaceHolder1_divSubCat").html(str);
                                                        }

                                                        function SubCat_select(ctrl) {
                                                            var catId = $("#ContentPlaceHolder1_xddlCat").val();

                                                            for (var i = 0; i < catLst.length; i++) {
                                                                if (catId == catLst[i].id) {
                                                                    $.each(catLst[i].subcat, function (index, subCat) {
                                                                        if ($("#" + ctrl).val() == subCat.id) {
                                                                            if ($("#" + ctrl).is(':checked')) {
                                                                                subCat.sel = 1;
                                                                            }
                                                                            else {
                                                                                subCat.sel = 0;
                                                                            }
                                                                            ShowSelCat();
                                                                            return;
                                                                        }
                                                                    });
                                                                    break;
                                                                }
                                                            }
                                                        }

                                                        function ShowSelCat() {
                                                            //var str = "<h3>Your Selection</h3><table style='table-layout:fixed; width:100%;' class='billInfo'><tr><th>Categories</th><th>Sub Categories</th></tr>";
                                                            var str = "<h3>Your Selection</h3><div class='scrollY'><table width='100%' class='billInfo'><tr><th>Categories</th><th>Sub Categories</th></tr>";
                                                            var strSub;
                                                            for (var i = 0; i < catLst.length; i++) {
                                                                strSub = "";
                                                                $.each(catLst[i].subcat, function (index, subCat) {
                                                                    if (subCat.sel == 1) {
                                                                        if (strSub == "") {
                                                                            strSub += subCat.name;
                                                                        }
                                                                        else {
                                                                            strSub += ", " + subCat.name;
                                                                        }
                                                                    }
                                                                });

                                                                if (strSub != "") {
                                                                    str += "<tr><td>" + catLst[i].name + "</td><td>" + strSub + "</td></tr>";
                                                                }
                                                            }
                                                            str += "</table>";
                                                            $("#ContentPlaceHolder1_divSelCat").html(str);
                                                        }

                                                        function GetSelCat() {
                                                            var str = "";
                                                            var strSub;
                                                            for (var i = 0; i < catLst.length; i++) {
                                                                strSub = "";
                                                                $.each(catLst[i].subcat, function (index, subCat) {
                                                                    if (subCat.sel == 1) {
                                                                        if (strSub == "") {
                                                                            strSub += subCat.id;
                                                                        }
                                                                        else {
                                                                            strSub += ", " + subCat.id;
                                                                        }
                                                                    }
                                                                });

                                                                if (strSub != "") {
                                                                    if (str == "") {
                                                                        str += catLst[i].id + "-" + strSub;
                                                                    }
                                                                    else {
                                                                        str += "#" + catLst[i].id + "-" + strSub;
                                                                    }
                                                                }
                                                            }
                                                            return str;
                                                        }
                                                    </script>
                                                    <div class="formRow" style="display: none">
                                                        <label>Company Logo</label>
                                                        <div class="formRow1">

                                                            <ctrl:UploadFile ID="UploadFile1" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
                                                                UploadFileType="Img" Caption="Upload Company Logo" Visible="false" />
                                                        </div>
                                                    </div>
                                                    <%--<p class="txtCopy">Select one or more product category that you’d be interested in supplying  </p>--%>
                                                    <div class="formRow">
                                                        <label class="markRed">Choose Category <em class="markRed">*</em></label>
                                                        <div class="formRow1">
                                                            <div class="imw48p bgGrey">
                                                                <div class="styled-select selOrganization">
                                                                    <asp:DropDownList ID="xddlCat" runat="server"
                                                                        AutoPostBack="false">
                                                                        <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div id="divSubCat" runat="server"></div>
                                                    </div>
                                                    <br class="cl">
                                                    <div class="formRow">
                                                        <%--<label></label>--%>
                                                        <div class="imw100p">
                                                            <div class="ad-nw-ad" id="divShowCategory" onclick="javascript:return showSelectedCategory();"><i id="i2" class="glyphicon glyphicon-plus fl"></i>View your Category and Sub-category selection </div>
                                                            <div class="ad-nw-ad" id="divHideCategory" onclick="javascript:return hideSelectedCategory();" style="display: none;"><i id="i3" class="glyphicon glyphicon-minus fl"></i>View your Category and Sub-category selection </div>
                                                            <br class="cl" />
                                                            <asp:HiddenField ID="xhdnProdCat" runat="server" />
                                                            <div id="divSelCat" runat="server" style="display: none">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="formRow">
                                                        <label>Brands</label>
                                                        <div class="formRow1">
                                                            <asp:TextBox ID="xtxtDescription" runat="server" CssClass="imw100p"
                                                                TextMode="MultiLine"
                                                                placeholder="Please enter the major brands you specialise in seperated by comma"
                                                                onkeypress="return RestrictText(event);"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="formRow" style="display: none;">
                                                        <label>Company Type</label>
                                                        <div class="formRow1">
                                                            <div class="styled-select fl selOrganization" style="display: none;">
                                                                <asp:DropDownList ID="xddlLegalStatus" runat="server">
                                                                    <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Partnership" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="Sole Proprietorship" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="Private Limited" Value="3"></asp:ListItem>
                                                                    <asp:ListItem Text="Public Limited" Value="4"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="formRow">
                                                        <label>Are you an</label>
                                                        <div class="formRow1">
                                                            <div class="termCheckbx">
                                                                <asp:CheckBox ID="xchkManufacture" runat="server" Text="OEM" />
                                                            </div>
                                                            <div class="termCheckbx">
                                                                <asp:CheckBox ID="xchkAgency" runat="server" Text="Distributor" />
                                                            </div>
                                                            <div class="termCheckbx">
                                                                <asp:CheckBox ID="xchkSupplier" runat="server" Text="Reseller" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="formRow">
                                                        <label>Description</label>
                                                        <div class="formRow1">
                                                            <asp:TextBox ID="xtxtDscp" runat="server" CssClass="imw100p"
                                                                TextMode="MultiLine"
                                                                placeholder="Please add any information that would be useful for buyers"
                                                                onkeypress="return RestrictText(event);"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <%--<label style="display: none;">Year of establishment</label>
                                                                <asp:TextBox ID="xtxtYearOfEst" runat="server" CssClass="imw97p" 
                                                                    onkeydown="return IsNumeric(event);" MaxLength="4" Visible="false"></asp:TextBox>
                                                                <label style="display: none;">Number of employees</label>
                                                                <asp:TextBox ID="xtxtNoOfEmployee" runat="server" CssClass="imw97p" 
                                                                    onkeydown="return IsNumeric(event);" Visible="false"></asp:TextBox>--%>

                                                    <div class="formRow">
                                                        <label>Delivery: <em class="markRed">*</em></label>
                                                        <div class="formRow1">

                                                            <div class="termCheckbx">
                                                                <asp:CheckBox ID="xchkPanIndia" runat="server" Text="All India" onchange="OnPanChange();" />
                                                            </div>
                                                            <div id="xdivCity" runat="server" style="display: none">
                                                                <select id="xddlCitylist" runat="server" style="width: 300px">
                                                                </select>
                                                            </div>
                                                            <div id="xdivState" runat="server">
                                                                <select id="xddlStatelist" runat="server" style="width: 300px">
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br class="cl" />
                                                    <div class="formRow" style="display: none">
                                                        <label>TIN Number</label>
                                                        <div class="formRow1">
                                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="imw48p" placeholder="Enter TIN Number"></asp:TextBox>
                                                            <ctrl:UploadFile ID="UploadFile2" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
                                                                UploadFileType="Doc" Caption="Upload TIN Number Document" />
                                                        </div>
                                                    </div>
                                                    <br class="cl" />
                                                    <div class="formRow">
                                                        <label></label>
                                                        <div class="formRow1">
                                                            <asp:LinkButton ID="xlnkBtnSubmitProd" runat="server" CssClass="btnRed" OnClick="xlnkBtnSubmitProd_Click" OnClientClick="javascript: return ValidateProductDet();">SUBMIT</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <br class="cl">
                                                    <asp:Literal ID="xlitProd" runat="server"></asp:Literal>
                                                    <asp:Literal ID="xlitscrCat" runat="server"></asp:Literal>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clmn2 imw72p fl" style="display: none">
                                            <div class="whiteBox fl" style="display: none;">
                                                <h2>Profile Strength<p>Complete your profile to get more from renepay.</p>
                                                    <h2></h2>
                                                    <asp:Literal ID="xlitProfile" runat="server"></asp:Literal>
                                                    <%--<img src="images/profile-completed-image.jpg" class="graph">--%>
                                                    <h2></h2>
                                                    <h2></h2>
                                                </h2>
                                            </div>
                                        </div>
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
                                    <i id="col3" class="glyphicon glyphicon-plus"></i>Bank Details

                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div>
                                            <div>
                                                <div class="buyRegis innerBxbody whiteBox">
                                                    <div class="formRow">
                                                        <label>Bank <em class="markRed">*</em></label>
                                                        <div class="formRow1">
                                                            <div class="imw48p fl bgGrey">
                                                                <div class="styled-select selOrganization">
                                                                    <asp:DropDownList ID="xddlBank" runat="server" onchange="ddlBank_change();">
                                                                        <%-- <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>--%>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div id="DivOtherBank" runat="server" style="display: none">
                                                                <asp:TextBox ID="txtOtherBank" runat="server" CssClass="imw48p"
                                                                    placeholder="If other bank please specify" autocomplete="off"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="formRow">
                                                        <label>Branch Code</label>
                                                        <div class="formRow1">
                                                            <asp:TextBox ID="xtxtBranchName" runat="server" CssClass="imw48p"
                                                                placeholder="Branch Name"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="formRow">
                                                        <label>IFSC Code</label>
                                                        <div class="formRow1">
                                                            <asp:TextBox ID="xtxtIFSCCode" runat="server" CssClass="imw48p"
                                                                placeholder="IFSC Code"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="formRow">
                                                        <label>Account holder</label>
                                                        <div class="formRow1">
                                                            <asp:TextBox ID="xtxtAccountHolder" runat="server" CssClass="imw100p"
                                                                placeholder="Account Holder"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="formRow">
                                                        <label>Account type <em class="markRed">*</em></label>
                                                        <div class="formRow1">
                                                            <div class="imw48p fl bgGrey">
                                                                <div class="styled-select selOrganization">
                                                                    <asp:DropDownList ID="xddlAccountType" runat="server">
                                                                        <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Current A/C" Value="Current A/c"></asp:ListItem>
                                                                        <asp:ListItem Text="Saving A/C" Value="Saving A/c"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <asp:TextBox ID="xtxtAccountNo" runat="server" CssClass="imw48p fr" placeholder="Account Number"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="formRow">
                                                        <label></label>
                                                        <div class="formRow1">
                                                            <asp:LinkButton ID="xlnkBtnSubmitBank" runat="server" CssClass="btnRed" OnClick="xlnkBtnSubmitBank_Click" OnClientClick="javascript: return ValidateBankDet();">SUBMIT</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <br class="cl">
                                                    <asp:Literal ID="xlitBank" runat="server"></asp:Literal>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div id="divCommission" class="panel panel-default" runat="server" visible="false">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                    <i id="col4" class="glyphicon glyphicon-plus"></i>Payment Details</a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse">
                            <div class="panel-body">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div id="divPayment" runat="server">
                                            <div class="clmn1 fl imw100p">
                                                <div class='innerBxbody whiteBox'>
                                                    <div class="buyRegis">
                                                        <div id="divAdmin" class="formRow" runat="server" visible="false">
                                                            <label>
                                                                <span class="fl">commission  (%)</span>
                                                                <div class="toolTip">
                                                                    <a href="#" onclick="javascript:return false;">?
			                                                          <div class="toolTipCont" style="width: 345px;">
                                                                          You will be charged this commission only once the transaction goes through. 
                                                                          It will be deducted from the buyer payment.
                                                                           Taxes extra.
                                                                      </div>
                                                                    </a>
                                                                </div>
                                                            </label>
                                                            <div class="formRow1">
                                                                <div class="imw50p fl">
                                                                    <asp:RadioButtonList ID="rdbCommissionType" runat="server" class="imw48p" RepeatDirection="Horizontal" RepeatColumns="2" CellPadding="20" CellSpacing="20" onchange="return rdbType_change()">
                                                                        <asp:ListItem Text="Default Commission" Value="D" Selected="True"></asp:ListItem>
                                                                        <asp:ListItem Text="Vendor Commission" Value="V"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </div>
                                                                <div class="imw50p">
                                                                    <asp:TextBox ID="xtxtCommissionDefault" ReadOnly="true" runat="server" MaxLength="5" class="imw48p" onkeydown="return IsDecimal(event);" placeholder="Default Commission" />
                                                                    <asp:TextBox ID="xtxtCommissionVendor" runat="server" MaxLength="5" class="imw48p" onkeydown="return IsDecimal(event);" placeholder="Vendor Commission" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="formRow buyRegis ">
                                                            <label>&nbsp;</label>
                                                            <div class="formRow1">
                                                                <asp:LinkButton ID="xlnkBtnSubmitCommission" OnClientClick="javascript: return ValidateCommissionDet();" runat="server" OnClick="xlnkBtnSubmitCommission_Click" CssClass="btnRed">Submit</asp:LinkButton>
                                                            </div>
                                                        </div>
                                                        <br class="cl">
                                                        <asp:Literal ID="xlitCommission" runat="server"></asp:Literal>
                                                    </div>
                                                    <br class="cl">
                                                </div>
                                            </div>
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

