/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsCntWebPageJuniorMenuInitiated = false;
var CntWebPageJuniorMenu = function () {
    var PageUrl = "WebPageJuniorMenu.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            if (!IsCntWebPageJuniorMenuInitiated) {
                $("#btnAdd").click(function () { CntWebPageJuniorMenu.add(); return false; });
                $("#btnSubmit").click(function () { CntWebPageJuniorMenu.save(); return false; });
                $("#btnBack").click(function () { CntWebPageJuniorMenu.back(); return false; });
                $("#btnBackTop").click(function () { CntWebPageJuniorMenu.back(); return false; });
                $("#btnBackToList").click(function () { CntWebPageJuniorMenu.backToList(); return false; });
                $("#fileUplPanelImage").change(function () {
                    FileHelper.onImageSelect(this, 'imgPanelImage', 'hdnPanelImageFileName');
                });
                $("#imgPanelImage").click(function () {
                    $("#fileUplPanelImage").click();
                    return false;
                });
                IsCntWebPageJuniorMenuInitiated = true;
            }
            CntWebPageJuniorMenu.search();
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#hdnPanelImageFileName").val('');
            $('#imgPanelImage').attr('src', '');
            $("#txtTitle").val('');
            $("#txtSysName").val('');
            $("#txtDescription").val('');             
            $("#txtLinkedSysName").val('');     
            $("#txtSortOrder").val('');     
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
            CommonHelper.enableControl($("#btnSubmit"), CntWebPageJuniorMenu.save);
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, CntWebPageJuniorMenu.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#hdnPanelImageFileName").val(data.Thumbnail);
            $('#imgPanelImage').attr('src', data.ThumbnailFullPath);
            $("#txtTitle").val(data.Title);
            $("#txtSysName").val(data.SysName);
            $("#txtDescription").val(data.Description); 
            $("#txtLinkedSysName").val(data.LinkedSysName); 
            $("#txtSortOrder").val(data.SortOrder); 
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            CntWebPageJuniorMenu.clear();
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            FormRequestHelper.addData(payload, CntWebPageJuniorMenu.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (id) {
            CntWebPageJuniorMenu.clear();
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + id.toString() + "'}", CntWebPageJuniorMenu.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, CntWebPageJuniorMenu.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitle"), "Page Menu Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtSortOrder"), "Sort Order", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (CntWebPageJuniorMenu.validate()) {
                FileHelper.saveImageFile("fileUplPanelImage", "cnt-pmenu",
                    $("#hdnRef").val(), "hdnPanelImageFileName", CntWebPageJuniorMenu.saveImageCallback);
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
                        + "', 'clickAction' : '" + $("#txtLinkedSysName").val()
                        + "', 'sortOrder' : '" + $("#txtSortOrder").val()
                        + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                        + "' }";
                    FormRequestHelper.saveData(payload, CntWebPageJuniorMenu.saveCallback);
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
                CommonHelper.enableControl($("#btnSubmit"), CntWebPageJuniorMenu.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CntWebPageJuniorMenu.back();
                CntWebPageJuniorMenu.search($("#hdnRef").val());
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), CntWebPageJuniorMenu.save);
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

