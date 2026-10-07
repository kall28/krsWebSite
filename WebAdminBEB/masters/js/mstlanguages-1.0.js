/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */

var MstLanguages = function () {
    var PageUrl = "Languages.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            MstLanguages.search();

            $("#btnAdd").click(function () { MstLanguages.add(); });
            $("#btnSubmit").click(function () { MstLanguages.save(); });
            $("#btnBack").click(function () { MstLanguages.back(); });
            $("#btnBackTop").click(function () { MstLanguages.back(); });
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#txtTitle").val('');
            $("#txtCode").val('');
            $("#txtISOCode").val('');
            $("#txtDescription").val('');
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, MstLanguages.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));   
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#txtTitle").val(data.Title);
            $("#txtCode").val(data.Code);
            $("#txtISOCode").val(data.ISOCode);
            $("#txtDescription").val(data.Description);
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            MstLanguages.clear();
            FormRequestHelper.addData(payload, MstLanguages.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", MstLanguages.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, MstLanguages.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitle"), "Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtISOCode"), "ISO Code", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtCode"), "Code", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (MstLanguages.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/Save";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'title' : '" + $("#txtTitle").val()
                    + "', 'code' : '" + $("#txtCode").val()
                    + "', 'ISOCode' : '" + $("#txtISOCode").val()
                    + "', 'description' : '" + $("#txtDescription").val()
                    + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, MstLanguages.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), MstLanguages.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                MstLanguages.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), MstLanguages.save);
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }            
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();

