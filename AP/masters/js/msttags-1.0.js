/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */

var MstTags = function () {
    var PageUrl = "Tags.aspx";
    return {
        init: function (id, title) {
            CommonHelper.switchPanelView('#divDataList', '#divDataListL2', '');
            $("#btnAddL2").click(function () { MstTags.add(); });
            $("#btnSubmitL2").click(function () { MstTags.save(); });
            $("#btnBackL2").click(function () { MstTags.back(); });
            $("#btnBackTopL2").click(function () { MstTags.back(); });
            $("#btnBackToList").click(function () { MstTags.backToList(); });
            $("#hdnRef").val(id);
            $("#lblTitleP").html(title);
            $("#lblTitleEditP").html(title);
            MstTags.search(id);
        },
        clear: function () {
            $("#hdnRefL2").val('');
            $("#txtTitleL2").val('');
            $("#txtDescriptionL2").val('');
            $("#chkStatusL2").prop('checked', true);
            $("#divMessageL2").html("");
            CommonHelper.enableControl($("#btnSubmitL2"), MstTags.save);
        },
        search: function (id) {
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL2";
            payload.data = "{ 'code' : '"+ id +"' }";
            payload.ctrlList = "divListL2";
            FormRequestHelper.searchData(payload, MstTags.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblListL2"));   
        },
        show: function (data) {
            $("#hdnRefL2").val(data.Id);
            $("#txtTitleL2").val(data.Title);
            $("#txtDescriptionL2").val(data.Description);
            $("#chkStatusL2").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayload();
            payload.url = PageUrl + "/AddL2";
            payload.ctrlRef = "hdnRefL2";
            payload.ctrlHeader = "headerEditL2";
            MstTags.clear();
            FormRequestHelper.addData(payload, MstTags.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataEditL2', 'new');
            CommonHelper.hideProgress();
        },
        update: function (id) {
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL2";
            payload.data = "{'Id':'" + id.toString() + "'}";
            payload.showData = MstTags.show;
            payload.ctrlHeader = "headerEditL2";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, MstTags.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataEditL2', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitleL2"), "Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtDescriptionL2"), "Description", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmitL2"));
            return true;
        },
        save: function () {
            if (MstTags.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/SaveL2";
                payload.data = "{ 'refNo' : '" + $("#hdnRefL2").val()
                    + "', 'title' : '" + $("#txtTitleL2").val()
                    + "', 'description' : '" + $("#txtDescriptionL2").val()
                    + "', 'refId' : '" + $("#hdnRef").val()
                    + "', 'status' : '" + ($('#chkStatusL2').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, MstTags.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmitL2"), MstTags.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                MstTags.back();
                MstTags.search($("#hdnRef").val());
            }
            else {
                CommonHelper.enableControl($("#btnSubmitL2"), MstTags.save);
                CommonHelper.showMessagePanel($("#divMessageL2"), "fail", msg);
            }            
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEditL2', '#divDataListL2', '');
        },
        backToList: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataList', '');
        }
    };
}();

