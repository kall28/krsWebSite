/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsComTemplatesInitiated = false;

var ComTemplates = function () {
    var PageUrl = "Templates.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');            
            if (!IsComTemplatesInitiated) {
                $("#btnAdd").click(function () { ComTemplates.add(); });
                $("#btnSubmit").click(function () { ComTemplates.save(); });
                $("#btnBack").click(function () { ComTemplates.back(); });
                $("#btnBackTop").click(function () { ComTemplates.back(); });
                IsComTemplatesInitiated = true;
            }
            ComTemplates.search();
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#txtTitle").val('');
            $("#txtCode").val('');
            CmnRequestHelper.fillCommCategories($("#ddlCategoryEdit"), '');
            $("#txtDescription").val('');
            $("#txtSubjectContent").val('');
            CKEDITOR.instances.txtBodyContent.setData('');
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, ComTemplates.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));   
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#txtTitle").val(data.Title);
            $("#txtCode").val(data.Code);
            CmnRequestHelper.fillCommCategories($("#ddlCategoryEdit"), data.CommTypeCode);
            $("#txtDescription").val(data.Description);
            $("#txtSubjectContent").val(data.TemplateSubject);
            CKEDITOR.instances.txtBodyContent.setData(data.TemplateBody);
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            ComTemplates.clear();
            FormRequestHelper.addData(payload, ComTemplates.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", ComTemplates.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, ComTemplates.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitle"), "Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtCode"), "Code", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlCategoryEdit"), "Category", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (ComTemplates.validate()) {
                var valBContent = CKEDITOR.instances.txtBodyContent.getData();
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/Save";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'title' : '" + $("#txtTitle").val()
                    + "', 'code' : '" + $("#txtCode").val()
                    + "', 'commTypeCode' : '" + $("#ddlCategoryEdit").val()
                    + "', 'description' : '" + $("#txtDescription").val()
                    + "', 'templateSubject' : '" + $("#txtSubjectContent").val()
                    + "', 'templateBody' : '" + CommonHelper.parseString(valBContent)
                    + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, ComTemplates.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), ComTemplates.save);
                CommonHelper.showModalMsgBox("Success", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                ComTemplates.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), ComTemplates.save);
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }            
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();

