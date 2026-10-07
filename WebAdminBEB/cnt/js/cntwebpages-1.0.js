/*
 *  Document   : ecomProducts.js
 *  Author     : krs
 *  Description: Custom javascript code used in eCommerce Products page
 */

var CntWebPages = function () {
    var PageUrl = "WebPageContent.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            $("#btnAdd").click(function () { CntWebPages.add(); });
            $("#btnSubmit").click(function () { CntWebPages.save(); });
            $("#btnBack").click(function () { CntWebPages.back(); });
            $("#btnBackTop").click(function () { CntWebPages.back(); });            
            $("#btnBackToList").click(function () { CntWebPages.backToList(); });
            CntWebPages.search();
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, CntWebPages.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.initBasic($("#tblList"));
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#txtTitle").val('');
            $("#txtSysName").val('');
            $("#txtMetaTags").val('');
            $("#txtHeaderScript").val('');
            $("#txtFooterScript").val('');
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#txtTitle").val(data.Title);
            $("#txtSysName").val(data.Code);
            $("#txtMetaTags").val(data.MetaTags);
            $("#txtHeaderScript").val(data.HeaderScript);
            $("#txtFooterScript").val(data.FooterScript);
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            CntWebPages.clear();
            FormRequestHelper.addData(payload, CntWebPages.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", CntWebPages.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, CntWebPages.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitle"), "Page Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtSysName"), "Page System Name", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (CntWebPages.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/Save";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'refNoMain' : '" + $("#hdnRefMain").val()
                    + "', 'title' : '" + $("#txtTitle").val()
                    + "', 'sysName' : '" + $("#txtSysName").val()
                    + "', 'metaTags' : '" + JSON.stringify($("#txtMetaTags").val())
                    + "', 'headerScripts' : '" + JSON.stringify($("#txtHeaderScripts").val())
                    + "', 'footerScripts' : '" + JSON.stringify($("#txtFooterScripts").val())
                    + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, CntWebPages.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), CntWebPages.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                CntWebPages.search($("#hdnRefMain").val());
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), CntWebPages.save);
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

