/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsCntWebImagesInitiated = false;
var CntWebImages = function () {
    var PageUrl = "WebImages.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            if (!IsCntWebImagesInitiated) {
                $("#btnAdd").click(function () { CntWebImages.add(); return false; });
                $("#btnSubmit").click(function () { CntWebImages.save(); return false; });
                $("#btnBack").click(function () { CntWebImages.back(); return false; });
                $("#btnBackTop").click(function () { CntWebImages.back(); return false; });
                $("#btnBackToList").click(function () { CntWebImages.backToList(); return false; });
                $("#fileUplPanelImage").change(function () {
                    FileHelper.onImageSelect(this, 'imgPanelImage', 'hdnPanelImageFileName');
                });
                $("#imgPanelImage").click(function () {
                    $("#fileUplPanelImage").click();
                    return false;
                });
                IsCntWebImagesInitiated = true;
            }
            CntWebImages.search();
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#hdnPanelImageFileName").val('');
            $('#imgPanelImage').attr('src', '');
            $("#txtTitle").val('');
            $("#txtSysName").val('');
            //$("#ddlClickModeEdit").val('0');
            $("#txtDescription").val(''); 
            $("#txtFullPath").val(''); 
            //$("#lblFullPath").html(''); 
            //$("#txtClickAction").val('');            
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
            CommonHelper.enableControl($("#btnSubmit"), CntWebImages.save);
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, CntWebImages.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#hdnPanelImageFileName").val(data.Image);
            $('#imgPanelImage').attr('src', data.ImageFullPath);
            $("#txtTitle").val(data.Title);
            $("#txtSysName").val(data.SysName);
            $("#txtDescription").val(data.Description); 
            //$("#ddlClickModeEdit").val(data.IsClickable);
            //$("#txtClickAction").val(data.ClickAction); 
            //$("#lblFullPath").html(data.ImageFullPath);
            $("#txtFullPath").val(data.ImageFullPath); 
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            CntWebImages.clear();
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            FormRequestHelper.addData(payload, CntWebImages.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (id) {
            CntWebImages.clear();
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + id.toString() + "'}", CntWebImages.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, CntWebImages.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitle"), "Image Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtSysName"), "Image Sysname", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (CntWebImages.validate()) {
                FileHelper.saveImageFile("fileUplPanelImage", "cnt-pimg",
                    $("#hdnRef").val(), "hdnPanelImageFileName", CntWebImages.saveImageCallback);
            }
        },
        saveImageCallback: function (errorCode) {
            switch (errorCode) {
                case 0:
                    var payload = FormRequestPayloadHelper.saveDataPayload();
                    payload.url = PageUrl + "/Save";
                    payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                        + "', 'title' : '" + $("#txtTitle").val()
                        + "', 'sysName' : '" + $("#txtSysName").val()
                        + "', 'description' : '" + $("#txtDescription").val()
                        + "', 'image' : '" + $("#hdnPanelImageFileName").val()
                        + "', 'clickMode' : '" + "0"
                        + "', 'clickAction' : '" + ""
                        + "', 'status' : '" + 1
                        + "' }";
                    FormRequestHelper.saveData(payload, CntWebImages.saveCallback);
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
                CommonHelper.enableControl($("#btnSubmit"), CntWebImages.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CntWebImages.back();
                CntWebImages.search($("#hdnRef").val());
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), CntWebImages.save);
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

