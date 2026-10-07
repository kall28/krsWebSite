/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsCntRecipeInitiated = false;
var CntRecipe = function () {
    var PageUrl = "Recipe.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            CntRecipe.search();
            if (!IsCntRecipeInitiated) {
                $("#btnAdd").click(function () { CntRecipe.add(); });
                $("#btnSubmit").click(function () { CntRecipe.save(); });
                $("#btnBack").click(function () { CntRecipe.back(); });
                $("#btnBackTop").click(function () { CntRecipe.back(); });
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

                IsCntRecipeInitiated = true;
            }
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
            FormRequestHelper.searchData(payload, CntRecipe.searchCallback);
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
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            CntRecipe.clear();
            FormRequestHelper.addData(payload, CntRecipe.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", CntRecipe.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, CntRecipe.updateCallback);
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
            if (CntRecipe.validate()) {
                FileHelper.saveImageFile("fileUplBanner", "cnt-postbanner",
                    $("#hdnRef").val(), "hdnBannerFileName", CntRecipe.saveIconcallback);
            }
        },
        saveIconcallback: function (errorCode) {
            switch (errorCode) {
                case 0:
                    FileHelper.saveImageFile("fileUplThubnail", "cnt-postthumb",
                        $("#hdnRef").val(), "hdnThumbnailFileName", CntRecipe.saveThumbnailcallback);
                    break;
                case -1:
                    CommonHelper.showModalMsgBox("Error", "Please select Icon.");
                    CommonHelper.enableControl($("#btnSubmit"), CntRecipe.save);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading Icon.");
                    CommonHelper.enableControl($("#btnSubmit"), CntRecipe.save);
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
                        + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                        + "' }";
                    FormRequestHelper.saveData(payload, CntRecipe.saveCallback);
                    break;
                case -1:
                    CommonHelper.showModalMsgBox("Error", "Please select thumbnail.");
                    CommonHelper.enableControl($("#btnSubmit"), CntRecipe.save);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading thumbnail.");
                    CommonHelper.enableControl($("#btnSubmit"), CntRecipe.save);
                    break;
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), CntRecipe.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                CntRecipe.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), CntRecipe.save);
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