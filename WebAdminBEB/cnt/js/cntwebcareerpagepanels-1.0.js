/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsCntPagePanelsCareerInitiated = false;
var CntWebPagePanelsCareer = function () {
    var PageUrl = "WebPageCareerContent.aspx";
    return {
        init: function (id, title) {
            $("#hdnRef").val(id);
            $("#lblTitlePL2").html(title);
            $("#lblTitleEditP").html(title);
            CommonHelper.switchPanelView('#divDataList', '#divDataListL2', '');
            if (!IsCntPagePanelsCareerInitiated) {
                $("#btnAddL2").click(function () { CntWebPagePanelsCareer.add(); return false; });
                $("#btnSubmitL2").click(function () { CntWebPagePanelsCareer.save(); return false; });
                $("#btnBackL2").click(function () { CntWebPagePanelsCareer.back(); return false; });
                $("#btnBackTopL2").click(function () { CntWebPagePanelsCareer.back(); return false; });
                $("#btnBackToListL2").click(function () { CntWebPagePanelsCareer.backToList(); return false; });
                $("#fileUplPanelImage").change(function () {
                    FileHelper.onImageSelect(this, 'imgPanelImage', 'hdnPanelImageFileName');
                });
                $("#imgPanelImage").click(function () {
                    $("#fileUplPanelImage").click();
                    return false;
                });
                IsCntPagePanelsCareerInitiated = true;
            }
            CntWebPagePanelsCareer.search(id);
        },
        clear: function () {
            $("#hdnRefL2").val('');
            $("#hdnPanelImageFileName").val('');
            $('#imgPanelImage').attr('src', '');
            $("#txtTitleL2").val('');
            $("#txtSysNameL2").val('');
            $("#txtDescriptionL2").val('');   
            CKEDITOR.instances.txtDescriptionL2.setData("");
            $("#chkStatusL2").prop('checked', true);
            $("#divMessageL2").html("");
            CommonHelper.enableControl($("#btnSubmitL2"), CntWebPagePanelsCareer.save);                        
        },
        search: function (id) {
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL2";
            payload.data = "{ 'refNo' : "+ id +" }";
            payload.ctrlList = "divListL2";
            FormRequestHelper.searchData(payload, CntWebPagePanelsCareer.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblListL2"));   
        },
        show: function (data) {
            $("#hdnRefL2").val(data.Id);
            $("#hdnPanelImageFileName").val(data.Image);
            $('#imgPanelImage').attr('src', data.ImageFullPath);
            $("#txtTitleL2").val(data.Title);
            $("#txtSysNameL2").val(data.SysName);
            $("#txtDescriptionL2").val(data.Description);    
            CKEDITOR.instances.txtDescriptionL2.setData(data.Description);
            $("#chkStatusL2").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            CntWebPagePanelsCareer.clear();
            var payload = FormRequestPayloadHelper.addDataPayload();
            payload.url = PageUrl + "/AddL2";
            payload.ctrlRef = "hdnRefL2";
            payload.ctrlHeader = "headerEditL2";
            FormRequestHelper.addData(payload, CntWebPagePanelsCareer.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataEditL2', 'new');
            CommonHelper.hideProgress();
        },
        update: function (id) {
            CntWebPagePanelsCareer.clear();
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL2";
            payload.data = "{'Id':'" + id.toString() + "'}";
            payload.showData = CntWebPagePanelsCareer.show;
            payload.ctrlHeader = "headerEditL2";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, CntWebPagePanelsCareer.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataEditL2', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitleL2"), "Page Panel Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtSysNameL2"), "Panel System Name", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmitL2"));
            return true;
        },
        save: function () {
            if (CntWebPagePanelsCareer.validate()) {
                if ($('#imgPanelImage').attr('src') !== "") {
                    FileHelper.saveImageFile("fileUplPanelImage", "cnt-ppanel",
                        $("#hdnRefL2").val(), "hdnPanelImageFileName", CntWebPagePanelsCareer.saveImageCallback);
                }
                else {
                    CntWebPagePanelsCareer.saveImageCallback(0);
                }
            }
        },
        saveImageCallback: function (errorCode) {
            switch (errorCode) {
                case 0:
                    var valDesc = CKEDITOR.instances.txtDescriptionL2.getData();
                    var payload = FormRequestPayloadHelper.saveDataPayload();
                    payload.url = PageUrl + "/SaveL2";
                    payload.data = "{ 'refNo' : '" + $("#hdnRefL2").val()
                        + "', 'refId' : '" + $("#hdnRef").val()
                        + "', 'title' : '" + $("#txtTitleL2").val()
                        + "', 'sysName' : '" + $("#txtSysNameL2").val()
                        + "', 'image' : '" + $("#hdnPanelImageFileName").val()
                        + "', 'description' : '" + CommonHelper.parseString(valDesc)
                        + "', 'status' : '" + ($('#chkStatusL2').is(":checked") ? 1 : 0)
                        + "' }";
                    FormRequestHelper.saveData(payload, CntWebPagePanelsCareer.saveCallback);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading image.");
                    CommonHelper.enableControl($("#btnSubmitL2"), EcmBooks.save);
                    break;
            }            
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmitL2"), CntWebPagePanelsCareer.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CntWebPagePanelsCareer.back();
                CntWebPagePanelsCareer.search($("#hdnRef").val());
            }
            else {
                CommonHelper.enableControl($("#btnSubmitL2"), CntWebPagePanelsCareer.save);
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

