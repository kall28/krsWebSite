<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_RFPCenter_Create, App_Web_create.aspx.f5f1fac" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <link href="../Scripts/TimePicker/jquery.ui.timepicker.css?v=0.3.3" rel="stylesheet" />
    <script src="../Scripts/TimePicker/jquery.ui.timepicker.js"></script>
    <%--<link href="../Styles/clockpicker.css" rel="stylesheet" />
    <script src="../Scripts/clockpicker.js"></script>--%>
    <%--<link href="../Styles/bootstrap-datetimepicker.min.css" rel="stylesheet" />--%>
    <%--<script src="../Scripts/bootstrap-datetimepicker.min.js"></script>--%>

    <script>
        $(document).ready(function () {
            //BindDatePicker();
            FillDate();
            // SetDataTablePaging("#tblSupplierList");
            //            BindPaging('tblSupplierList');
        });

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            FillDate();
            BindClockPicker();
        });

        function FillDate() {
            $.ajax({
                type: 'POST',
                url: 'Create.aspx/FillDate',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                success: function (msg) {
                    if (msg.d != null) {

                        $("#ContentPlaceHolder1_xtxtStartDate").datepicker({
                            dateFormat: 'dd/mm/yy',
                            minDate: msg.d,
                        }).attr('readonly', 'true');

                        $("#ContentPlaceHolder1_xtxtEndDate").datepicker({
                            dateFormat: 'dd/mm/yy',
                            minDate: msg.d,
                        }).attr('readonly', 'true');
                    }
                },
                error: ShowError
            });
        }

        function BindDatePicker() {
            var d = new Date();
            var day = d.getDate();
            $("#ContentPlaceHolder1_xtxtStartDate").datepicker({
                dateFormat: 'dd/mm/yy',
                minDate: d,
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtEndDate").datepicker({
                dateFormat: 'dd/mm/yy',
                minDate: d,
            }).attr('readonly', 'true');

        }

        function opencalender() {
            $('#ContentPlaceHolder1_xtxtStartDate').trigger("focus");
        }
        function opencalender1() {
            $('#ContentPlaceHolder1_xtxtEndDate').trigger("focus");
        }

        function BindClockPicker() {
            $('#ContentPlaceHolder1_xtxtStartTime').timepicker({
                showPeriodLabels: false
            });
            $('#ContentPlaceHolder1_xtxtEndTime').timepicker({
                showPeriodLabels: false
            });

            //var input = $('#ContentPlaceHolder1_xtxtEndTime').clockpicker({
            //    placement: 'top',
            //    autoclose: true
            //}).attr('readonly', 'true');
        }

        function validateCheckBox() {
            if (!$("#chkVendor input[type='checkbox']").is(":checked")) {
                return false;
            }
            return true;
        }
        function GetCheckedVendor() {
            var checkedVendor = [];
            var checkBoxList = $("#chkVendor input[type='checkbox']");
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
            //if ($("#ContentPlaceHolder1_xtxtName").val() == "") {
            //    $("#ContentPlaceHolder1_xtxtName").focus();
            //    ShowToolTip($("#ContentPlaceHolder1_xtxtName"), "Please enter RFP name.", "bottom");
            //    return false;
            //}
            //else if ($("#ContentPlaceHolder1_xchkRegisteredAddr").is(":checked")) {
            //    ShowModalMsgBox("Error", "chkd.");
            //    return false;
            //}
            //else if (!$("#ContentPlaceHolder1_xchkRegisteredAddr").is(":checked")) {
            //    ShowModalMsgBox("Error", "not chkd.");
            //    return false;
            //}

            if ($("#ContentPlaceHolder1_xtxtProduct").val() == "") {
                $("#ContentPlaceHolder1_xtxtProduct").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtProduct"), "Please Enter product name.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlCategory option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlCategory").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlCategory", "Please select category", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlSubCategory option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlSubCategory").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlSubCategory", "Please select subcategory", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtQty").val() == "") {
                $("#ContentPlaceHolder1_xtxtQty").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtQty"), "Please enter quantity.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlUnit option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlUnit").focus();
                ShowToolTip($("#ContentPlaceHolder1_xddlUnit"), "Please select unit.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtNoDays").val() == "") {
                $("#ContentPlaceHolder1_xtxtNoDays").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtNoDays"), "Please enter days.", "bottom");
                return false;
            }
            var strType = $("input[name='ctl00$ContentPlaceHolder1$rdbType']:checked").val();
            if (strType == "R") {
                if ($("#ContentPlaceHolder1_xddlRecurrType option:selected").index() <= 0) {
                    $("#ContentPlaceHolder1_xddlRecurrType").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xddlRecurrType"), "Please select recurring type.", "bottom");
                    return false;
                }
                else if ($("#ContentPlaceHolder1_xtxtRecurrPeriod").val() == "") {
                    $("#ContentPlaceHolder1_xtxtRecurrPeriod").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtRecurrPeriod"), "Please enter recurring period.", "bottom");
                    return false;
                }
                //else if ($("#ContentPlaceHolder1_xtxtRecurrPeriod").val() == "") {
                //    if ($("#ContentPlaceHolder1_xtxtRecurrPeriod").val() <= 0) {
                //        $("#ContentPlaceHolder1_xtxtRecurrPeriod").focus();
                //        ShowToolTip($("#ContentPlaceHolder1_xtxtRecurrPeriod"), "Recurring period must greater than zero.", "bottom");
                //        return false;
                //    }
                //}
            }
            if (!$("#ContentPlaceHolder1_xchkRegisteredAddr").is(":checked")) {
                if (!$("#ContentPlaceHolder1_xchckAddr1").is(":checked")) {
                    ShowModalMsgBox("Error", "Please select shipping address.");
                    return false;
                    //if (!$("#ContentPlaceHolder1_xchckAddr2").is(":checked")) {
                    //    ShowModalMsgBox("Error", "Please select shipping address.");
                    //    return false;
                    //}
                }
            }
            if ($("#ContentPlaceHolder1_xchkRegisteredAddr").is(":checked")) {
                if ($("#ContentPlaceHolder1_xtxtRegAdd").val() == "") {
                    $("#ContentPlaceHolder1_xtxtRegAdd").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtRegAdd"), "Please enter address.", "bottom");
                    return false;
                }
                else if ($("#ContentPlaceHolder1_xtxtRegCountry").val() == "") {
                    $("#ContentPlaceHolder1_xtxtRegCountry").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtRegCountry"), "Please enter country.", "bottom");
                    return false;
                }
                else if ($("#ContentPlaceHolder1_xtxtRegState").val() == "") {
                    $("#ContentPlaceHolder1_xtxtRegState").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtRegState"), "Please enter state.", "bottom");
                    return false;
                }
                else if ($("#ContentPlaceHolder1_xtxtRegCity").val() == "") {
                    $("#ContentPlaceHolder1_xtxtRegCity").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtRegCity"), "Please enter city.", "bottom");
                    return false;
                }
                else if ($("#ContentPlaceHolder1_xtxtRegPinCode").val() == "") {
                    $("#ContentPlaceHolder1_xtxtRegPinCode").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtRegPinCode"), "Please enter pincode.", "bottom");
                    return false;
                }
            }
            if ($("#ContentPlaceHolder1_xchckAddr1").is(":checked")) {
                if ($("#ContentPlaceHolder1_xtxtAdd1").val() == "") {
                    $("#ContentPlaceHolder1_xtxtAdd1").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtAdd1"), "Please enter address.", "bottom");
                    return false;
                }
                else if ($("#ContentPlaceHolder1_xddlCountryAddr1 option:selected").index() <= 0) {
                    $("#ContentPlaceHolder1_xddlCountryAddr1").focus();
                    ShowToolTip("#ContentPlaceHolder1_xddlCountryAddr1", "Please select country", "bottom");
                    return false;
                }
                else if ($("#ContentPlaceHolder1_xddlStateAddr1 option:selected").index() <= 0) {
                    $("#ContentPlaceHolder1_xddlStateAddr1").focus();
                    ShowToolTip("#ContentPlaceHolder1_xddlStateAddr1", "Please select state", "bottom");
                    return false;
                }
                else if ($("#ContentPlaceHolder1_xddlCityAddr1 option:selected").index() <= 0) {
                    $("#ContentPlaceHolder1_xddlCityAddr1").focus();
                    ShowToolTip("#ContentPlaceHolder1_xddlCityAddr1", "Please select city", "bottom");
                    return false;
                }
                else if ($("#ContentPlaceHolder1_xtxtPincodeAddr1").val() == "") {
                    $("#ContentPlaceHolder1_xtxtPincodeAddr1").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtPincodeAddr1"), "Please enter pincode.", "bottom");
                    return false;
                }
            }
            if ($("#ContentPlaceHolder1_xchckAddr2").is(":checked")) {
                if ($("#ContentPlaceHolder1_xtxtAdd2").val() == "") {
                    $("#ContentPlaceHolder1_xtxtAdd2").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtAdd2"), "Please enter address.", "bottom");
                    return false;
                }
                else if ($("#ContentPlaceHolder1_xddlCountryAddr2 option:selected").index() <= 0) {
                    $("#ContentPlaceHolder1_xddlCountryAddr2").focus();
                    ShowToolTip("#ContentPlaceHolder1_xddlCountryAddr2", "Please select country", "bottom");
                    return false;
                }
                else if ($("#ContentPlaceHolder1_xddlStateAddr2 option:selected").index() <= 0) {
                    $("#ContentPlaceHolder1_xddlStateAddr2").focus();
                    ShowToolTip("#ContentPlaceHolder1_xddlStateAddr2", "Please select state", "bottom");
                    return false;
                }
                else if ($("#ContentPlaceHolder1_xddlCityAddr2 option:selected").index() <= 0) {
                    $("#ContentPlaceHolder1_xddlCityAddr2").focus();
                    ShowToolTip("#ContentPlaceHolder1_xddlCityAddr2", "Please select city", "bottom");
                    return false;
                }
                else if ($("#ContentPlaceHolder1_xtxtPincodeAddr2").val() == "") {
                    $("#ContentPlaceHolder1_xtxtPincodeAddr2").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtPincodeAddr2"), "Please enter pincode.", "bottom");
                    return false;
                }
            }
            //if ($("#ContentPlaceHolder1_xddlPaymentCycle option:selected").index() <= 0) {
            //    $("#ContentPlaceHolder1_xddlPaymentCycle").focus();
            //    ShowToolTip("#ContentPlaceHolder1_xddlPaymentCycle", "Please select payment cycle", "bottom");
            //    return false;
            //}
            //if ($("#ContentPlaceHolder1_xddlPaymentMode option:selected").index() <= 0) {
            //    $("#ContentPlaceHolder1_xddlPaymentMode").focus();
            //    ShowToolTip("#ContentPlaceHolder1_xddlPaymentMode", "Please select payment mode", "bottom");
            //    return false;
            //}
            // if ($("#ContentPlaceHolder1_xddlContractPeriod option:selected").index() <= 0) {
            //    $("#ContentPlaceHolder1_xddlContractPeriod").focus();
            //    ShowToolTip("#ContentPlaceHolder1_xddlContractPeriod", "Please select contract period", "bottom");
            //    return false;
            //}
            // if ($("#ContentPlaceHolder1_xddlContractPeriod option:selected").index() > 0) {
            //    if ($("#ContentPlaceHolder1_xddlContractPeriod").val() < 0) {
            //        if ($("#ContentPlaceHolder1_xtxtOthContract").val() == "") {
            //            $("#ContentPlaceHolder1_xtxtOthContract").focus();
            //            ShowToolTip("#ContentPlaceHolder1_xtxtOthContract", "Please Enter Contract Period", "bottom");
            //            return false;
            //        }
            //    }
            //}
            var PayType = $("#ContentPlaceHolder1_xhdnPayType").val();
            if (PayType == "COD") {
                if ($("#ContentPlaceHolder1_xddlCreditPeriod option:selected").index() <= 0) {
                    $("#ContentPlaceHolder1_xddlCreditPeriod").focus();
                    ShowToolTip("#ContentPlaceHolder1_xddlCreditPeriod", "Please select credit period", "bottom");
                    return false;
                }
                if ($("#ContentPlaceHolder1_xddlCreditPeriod option:selected").index() > 0) {
                    if ($("#ContentPlaceHolder1_xddlCreditPeriod").val() < 0) {
                        if ($("#ContentPlaceHolder1_txtOtherCreditPeriod").val() == "") {
                            $("#ContentPlaceHolder1_txtOtherCreditPeriod").focus();
                            ShowToolTip("#ContentPlaceHolder1_txtOtherCreditPeriod", "Please Enter credit Period", "bottom");
                            return false;
                        }
                    }
                }
            }
            //else if ($("#ContentPlaceHolder1_xtxtContractDetails").val() == "") {
            //    $("#ContentPlaceHolder1_xtxtContractDetails").focus();
            //    ShowToolTip($("#ContentPlaceHolder1_xtxtContractDetails"), "Please Enter Contract Details.", "bottom");
            //    return false;
            //}
            //else if ($("#ContentPlaceHolder1_xtxtTNC").val() == "") {
            //    $("#ContentPlaceHolder1_xtxtTNC").focus();
            //    ShowToolTip($("#ContentPlaceHolder1_xtxtTNC"), "Please Enter Terms and Conditions.", "bottom");
            //    return false;
            //}
            //ShowModalMsgBox("Error", $("#ContentPlaceHolder1_xtxtStartDate").val());
            var strSuppType = $("input[name='ctl00$ContentPlaceHolder1$rdbSuppType']:checked").val();
            if (strSuppType == "ALL") {
                var select = [];
                select = GetCheckedVendor();
                if (select.length <= 0) {
                    ShowModalMsgBox("Error", "Please select atleast one supplier.");
                    //ShowModalBox("#ContentPlaceHolder1_divSupplierList");
                    ShowSuppList();
                    return false;
                }
            }
            //}
            //else
            //{
            //    if (select.length <= 0) {
            //        ShowModalMsgBox("Error", "Please select atleast two supplier.");
            //        return false;
            //    }
            //}
            if (($("#ContentPlaceHolder1_xtxtStartDate").val() == '') && ($("#ContentPlaceHolder1_xtxtEndDate").val() == '')) {
                msg = "Please select Start Date and End Date.";
                ShowModalMsgBox("Error", msg);
                ShowSuppList();
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
            ShowProgress();
            var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
            if (rfpId == 0) {
                ValidateRFP();
            }
            else {
                return true;
            }
        }

        function ValidateRFP() {
            var Name = "";
            var Qty = "";
            Name = $("#ContentPlaceHolder1_xtxtProduct").val();
            Qty = $("#ContentPlaceHolder1_xtxtQty").val();
            $.ajax({
                url: 'Create.aspx/ValidateRFP',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'Name':'" + Name + "','Qty':'" + Qty + "'}",
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData == "1") {
                            $("#ContentPlaceHolder1_xbtnSubmit").click();
                        }
                        else {
                            HideProgress();
                            ShowModalBox("#divRFPValidate");
                            //return false;
                        }
                    }
                    catch (e) { //alert(e.Message); 
                    }
                },
                error: function (data) {
                    ShowModalMsgBox("Renepay", data.Message);
                }
            });
        }

        function btnConfirm_click() {
            ShowProgress();
            HideModalBox("#divRFPValidate");
            $("#ContentPlaceHolder1_xbtnSubmit").click();
        }

        function ShowNewSupplier() {
            ShowModalBox($("#divNewSupplier"));
        }

        function CloseSupplier() {
            HideModalBox($("#divNewSupplier"));
        }

        function GetCompany(Id) {
            ShowProgress();
            $.ajax({
                type: 'POST',
                url: 'Create.aspx/GetCompany',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id':'" + Id + "'}",
                cache: false,
                success: function (msg) {
                    if (msg.d != null) {
                        $('#ContentPlaceHolder1_xtxtRegAdd').val(msg.d[1]);
                        $('#ContentPlaceHolder1_xtxtRegCountry').val(msg.d[2]);
                        $('#ContentPlaceHolder1_xtxtRegState').val(msg.d[3]);
                        $('#ContentPlaceHolder1_xtxtRegCity').val(msg.d[4]);
                        $('#ContentPlaceHolder1_xtxtRegPinCode').val(msg.d[5]);

                        $('#ContentPlaceHolder1_divCompanyList').hide();
                        $('#ContentPlaceHolder1_divRFP').show();
                        HideProgress();
                    }
                },
                error: ShowError
            });
        }
        function FillSubCat(SubCatId) {
            var catId = $("#ContentPlaceHolder1_xddlCategory").val();
            ShowProgress();
            $.ajax({
                type: 'POST',
                url: 'Create.aspx/FillSubCat',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'CatId':'" + catId + "','SubCatId':'" + SubCatId + "'}",
                cache: false,
                success: function (data) {
                    var subCatLst = data.d;
                    if (subCatLst != null) {
                        //$('#ContentPlaceHolder1_xddlSubCategory').html('');
                        $('#ContentPlaceHolder1_xddlSubCategory').empty();
                        $('#ContentPlaceHolder1_xddlSubCategory').append('<option value="0">Select</option>')
                        for (var CountCat = 0; CountCat < subCatLst.length; CountCat++) {
                            if (SubCatId == subCatLst[CountCat].Id) {
                                $("#ContentPlaceHolder1_xddlSubCategory").append("<option value='" + subCatLst[CountCat].Id
                                    + "' selected='selected'>" + subCatLst[CountCat].Name + "</option>");
                            }
                            else {
                                $('#ContentPlaceHolder1_xddlSubCategory').append("<option value='" + subCatLst[CountCat].Id
                                   + "'>" + subCatLst[CountCat].Name + "</option>");
                            }
                        }
                        bindVendorList();
                        HideProgress();
                    }
                },
                error: ShowError
            });
        }
        function bindVendorList() {
            var catId = $("#ContentPlaceHolder1_xddlCategory").val();
            //var SubcatId = 0;
            var SubcatId = $("#ContentPlaceHolder1_xddlSubCategory").val();
            ShowProgress();
            $.ajax({
                type: 'POST',
                url: 'Create.aspx/BindVendorList',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'catId': '" + catId + "','SubcatId':'" + SubcatId + "'}",
                cache: false,
                success: function (data) {
                    if (data.d != null) {
                        $('#ContentPlaceHolder1_divVendorList').html('');
                        $('#ContentPlaceHolder1_divVendorList').html(data.d);

                        var strType = $("input[name='ctl00$ContentPlaceHolder1$rdbSuppType']:checked").val();
                        if (strType == "REC") {
                            $("#ContentPlaceHolder1_divVendorList").hide();
                        }
                        else {
                            $("#ContentPlaceHolder1_divVendorList").show();
                        }
                    }
                    HideProgress();
                },

                error: ShowError
            });
        }
        function ddlCreditPeriod_change() {
            if ($("#ContentPlaceHolder1_xddlCreditPeriod").val() == "-1") {
                //$("#ContentPlaceHolder1_txtOtherCreditPeriod").val();
                //$("#ContentPlaceHolder1_txtOtherCreditPeriod").removeAttr("disabled");
                $("#ContentPlaceHolder1_txtOtherCreditPeriod").attr("style", "display:block;");
            }
            else {
                //$("#ContentPlaceHolder1_txtOtherCreditPeriod").val("");
                //$("#ContentPlaceHolder1_txtOtherCreditPeriod").attr("disabled", "disabled");
                $("#ContentPlaceHolder1_txtOtherCreditPeriod").attr("style", "display:none;");
            }
        }

        function ddlContractPeriod_change() {
            $("#ContentPlaceHolder1_xtxtOthContract").attr("disabled", "disabled");
            if ($("#ContentPlaceHolder1_xddlContractPeriod").val() == "-1") {
                $("#ContentPlaceHolder1_xtxtOthContract").val();
                $("#ContentPlaceHolder1_xtxtOthContract").removeAttr("disabled");
            }
        }

        function rdbType_change() {
            var strType = $("input[name='ctl00$ContentPlaceHolder1$rdbType']:checked").val();
            if (strType == "R") {
                $("#ContentPlaceHolder1_divRecurrDet").show();
            }
            else {
                $("#ContentPlaceHolder1_divRecurrDet").hide();
            }
        }

        function rdbSupplierType_change() {
            var strType = $("input[name='ctl00$ContentPlaceHolder1$rdbSuppType']:checked").val();
            if (strType == "REC") {
                $("#ContentPlaceHolder1_divVendorList").hide();
            }
            else {
                $("#ContentPlaceHolder1_divVendorList").show();
                //ShowModalBox("#ContentPlaceHolder1_divSupplierList");
                //SetDataTablePaging("#tblSupplierList");

            }
        }

        function HideSuppList() {
            HideModalBox("#ContentPlaceHolder1_divSupplierList");
        }

        function ShowSuppList() {
            $("#ContentPlaceHolder1_divVendorList").show();
        }

        function IsModule() {
            var Type = 0;
            switch ($("#ContentPlaceHolder1_xddlRecurrType").val()) {
                case "Y":
                    Type = 12;
                    break;
                case "H":
                    Type = 6;
                    break;
                case "Q":
                    Type = 3;
                    break;
                case "M":
                    Type = 1;
                    break;
            }
            var period = $("#ContentPlaceHolder1_xtxtRecurrPeriod").val();
            period = period / Type;
            if (period % 1 == 0) {
                //alert('OK');
            }
            else {
                //alert('Enter No of  in Multiple of Seleted Months');
                $("#ContentPlaceHolder1_xtxtRecurrPeriod").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtRecurrPeriod"), "Please enter No of Months in Multiple of Seleted Recurring period.", "bottom");
            }
            bool = false;
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

    <style>
        .ui-widget-content {
            z-index: 200 !important;
        }

        .ui-timepicker {
            z-index: 200 !important;
        }
    </style>

    <asp:UpdatePanel ID="xupnlRFPDefine" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="divCompanyList" runat="server" style="display: none">
                <div class="topBlk">
                    <div class="mainHead fl">
                        <h2>Please select buyer to create RFP</h2>
                    </div>
                    <ul class="rightBtn">
                        <asp:LinkButton ID="xlnkbtnClose" runat="server" class="btnBlk"
                            OnClick="xlnkbtnClose_Click">Close</asp:LinkButton>
                    </ul>
                    <br class="cl" />
                </div>
                <asp:Literal ID="xlitList" runat="server"></asp:Literal>
            </div>
            <div id="divRFP" runat="server">
                <div class="clmn1 fl">
                    <div class="row1">
                        <div class="whiteBox brdPink">
                            <div class="buyRegis">
                                <div class="formRow">
                                    <label></label>
                                    <div class="formRow1 rdpType">
                                        <asp:RadioButtonList ID="rdbType" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" CellPadding="20" CellSpacing="20" Width="100%" onchange="return rdbType_change()">
                                            <asp:ListItem Text="One Time" Value="O" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Recurring" Value="R"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <br class="cl" />
                                <div class="formRow" style="display: none;">
                                    <label>Name your RFP</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtName" MaxLength="50" runat="server" CssClass="imw100p" onkeypress="return RestrictText(event);" ondrop="return false;" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Product Name</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtProduct" runat="server" autocomplete="off" CssClass="imw100p" onkeypress="return RestrictText(event);" MaxLength="30"></asp:TextBox>
                                    </div>
                                </div>
                                <ctrl:VendorDetails ID='xctrlVendorDet' runat='server' Caption='View' />
                                <div class="formRow">
                                    <label>Category</label>
                                    <div class="formRow1">
                                        <div class="imw100p fl bgGrey">
                                            <div class="styled-select selOrganization imw90p">
                                                <asp:DropDownList ID="xddlCategory" runat="server">
                                                    <asp:ListItem Text="All" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Sub Category</label>
                                    <div class="formRow1">
                                        <div class="imw100p fl bgGrey">
                                            <div class="styled-select selOrganization imw90p">
                                                <select id="xddlSubCategory" runat="server" onchange="javasctript : bindVendorList();">
                                                    <option value="0">Select</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Description</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtDescription" MaxLength="400" runat="server" TextMode="MultiLine"
                                            placeholder="Add details such as brand, specifications, special delivery needs or credit requirements."
                                            autocomplete="off" CssClass="imw100p" onkeypress="return RestrictText(event);"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Attachments</label>
                                    <div class="formRow1">
                                        <ctrl:UploadFile ID="xctrlProdctDoc1" runat="server" UserType="CMP" UploadDocType="RFPProductDoc"
                                            UploadFileType="Doc" Caption="Upload File 1" />
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label></label>
                                    <div class="formRow1">
                                        <ctrl:UploadFile ID="xctrlProdctDoc2" runat="server" UserType="CMP" UploadDocType="RFPProductDoc"
                                            UploadFileType="Doc" Caption="Upload File 2" />
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label></label>
                                    <div class="formRow1">
                                        <ctrl:UploadFile ID="xctrlProdctDoc3" runat="server" UserType="CMP" UploadDocType="RFPProductDoc"
                                            UploadFileType="Doc" Caption="Upload File 3" />
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Quantity</label>
                                    <div class="formRow1">
                                        <div class="imw32p fl immr10">
                                            <asp:TextBox ID="xtxtQty" CssClass="imw100p" placeholder="Qty" autocomplete="off" runat="server" onkeydown="IsNumeric(event);" MaxLength="9"></asp:TextBox>
                                        </div>
                                        <div class="imw32p fl bgGrey">
                                            <div class="styled-select selOrganization imw100p">
                                                <asp:DropDownList ID="xddlUnit" runat="server">
                                                    <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Unit" Value="Unit" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Litre" Value="Litre"></asp:ListItem>
                                                    <asp:ListItem Text="Kg" Value="Kg"></asp:ListItem>

                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Expected Delivery</label>
                                    <div class="formRow1">
                                        <div class="imw32p fl immr10">
                                            <asp:TextBox ID="xtxtNoDays" placeholder="in Days" runat="server" MaxLength="4"
                                                autocomplete="off" CssClass="imw100p" onkeydown="IsNumeric(event);"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div id="divRecurrDet" runat="server" style="display: none;">
                                    <div class="formRow">
                                        <label>Raise a draft PO</label>

                                        <div class="formRow1">
                                            <label class="txtLeft">Every</label>
                                            <div class="imw20p fl">
                                                <div class="bgGrey immr10">
                                                    <div class="styled-select selOrganization imw100p">
                                                        <asp:DropDownList ID="xddlRecurrType" runat="server" Style="width: 130%;">
                                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="Month" Value="M"></asp:ListItem>
                                                            <asp:ListItem Text="3 months" Value="Q"></asp:ListItem>
                                                            <asp:ListItem Text="6 months" Value="H"></asp:ListItem>
                                                            <asp:ListItem Text="12 months" Value="Y"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <label class="txtLeft">for a period of </label>
                                            <div class="imw20p fl immr10">
                                                <asp:TextBox ID="xtxtRecurrPeriod" placeholder="Period" runat="server"
                                                    MaxLength="2" autocomplete="off" CssClass="imw100p" onkeyup="IsModule();" onkeydown="IsNumeric(event);"></asp:TextBox>
                                            </div>
                                            <label class="txtLeft">months</label>
                                        </div>
                                    </div>
                                </div>
                                <asp:UpdatePanel ID="xupdnlShippingDet" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="formRow">
                                            <label>Shipping address</label>
                                            <div class="formRow1">
                                                <div class="addCheckbx">
                                                    <asp:CheckBox ID="xchkRegisteredAddr" runat="server" OnCheckedChanged="xchkRegisteredAddr_CheckedChanged" AutoPostBack="true" />
                                                    <label for="option">Registered address</label>
                                                </div>
                                                <div id="divRegAddr" class="selAddress" runat="server" visible="false">
                                                    <div class="imw100p fl">
                                                        <label>Address</label>
                                                        <asp:TextBox ID="xtxtRegAdd" runat="server" TextMode="MultiLine" CssClass="imw100p" ReadOnly="true"></asp:TextBox>
                                                    </div>
                                                    <div class="imw100p fl">
                                                        <div class="imw48p fl">
                                                            <label>Country</label>
                                                            <asp:TextBox ID="xtxtRegCountry" runat="server" CssClass="imw100p" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                        <div class="imw48p fr">
                                                            <label>State</label>
                                                            <asp:TextBox ID="xtxtRegState" runat="server" CssClass="imw100p" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="imw100p fl">
                                                        <div class="imw48p fl">
                                                            <label>City</label>
                                                            <asp:TextBox ID="xtxtRegCity" runat="server" CssClass="imw100p" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                        <div class="imw48p fr">
                                                            <label>Pin Code</label>
                                                            <asp:TextBox ID="xtxtRegPinCode" runat="server" CssClass="imw100p" ReadOnly="true" MaxLength="6" onkeydown="IsNumeric(event);"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--<br class="cl" />--%>
                                                <div class="addCheckbx">
                                                    <asp:CheckBox ID="xchckAddr1" runat="server" OnCheckedChanged="xchckAddr1_Checked" AutoPostBack="true" />
                                                    <label for="option" id="lblAddr1" runat="server">Add a new address 1</label>
                                                </div>
                                                <div id="divAddr1" runat="server" class="selAddress" visible="false">
                                                    <div class="imw100p fl">
                                                        <label>Address</label>
                                                        <asp:TextBox ID="xtxtAdd1" runat="server" TextMode="MultiLine" onkeypress="return RestrictText(event);" CssClass="imw100p"></asp:TextBox>
                                                    </div>
                                                    <div class="imw100p fl">
                                                        <div class="imw48p fl">
                                                            <label>Country</label>
                                                            <div class="imw100p fl bgGrey">
                                                                <div class="styled-select ">
                                                                    <asp:DropDownList ID="xddlCountryAddr1" runat="server" OnSelectedIndexChanged="xddlCountryAddr1_OnSelectedIndexChanged" AutoPostBack="true">
                                                                        <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="imw48p fr">
                                                            <label>State</label>
                                                            <div class="imw100p fl bgGrey">
                                                                <div class="styled-select">
                                                                    <asp:DropDownList ID="xddlStateAddr1" runat="server" OnSelectedIndexChanged="xddlStateAddr1_OnSelectedIndexChanged" AutoPostBack="true">
                                                                        <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br class="cl" />
                                                    </div>
                                                    <div class="imw100p fl">
                                                        <div class="imw48p fl">
                                                            <label>City</label>
                                                            <div class="imw100p fl bgGrey">
                                                                <div class="styled-select imw30p fl">
                                                                    <asp:DropDownList ID="xddlCityAddr1" runat="server">
                                                                        <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="imw48p fr">
                                                            <label>Pin Code</label>
                                                            <asp:TextBox ID="xtxtPincodeAddr1" runat="server" CssClass="imw97p" MaxLength="6" onkeydown="IsNumeric(event);"></asp:TextBox>
                                                        </div>
                                                        <br class="cl" />
                                                    </div>
                                                    <br class="cl" />
                                                </div>
                                                <div class="immrt20" style="display: none;">
                                                    <div class="termCheckbx">
                                                        <asp:CheckBox ID="xchckAddr2" runat="server" OnCheckedChanged="xchckAddr2_Checked" AutoPostBack="true" />
                                                        <label for="option" id="lblAddr2" runat="server">Add a new address 2</label>
                                                    </div>
                                                    <br class="cl" />
                                                    <div id="divAddr2" runat="server" visible="false">
                                                        <div class="numberOffice immrt10">
                                                            <label>Address</label>
                                                            <asp:TextBox ID="xtxtAdd2" runat="server" TextMode="MultiLine" onkeypress="return RestrictText(event);" CssClass="imw97p"></asp:TextBox>
                                                        </div>
                                                        <div class="numberOffice immrt10">
                                                            <div class="imw48p fl">
                                                                <label>Country</label>
                                                                <div class="styled-select ">
                                                                    <asp:DropDownList ID="xddlCountryAddr2" runat="server" OnSelectedIndexChanged="xddlCountryAddr2_OnSelectedIndexChanged" AutoPostBack="true">
                                                                        <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="imw48p fr">
                                                                <label>State</label>
                                                                <div class="styled-select">
                                                                    <asp:DropDownList ID="xddlStateAddr2" runat="server" OnSelectedIndexChanged="xddlStateAddr2_OnSelectedIndexChanged" AutoPostBack="true">
                                                                        <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <br class="cl" />
                                                        </div>
                                                        <div class="numberOffice immrt10">
                                                            <div class="imw48p fl">
                                                                <label>City</label>
                                                                <div class="styled-select imw30p fl">
                                                                    <asp:DropDownList ID="xddlCityAddr2" runat="server">
                                                                        <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="imw48p fr">
                                                                <label>Pin Code</label>
                                                                <asp:TextBox ID="xtxtPincodeAddr2" runat="server" CssClass="imw97p" MaxLength="6" onkeydown="IsNumeric(event);"></asp:TextBox>
                                                            </div>
                                                            <br class="cl" />
                                                        </div>
                                                        <br class="cl" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="divCreditPriodDet" runat="server" class="formRow" visible="false">
                                            <label>Credit Period</label>
                                            <div class="formRow1">
                                                <div class="bgGrey imw48p fl">
                                                    <div class="styled-select imw100p">
                                                        <asp:DropDownList ID="xddlCreditPeriod" runat="server" onchange="ddlCreditPeriod_change();">
                                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="15 Days" Value="15"></asp:ListItem>
                                                            <asp:ListItem Text="30 Days" Value="30"></asp:ListItem>
                                                            <asp:ListItem Text="45 Days" Value="45"></asp:ListItem>
                                                            <asp:ListItem Text="--Other--" Value="-1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="imw48p fr">
                                                    <asp:TextBox ID="txtOtherCreditPeriod" placeholder="If other please specify(days)" runat="server"
                                                        Style="display: none;" MaxLength="3" onkeydown="IsNumeric(event);" CssClass="imw97p"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="formRow">
                                    <label>Suppliers</label>
                                    <div class="formRow1 rdpType immrt10">
                                        <asp:RadioButtonList ID="rdbSuppType" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" CellPadding="20" CellSpacing="20" Width="100%" onchange="return rdbSupplierType_change()">
                                            <asp:ListItem Text="Select on your own from list" Value="ALL"></asp:ListItem>
                                            <asp:ListItem Text="Ask Renepay team to select" Value="REC" Selected="True"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div id="divVendorList" runat="server" style="display: none;"></div>
                                </div>
                                <asp:UpdatePanel ID="xupnlRFPDeadline" runat="server">
                                    <ContentTemplate>
                                        <div class="formRow">
                                            <label>
                                                <span class="fl">RFP Deadline</span>
                                                <div class="toolTip">
                                                    <a href="#" onclick="javascript:return false;">?
			                                          <div class="toolTipCont" style="width: 345px;">
                                                          All RFPs start at 9am and close at 630pm.
                                                           They start immediately if today’s date is chosen.
                                                      </div>
                                                    </a>
                                                </div>
                                            </label>
                                            <div class="formRow1">
                                                <div class="imw48p fl">
                                                    <div class="iconCal">
                                                        <i class="fa fa-calendar" aria-hidden="true" onclick="opencalender();"></i>
                                                        <asp:TextBox placeholder="Start Date" ID="xtxtStartDate" CssClass="icnCal imw100p immrb20" runat="server" autocomplete="off"></asp:TextBox>
                                                    </div>
                                                    <div class="iconTime" style="display: none;">
                                                        <i class="fa fa-clock-o" aria-hidden="true"></i>
                                                        <asp:TextBox ID="xtxtStartTime" placeholder="Start Time" CssClass="icnTime imw100p"
                                                            runat="server" autocomplete="off"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="imw48p fr">
                                                    <div class="iconCal">
                                                        <i class="fa fa-calendar" aria-hidden="true" onclick="opencalender1();"></i>
                                                        <asp:TextBox ID="xtxtEndDate" placeholder="End Date" CssClass="icnCal imw100p immrb20" runat="server" autocomplete="off"></asp:TextBox>
                                                    </div>
                                                    <div class="iconTime" style="display: none;">
                                                        <i class="fa fa-clock-o" aria-hidden="true"></i>
                                                        <asp:TextBox ID="xtxtEndTime" placeholder="End Time" CssClass="icnTime imw100p"
                                                            runat="server" autocomplete="off"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <script>
                                                    BindClockPicker();
                                                </script>
                                                <br class="cl" />
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="formRow">
                                    <label></label>
                                    <div class="formRow1">
                                        <button id="xlnkbtnCreate" runat="server" class="btnRed immrt10" type="button"
                                            onclick="javascript:if(!lnkbtnRegister_Click() ){ return false; }"
                                            onserverclick="xlnkbtnCreate_Click">
                                            CREATE</button>
                                    </div>
                                </div>

                            </div>
                            <br class="cl" />
                        </div>
                        <br class="cl" />
                    </div>
                </div>
                <asp:Button ID="xbtnSubmit" OnClick="xlnkbtnCreate_Click" runat="server" Style="display: none;" />
            </div>
            <div class="modal fade" id="divRFPValidate" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="Button1" runat="server" class="close"
                                data-dismiss="modal">
                                &times;</button>
                            <h4 class="modal-title" id="H2">RFP Confirmation</h4>
                        </div>
                        <div class="modal-body">
                            <p>RFP name already exist,So do you want to create another RFP.</p>
                        </div>
                        <div class="modal-footer">
                            <a class="btnRed" href="#" id="btnConfirm" runat="server" onclick="btnConfirm_click()">CONTINUE</a>
                        </div>
                    </div>
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
                            <h4 class="modal-title" id="H1">RFP Details</h4>
                        </div>
                        <div class="modal-body">
                            <p id="pRegMsg" runat="server">
                            </p>
                        </div>
                        <div class="modal-footer" style="display: none;">
                        </div>
                    </div>
                </div>
            </div>
            <div id="divSupplierList" runat="server" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="Button4" class="close"
                                data-dismiss="modal">
                                &times;</button>
                            <h4 class="modal-title" id="H5">Supplier List</h4>
                        </div>
                        <div class="modal-body" id="divSuppliers" runat="server">
                            <asp:Literal ID="xlitSupplierList" runat="server"></asp:Literal>
                        </div>
                        <div class="modal-footer">
                            <a class="btnRed" href="#" id="A1" data-dismiss="modal">submit</a>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="xhdnRFPId" runat="server" />
            <asp:HiddenField ID="xhdnPayType" runat="server" />
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Literal ID="xlitCat" runat="server"></asp:Literal>
</asp:Content>



