<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_RegistrationSupplierAdditionalDet, App_Web_registrationsupplieradditionaldet.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Styles/morris.css" rel="stylesheet" />
    <script src="../Scripts/morris.min.js"></script>
    <script src="../Scripts/raphael-min.js"></script>
    <script src="../Scripts/jQuery.circleProgressBar.min.js"></script>
    <script>

        $(document).ready(function () {
            $("input").attr("autocomplete", "off");
            $(":input, a").attr("tabindex", "-1");
            // $("#txtIfOther").attr("disabled", "disabled");
            $("#ContentPlaceHolder1_xddlState").select2({ placeholder: 'Find and Select State/s' });

            $(function Process() {
                $('.percent').percentageLoader({
                    valElement: 'p',
                    strokeWidth: 30,
                    bgColor: '#d9d9d9',
                    ringColor: '#d53f3f',
                    textColor: '#2C3E50',
                    fontSize: '14px',
                    fontWeight: 'bold'
                });
            });
        });

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            $(function Process() {
                $('.percent').percentageLoader({
                    valElement: 'p',
                    strokeWidth: 30,
                    bgColor: '#d9d9d9',
                    ringColor: '#d53f3f',
                    textColor: '#2C3E50',
                    fontSize: '14px',
                    fontWeight: 'bold'
                });
            });
        });

        function Validate() {
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

            //if ($("#ContentPlaceHolder1_xddlLegalStatus option:selected").index() <= 0) {
            //     $("#ContentPlaceHolder1_xddlLegalStatus").focus();
            //     ShowToolTip("#ContentPlaceHolder1_xddlLegalStatus", "Please select company type", "bottom");
            //     return false;
            // }

            //if ($("#ContentPlaceHolder1_xtxtDescription").val() == "") {
            //    $("#ContentPlaceHolder1_xtxtYearOfEst").focus();
            //    ShowToolTip($("#ContentPlaceHolder1_xtxtYearOfEst"), "Please enter year of establishment.", "bottom");
            //    return false;
            //}
            //if ($("#ContentPlaceHolder1_xtxtNoOfEmployee").val() == "") {
            //    $("#ContentPlaceHolder1_xtxtNoOfEmployee").focus();
            //    ShowToolTip($("#ContentPlaceHolder1_xtxtNoOfEmployee"), "Please enter Number of employees.", "bottom");
            //    return false;
            //} 

            //if (!$('#ContentPlaceHolder1_xchkManufacture').is(':checked')) {
            //    if (!$('#ContentPlaceHolder1_xchkAgency').is(':checked')) {
            //        if (!$('#ContentPlaceHolder1_xchkSupplier').is(':checked')) {
            //            $('#ContentPlaceHolder1_xchkSupplier').focus();
            //            ShowToolTip($('#ContentPlaceHolder1_xchkSupplier'), "Please select type of bussiness", "top");
            //            return false;
            //        }
            //    }
            //}
            if (!$('#ContentPlaceHolder1_xchkPanIndia').is(':checked')) {
                //var length = $('#ContentPlaceHolder1_xddlCity').length;

                //var length = $('#ContentPlaceHolder1_xddlCity').val();
                //if (length == null) {
                //    $("#ContentPlaceHolder1_xddlCity").focus();
                //    ShowToolTip("#ContentPlaceHolder1_xddlCity", "Please select cities.", "bottom");
                //    return false;
                //}
                var length = $('#ContentPlaceHolder1_xddlState').val();
                if (length == null) {
                    $("#ContentPlaceHolder1_xddlState").focus();
                    ShowToolTip("#ContentPlaceHolder1_xddlState", "Please select state.", "bottom");
                    return false;
                }
            }
            //if ($("#ContentPlaceHolder1_xtxtTinCards").val() == "") {
            //    $("#ContentPlaceHolder1_xtxtTinCards").focus();
            //    ShowToolTip($("#ContentPlaceHolder1_xtxtTinCards"), "Please enter TIN number.", "bottom");
            //    return false;
            //}
            //var TinDoc = window["xctrlTinCards_GetUploadedFileName"]();
            //if (TinDoc == undefined || TinDoc == "") {
            //    //if ($("#ContentPlaceHolder1_xtxtCompanyLogo").val() == "") {
            //    $("#ContentPlaceHolder1_xctrlTinCards_lnkUpload").focus();
            //    ShowToolTip("#ContentPlaceHolder1_xctrlTinCards_lnkUpload", "Please upload TIN document.", "bottom");
            //    return false;
            //    //}
            //}
            //var Certificate = window["xctrlCompanyLogo_GetUploadedFileName"]();
            //if (Certificate == undefined || Certificate == "") {
            //    //if ($("#ContentPlaceHolder1_xtxtCompanyLogo").val() == "") {
            //    $("#ContentPlaceHolder1_xctrlCompanyLogo_lnkUpload").focus();
            //    ShowToolTip("#ContentPlaceHolder1_xctrlCompanyLogo_lnkUpload", "Please upload company logo.", "bottom");
            //    return false;
            //    //}
            //}
            ShowProgress();
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
    <link href="../Scripts/plugins/select2.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/plugins/jquery.select2.js" type="text/javascript"></script>
    <script src="../Scripts/plugins/select2.full.js" type="text/javascript"></script>
    <asp:UpdatePanel ID="xupnlProfile" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="clmn1 imw100p fl">
                <div class="innerBx">
                    <div class="innerBxhead bgRed">Products & Services</div>
                    <div class="buyRegis innerBxbody brdGrey whiteBox">
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

                                str = "<table class='tableList' col='4'>";
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
                                str += "</table>"

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
                                var str = "<h3>Your Selection</h3><table width='100%' class='billInfo'><tr><th>Categories</th><th>Sub Categories</th></tr>";
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
                                <ctrl:UploadFile ID="xctrlCompanyLogo" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
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
                                <label class="imw100p">Product Subcategory</label>
                                <div id="divSubCat" class="suppprofList" runat="server">
                                </div>
                            </div>
                        </div>
                        <br class="cl">
                        <div class="formRow">
                            <label></label>
                            <div class="formRow1">
                                <div class="ad-nw-ad" id="divShowCategory" onclick="javascript:return showSelectedCategory();"><i id="iShowLine" class="glyphicon glyphicon-plus fl"></i>View your Category and Sub-category selection </div>
                                <div class="ad-nw-ad" id="divHideCategory" onclick="javascript:return hideSelectedCategory();" style="display: none;"><i id="i1" class="glyphicon glyphicon-minus fl"></i>View your Category and Sub-category selection </div>
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
                        <%-- <div class="whiteBox brdPink">--%>

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
                                    <select id="xddlCity" runat="server" style="width: 300px">
                                    </select>
                                </div>

                                <div id="xdivState" runat="server">
                                    <select id="xddlState" runat="server" style="width: 300px">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br class="cl" />
                        <div class="formRow" style="display: none">
                            <label>TIN Number</label>
                            <div class="formRow1">
                                <asp:TextBox ID="xtxtTinCards" runat="server" CssClass="imw48p" placeholder="Enter TIN Number"></asp:TextBox>
                                <ctrl:UploadFile ID="xctrlTinCards" runat="server" UserType="VND" UploadDocType="SupplierProfileDoc"
                                    UploadFileType="Doc" Caption="Upload TIN Number Document" />
                            </div>
                        </div>
                        <br class="cl" />
                        <div class="bglightGrey">Bank Details</div>
                        <div class="formRow">
                            <label>Bank</label>
                            <div class="formRow1">
                                <div class="imw48p fl bgGrey">
                                    <div class="styled-select selOrganization">
                                        <asp:DropDownList ID="xddlBank" runat="server">
                                            <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <asp:TextBox ID="xtxtBranchName" runat="server" CssClass="imw48p fr"
                                    placeholder="Branch Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="formRow">
                            <label>IFSC Code</label>
                            <div class="formRow1">
                                <asp:TextBox ID="xtxtIFSCCode" runat="server" CssClass="imw48p" TabIndex="0"
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
                            <label>Account Type</label>
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
                                <asp:LinkButton ID="xlnkbtnRegister" runat="server" CssClass="btnRed"
                                    OnClientClick="javascript: return Validate();"
                                    OnClick="xlnkbtnRegister_Click">REGISTER</asp:LinkButton>
                                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                                <asp:Literal ID="xlitscrCat" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <br class="cl">
                    </div>
                </div>
            </div>
            </div>
            <div class="clmn2 imw100p fl" style="display: none">
                <div class="whiteBox fl" style="display: none;">
                    <h2>Profile Strength<p>Complete your profile to get more from renepay.</p>
                    </h2>
                    <asp:Literal ID="xlitProfile" runat="server"></asp:Literal>
                    <%--<img src="images/profile-completed-image.jpg" class="graph">--%>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

