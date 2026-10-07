$(document).ready(function () {
    EntAuthor.init();
});

var IsEntAuthorInitiated = false;
var EntAuthor = function () {
    var PageUrl = "Authors.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            if (!IsEntAuthorInitiated) {
                $("#btnAdd").click(function () { EntAuthor.add(); });
                $("#btnSubmit").click(function () { EntAuthor.save(); });
                $("#btnBack").click(function () { EntAuthor.back(); });
                $("#btnBackTop").click(function () { EntAuthor.back(); });
                $("#fileUplThubnail").change(function () {
                    FileHelper.onImageSelect(this, 'imgThumbnailImage', 'hdnThumbnailFileName');
                });
                $("#imgThumbnailImage").click(function () {
                    $("#fileUplThubnail").click();
                    return false;
                });
                IsEntAuthorInitiated = true;
            }
            EntAuthor.search();            
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#hdnThumbnailFileName").val('');
            $('#imgThumbnailImage').attr('src', '');
            $("#txtTitle").val('');
            $("#txtDescription").val('');            
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, EntAuthor.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#hdnThumbnailFileName").val(data.Thumbnail);
            $('#imgThumbnailImage').attr('src', data.ThumbnailFullPath);
            $("#txtTitle").val(data.Title);
            $("#txtDescription").val(data.Description);
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
            $("#divMessage").html("");            
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            EntAuthor.clear();
            FormRequestHelper.addData(payload, EntAuthor.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", EntAuthor.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, EntAuthor.updateCallback);
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
            if (EntAuthor.validate()) {
                FileHelper.saveImageFile("fileUplThubnail", "ent-entity",
                    $("#hdnRef").val(), "hdnThumbnailFileName", EntAuthor.saveThumbnailcallback);
            }
        },
        saveThumbnailcallback: function (errorCode) {
            switch (errorCode) {
                case 0:
                    var payload = FormRequestPayloadHelper.saveDataPayload();
                    payload.url = PageUrl + "/Save";
                    payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                        + "', 'title' : '" + $("#txtTitle").val()
                        + "', 'description' : '" + CommonHelper.parseString($("#txtDescription").val())
                        + "', 'thumbnail' : '" + $("#hdnThumbnailFileName").val()
                        + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                        + "' }";
                    FormRequestHelper.saveData(payload, EntAuthor.saveCallback);
                    break;
                case -1:
                    CommonHelper.showModalMsgBox("Error", "Please select thumbnail.");
                    CommonHelper.enableControl($("#btnSubmit"), EntAuthor.save);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading image.");
                    CommonHelper.enableControl($("#btnSubmit"), EntAuthor.save);
                    break;
            }            
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                EntAuthor.search();
            }
            else {
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }
            CommonHelper.enableControl($("#btnSubmit"), EntAuthor.save);
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();