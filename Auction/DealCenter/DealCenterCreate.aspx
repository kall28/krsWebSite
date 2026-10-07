<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_DealCenter_DealCenterCreate, App_Web_dealcentercreate.aspx.3dacc91e" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <link href="../Styles/clockpicker.css" rel="stylesheet" />
    <script src="../Scripts/clockpicker.js"></script>

    <script>
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
            var input = $('#ContentPlaceHolder1_xtxtStartTime').clockpicker({
                placement: 'top',
                autoclose: true
            }).attr('readonly', 'true');

            var input = $('#ContentPlaceHolder1_xtxtEndTime').clockpicker({
                placement: 'top',
                autoclose: true
            }).attr('readonly', 'true');
        }

        function validateCheckBox() {
            if (!$("#chkVendor input[type='radio']").is(":checked")) {
                return false;
            }

            return true;
        }

        function GetCheckedVendor() {
            var checkedVendor = [];
            var checkBoxList = $("#chkVendor input[type='radio']");
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
            var msg = "";
            if ($("#ContentPlaceHolder1_xtxtName").val() == "") {
                $("#ContentPlaceHolder1_xtxtName").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtName"), "Please enter deal name.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlCategory option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlCategory").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlCategory", "Please select category.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlSubCategory option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlSubCategory").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlSubCategory", "Please select subcategory.", "bottom");
                return false;
            }
            //else if ($("#ContentPlaceHolder1_xtxtProduct").val() == "") {
            //    $("#ContentPlaceHolder1_xtxtProduct").focus();
            //    ShowToolTip($("#ContentPlaceHolder1_xtxtProduct"), "Please enter product name.", "bottom");
            //    return false;
            //}
            else if ($("#ContentPlaceHolder1_xtxtQty").val() == "") {
                $("#ContentPlaceHolder1_xtxtQty").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtQty"), "Please enter quantity.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtQty").val() != "") {
                if ($("#ContentPlaceHolder1_xtxtQty").val() <= 0) {
                    $("#ContentPlaceHolder1_xtxtQty").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtQty"), "Please enter atleast 1 quantity.", "bottom");
                    return false;
                }
            }
            else if ($("#ContentPlaceHolder1_xtxtMinQty").val() == "") {
                $("#ContentPlaceHolder1_xtxtMinQty").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMinQty"), "Please enter minimum request quantity.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtMaxQty").val() == "") {
                $("#ContentPlaceHolder1_xtxtMaxQty").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMaxQty"), "Please enter maximum request quantity.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtUnitPrice").val() == "") {
                $("#ContentPlaceHolder1_xtxtUnitPrice").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtUnitPrice"), "Please enter unit price.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtUnitOfMsur").val() == "") {
                $("#ContentPlaceHolder1_xtxtUnitOfMsur").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtUnitOfMsur"), "Please enter unit of measurement.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtNoDays").val() == "") {
                $("#ContentPlaceHolder1_xtxtNoDays").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtNoDays"), "Please enter days.", "bottom");
                return false;
            }
            if ($("#ContentPlaceHolder1_xddlPaymentCycle option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlPaymentCycle").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlPaymentCycle", "Please select payment cycle.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlPaymentMode option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlPaymentMode").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlPaymentMode", "Please select payment mode.", "bottom");
                return false;
            } 
            else if ($("#ContentPlaceHolder1_xtxtExpectedDelivery").val() == "") {
                $("#ContentPlaceHolder1_xtxtExpectedDelivery").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtExpectedDelivery"), "Please enter expected delivery days.", "bottom");
                return false;
            }
            var select = [];
            select = GetCheckedVendor();
            //var checkBoxList = $("#chkVendor input[type='radio']");
            //else if (checkBoxList.length == 1) {
            if (select.length <= 0) {
                ShowModalMsgBox("Error", "Please select only 1 supplier.");
                return false;
            }
            else if (($("#ContentPlaceHolder1_xtxtStartDate").val() == '') && ($("#ContentPlaceHolder1_xtxtEndDate").val() == '')) {
                msg = "Please select Start Date and End Date.";
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
                    msg = "Please Enter Start Time.";
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

        function toggleVendorSelection(element) {
            var checkBoxList = $(".chkVendorList input[type='radio']");
            for (var i = 0; i < checkBoxList.length; i++) {
                checkBoxList[i].checked = element.checked;
            }
        }

        function ShowNewSupplier() {
            ShowModalBox($("#divNewSupplier"));
        }

        function CloseSupplier() {
            HideModalBox($("#divNewSupplier"));
        }

        function Clear() {

        }

    </script>
    


    <div class="main supplier">
        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="<span id='spnCap'> Create an Deal </span>"></asp:Literal>
            </div>
            <br class="cl"/>
        </div>
        <asp:UpdatePanel ID="xupnlOfferDet" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="row1">
                    <div class="whiteBox">
                        <div class="leftClmn">
                            <label>Deal Name</label>
                            <asp:TextBox ID="xtxtName" runat="server" CssClass="imw97p" onkeypress="return RestrictText(event);" ondrop="return false;" maxlength="50" autocomplete="off"></asp:TextBox>
                            <label>Brand</label>
                            <asp:TextBox ID="xtxtBrand" runat="server" CssClass="imw97p" onkeypress="return RestrictText(event);" ondrop="return false;" maxlength="50" autocomplete="off"></asp:TextBox>
                            <%--<label>Product</label>
                            <asp:TextBox ID="xtxtProduct" runat="server" CssClass="imw97p" onkeypress="return RestrictText(event);" maxlength="50"></asp:TextBox>--%>
                            <label>Unit of Measurement</label>
                            <asp:TextBox ID="xtxtUnitOfMsur" runat="server" CssClass="imw97p" MaxLength="50" ondrop="return false;" onkeypress="return RestrictText(event);" autocomplete="off"></asp:TextBox>
                            <label>Expected Delivery</label>
                            <asp:TextBox ID="xtxtExpectedDelivery" CssClass="imw97p" runat="server" maxlength="9" onkeydown="IsNumeric(event);"></asp:TextBox>
                            <label>Additional product specifications, if any</label>
                            <asp:TextBox ID="xtxtDescription" runat="server" TextMode="MultiLine" maxlength="200" CssClass="imw97p" Height="125px" onkeypress="return RestrictText(event);"></asp:TextBox>
                            <label>Contract Details</label>
                            <asp:TextBox ID="xtxtContractDetails" runat="server" Height="125px" CssClass="imw97p" ondrop="return false;" onkeypress="return RestrictText(event);" TextMode="MultiLine" maxlength="200"></asp:TextBox>
                            <label>Product Image</label>
                            <ctrl:UploadFile ID="xfileProductImage" runat="server" UserType="ADM" UploadDocType="OfferProductImage"
                            UploadFileType="Img" Caption="Upload product image" />
                            <label>Payment Terms</label>
                                <div class="styled-select selOrganization imw90p">
                                    <asp:DropDownList ID="xddlPaymentCycle" runat="server">
                                    </asp:DropDownList>
                                </div>
                            
                            
                            <asp:DropDownList ID="xddlCountry" runat="server" Visible="false">
                            </asp:DropDownList>
                        </div>
                        <div class="rightClmn">
                            <label>Category</label>
                            <div class="styled-select selOrganization imw90p">
                                <asp:DropDownList ID="xddlCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="xddlCategory_SelectedIndexChanged">
                                    <asp:ListItem Text="All" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <label>Sub Category</label>
                            <div class="styled-select selOrganization imw90p">
                                <asp:DropDownList ID="xddlSubCategory" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="xddlSubCategory_SelectedIndexChanged">
                                    <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <label>Quantity</label>
                                <asp:TextBox ID="xtxtQty" CssClass="imw97p" runat="server" maxlength="9" onkeydown="IsNumeric(event);"></asp:TextBox>
                            <label>Minimum Quantity</label>
                            <asp:TextBox ID="xtxtMinQty" runat="server" CssClass="imw97p" onkeydown="return IsNumeric(event);" MaxLength="4" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Maximum Quantity</label>
                            <asp:TextBox ID="xtxtMaxQty" runat="server" CssClass="imw97p" onkeydown="return IsNumeric(event);" MaxLength="4" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Offer Price</label>
                                <asp:TextBox ID="xtxtUnitPrice" runat="server" CssClass="imw97p" maxlength="9" autocomplete="off" onkeydown="return IsNumeric(event);"></asp:TextBox>
                             <label>Market Price</label>
                                <asp:TextBox ID="xtxtMarketPrice" runat="server" CssClass="imw97p" maxlength="9" autocomplete="off" onkeydown="return IsNumeric(event);"></asp:TextBox>
                            <label>Terms & Conditions</label>
                            <asp:TextBox ID="xtxtTerms" runat="server" Height="125px" CssClass="imw97p" ondrop="return false;" onkeypress="return RestrictText(event);" TextMode="MultiLine" maxlength="200"></asp:TextBox>
                            
                            <label>Product Document</label>
                            <ctrl:UploadFile ID="xfileUploader" runat="server" UserType="ADM" UploadDocType="OfferContractDoc"
                            UploadFileType="Doc" Caption="Upload product specifications Document" />
                            <label>Mode of payment</label>
                                <div class="styled-select selOrganization imw90p">
                                    <asp:DropDownList ID="xddlPaymentMode" runat="server">
                                    </asp:DropDownList>
                                </div>
                            
                        </div>
                        
                        <br class="cl">
                    </div>
                    
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="xupnlSupplierlist" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="whiteBox immrt20">
                    <div class="aucHead fl">Choose Vendor</div> 
                    <br class="cl">
                </div>
                <asp:Literal ID="xlitSupplierList" runat="server"></asp:Literal>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="xupnlOfferDeadline" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="whiteBox immrt20">
                    <div class="aucHead">Deal Deadline</div>
                    <div class="leftClmn">
                        <div class="imw45p fl">
                            <label>Start Date</label>
                            <asp:TextBox ID="xtxtStartDate" CssClass="icnCal" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                        <div class="imw45p fr">
                            <label>Start Time</label>
                            <asp:TextBox ID="xtxtStartTime" CssClass="icnTime" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="rightClmn">
                        <div class="imw45p immr0 fl">
                            <label>End Date</label>
                            <asp:TextBox ID="xtxtEndDate" CssClass="icnCal" runat="server"></asp:TextBox>
                        </div>
                        <div class="imw45p immr0 fr">
                            <label>End Time</label>
                            <asp:TextBox ID="xtxtEndTime" CssClass="icnTime" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="leftClmn chkPub">
                        <br />
                        <asp:CheckBox ID="xchckPublish" Text="Publish" runat="server" />
                    </div>
                    <%--<script src="../Scripts/clockpicker.js"></script>--%>
                    <script>
                        BindClockPicker();
                    </script>
                    <br class="cl">
                    <br class="cl">
                    <asp:LinkButton ID="xlnkbtnCreate" runat="server" class="btnBlk immrt30"  OnClick="xlnkbtnCreate_Click" OnClientClick="javascript:if(!lnkbtnRegister_Click() ){ return false; }">SUBMIT</asp:LinkButton>
                    <asp:LinkButton  ID="xlnkbtnCancel" runat="server" CssClass="btnBlk immrt30" OnClick="xlnkbtnCancel_Click">CANCEL</asp:LinkButton>
                    
                    
                    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                </div>
                    
                </div>

                <div class="modal fade" id="divConfirm" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" id="btnClose" runat="server" class="close"
                                    onclick="javascript:link_click('RFPD');">
                                    &times;</button>
                                <h4 class="modal-title" id="H1">Deal Confirmation</h4>
                            </div>
                            <div class="modal-body">
                                <p id="pRegMsg" runat="server">
                                </p>
                            </div>
                            <div class="modal-footer">
                                <a class="btnRed fl" href="#" id="lnkNext" runat="server"
                                    onclick="javascript:link_click('RFPD'); return false;">CLOSE</a>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>

