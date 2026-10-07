/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsCntNewsInitiated = false;
var CntNews = function () {
    var PageUrl = "News.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            CntNews.search();
            if (!IsCntNewsInitiated) {
                $("#btnAdd").click(function () { CntNews.add(); });
                $("#btnSubmit").click(function () { CntNews.save(); });
                $("#btnBack").click(function () { CntNews.back(); });
                $("#btnBackTop").click(function () { CntNews.back(); });
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

                $("#fileUplThubnailMob").change(function () {
                    FileHelper.onImageSelect(this, 'imgThumbnailImageMob', 'hdnThumbnailFileNameMob');
                });
                $("#imgThumbnailImageMob").click(function () {
                    $("#fileUplThubnailMob").click();
                    return false;
                });

                IsCntNewsInitiated = true;
            }
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#hdnBannerFileName").val('');
            $('#imgBannerImage').attr('src', '');
            $("#hdnThumbnailFileName").val('');
            $('#imgThumbnailImage').attr('src', '');
            $("#hdnThumbnailFileNameMob").val('');
            $('#imgThumbnailImageMob').attr('src', '');
            $("#txtTitle").val('');
            CKEDITOR.instances.txtDescription.setData("");
            $("#txtShortDescription").val('');
            $("#txtPublishDate").val(CommonHelper.getCurrentDate());
            $("#txtPublishTime").val(CommonHelper.getCurrentTime());            
            $("#txtPublishURL").val('');
            $("#txtFromDate").val('');
            $("#txtToDate").val('');
            $("#txtAuthorTitle").val('');
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, CntNews.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#txtTitle").val(data.Title);
            $("#txtAuthorTitle").val(data.AuthorTitle);
            CKEDITOR.instances.txtDescription.setData(data.Description);
            $("#txtShortDescription").val(data.ShortDescription);
            $("#txtPublishDate").val(Setdate(data.PublishedDate));
            $("#txtPublishTime").val(SetTime(data.PublishedDate));
            $("#txtPublishURL").val(data.PublishURL);
            $("#txtFromDate").val(Setdate(data.FromDateTime));
            $("#txtToDate").val(Setdate(data.ToDateTime));
            $("#hdnBannerFileName").val(data.Banner);
            $('#imgBannerImage').attr('src', data.BannerFullPath);
            $("#hdnThumbnailFileName").val(data.Thumbnail);
            $('#imgThumbnailImage').attr('src', data.ThumbnailFullPath);
            $("#hdnThumbnailFileNameMob").val(data.ThumbnailMob);
            $('#imgThumbnailImageMob').attr('src', data.ThumbnailMobFullPath);
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            CntNews.clear();
            FormRequestHelper.addData(payload, CntNews.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", CntNews.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, CntNews.updateCallback);
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
            if (CntNews.validate()) {
                FileHelper.saveImageFile("fileUplBanner", "cnt-newsbanner",
                    $("#hdnRef").val(), "hdnBannerFileName", CntNews.saveIconcallback);
            }
        },
        saveIconcallback: function (errorCode) {
            switch (errorCode) {
                case 0:
                    FileHelper.saveImageFile("fileUplThubnail", "cnt-newsthumb",
                        $("#hdnRef").val(), "hdnThumbnailFileName", CntNews.saveThumbnailcallback);
                    break;
                case -1:
                    CommonHelper.showModalMsgBox("Error", "Please select Icon.");
                    CommonHelper.enableControl($("#btnSubmit"), CntNews.save);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading Icon.");
                    CommonHelper.enableControl($("#btnSubmit"), CntNews.save);
                    break;
            }
        },
        saveThumbnailcallback: function (errorCode) {
            switch (errorCode) {
                case 0:
                    FileHelper.saveImageFile("fileUplThubnailMob", "cnt-newsthumb",
                        $("#hdnRef").val(), "hdnThumbnailFileNameMob", CntNews.saveThumbnailMobcallback);
                    break;
                case -1:
                    CommonHelper.showModalMsgBox("Error", "Please select thumbnail.");
                    CommonHelper.enableControl($("#btnSubmit"), CntNews.save);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading thumbnail.");
                    CommonHelper.enableControl($("#btnSubmit"), CntNews.save);
                    break;
            }
        },
        saveThumbnailMobcallback: function (errorCode) {
            switch (errorCode) {
                case 0:
                    var valDesc = CKEDITOR.instances.txtDescription.getData();
                    var payload = FormRequestPayloadHelper.saveDataPayload();
                    payload.url = PageUrl + "/Save";
                    payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                        + "', 'title' : '" + $("#txtTitle").val()
                        + "', 'authortitle' : '" + $("#txtAuthorTitle").val()
                        + "', 'description' : '" + CommonHelper.parseString(valDesc)
                        + "', 'shortdescription' : '" + CommonHelper.parseString($("#txtShortDescription").val())
                        + "', 'publishdate' : '" + $("#txtPublishDate").val()
                        + "', 'publishTime' : '" + $("#txtPublishTime").val()
                        + "', 'publishurl' : '" + $("#txtPublishURL").val()
                        + "', 'fromdate' : '" + $("#txtFromDate").val()
                        + "', 'todate' : '" + $("#txtToDate").val()
                        + "', 'banner' : '" + $("#hdnBannerFileName").val()
                        + "', 'thumbnail' : '" + $("#hdnThumbnailFileName").val()
                        + "', 'thumbnailMob' : '" + $("#hdnThumbnailFileNameMob").val()
                        + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                        + "' }";
                    FormRequestHelper.saveData(payload, CntNews.saveCallback);
                    break;
                case -1:
                    CommonHelper.showModalMsgBox("Error", "Please select mobile thumbnail.");
                    CommonHelper.enableControl($("#btnSubmit"), CntNews.save);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading mobile thumbnail image.");
                    CommonHelper.enableControl($("#btnSubmit"), CntNews.save);
                    break;
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), CntNews.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                CntNews.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), CntNews.save);
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

function SetTime(Jsondate) {
    var formattedDate = new Date(parseInt(Jsondate.substr(6)));
    var h = formattedDate.getHours();
    if (h < 10) {
        h = "0" + h;
    }
    var m = formattedDate.getMinutes();
    if (m < 10) {
        m = "0" + m;
    }

    var s = formattedDate.getSeconds();
    if (s < 10) {
        s = "0" + s;
    }
    return h + ":" + m + ":" + s;
}