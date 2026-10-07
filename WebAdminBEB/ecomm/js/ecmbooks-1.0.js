$(document).ready(function () {
    EcmBook.init();
});

var IsEcmBookInitiated = false;
var EcmBook = function () {
    var PageUrl = "Books.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            if (!IsEcmBookInitiated) {
                $("#btnAdd").click(function () { EcmBook.add(); });
                $("#btnSubmit").click(function () { EcmBook.save(); });
                $("#btnBack").click(function () { EcmBook.back(); });
                $("#btnBackTop").click(function () { EcmBook.back(); });
                $("#fileUplThubnail").change(function () {
                    FileHelper.onImageSelect(this, 'imgThumbnailImage', 'hdnThumbnailFileName');
                });
                $("#imgThumbnailImage").click(function () {
                    $("#fileUplThubnail").click();
                    return false;
                });
                IsEcmBookInitiated = true;
            }   
            EcmBook.search();
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#hdnThumbnailFileName").val('');
            $('#imgThumbnailImage').attr('src', '');
            $("#txtTitle").val('');
            EcmRequestHelper.fillCategories($("#ddlCategoryEdit"), 0);
            $("#txtAuthorNameEdit").val('');
            $("#hdntxtAuthorRefEdit").val('');
            $("#txtMarketPrice").val('0');
            $("#txtPrice").val('0');
            $("#txtDescription").val('');
            $("#txtPublishedDate").val('');
            $("#chkIsAvailable").prop('checked', true);
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, EcmBook.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));
        },
        show: function (data) {
            $("#hdnRef").val(data.ProductDetails.Id);
            $("#hdnThumbnailFileName").val(data.ProductDetails.Thumbnail);
            $('#imgThumbnailImage').attr('src', data.ProductDetails.ThumbnailFullPath);
            $("#txtTitle").val(data.ProductDetails.Title);
            var catId = data.Categories.length > 0 ? data.Categories[0].Id : 0;
            EcmRequestHelper.fillCategories($("#ddlCategoryEdit"), catId);
            $("#txtAuthorNameEdit").val(data.EntityConfigId.ConfigId.Title);
            $("#hdntxtAuthorRefEdit").val(data.EntityConfigId.ConfigId.Id);
            $("#txtMarketPrice").val(data.ProductDetails.Price);
            $("#txtPrice").val(data.ProductDetails.OrderPrice);
            $("#txtDescription").val(data.ProductDetails.ShortDescription);
            $("#txtPublishedDate").val(data.ProductDetails.PublishedDateDisp);
            $("#chkIsAvailable").prop('checked', data.ProductDetails.IsAvailable === 1 ? true : false);
            $("#chkStatus").prop('checked', data.ProductDetails.Status === 1 ? true : false);
            $("#divMessage").html("");
            $("#divModalSelList").html('');
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            EcmBook.clear();
            FormRequestHelper.addData(payload, EcmBook.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            EcmRequestHelper.fillCategories($("#ddlParentEdit"), 0);
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", EcmBook.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, EcmBook.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        searchModal: function () {
            var payload = FormRequestPayloadHelper.searchDataPayload();
            payload.url = PageUrl + "/SearchDataModal";
            payload.data = "";
            payload.ctrlList = "divModalSelList";
            FormRequestHelper.searchData(payload, EcmBook.searchModalCallback);
        },
        searchModalCallback: function () {
            CommonDatatableHelper.initBasic($("#tblListModal"));
            CommonHelper.showModalBox($("#divModalSel"));
        },
        selectModalVal: function (id, title) {
            $("#txtAuthorNameEdit").val(title);
            $("#hdntxtAuthorRefEdit").val(id);
            CommonHelper.hideModalBox($("#divModalSel"));
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitle"), "Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlCategoryEdit"), "Category", "bottom")) { return false; }
            if (CommonHelper.trim($("#hdntxtAuthorRefEdit").val()) === "" || parseInt($("#hdntxtAuthorRefEdit").val()) <= 0) { EcmBook.searchModal(); return false; }
            if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtMarketPrice"), "Market Price", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtPrice"), "Price", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtPublishedDate"), "Published Date", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (EcmBook.validate()) {
                FileHelper.saveImageFile("fileUplThubnail", "ecm-prod",
                    $("#hdnRef").val(), "hdnThumbnailFileName", EcmBook.saveThumbnailcallback);
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
                        + "', 'categoryId' : '" + $("#ddlCategoryEdit").val()
                        + "', 'entityId' : '" + $("#hdntxtAuthorRefEdit").val()                    
                        + "', 'marketPrice' : '" + $("#txtMarketPrice").val()
                        + "', 'price' : '" + $("#txtPrice").val()
                        + "', 'publishedDate' : '" + $("#txtPublishedDate").val()
                        + "', 'isAvailable' : '" + ($('#chkIsAvailable').is(":checked") ? 1 : 0)
                        + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                        + "' }";
                    FormRequestHelper.saveData(payload, EcmBook.saveCallback);
                    break;
                case -1:
                    CommonHelper.showModalMsgBox("Error", "Please select thumbnail.");
                    CommonHelper.enableControl($("#btnSubmit"), EcmBook.save);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading image.");
                    CommonHelper.enableControl($("#btnSubmit"), EcmBook.save);
                    break;
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), EcmBook.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                EcmBook.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), EcmBook.save);
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }            
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();