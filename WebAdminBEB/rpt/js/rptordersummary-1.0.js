/*
 *  Document   : ecomProducts.js
 *  Author     : krs
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsRPTOrderSummaryInitiated = false;
var RPTOrderSummary = function () {
    var PageUrl = "RptOrderSummary.aspx";
    return {
        init: function () {
            //CommonHelper.switchPanelView('#divDataList', '#divDataListMain', '');
            if (!IsRPTOrderSummaryInitiated) {
                $("#btnSearch").click(function () { RPTOrderSummary.search(); });
                RptRequestHelper.fillCinemas($("#ddlCinemaSearch"), 0);
                IsRPTOrderSummaryInitiated = true;
            }
            //RPTOrderSummary.search();
        },
        validateSearch: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtFromDate"), "From Date", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtToDate"), "To Date", "bottom")) { return false; }
            return true;
        },
        search: function () {
            if (RPTOrderSummary.validateSearch()) {
                var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl,
                    "{ 'refParam' : '" + $("#ddlDateParam").val()
                    + "', 'fromDate' : '" + $("#txtFromDate").val()
                    + "', 'toDate' : '" + $("#txtToDate").val()
                    + "', 'sourceCode' : '" + $("#ddlAppSourceSearch").val()
                    + "', 'paymentMode' : '" + $("#ddlPaymentModeSearch").val()
                    + "', 'productTypeCode' : '" + $("#ddlProductTypeSearch").val()
                    + "', 'payStatus' : '" + $("#ddlPaymentStatusSearch").val()
                    + "', 'deliveryStatus' : '" + $("#ddlDeliveryStatusSearch").val()
                    + "', 'status' : '" + $("#ddlStatusSearch").val()
                    + "' }");
                FormRequestHelper.searchData(payload, RPTOrderSummary.searchCallback);
            }
        },
        searchCallback: function () {
            CommonDatatableHelper.initDefaultExport($("#tblList"));
        }
    };
}();       