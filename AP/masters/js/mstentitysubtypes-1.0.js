/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */

var MstEntitySubTypes = function () {
    var PageUrl = "EntityTypes.aspx";
    return {
        init: function (id, title) {
            CommonHelper.switchPanelView('#divDataList', '#divDataListL2', '');
            $("#btnAddL2").click(function () { MstEntitySubTypes.add(); });
            $("#btnSubmitL2").click(function () { MstEntitySubTypes.save(); });
            $("#btnBackL2").click(function () { MstEntitySubTypes.back(); });
            $("#btnBackTopL2").click(function () { MstEntitySubTypes.back(); });
            $("#btnBackToList").click(function () { MstEntitySubTypes.backToList(); });
            $("#hdnRef").val(id);
            $("#lblTitlePL2").html(title);
            $("#lblTitleEditPL2").html(title);            
            MstEntitySubTypes.search(id);
        },
        clear: function () {
            $("#hdnRefL2").val('');
            $("#txtTitleL2").val('');
            $("#txtCodeL2").val('');
            $("#txtDescriptionL2").val('');
            $("#chkStatusL2").prop('checked', true);
            $("#divMessageL2").html("");
            CommonHelper.enableControl($("#btnSubmitL2"), MstEntitySubTypes.save);
        },
        search: function (id) {
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL2";
            payload.data = "{ 'Id' : "+ id +" }";
            payload.ctrlList = "divListL2";
            FormRequestHelper.searchData(payload, MstEntitySubTypes.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblListL2"));   
        },
        show: function (data) {
            $("#hdnRefL2").val(data.Id);
            $("#txtTitleL2").val(data.Title);
            $("#txtCodeL2").val(data.Code);
            $("#txtDescriptionL2").val(data.Description);
            $("#chkStatusL2").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayload();
            payload.url = PageUrl + "/AddL2";
            payload.ctrlRef = "hdnRefL2";
            payload.ctrlHeader = "headerEditL2";
            MstEntitySubTypes.clear();
            FormRequestHelper.addData(payload, MstEntitySubTypes.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataEditL2', 'new');
            CommonHelper.hideProgress();
        },
        update: function (id) {
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL2";
            payload.data = "{'Id':'" + id.toString() + "'}";
            payload.showData = MstEntitySubTypes.show;
            payload.ctrlHeader = "headerEditL2";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, MstEntitySubTypes.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataEditL2', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitleL2"), "Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtCodeL2"), "Code", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtDescriptionL2"), "Description", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmitL2"));
            return true;
        },
        save: function () {
            if (MstEntitySubTypes.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/SaveL2";
                payload.data = "{ 'refNo' : '" + $("#hdnRefL2").val()
                    + "', 'title' : '" + $("#txtTitleL2").val()
                    + "', 'code' : '" + $("#txtCodeL2").val()
                    + "', 'description' : '" + $("#txtDescriptionL2").val()
                    + "', 'refId' : '" + $("#hdnRef").val()
                    + "', 'status' : '" + ($('#chkStatusL2').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, MstEntitySubTypes.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmitL2"), MstEntitySubTypes.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                MstEntitySubTypes.back();
                MstEntitySubTypes.search($("#hdnRef").val());
            }
            else {
                CommonHelper.enableControl($("#btnSubmitL2"), MstEntitySubTypes.save);
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

