<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" validaterequest="false" inherits="Deals_MarketingDealsCreate, App_Web_marketingdealscreate.aspx.1c5f8e60" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script src="../Scripts/plugins/tinymce_4.1.9/tinymce/js/tinymce/tinymce.min.js" type="text/javascript"></script>
    <script src="../Scripts/TimePicker/jquery.ui.timepicker.js"></script>
    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <link href="../Scripts/TimePicker/jquery.ui.timepicker.css?v=0.3.3" rel="stylesheet" />

    <script>

        function lnkbtnSubmit_Click() {
            if ($("#ContentPlaceHolder1_xtxtProductname").val() == "") {
                $("#ContentPlaceHolder1_xtxtProductname").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtProductname"), "Please enter product name.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtQty").val() == "") {
                $("#ContentPlaceHolder1_xtxtQty").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtQty"), "Please enter quantity.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtPrice").val() == "") {
                $("#ContentPlaceHolder1_xtxtPrice").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtPrice"), "Please enter price.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtDescription").val() == "") {
                $("#ContentPlaceHolder1_xtxtDescription").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtDescription"), "Please enter description.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtMarketPrice").val() == "") {
                $("#ContentPlaceHolder1_xtxtMarketPrice").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMarketPrice"), "Please enter market price.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlVendor option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlVendor").focus();
                ShowToolTip($("#ContentPlaceHolder1_xddlVendor"), "Please select vendor.", "bottom");
                return false;
            }
                //else if ($("#ContentPlaceHolder1_xtxtVendorName").val() == "") {
                //    $("#ContentPlaceHolder1_xtxtVendorName").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xtxtVendorName"), "Please enter vendor name.", "bottom");
                //    return false;
                //}
            else if ($("#ContentPlaceHolder1_xtxtMinQty").val() == "") {
                $("#ContentPlaceHolder1_xtxtMinQty").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMinQty"), "Please enter minimum request quantity.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtVendorEmail").val() == "") {
                $("#ContentPlaceHolder1_xtxtVendorEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtVendorEmail"), "Please enter vendor email.", "bottom");
                return false;
            }
            else if (!validateEmail($("#ContentPlaceHolder1_xtxtVendorEmail").val())) {
                $("#ContentPlaceHolder1_xtxtVendorEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtVendorEmail"), "Please Enter Valid Email Address", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtMaxQty").val() == "") {
                $("#ContentPlaceHolder1_xtxtMaxQty").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMaxQty"), "Please enter maximum request quantity.", "bottom");
                return false;
            }
                //else if ($("#ContentPlaceHolder1_xddlDealType option:selected").index() <= 0) {
                //    $("#ContentPlaceHolder1_xddlDealType").focus();
                //    ShowToolTip($("#ContentPlaceHolder1_xddlDealType"), "Please select deal type.", "bottom");
                //    return false;
                //}
            else if ($("#ContentPlaceHolder1_xtxtVendorAdd").val() == "") {
                $("#ContentPlaceHolder1_xtxtVendorAdd").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtVendorAdd"), "Please enter vendor address.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtState").val() == "") {
                $("#ContentPlaceHolder1_xtxtState").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtState"), "Please enter vendor state.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtCity").val() == "") {
                $("#ContentPlaceHolder1_xtxtCity").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtCity"), "Please enter vendor city.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtVendorMobileNo").val() == "") {
                $("#ContentPlaceHolder1_xtxtVendorMobileNo").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtVendorMobileNo"), "Please enter vendor mobile no.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtBrandName").val() == "") {
                $("#ContentPlaceHolder1_xtxtBrandName").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtBrandName"), "Please enter brand name.", "bottom");
                return false;
            }

            if (($("#ContentPlaceHolder1_xtxtStartDate").val() == '') && ($("#ContentPlaceHolder1_xtxtEndDate").val() == '')) {
                msg = "Please select start date and end date.";
                ShowModalMsgBox("Error", msg);
                return false;
            }
            else {
                if ($("#ContentPlaceHolder1_xtxtStartDate").val() == '') {
                    msg = "Please select start date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtStartDate", msg, "bottom");
                    return false;
                }
                if ($("#ContentPlaceHolder1_xtxtEndDate").val() == '') {
                    msg = "Please select end date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtEndDate", msg, "bottom");
                    return false;
                }
            }

            if (($("#ContentPlaceHolder1_xtxtStartTime").val() == '') && ($("#ContentPlaceHolder1_xtxtEndTime").val() == '')) {
                msg = "Please enter start time and end time.";
                ShowModalMsgBox("Error", msg);
                return false;
            }
            else {
                if ($("#ContentPlaceHolder1_xtxtStartTime").val() == '') {
                    msg = "Please select start time.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtStartTime", msg, "bottom");
                    return false;
                }
                if ($("#ContentPlaceHolder1_xtxtEndTime").val() == '') {
                    msg = "Please select end time.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtEndTime", msg, "bottom");
                    return false;
                }
            }

            ShowProgress();
            return true;
        }

        $(document).ready(function () {
            BindDatePicker();
        });

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            BindDatePicker();
            BindClockPicker();
        });

        function BindDatePicker() {
            $("#ContentPlaceHolder1_xtxtStartDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtEndDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');
        }

        function BindClockPicker() {
            $('#ContentPlaceHolder1_xtxtStartTime').timepicker({
                showPeriodLabels: false
            });
            $('#ContentPlaceHolder1_xtxtEndTime').timepicker({
                showPeriodLabels: false
            });
        }

        function FillVendorDet() {
            ShowProgress();
            var VendorId = $("#ContentPlaceHolder1_xddlVendor").val();
            if (VendorId <= 0) {
                $("#ContentPlaceHolder1_xtxtVendorEmail").val('');
                $("#ContentPlaceHolder1_xtxtVendorAdd").val('');
                $("#ContentPlaceHolder1_xtxtState").val('');
                $("#ContentPlaceHolder1_xtxtCity").val('');
                $("#ContentPlaceHolder1_xtxtVendorMobileNo").val('');
                HideProgress();
            }
            else {
                $.ajax({
                    url: 'MarketingDealsCreate.aspx/FillVendorDetail',
                    type: 'POST',       //GET
                    contentType: 'application/json; charset =utf-8',
                    data: "{'Id':" + VendorId + "}",
                    dataType: 'json',
                    success: function (data) {
                        try {
                            var VendorDet = data.d;
                            if (VendorDet != null) {
                                $("#ContentPlaceHolder1_xtxtVendorEmail").val(VendorDet[0]);
                                $("#ContentPlaceHolder1_xtxtVendorAdd").val(VendorDet[1]);
                                $("#ContentPlaceHolder1_xtxtState").val(VendorDet[2]);
                                $("#ContentPlaceHolder1_xtxtCity").val(VendorDet[3]);
                                $("#ContentPlaceHolder1_xtxtVendorMobileNo").val(VendorDet[4]);
                            }
                            else {
                                //Message to select vendor.
                            }
                            HideProgress();
                        }
                        catch (e) {
                        }
                    }
                });
                //HideProgress();
            }
        }

        //For tiny textbox
        tinymce.init({
            selector: "textarea",
            theme: "modern",
            plugins: [
        "advlist autolink lists link image charmap print preview hr anchor pagebreak",
        "searchreplace wordcount visualblocks visualchars code fullscreen",
        "insertdatetime media nonbreaking save table contextmenu directionality",
        "emoticons template paste textcolor colorpicker textpattern"
            ],
            toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
            toolbar2: "print preview media | forecolor backcolor emoticons",
            image_advtab: true,
            templates: [
        { title: 'Test template 1', content: 'Test 1' },
        { title: 'Test template 2', content: 'Test 2' }
            ]
        });

    </script>

    <div class="main supplier">
        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="<span id='spnCap'> Deals </span>"></asp:Literal>
            </div>
            <br class="cl"/>
        </div>
                <div class="row1">
                    <div class="whiteBox">
                        <div class="leftClmn">
                            <asp:HiddenField ID="xhdnDealId" Value="0" runat="server" />
                            <label>Product Name</label>
                            <asp:TextBox ID="xtxtProductname" runat="server" CssClass="imw97p" onkeypress="return RestrictText(event);" ondrop="return false;" MaxLength="50" autocomplete="off"></asp:TextBox>
                            <label>Deal Quantity</label>
                            <asp:TextBox ID="xtxtQty" runat="server" CssClass="imw97p" onkeydown="return IsNumeric(event);" MaxLength="4" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Description</label>
                            <asp:TextBox ID="xtxtDescription" runat="server" CssClass="imw97p" onkeypress="return RestrictText(event);" MaxLength="200" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Vendor Name</label>
                            <%--<asp:TextBox ID="xtxtVendorName" runat="server" CssClass="imw97p" onkeypress="return RestrictText(event);" MaxLength="50" ondrop="return false;" autocomplete="off"></asp:TextBox>--%>
                            <div class="imw97p fl ">
                                <div class="styled-select selOrganization imw100p">
                                    <asp:DropDownList ID="xddlVendor" runat="server" onchange="javascript:FillVendorDet();"></asp:DropDownList>
                                </div>
                            </div>
                            <label>Email</label>
                            <asp:TextBox ID="xtxtVendorEmail" runat="server" CssClass="imw97p" ondrop="return false;" Enabled="false" MaxLength="100" autocomplete="off"></asp:TextBox>
                            <label>Vendor Address</label>
                            <asp:TextBox ID="xtxtVendorAdd" runat="server" CssClass="imw97p" MaxLength="100" Enabled="false" ></asp:TextBox>
                            <label>State</label>
                            <asp:TextBox ID="xtxtState" runat="server" CssClass="imw97p" onkeydown="return IsCharacter(event);" MaxLength="30" Enabled="false" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>City</label>
                            <asp:TextBox ID="xtxtCity" runat="server" CssClass="imw97p" onkeydown="return IsCharacter(event);" MaxLength="30" Enabled="false" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Mobile No</label>
                            <asp:TextBox ID="xtxtVendorMobileNo" runat="server" CssClass="imw97p" onkeydown="return IsNumeric(event);" Enabled="false" MaxLength="10" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Request Limt</label>
                            <asp:CheckBox ID="xchkReqLimit" runat="server" />
                            <label>Publish</label>
                            <asp:CheckBox ID="xChkPublish" runat="server" />
                            <br class="cl">
                            <asp:LinkButton ID="xbtnSubmit" runat="server" class="btnBlk immrt30"  OnClick="xbtnSubmit_Click" OnClientClick="javascript: return lnkbtnSubmit_Click();">SUBMIT</asp:LinkButton>
                            <asp:LinkButton ID="xbtnCancel" runat="server" class="btnBlk immrt30"  OnClick="xbtnCancel_Click">CANCEL</asp:LinkButton>
                        </div>
                        <div class="rightClmn">
                            <label>Brand Name</label>
                            <asp:TextBox ID="xtxtBrandName" runat="server" CssClass="imw97p" onkeypress="return RestrictText(event);" MaxLength="50" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Offer Price</label>
                            <asp:TextBox ID="xtxtPrice" runat="server" CssClass="imw97p" onkeydown="return IsNumeric(event);" MaxLength="9" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Average Online Price</label>
                            <asp:TextBox ID="xtxtMarketPrice" runat="server" CssClass="imw97p" onkeydown="return IsNumeric(event);" MaxLength="9" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Minimum Quantity</label>
                            <asp:TextBox ID="xtxtMinQty" runat="server" CssClass="imw97p" onkeydown="return IsNumeric(event);" MaxLength="4" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Maximum Quantity</label>
                            <asp:TextBox ID="xtxtMaxQty" runat="server" CssClass="imw97p" onkeydown="return IsNumeric(event);" MaxLength="4" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <%--<label>Deal Type</label>
                            <asp:DropDownList ID="xddlDealType" CssClass="styled-select selOrganization imw90p bgGrey" runat="server">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="MKTOFF">Marketing Offers</asp:ListItem>
                                <asp:ListItem Value="CMUOFF">Community Deal</asp:ListItem>
                            </asp:DropDownList>--%>
                            <label>Product Image</label>
                            <ctrl:UploadFile ID="xfileProductImage" runat="server" UserType="ADM" UploadDocType="OfferProductImage"
                                UploadFileType="Img" Caption="Upload product image" />
                            <br class="cl">
                            <div class="imw45p fl">
                                <label>Start Date</label>
                                <asp:TextBox ID="xtxtStartDate" CssClass="icnCal" runat="server" autocomplete="off"></asp:TextBox>
                            </div>
                            <div class="imw45p immr0 fr">
                                <label>End Date</label>
                                <asp:TextBox ID="xtxtEndDate" CssClass="icnCal" runat="server"></asp:TextBox>
                            </div>

                            <div class="imw45p fl">
                                <label>Start Time</label>
                                <asp:TextBox ID="xtxtStartTime" CssClass="icnTime" runat="server"></asp:TextBox>
                            </div>
                            <div class="imw45p immr0 fr">
                                <label>End Time</label>
                                <asp:TextBox ID="xtxtEndTime" CssClass="icnTime" runat="server"></asp:TextBox>
                                <script>
                                    BindClockPicker();
                                </script>
                                <br class="cl">
                            </div>

                            <label>T&C</label>
                            <textarea id="txtArea" name="content" runat="server"></textarea>

                        </div>

                        <br class="cl">
                    </div>
                </div>
    </div>

</asp:Content>