/*
 *  Document   : ecomProducts.js
 *  Author     : krs
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsCntWebPagesCareer = false;
var CntWebPagesCareer = function () {
    var PageUrl = "WebPageCareerContent.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            if (!IsCntWebPagesCareer) {
                $("#btnAdd").click(function () { CntWebPagesCareer.add(); });
                $("#btnSubmit").click(function () { CntWebPagesCareer.save(); });
                $("#btnBack").click(function () { CntWebPagesCareer.back(); });
                $("#btnBackTop").click(function () { CntWebPagesCareer.back(); });
                $("#btnBackToList").click(function () { CntWebPagesCareer.backToList(); });
                IsCntWebPagesCareer = true;
            }
            CntWebPagesCareer.search();
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, CntWebPagesCareer.searchCallback);
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
            $("#txtSysName").val(data.SysName);
            $("#txtMetaTags").val(data.MetaTags);
            $("#txtHeaderScript").val(data.HeaderScript);
            $("#txtFooterScript").val(data.FooterScript);
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            CntWebPagesCareer.clear();
            FormRequestHelper.addData(payload, CntWebPagesCareer.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", CntWebPagesCareer.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, CntWebPagesCareer.updateCallback);
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
            if (CntWebPagesCareer.validate()) {
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
                FormRequestHelper.saveData(payload, CntWebPagesCareer.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), CntWebPagesCareer.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                CntWebPagesCareer.search($("#hdnRefMain").val());
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), CntWebPagesCareer.save);
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

