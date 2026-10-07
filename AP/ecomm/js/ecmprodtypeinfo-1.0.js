/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var isEcmProdTypeInfoInitiated = false;
var EcmProdTypeInfo = function () {
    var PageUrl = "ProductTypes.aspx";
    return {
        init: function (id, title) {
            CommonHelper.switchPanelView('#divDataList', '#divDataListL2', '');
            if (!isEcmProdTypeInfoInitiated) {
                $("#btnAddL2").click(function () { EcmProdTypeInfo.add(); return false; });
                $("#btnSubmitL2").click(function () { EcmProdTypeInfo.save(); return false; });
                $("#btnBackL2").click(function () { EcmProdTypeInfo.back(); return false; });
                $("#btnBackTopL2").click(function () { EcmProdTypeInfo.back(); return false; });
                $("#btnBackToList").click(function () { EcmProdTypeInfo.backToList(); return false; });
                isEcmProdTypeInfoInitiated = true;
            }
            $("#hdnRef").val(id);
            $("#txtTitleEditP").val(title);
            $("#lblTitleP").html(title);
            $("#divMessageL2").html("");           
            this.search(id);
        },
        clear: function () {
            $("#hdnRefL2").val('');
            $("#txtCodeL2").val('');
            $("#txtCodeL2").removeAttr("disabled");
            $("#txtTitleL2").val('');
            $("#txtDescriptionL2").val('');
            $("#ddlInfoTypeL2").val('NTC');
            $("#txtMaxLengthL2").val('');
            $("#txtSortOrderL2").val('');
            $("#chkStatusL2").prop('checked', true);
            $("#divMessageL2").html("");
            CommonHelper.enableControl($("#btnSubmitL2"), EcmProdTypeInfo.save);
        },
        search: function (id) {
            var payload = FormRequestPayloadHelper.saveDataPayload();
            payload.url = PageUrl + "/SearchDataL2";
            payload.data = "{ 'code' : '"+ id +"' }";
            payload.ctrlList = "divListL2";
            FormRequestHelper.searchData(payload, this.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblListL2"));   
        },
        show: function (data) {
            $("#hdnRefL2").val(data.Id);
            $("#txtCodeL2").val(data.InfoCode);
            $("#txtCodeL2").attr("disabled", "disabled");
            $("#txtTitleL2").val(data.Title);
            $("#txtDescriptionL2").val(data.Description);
            $("#ddlInfoTypeL2").val(data.InfoType);
            $("#txtMaxLengthL2").val(data.MaxLength);
            $("#txtSortOrderL2").val(data.SortOrder);
            $("#chkStatusL2").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayload();
            payload.url = PageUrl + "/AddL2";
            payload.ctrlRef = "hdnRefL2";
            payload.ctrlHeader = "headerEditL2";
            this.clear();
            FormRequestHelper.addData(payload, this.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataEditL2', 'new');
            CommonHelper.hideProgress();
        },
        update: function (id) {
            this.clear();
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL2";
            payload.data = "{'Id':'" + id.toString() + "'}";
            payload.showData = this.show;
            payload.ctrlHeader = "headerEditL2";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, this.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataEditL2', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateCodeCtrl($("#txtCodeL2"), 4, "Info Code", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitleL2"), "Title", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtDescriptionL2"), "Description", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtMaxLengthL2"), "Max Length", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtSortOrderL2"), "Sort Order", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmitL2"));
            return true;
        },
        save: function () {
            if (EcmProdTypeInfo.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/SaveL2";
                payload.data = "{ 'refNo' : '" + $("#hdnRefL2").val()
                    + "', 'infoCode' : '" + $("#txtCodeL2").val()
                    + "', 'title' : '" + $("#txtTitleL2").val()
                    + "', 'description' : '" + $("#txtDescriptionL2").val()
                    + "', 'infoType' : '" + $("#ddlInfoTypeL2").val()
                    + "', 'maxlength' : '" + $("#txtMaxLengthL2").val()
                    + "', 'sortOrder' : '" + $("#txtSortOrderL2").val()
                    + "', 'refId' : '" + $("#hdnRef").val()
                    + "', 'status' : '" + ($('#chkStatusL2').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, EcmProdTypeInfo.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.showModalMsgBox("Sucess", msg);
                EcmProdTypeInfo.back();
                EcmProdTypeInfo.search($("#hdnRef").val());
            }
            else {
                CommonHelper.showMessagePanel($("#divMessageL2"), "fail", msg);
            }
            CommonHelper.enableControl($("#btnSubmitL2"), this.save);
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEditL2', '#divDataListL2', '');
        },
        backToList: function () {
            CommonHelper.switchPanelView('#divDataListL2', '#divDataList', '');
        }
    };
}();

