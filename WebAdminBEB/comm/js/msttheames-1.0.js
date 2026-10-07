/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */

var MstTheames = function () {
    var PageUrl = "Theames.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            MstTheames.search();

            $("#btnAdd").click(function () { MstTheames.add(); });
            $("#btnSubmit").click(function () { MstTheames.save(); });
            $("#btnBack").click(function () { MstTheames.back(); });
            $("#btnBackTop").click(function () { MstTheames.back(); });
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#txtTitle").val('');
            $("#txtCode").val('');
            CmnRequestHelper.fillCommCategories($("#ddlCategoryEdit"), '');
            $("#txtDescription").val('');
            CKEDITOR.instances.txtHeaderContent.setData('');
            CKEDITOR.instances.txtFooterContent.setData('');
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, MstTheames.searchCallback);
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
            CKEDITOR.instances.txtHeaderContent.setData(data.HeaderContent);
            CKEDITOR.instances.txtFooterContent.setData(data.FooterContent);
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            MstTheames.clear();
            FormRequestHelper.addData(payload, MstTheames.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", MstTheames.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, MstTheames.updateCallback);
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
            if (MstTheames.validate()) {
                var valHContent = CKEDITOR.instances.txtHeaderContent.getData();
                var valFContent = CKEDITOR.instances.txtFooterContent.getData();
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/Save";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'title' : '" + $("#txtTitle").val()
                    + "', 'code' : '" + $("#txtCode").val()
                    + "', 'commTypeCode' : '" + $("#ddlCategoryEdit").val()
                    + "', 'description' : '" + $("#txtDescription").val()
                    + "', 'headerContent' : '" + CommonHelper.parseString(valDesc)
                    + "', 'footerContent' : '" + CommonHelper.parseString(valDesc)
                    + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, MstTheames.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), MstTheames.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                MstTheames.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), MstTheames.save);
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }            
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();

