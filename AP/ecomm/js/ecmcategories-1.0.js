/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsEcmCategoriesInitiated = false;

var EcmCategories = function () {
    var PageUrl = "Categories.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            if (!IsEcmCategoriesInitiated) {
                $("#btnAdd").click(function () { EcmCategories.add(); });
                $("#btnSubmit").click(function () { EcmCategories.save(); });
                $("#btnBack").click(function () { EcmCategories.back(); });
                $("#btnBackTop").click(function () { EcmCategories.back(); });
                IsEcmCategoriesInitiated = true;
            }
            EcmCategories.search();            
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#txtTitle").val('');
            $("#txtDescription").val('');
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, EcmCategories.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#txtTitle").val(data.Title);
            $("#txtDescription").val(data.Description);
            EcmRequestHelper.fillCategories($("#ddlParentEdit"), data.ParentId.Id);
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            EcmCategories.clear();
            FormRequestHelper.addData(payload, EcmCategories.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            EcmRequestHelper.fillCategories($("#ddlParentEdit"), 0);
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", EcmCategories.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, EcmCategories.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitle"), "Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtDescription"), "Description", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (EcmCategories.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/Save";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'title' : '" + $("#txtTitle").val()
                    + "', 'description' : '" + $("#txtDescription").val()
                    + "', 'parentId' : '" + $("#ddlParentEdit").val()
                    + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, EcmCategories.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                EcmCategories.search();
            }
            else {
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }
            CommonHelper.enableControl($("#btnSubmit"), EcmCategories.save);
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();