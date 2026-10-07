/*
 *  Document   : ecomProducts.js
 *  Author     : krs
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsRPTUserSearchInitiated = false;
var RPTUserSearch = function () {
    var PageUrl = "RptUserSearch.aspx";
    return {
        init: function () {
            //CommonHelper.switchPanelView('#divDataList', '#divDataListMain', '');
            if (!IsRPTUserSearchInitiated) {
                $("#btnSearch").click(function () { RPTUserSearch.search(); });               
                IsRPTUserSearchInitiated = true;
            }
            //RPTUserSearch.search();
        },
        validateSearch: function () {
            if ($("#chkregDates").prop("checked")) {
                if (!FormCtrlValidationHelper.validateTextCtrl($("#txtFromDate"), "From Date", "bottom")) { return false; }
                if (!FormCtrlValidationHelper.validateTextCtrl($("#txtToDate"), "To Date", "bottom")) { return false; }
            }
            else
            {
                if (CommonHelper.trim($("#txtNameSearch").val()) === ""
                    && CommonHelper.trim($("#txtEmailSearch").val()) === ""
                    && CommonHelper.trim($("#txtMobileNoSearch").val()) === "") {
                    CommonHelper.showModalMsgBox("Error", "Please enter at least one criteria value.");
                    return false;
                }
                else {
                    if (CommonHelper.trim($("#txtEmailSearch").val()) !== "") {
                        if (!FormCtrlValidationHelper.validateEmailTextCtrl($("#txtEmailSearch"), "Email", "bottom")) { return false; }
                    }

                    if (CommonHelper.trim($("#txtMobileNoSearch").val()) !== "") {
                        if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtMobileNoSearch"), "Mobile No", "bottom")) { return false; }
                    }
                }
            }
            return true;
        },
        search: function () {
            if (RPTUserSearch.validateSearch()) {
                var fromDt = "";
                var toDt = "";

                if ($("#chkregDates").prop("checked")) {
                    fromDt = $("#txtFromDate").val();
                    toDt = $("#txtToDate").val();
                }

                var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl,
                    "{ 'fromDate' : '" + fromDt
                    + "', 'toDate' : '" + toDt
                    + "', 'name' : '" + $("#txtNameSearch").val()
                    + "', 'email' : '" + $("#txtEmailSearch").val()
                    + "', 'mobileNo' : '" + $("#txtMobileNoSearch").val()
                    + "' }");
                FormRequestHelper.searchData(payload, RPTUserSearch.searchCallback);
            }
        },
        searchCallback: function () {
            CommonDatatableHelper.initDefaultExport($("#tblList"));
        }
    };
}();       