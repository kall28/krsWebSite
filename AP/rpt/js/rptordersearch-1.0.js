/*
 *  Document   : ecomProducts.js
 *  Author     : krs
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsRPTOrderSearchInitiated = false;
var RPTOrderSearch = function () {
    var PageUrl = "RptOrderSearch.aspx";
    return {
        init: function () {
            //CommonHelper.switchPanelView('#divDataList', '#divDataListMain', '');
            if (!IsRPTOrderSearchInitiated) {
                $("#btnSearch").click(function () { RPTOrderSearch.search(); });
                $("#btnBack").click(function () { RPTOrderSearch.back(); });
                $("#btnBackToListL2").click(function () { RPTOrderSearch.backToListL2(); });
                $("#btnBackToListL3").click(function () { RPTOrderSearch.backToListL3(); });
                $("#btnBackToListL4").click(function () { RPTOrderSearch.backToListL4(); });
                $("#btnBackToListL5").click(function () { RPTOrderSearch.backToListL5(); });
                $("#btnBackToListL6").click(function () { RPTOrderSearch.backToListL6(); });

                IsRPTOrderSearchInitiated = true;
            }
            //RPTOrderSearch.search();
        },
        validateSearch: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtFromDate"), "From Date", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtToDate"), "To Date", "bottom")) { return false; }
            return true;
        },
        search: function () {
            if (RPTOrderSearch.validateSearch()) {
                var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl,
                    "{ 'refParam' : '" + $("#ddlDateParam").val()
                    + "', 'fromDate' : '" + $("#txtFromDate").val()
                    + "', 'toDate' : '" + $("#txtToDate").val()
                    + "', 'paymentMode' : '" + $("#ddlPaymentModeSearch").val()
                    + "', 'orderNo' : '" + $("#txtOrderNoSearch").val()
                    + "', 'payTransId' : '" + $("#txtPayTransIdSearch").val()
                    + "', 'email' : '" + $("#txtEmailSearch").val()
                    + "', 'mobileNo' : '" + $("#txtMobileNoSearch").val()
                    + "', 'payStatus' : '" + $("#ddlPaymentStatusSearch").val()
                    + "', 'deliveryStatus' : '" + $("#ddlDelStatusSearch").val()
                    + "', 'status' : '" + $("#ddlStatusSearch").val()
                    + "' }");
                FormRequestHelper.searchData(payload, RPTOrderSearch.searchCallback);
            }
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));
        },
        resendMail: function (refNo) {
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/resendMail";
            payload.data = "{ 'refNo' : '" + refNo + "' }";
            FormRequestHelper.saveData(payload, RPTOrderSearch.resendMailCallback);
        },
        resendMailCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.showModalMsgBox("Sucess", msg);
            }
            else {
                CommonHelper.showModalMsgBox("Fail", msg);
            }
        },
        checkAndProcess: function (refNo) {
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/CheckAndProcess";
            payload.data = "{ 'refNo' : '" + refNo + "' }";
            FormRequestHelper.saveData(payload, RPTOrderSearch.checkAndProcessCallback);
        },
        checkAndProcessCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.showModalMsgBox("Sucess", msg);
                RPTOrderSearch.search();
            }
            else {
                CommonHelper.showModalMsgBox("Fail", msg);
            }
        },
        exportToExcel: function () {
            CommonHelper.showProgress();
            RequestHelper.post({
                url: PageUrl + '/ExportExcelReport',
                data: "{'selItem': ''}"

            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    CommonHelper.hideProgress();
                    window.open(WebNavHelper.getBaseUrl() + "Handlers/ProcessFile.ashx?ref="
                        + result.DataObject);

                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Export Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Export Error", error.message, null);
            });
        },
        searchL2: function (id, title) {
            $("#lblTitlePL2").html(title);
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL2";
            payload.data = "{ 'Id' : " + id + " }";
            payload.ctrlList = "divListL2";
            FormRequestHelper.searchData(payload, RPTOrderSearch.searchCallbackL2); 
        },
        searchCallbackL2: function () {
            //CommonDatatableHelper.initDefault($("#tblListL2"));
            CommonHelper.switchPanelView('#divDataList', '#divDataListL2', '');
        },
        searchL3: function (id, title) {
            $("#lblTitlePL3").html(title);
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL3";
            payload.data = "{ 'Id' : " + id + " }";
            payload.ctrlList = "divListL3";
            FormRequestHelper.searchData(payload, RPTOrderSearch.searchCallbackL3); 
        },
        searchCallbackL3: function () {
            //CommonDatatableHelper.initDefault($("#tblListL3"));
            CommonHelper.switchPanelView('#divDataListL2', '#divDataListL3', '');
        },
        searchL4: function (id, title) {
            $("#lblTitlePL4").html(title);
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL4";
            payload.data = "{ 'Id' : " + id + " }";
            payload.ctrlList = "divListL4";
            FormRequestHelper.searchData(payload, RPTOrderSearch.searchCallbackL4);
        },
        searchCallbackL4: function () {
            //CommonDatatableHelper.initDefault($("#tblListL3"));
            CommonHelper.switchPanelView('#divDataList', '#divDataListL4', '');
        },
        searchL5: function (id, title) {
            $("#lblTitlePL5").html(title);
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL5";
            payload.data = "{ 'Id' : " + id + " }";
            payload.ctrlList = "divListL5";
            FormRequestHelper.searchData(payload, RPTOrderSearch.searchCallbackL5);
        },
        searchCallbackL5: function () {
            //CommonDatatableHelper.initDefault($("#tblListL3"));
            CommonHelper.switchPanelView('#divDataList', '#divDataListL5', '');
        },
        searchL6: function (id, title) {
            $("#lblTitlePL6").html(title);
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL6";
            payload.data = "{ 'Id' : " + id + " }";
            payload.ctrlList = "divListL6";
            FormRequestHelper.searchData(payload, RPTOrderSearch.searchCallbackL6);
        },
        searchCallbackL6: function () {
            //CommonDatatableHelper.initDefault($("#tblListL3"));
            CommonHelper.switchPanelView('#divDataList', '#divDataListL6', '');
        },
        backToListL2: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataList', '');
        },
        backToListL3: function () {
            CommonHelper.switchPanelView('#divDataListL3', '#divDataListL2', '');
        },
        backToListL4: function () {
            CommonHelper.switchPanelView('#divDataListL4', '#divDataList', '');
        },
        backToListL5: function () {
            CommonHelper.switchPanelView('#divDataListL5', '#divDataList', '');
        },
        backToListL6: function () {
            CommonHelper.switchPanelView('#divDataListL6', '#divDataList', '');
        }
    };
}();       