/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsAdmAppRolesInitiated = false;
var AdmAppRoles = function () {
    var PageUrl = "AppRoles.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            AdmAppRoles.search();
            if (!IsAdmAppRolesInitiated) {
                $("#btnAdd").click(function () { AdmAppRoles.add(); });
                $("#btnSubmit").click(function () { AdmAppRoles.save(); });
                $("#btnBack").click(function () { AdmAppRoles.back(); });
                $("#btnBackTop").click(function () { AdmAppRoles.back(); });
                IsAdmAppRolesInitiated = true;
            }
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#txtTitle").val('');
            $("#txtCode").val('');
            $("#txtDescription").val('');
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, AdmAppRoles.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));   
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#txtTitle").val(data.Title);
            $("#txtCode").val(data.Code);
            $("#txtDescription").val(data.Description);
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            AdmAppRoles.clear();
            FormRequestHelper.addData(payload, AdmAppRoles.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", AdmAppRoles.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, AdmAppRoles.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitle"), "Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtCode"), "Code", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (AdmAppRoles.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/Save";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'title' : '" + $("#txtTitle").val()
                    + "', 'code' : '" + $("#txtCode").val()
                    + "', 'description' : '" + $("#txtDescription").val()
                    + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, AdmAppRoles.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), AdmAppRoles.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                AdmAppRoles.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), AdmAppRoles.save);
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }            
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();

