/*
 *  Document   : ecomProducts.js
 *  Author     : krs
 *  Description: Custom javascript code used in eCommerce Products page
 */

var ComActivityConfig = function () {
    var PageUrl = "ActivityConfig.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            $("#btnAdd").click(function () { ComActivityConfig.add(); });
            $("#btnSubmit").click(function () { ComActivityConfig.save(); });
            $("#btnBack").click(function () { ComActivityConfig.back(); });
            $("#btnBackTop").click(function () { ComActivityConfig.back(); });
            $("#btnBackToList").click(function () { ComActivityConfig.backToList(); });
            ComActivityConfig.search();
            ComActivityConfig.clear();
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, ComActivityConfig.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.initBasic($("#tblList"));
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#txtTitle").val('');
            $("#txtCode").val('');
            $("#txtTypeCode").val('');
            $("#txtDescription").val('');
            //$("#ddlMessageTypeCodeEdit").val('0');
            //$("#ddlLogTypeEdit").val('0');
            CmnRequestHelper.fillMessageTypeCodes($("#ddlMessageTypeCodeEdit"), '0');
            CmnRequestHelper.fillLogTypes($("#ddlLogTypeEdit"), '0');
            $("#chkIsDefault").prop('checked', true);
            $("#chkEncryptLog").prop('checked', true);
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#txtTitle").val(data.Title);
            $("#txtCode").val(data.Code);
            $("#txtTypeCode").val(data.TypeCode);
            $("#txtDescription").val(data.Description);
            //$("#ddlMessageTypeCodeEdit").val(data.MessageTypeCode);
            //$("#ddlLogTypeEdit").val(data.WriteLog);
            CmnRequestHelper.fillMessageTypeCodes($("#ddlMessageTypeCodeEdit"), data.MessageTypeCode);
            CmnRequestHelper.fillLogTypes($("#ddlLogTypeEdit"), data.WriteLog);
            $("#chkIsDefault").prop('checked', data.IsDefault === 1 ? true : false);
            $("#chkEncryptLog").prop('checked', data.EncryptLog === 1 ? true : false);
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);

        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            ComActivityConfig.clear();
            FormRequestHelper.addData(payload, ComActivityConfig.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", ComActivityConfig.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, ComActivityConfig.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitle"), "Page Title", "bottom")) { return false; }
           // if (!FormCtrlValidationHelper.validateTextCtrl($("#txtSysName"), "Page System Name", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (ComActivityConfig.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/Save";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    // + "', 'refNoMain' : '" + $("#hdnRefMain").val()
                    + "', 'title' : '" + $("#txtTitle").val()
                    + "', 'code' : '" + $("#txtCode").val()
                    + "', 'typeCode' : '" + $("#txtTypeCode").val()
                    + "', 'description' : '" + $("#txtDescription").val()
                    + "', 'messageTypeCode' : '" + $("#ddlMessageTypeCodeEdit").val()
                    + "', 'IsDefault' : '" + ($('#chkIsDefault').is(":checked") ? 1 : 0)
                    + "', 'logType' : '" + $("#ddlLogTypeEdit").val()
                    + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                    + "', 'encryptLog' : '" + ($('#chkEncryptLog').is(":checked") ? 1 : 0)
                    + "' }";

                FormRequestHelper.saveData(payload, ComActivityConfig.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), ComActivityConfig.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                ComActivityConfig.search($("#hdnRefMain").val());
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), ComActivityConfig.save);
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        },
        backToList: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataListMain', '');
        }
    };
}();

