/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */

var IsEcmFarmSubsInitiated = false;
var EcmFarmSubs = function () {
    var PageUrl = "FarmSubscriptions.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            if (!IsEcmFarmSubsInitiated) {
                $("#btnAdd").click(function () { EcmFarmSubs.add(); });
                $("#btnSubmit").click(function () { EcmFarmSubs.save(); });
                $("#btnBack").click(function () { EcmFarmSubs.back(); });
                $("#btnBackTop").click(function () { EcmFarmSubs.back(); });
                $("#fileUplThubnail").change(function () {
                    FileHelper.onImageSelect(this, 'imgThumbnailImage', 'hdnThumbnailFileName');
                });
                $("#imgThumbnailImage").click(function () {
                    $("#fileUplThubnail").click();
                    return false;
                });
                IsEcmFarmSubsInitiated = true;
            }   
            EcmFarmSubs.search();
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#hdnThumbnailFileName").val('');
            $('#imgThumbnailImage').attr('src', '');
            $("#txtTitle").val('');
            EcmRequestHelper.fillCategories($("#ddlCategoryEdit"), 0);
            $("#txtWeight").val('0');
            $("#txtPeriod").val('0');
            $("#txtNoOfTimes").val('0');
            $("#txtUnitPrice").val('0');
            $("#txtPrice").val('0');
            $("#txtDiscount").val('0');
            $("#txtOrderPrice").val('0');            
            $("#txtDescription").val('');
            $("#chkManageInventory").prop('checked', true);
            $("#txtStockQty").val('0');
            $("#txtMinStockQty").val('0'); 
            $("#chkIsAvailable").prop('checked', true);
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, EcmFarmSubs.searchCallback);
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
            $("#txtWeight").val(data.ProductDetails.Weight);
            $("#txtPeriod").val(data.ProductDetails.Period);            
            $("#txtNoOfTimes").val(data.ProductDetails.NoOfTimes);
            $("#txtUnitPrice").val(data.ProductDetails.UnitPrice);
            $("#txtPrice").val(data.ProductDetails.Price);
            $("#txtDiscount").val(data.ProductDetails.Discount);
            $("#txtOrderPrice").val(data.ProductDetails.OrderPrice);
            $("#txtDescription").val(data.ProductDetails.ShortDescription);
            $("#chkManageInventory").prop('checked', data.ProductDetails.ManageInventory === 1 ? true : false);
            $("#txtStockQty").val(data.ProductDetails.StockQty);
            $("#txtMinStockQty").val(data.ProductDetails.MinStockQty);
            $("#chkIsAvailable").prop('checked', data.ProductDetails.IsAvailable === 1 ? true : false);
            $("#chkStatus").prop('checked', data.ProductDetails.Status === 1 ? true : false);
            $("#divMessage").html("");
            $("#divModalSelList").html('');
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            EcmFarmSubs.clear();
            FormRequestHelper.addData(payload, EcmFarmSubs.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            EcmRequestHelper.fillCategories($("#ddlParentEdit"), 0);
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", EcmFarmSubs.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, EcmFarmSubs.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },        
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitle"), "Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlCategoryEdit"), "Category", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtWeight"), "Weight", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtPeriod"), "Period", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtNoOfTimes"), "No Of Times", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtUnitPrice"), "Unit Price", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtPrice"), "Price", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtDiscount"), "Discount", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtOrderPrice"), "Order Price", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (EcmFarmSubs.validate()) {
                FileHelper.saveImageFile("fileUplThubnail", "ecm-prod",
                    $("#hdnRef").val(), "hdnThumbnailFileName", EcmFarmSubs.saveThumbnailcallback);
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
                        + "', 'weight' : '" + $("#txtWeight").val()
                        + "', 'categoryId' : '" + $("#ddlCategoryEdit").val()
                        + "', 'period' : '" + $("#txtPeriod").val()
                        + "', 'noOfTimes' : '" + $("#txtNoOfTimes").val()
                        + "', 'unitPrice' : '" + $("#txtUnitPrice").val()
                        + "', 'discount' : '" + $("#txtDiscount").val()
                        + "', 'manageInv' : '" + ($('#chkManageInventory').is(":checked") ? 1 : 0)
                        + "', 'stockQty' : '" + $("#txtStockQty").val()
                        + "', 'minStockQty' : '" + $("#txtMinStockQty").val()
                        + "', 'isAvailable' : '" + ($('#chkIsAvailable').is(":checked") ? 1 : 0)
                        + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                        + "' }";
                    FormRequestHelper.saveData(payload, EcmFarmSubs.saveCallback);
                    break;
                case -1:
                    CommonHelper.showModalMsgBox("Error", "Please select thumbnail.");
                    CommonHelper.enableControl($("#btnSubmit"), EcmFarmSubs.save);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading image.");
                    CommonHelper.enableControl($("#btnSubmit"), EcmFarmSubs.save);
                    break;
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), EcmFarmSubs.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                EcmFarmSubs.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), EcmFarmSubs.save);
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }            
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();