/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */

var CntPromotions = function () {
    var PageUrl = "Promotions.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            CntPromotions.search();

            $("#btnAdd").click(function () { CntPromotions.add(); });
            $("#btnSubmit").click(function () { CntPromotions.save(); });
            $("#btnBack").click(function () { CntPromotions.back(); });
            $("#btnBackTop").click(function () { CntPromotions.back(); });
            $("#fileUplBanner").change(function () {
                FileHelper.onImageSelect(this, 'imgBannerImage', 'hdnBannerFileName');
            });
            $("#imgBannerImage").click(function () {
                $("#fileUplBanner").click();
                return false;
            });

            $("#fileUplThubnail").change(function () {
                FileHelper.onImageSelect(this, 'imgThumbnailImage', 'hdnThumbnailFileName');
            });
            $("#imgThumbnailImage").click(function () {
                $("#fileUplThubnail").click();
                return false;
            });
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#hdnBannerFileName").val('');
            $('#imgBannerImage').attr('src', '');
            $("#hdnThumbnailFileName").val('');
            $('#imgThumbnailImage').attr('src', '');
            $("#txtTitle").val('');
            CKEDITOR.instances.txtDescription.setData("");
            $("#txtShortDescription").val('');
            $("#txtPublishURL").val('');
            $("#txtFromDate").val('');
            $("#txtToDate").val('');
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, CntPromotions.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#txtTitle").val(data.Title);
            CKEDITOR.instances.txtDescription.setData(data.Description);
            $("#txtShortDescription").val(data.ShortDescription);
            $("#txtFromDate").val(Setdate(data.FromDateTime));
            $("#txtToDate").val(Setdate(data.ToDateTime));
            $("#hdnBannerFileName").val(data.Banner);
            $('#imgBannerImage').attr('src', data.BannerFullPath);
            $("#hdnThumbnailFileName").val(data.Thumbnail);
            $('#imgThumbnailImage').attr('src', data.ThumbnailFullPath);
            $("#txtPublishURL").val(data.PublishURL);
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            CntPromotions.clear();
            FormRequestHelper.addData(payload, CntPromotions.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", CntPromotions.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, CntPromotions.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitle"), "Title", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (CntPromotions.validate()) {
                FileHelper.saveImageFile("fileUplBanner", "cnt-promobanner",
                    $("#hdnRef").val(), "hdnBannerFileName", CntPromotions.saveIconcallback);
            }
        },
        saveIconcallback: function (errorCode) {
            switch (errorCode) {
                case 0:
                    FileHelper.saveImageFile("fileUplThubnail", "cnt-promothumb",
                        $("#hdnRef").val(), "hdnThumbnailFileName", CntPromotions.saveThumbnailcallback);
                    break;
                case -1:
                    CommonHelper.showModalMsgBox("Error", "Please select Icon.");
                    CommonHelper.enableControl($("#btnSubmit"), CntPromotions.save);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading Icon.");
                    CommonHelper.enableControl($("#btnSubmit"), CntPromotions.save);
                    break;
            }
        },
        saveThumbnailcallback: function (errorCode) {
            switch (errorCode) {
                case 0:
                    var valDesc = CKEDITOR.instances.txtDescription.getData();
                    var payload = FormRequestPayloadHelper.saveDataPayload();
                    payload.url = PageUrl + "/Save";
                    payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                        + "', 'title' : '" + $("#txtTitle").val()
                        + "', 'description' : '" + CommonHelper.parseString(valDesc)
                        + "', 'shortdescription' : '" + CommonHelper.parseString($("#txtShortDescription").val())
                        + "', 'fromdate' : '" + $("#txtFromDate").val()
                        + "', 'todate' : '" + $("#txtToDate").val()
                        + "', 'banner' : '" + $("#hdnBannerFileName").val()
                        + "', 'thumbnail' : '" + $("#hdnThumbnailFileName").val()
                        + "', 'publishurl' : '" + $("#txtPublishURL").val()
                        + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                        + "' }";
                    FormRequestHelper.saveData(payload, CntPromotions.saveCallback);
                    break;
                case -1:
                    CommonHelper.showModalMsgBox("Error", "Please select thumbnail.");
                    CommonHelper.enableControl($("#btnSubmit"), CntPromotions.save);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading image.");
                    CommonHelper.enableControl($("#btnSubmit"), CntPromotions.save);
                    break;
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), CntPromotions.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                CntPromotions.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), CntPromotions.save);
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();

function Setdate(Jsondate) {
    var formattedDate = new Date(parseInt(Jsondate.substr(6)));
    var d = formattedDate.getDate();
    if (d < 10) {
        d = "0" + d;
    }
    var m = formattedDate.getMonth();
    m += 1;  // JavaScript months are 0-11
    if (m < 10) {
        m = "0" + m;
    }
    var y = formattedDate.getFullYear();
    return nowDate = d + "/" + m + "/" + y;
}