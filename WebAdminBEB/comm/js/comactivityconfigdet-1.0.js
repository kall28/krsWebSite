/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsCmnActivityConfigDetInitiated = false;
var CmnActivityConfigDet = function () {
    var PageUrl = "ActivityConfig.aspx";
    return {
        init: function (id, title) {
            $("#hdnRef").val(id);
            $("#lblTitlePL2").html(title);
            $("#lblTitleEditP").html(title);
            CommonHelper.switchPanelView('#divDataList', '#divDataListL2', '');
            if (!IsCmnActivityConfigDetInitiated) {
                $("#btnAddL2").click(function () { CmnActivityConfigDet.add(); return false; });
                $("#btnSubmitL2").click(function () { CmnActivityConfigDet.save(); return false; });
                $("#btnBackL2").click(function () { CmnActivityConfigDet.back(); return false; });
                $("#btnBackTopL2").click(function () { CmnActivityConfigDet.back(); return false; });
                $("#btnBackToListL2").click(function () { CmnActivityConfigDet.backToList(); return false; });
                //$("#fileUplPanelImage").change(function () {
                //    FileHelper.onImageSelect(this, 'imgPanelImage', 'hdnPanelImageFileName');
                //});
                //$("#imgPanelImage").click(function () {
                //    $("#fileUplPanelImage").click();
                //    return false;
                //});
                IsCmnActivityConfigDetInitiated = true;
            }
            CmnActivityConfigDet.search(id);
        },
        clear: function () {
            $("#hdnRefL2").val('');


            $("#txtTheamCodeEdit").val('');
            $("#txtTemplateCode").val('');
            $("#txtSenderName").val('');
            $("#txtSenderEmail").val('');
            $("#txtMessageCC").val('');
            $("#txtMessageBCC").val('');
            $("#chkNotifyL2").prop('checked', false);
            $("#chkStatusL2").prop('checked', true);
            $("#divMessageL2").html("");
            CommonHelper.enableControl($("#btnSubmitL2"), CmnActivityConfigDet.save);
        },
        search: function (id) {
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL2";
            payload.data = "{ 'refNo' : '" + id + "' }";
            payload.ctrlList = "divListL2";
            FormRequestHelper.searchData(payload, CmnActivityConfigDet.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblListL2"));
        },
        show: function (data) {
            $("#hdnRefL2").val(data.Id);

            CmnRequestHelper.fillCommTypeCode($("#ddlCommTypeCodeEdit"), data.CommTypeCode);
            $("#txtTheamCodeEdit").val(data.TheamCode.Code);
            $("#txtTemplateCode").val(data.TemplateCode.Code);
            CmnRequestHelper.fillCommProcessModes($("#ddlCommProcessModeEdit"), data.CommProcessMode);

            $("#txtSenderName").val(data.SenderName);
            $("#txtSenderEmail").val(data.SenderEmail);
            $("#txtMessageCC").val(data.MessageCC);
            $("#txtMessageBCC").val(data.MessageBCC);
            $("#chkNotifyL2").prop('checked', data.Notify === 1 ? true : false);
            $("#chkStatusL2").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            CmnActivityConfigDet.clear();
            var payload = FormRequestPayloadHelper.addDataPayload();
            payload.url = PageUrl + "/AddL2";
            payload.ctrlRef = "hdnRefL2";
            payload.ctrlHeader = "headerEditL2";
            FormRequestHelper.addData(payload, CmnActivityConfigDet.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataEditL2', 'new');
            CommonHelper.hideProgress();
        },
        update: function (id) {
            CmnActivityConfigDet.clear();
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL2";
            payload.data = "{'Id':'" + id.toString() + "'}";
            payload.showData = CmnActivityConfigDet.show;
            payload.ctrlHeader = "headerEditL2";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, CmnActivityConfigDet.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataEditL2', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
          //  if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitleL2"), "Page Panel Title", "bottom")) { return false; }
           // if (!FormCtrlValidationHelper.validateTextCtrl($("#txtSysNameL2"), "Panel System Name", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmitL2"));
            return true;
        },
        save: function () {
            if (CmnActivityConfigDet.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/Save2";

                payload.data = "{ 'refNo' : '" + $("#hdnRefL2").val()
                    + "', 'refId' : '" + $("#hdnRef").val()
                    + "', 'theamCode' : '" + $("#txtTheamCodeEdit").val()
                    + "', 'templateCode' : '" + $("#txtTemplateCode").val()
                    + "', 'senderName' : '" + $("#txtSenderName").val()
                    + "', 'senderEmail' : '" + $("#txtSenderEmail").val()
                    + "', 'messageCC' : '" + $("#txtMessageCC").val()
                    + "', 'messageBCC' : '" + $("#txtMessageBCC").val()
                    + "', 'typeCode' : '" + $("#ddlCommTypeCodeEdit").val()
                    + "', 'processMode' : '" + $("#ddlCommProcessModeEdit").val()
                    + "', 'notify' : '" + ($('#chkNotifyL2').is(":checked") ? 1 : 0)
                    + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                    + "' }";

                FormRequestHelper.saveData(payload, CmnActivityConfigDet.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmitL2"), CmnActivityConfigDet.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CmnActivityConfigDet.back();
                CmnActivityConfigDet.search($("#hdnRef").val());
            }
            else {
                CommonHelper.enableControl($("#btnSubmitL2"), CmnActivityConfigDet.save);
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

