/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsCntWebPageBannersInitiated = false;
var CntWebPageBanners = function () {
    var PageUrl = "WebPageBanners.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            if (!IsCntWebPageBannersInitiated) {
                $("#btnAdd").click(function () { CntWebPageBanners.add(); return false; });
                $("#btnSubmit").click(function () { CntWebPageBanners.save(); return false; });
                $("#btnBack").click(function () { CntWebPageBanners.back(); return false; });
                $("#btnBackTop").click(function () { CntWebPageBanners.back(); return false; });
                $("#btnBackToList").click(function () { CntWebPageBanners.backToList(); return false; });
                $("#fileUplPanelImage").change(function () {
                    FileHelper.onImageSelect(this, 'imgPanelImage', 'hdnPanelImageFileName');
                });
                $("#imgPanelImage").click(function () {
                    $("#fileUplPanelImage").click();
                    return false;
                });
                IsCntWebPageBannersInitiated = true;
            }
            CntWebPageBanners.search();
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#hdnPanelImageFileName").val('');
            $('#imgPanelImage').attr('src', '');
            $("#txtTitle").val('');
            $("#txtFromDate").val('');
            $("#txtToDate").val('');
            $("#ddlClickModeEdit").val('0');
            $("#txtDescription").val(''); 
            $("#txtClickAction").val('');            
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
            CommonHelper.enableControl($("#btnSubmit"), CntWebPageBanners.save);
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, CntWebPageBanners.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#hdnPanelImageFileName").val(data.Banner);
            $('#imgPanelImage').attr('src', data.BannerFullPath);
            $("#txtTitle").val(data.Title);
            $("#txtFromDate").val(CommonHelper.formatJSONDate(data.FromDateTime));
            $("#txtToDate").val(CommonHelper.formatJSONDate(data.ToDateTime));
            $("#txtDescription").val(data.Description); 
            $("#ddlClickModeEdit").val(data.IsClickable);
            $("#txtClickAction").val(data.ClickAction); 
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            CntWebPageBanners.clear();
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            FormRequestHelper.addData(payload, CntWebPageBanners.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (id) {
            CntWebPageBanners.clear();
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + id.toString() + "'}", CntWebPageBanners.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, CntWebPageBanners.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitle"), "Page Banner Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtFromDate"), "From Date", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtToDate"), "To Date", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (CntWebPageBanners.validate()) {
                FileHelper.saveImageFile("fileUplPanelImage", "cnt-ppagebanner",
                    $("#hdnRef").val(), "hdnPanelImageFileName", CntWebPageBanners.saveImageCallback);
            }
        },
        saveImageCallback: function (errorCode) {
            switch (errorCode) {
                case 0:
                    var payload = FormRequestPayloadHelper.saveDataPayload();
                    payload.url = PageUrl + "/Save";
                    payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                        + "', 'title' : '" + $("#txtTitle").val()
                        + "', 'fromdate' : '" + $("#txtFromDate").val()
                        + "', 'todate' : '" + $("#txtToDate").val()
                        + "', 'description' : '" + $("#txtDescription").val()
                        + "', 'image' : '" + $("#hdnPanelImageFileName").val()
                        + "', 'clickMode' : '" + $("#ddlClickModeEdit").val()
                        + "', 'clickAction' : '" + $("#txtClickAction").val()
                        + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                        + "' }";
                    FormRequestHelper.saveData(payload, CntWebPageBanners.saveCallback);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading image.");
                    CommonHelper.enableControl($("#btnSubmit"), EcmBooks.save);
                    break;
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), CntWebPageBanners.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CntWebPageBanners.back();
                CntWebPageBanners.search($("#hdnRef").val());
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), CntWebPageBanners.save);
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        },
        backToList: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();

