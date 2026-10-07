/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */

var MstGenres = function () {
    var PageUrl = "Genres.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            MstGenres.search();

            $("#btnAdd").click(function () { MstGenres.add(); });
            $("#btnSubmit").click(function () { MstGenres.save(); });
            $("#btnBack").click(function () { MstGenres.back(); });
            $("#btnBackTop").click(function () { MstGenres.back(); });
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
            FormRequestHelper.searchData(payload, MstGenres.searchCallback);
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
            MstGenres.clear();
            FormRequestHelper.addData(payload, MstGenres.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", MstGenres.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, MstGenres.updateCallback);
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
            if (MstGenres.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/Save";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'title' : '" + $("#txtTitle").val()
                    + "', 'code' : '" + $("#txtCode").val()
                    + "', 'description' : '" + $("#txtDescription").val()
                    + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, MstGenres.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), MstGenres.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                MstGenres.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), MstGenres.save);
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }            
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();

