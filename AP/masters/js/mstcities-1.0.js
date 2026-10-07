/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsMstCitiesInitiated = false;
var MstCities = function () {
    var PageUrl = "Locations.aspx";
    return {
        init: function (id, title) {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataListL3', '');
            if (!IsMstCitiesInitiated) {
                $("#btnAddL3").click(function () { MstCities.add(); });
                $("#btnSubmitL3").click(function () { MstCities.save(); });
                $("#btnBackL3").click(function () { MstCities.back(); });
                $("#btnBackTopL3").click(function () { MstCities.back(); });
                $("#btnBackToListL3").click(function () { MstCities.backToList(); });                
                IsMstCitiesInitiated = true;
            }
            $("#hdnRefL2").val(id);
            $("#lblTitlePL3").html(title);
            $("#lblTitleEditPL2L3").html(title);
            MstCities.search(id);
        },
        clear: function () {
            $("#hdnRefL3").val('');
            $("#txtTitleL3").val('');
            $("#txtCodeL3").val('');
            $("#txtTimeOffsetL3").val('');
            $("#txtLatitudeL3").val('');
            $("#txtLongitudeL3").val('');
            $("#chkStatusL3").prop('checked', true);
            $("#divMessageL3").html("");
            CommonHelper.enableControl($("#btnSubmitL3"), MstCities.save);
        },
        search: function (id) {
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL3";
            payload.data = "{ 'Id' : "+ id +" }";
            payload.ctrlList = "divListL3";
            FormRequestHelper.searchData(payload, MstCities.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblListL3"));   
        },
        show: function (data) {
            $("#hdnRefL3").val(data.Id);
            $("#txtTitleL3").val(data.Title);
            $("#txtCodeL3").val(data.Code);
            $("#txtTimeOffsetL3").val(data.TimeOffset);
            $("#txtLatitudeL3").val(data.Latitude);
            $("#txtLongitudeL3").val(data.Longitude);
            $("#chkStatusL3").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayload();
            payload.url = PageUrl + "/AddL3";
            payload.ctrlRef = "hdnRefL3";
            payload.ctrlHeader = "headerEditL3";
            MstCities.clear();
            FormRequestHelper.addData(payload, MstCities.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataListL3', '#divDataEditL3', 'new');
            CommonHelper.hideProgress();
        },
        update: function (id) {
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL3";
            payload.data = "{'Id':'" + id.toString() + "'}";
            payload.showData = MstCities.show;
            payload.ctrlHeader = "headerEditL3";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, MstCities.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataListL3', '#divDataEditL3', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitleL3"), "Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtCodeL3"), "Code", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTimeOffsetL3"), "Time Offset", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtLatitudeL3"), "Latitude", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtLongitudeL3"), "Longitude", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmitL3"));
            return true;
        },
        save: function () {
            if (MstCities.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/SaveL3";
                payload.data = "{ 'refNo' : '" + $("#hdnRefL3").val()
                    + "', 'title' : '" + $("#txtTitleL3").val()
                    + "', 'code' : '" + $("#txtCodeL3").val()
                    + "', 'refId' : '" + $("#hdnRef").val()
                    + "', 'refId2' : '" + $("#hdnRefL2").val()
                    + "', 'timeOffset' : '" + $("#txtTimeOffsetL3").val()
                    + "', 'latitude' : '" + $("#txtLatitudeL3").val()
                    + "', 'longitude' : '" + $("#txtLongitudeL3").val()
                    + "', 'status' : '" + ($('#chkStatusL3').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, MstCities.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmitL3"), MstCities.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                MstCities.back();
                MstCities.search($("#hdnRefL2").val());
            }
            else {
                CommonHelper.enableControl($("#btnSubmitL3"), MstCities.save);
                CommonHelper.showMessagePanel($("#divMessageL3"), "fail", msg);
            }            
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEditL3', '#divDataListL3', '');
        },
        backToList: function () {
            CommonHelper.switchPanelView('#divDataListL3', '#divDataListL2', '');
        }
    };
}();

