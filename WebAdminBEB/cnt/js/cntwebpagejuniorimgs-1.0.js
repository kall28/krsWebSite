/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsCntPageJuniorImagesInitiated = false;
var CntWebPageJuniorImages = function () {
    var PageUrl = "WebPageJuniorContent.aspx";
    return {
        init: function (id, title) {
            $("#hdnRef").val(id);
            $("#lblTitlePL3").html(title);
            $("#lblTitleEditPL3").html(title);
            CommonHelper.switchPanelView('#divDataList', '#divDataListL3', '');
            if (!IsCntPageJuniorImagesInitiated) {
                $("#btnAddL3").click(function () { CntWebPageJuniorImages.add(); return false; });
                $("#btnSubmitL3").click(function () { CntWebPageJuniorImages.save(); return false; });
                $("#btnBackL3").click(function () { CntWebPageJuniorImages.back(); return false; });
                $("#btnBackTopL3").click(function () { CntWebPageJuniorImages.back(); return false; });
                $("#btnBackToListL3").click(function () { CntWebPageJuniorImages.backToList(); return false; });
                $("#fileUplPanelImageL3").change(function () {
                    FileHelper.onImageSelect(this, 'imgPanelImageL3', 'hdnPanelImageFileNameL3');
                });
                $("#imgPanelImageL3").click(function () {
                    $("#fileUplPanelImageL3").click();
                    return false;
                });
                IsCntPageJuniorImagesInitiated = true;
            }
            CntWebPageJuniorImages.search(id);
        },
        clear: function () {
            $("#hdnRefL3").val('');
            $("#hdnPanelImageFileNameL3").val('');
            $('#imgPanelImageL3').attr('src', '');
            $("#txtTitleL3").val('');
            $("#txtSysNameL3").val('');
            $("#ddlClickModeEditL3").val('0');
            $("#txtDescriptionL3").val(''); 
            $("#txtClickActionL3").val('');            
            $("#chkStatusL3").prop('checked', true);
            $("#divMessageL3").html("");
            CommonHelper.enableControl($("#btnSubmitL3"), CntWebPageJuniorImages.save);
        },
        search: function (id) {
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL3";
            payload.data = "{ 'refNo' : " + id + " }";
            payload.ctrlList = "divListL3";
            FormRequestHelper.searchData(payload, CntWebPageJuniorImages.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblListL3"));
        },
        show: function (data) {
            $("#hdnRefL3").val(data.Id);
            $("#hdnPanelImageFileNameL3").val(data.Image);
            $('#imgPanelImageL3').attr('src', data.ImageFullPath);
            $("#txtTitleL3").val(data.Title);
            $("#txtSysNameL3").val(data.SysName);
            $("#txtDescriptionL3").val(data.Description); 
            $("#ddlClickModeEditL3").val(data.IsClickable);
            $("#txtClickActionL3").val(data.ClickAction); 
            $("#chkStatusL3").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            CntWebPageJuniorImages.clear();
            var payload = FormRequestPayloadHelper.addDataPayload();
            payload.url = PageUrl + "/AddL3";
            payload.ctrlRef = "hdnRefL3";
            payload.ctrlHeader = "headerEditL3";
            FormRequestHelper.addData(payload, CntWebPageJuniorImages.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataListL3', '#divDataEditL3', 'new');
            CommonHelper.hideProgress();
        },
        update: function (id) {
            CntWebPageJuniorImages.clear();
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL3";
            payload.data = "{'Id':'" + id.toString() + "'}";
            payload.showData = CntWebPageJuniorImages.show;
            payload.ctrlHeader = "headerEditL3";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, CntWebPageJuniorImages.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataListL3', '#divDataEditL3', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitleL3"), "Page Image Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtSysNameL3"), "Image System Name", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmitL3"));
            return true;
        },
        save: function () {
            if (CntWebPageJuniorImages.validate()) {
                FileHelper.saveImageFile("fileUplPanelImageL3", "cnt-ppageimg",
                    $("#hdnRefL3").val(), "hdnPanelImageFileNameL3", CntWebPageJuniorImages.saveImageCallback);
            }
        },
        saveImageCallback: function (errorCode) {
            switch (errorCode) {
                case 0:
                    var payload = FormRequestPayloadHelper.saveDataPayload();
                    payload.url = PageUrl + "/SaveL3";
                    payload.data = "{ 'refNo' : '" + $("#hdnRefL3").val()
                        + "', 'refId' : '" + $("#hdnRef").val()
                        + "', 'title' : '" + $("#txtTitleL3").val()
                        + "', 'sysName' : '" + $("#txtSysNameL3").val()
                        + "', 'description' : '" + $("#txtDescriptionL3").val()
                        + "', 'image' : '" + $("#hdnPanelImageFileNameL3").val()
                        + "', 'clickMode' : '" + $("#ddlClickModeEditL3").val()
                        + "', 'clickAction' : '" + $("#txtClickActionL3").val()
                        + "', 'status' : '" + ($('#chkStatusL3').is(":checked") ? 1 : 0)
                        + "' }";
                    FormRequestHelper.saveData(payload, CntWebPageJuniorImages.saveCallback);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading image.");
                    CommonHelper.enableControl($("#btnSubmitL3"), EcmBooks.save);
                    break;
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmitL3"), CntWebPageJuniorImages.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CntWebPageJuniorImages.back();
                CntWebPageJuniorImages.search($("#hdnRef").val());
            }
            else {
                CommonHelper.enableControl($("#btnSubmitL3"), CntWebPageJuniorImages.save);
                CommonHelper.showMessagePanel($("#divMessageL3"), "fail", msg);
            }
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEditL3', '#divDataListL3', '');
        },
        backToList: function () {
            CommonHelper.switchPanelView('#divDataListL3', '#divDataList', '');
        }
    };
}();

