/*
 *  Document   : ecomProducts.js
 *  Author     : krs
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsRPTPaySearchInitiated = false;
var RPTPaySearch = function () {
    var PageUrl = "RptPayTransSearch.aspx";
    return {
        init: function () {
            //CommonHelper.switchPanelView('#divDataList', '#divDataListMain', '');
            if (!IsRPTPaySearchInitiated) {
                $("#btnSearch").click(function () { RPTPaySearch.search(); });
                $("#btnSubmit").click(function () { RPTPaySearch.save(); });
                $("#btnBack").click(function () { RPTPaySearch.back(); });
                $("#btnBackToListL2").click(function () { RPTPaySearch.backToListL2(); });
                $("#btnBackToListL3").click(function () { RPTPaySearch.backToListL3(); });
                IsRPTPaySearchInitiated = true;
            }
            //RPTPaySearch.search();
        },
        validateSearch: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtFromDate"), "From Date", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtToDate"), "To Date", "bottom")) { return false; }
            return true;
        },
        search: function () {
            if (RPTPaySearch.validateSearch()) {
                var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl,
                    "{ 'fromDate' : '" + $("#txtFromDate").val()
                    + "', 'toDate' : '" + $("#txtToDate").val()
                    + "', 'sourceCode' : '" + $("#ddlAppSourceSearch").val()
                    + "', 'payTransId' : '" + $("#txtPayTransIdSearch").val()
                    + "', 'paymentMode' : '" + $("#ddlPaymentModeSearch").val()
                    + "', 'orderId' : '" + $("#txtOrderIdSearch").val()
                    + "', 'orderNo' : '" + $("#txtOrderNoSearch").val()
                    + "', 'noOfRecords' : '" + $("#ddlNoOfRecordsSearch").val()
                    + "', 'payStatus' : '" + $("#ddlPaymentStatusSearch").val()
                    + "', 'serviceCode' : '" + $("#ddlServiceCodeSearch").val()
                    + "' }");
                FormRequestHelper.searchData(payload, RPTPaySearch.searchCallback);
            }
        },
        searchCallback: function () {
            CommonDatatableHelper.initDefaultExport($("#tblList"));
        },
        resendMail: function (refNo) {
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/resendMail";
            payload.data = "{ 'refNo' : '" + refNo + "' }";
            FormRequestHelper.saveData(payload, RPTPaySearch.resendMailCallback);
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
        searchL2: function (id, title) {
            $("#lblTitlePL2").html(title);
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL2";
            payload.data = "{ 'Id' : " + id + " }";
            payload.ctrlList = "divListL2";
            FormRequestHelper.searchData(payload, RPTPaySearch.searchCallbackL2); 
        },
        searchCallbackL2: function () {
            //CommonDatatableHelper.initDefault($("#tblListL2"));
            CommonHelper.switchPanelView('#divDataList', '#divDataListL2', '');
        },
        searchL3: function (id) {
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL3";
            payload.data = "{ 'Id' : " + id + " }";
            payload.ctrlList = "divListL3";
            FormRequestHelper.searchData(payload, RPTPaySearch.searchCallbackL3); 
        },
        searchCallbackL3: function () {
            //CommonDatatableHelper.initDefault($("#tblListL3"));
            CommonHelper.switchPanelView('#divDataList', '#divDataListL3', '');
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", RPTPaySearch.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, RPTPaySearch.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#lblPayTransId").html(data.Id);
            $("#lblOrderId").html(data.OrderId);
            $("#txtRemark").val(data.Remark);
            $("#chkProcessRefund").prop('checked', true);
            $("#chkSendInstructionToCustomer").prop('checked', true);            
            $("#headerEdit").html("Process Refund");
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtRemark"), "Remark", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (RPTPaySearch.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/processRefund";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'remark' : '" + $("#txtRemark").val()
                    + "', 'processRefund' : '" + ($('#chkProcessRefund').is(":checked") ? 1 : 0)
                    + "', 'sendInstruction' : '" + ($('#chkSendInstructionToCustomer').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, RPTPaySearch.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), RPTPaySearch.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                RPTPaySearch.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), RPTPaySearch.save);
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }
        },
        backToListL2: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataList', '');
        },
        backToListL3: function () {
            CommonHelper.switchPanelView('#divDataListL3', '#divDataList', '');
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();       