/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsMstStatesInitiated = false;
var MstStates = function () {
    var PageUrl = "Locations.aspx";
    return {
        init: function (code, title) {
            CommonHelper.switchPanelView('#divDataList', '#divDataListL2', '');
            if (!IsMstStatesInitiated) {
                $("#btnAddL2").click(function () { MstStates.add(); });
                $("#btnSubmitL2").click(function () { MstStates.save(); });
                $("#btnBackL2").click(function () { MstStates.back(); });
                $("#btnBackTopL2").click(function () { MstStates.back(); });
                $("#btnBackToList").click(function () { MstStates.backToList(); });                
                IsMstStatesInitiated = true;
            }
            $("#hdnRef").val(code);
            $("#lblTitlePL2").html(title);
            $("#lblTitlePL3").html(title);
            $("#lblTitleEditPL2").html(title);
            $("#lblTitleEditPL3").html(title);
            MstStates.search(code);
        },
        clear: function () {
            $("#hdnRefL2").val('');
            $("#txtTitleL2").val('');
            $("#txtCodeL2").val('');
            $("#chkStatusL2").prop('checked', true);
            $("#divMessageL2").html("");
            CommonHelper.enableControl($("#btnSubmitL2"), MstStates.save);
        },
        search: function (code) {
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL2";
            payload.data = "{ 'code' : '" + code + "' }";
            payload.ctrlList = "divListL2";
            FormRequestHelper.searchData(payload, MstStates.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblListL2"));   
        },
        show: function (data) {
            $("#hdnRefL2").val(data.Id);
            $("#txtTitleL2").val(data.Title);
            $("#txtCodeL2").val(data.Code);
            $("#chkStatusL2").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayload();
            payload.url = PageUrl + "/AddL2";
            payload.ctrlRef = "hdnRefL2";
            payload.ctrlHeader = "headerEditL2";
            MstStates.clear();
            FormRequestHelper.addData(payload, MstStates.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataEditL2', 'new');
            CommonHelper.hideProgress();
        },
        update: function (id) {
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL2";
            payload.data = "{'Id':'" + id.toString() + "'}";
            payload.showData = MstStates.show;
            payload.ctrlHeader = "headerEditL2";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, MstStates.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataEditL2', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitleL2"), "Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtCodeL2"), "Code", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmitL2"));
            return true;
        },
        save: function () {
            if (MstStates.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/SaveL2";
                payload.data = "{ 'refNo' : '" + $("#hdnRefL2").val()
                    + "', 'title' : '" + $("#txtTitleL2").val()
                    + "', 'code' : '" + $("#txtCodeL2").val()
                    + "', 'refId' : '" + $("#hdnRef").val()
                    + "', 'status' : '" + ($('#chkStatusL2').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, MstStates.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmitL2"), MstStates.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                MstStates.back();
                MstStates.search($("#hdnRef").val());
            }
            else {
                CommonHelper.enableControl($("#btnSubmitL2"), MstStates.save);
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

