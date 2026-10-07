/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsEntEntityInfoInitiated = false;
var EntEntityInfo = function () {
    var PageUrl = "Authors.aspx";
    return {
        init: function (id, title) {
            if (!IsEntEntityInfoInitiated) {
                $("#btnSubmitL2").click(function () { EntEntityInfo.save(); return false; });
                $("#btnBackL2").click(function () { EntEntityInfo.back(); return false; });
                IsEntEntityInfoInitiated = true;
            }
            $("#hdnRef").val(id);
            $("#headerEditL2").html("<i class='fa fa-pencil'></i><strong>" + title + "</strong> - Additional Details");
            //$("#txtTitleEditP").val(title);
            //$("#lblTitleEditP").html(title);
            //$("#divFormEditL2").html("");
            $("#divMessageL2").html("");
            EntEntityInfo.update(id);
        },
        show: function (data) {
            $("#divFormEditL2").html(data);
        },
        update: function (id) {
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL2";
            payload.data = "{'Id':'" + id.toString() + "'}";
            payload.showData = EntEntityInfo.show;
            payload.ctrlHeader = "";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, EntEntityInfo.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEditL2', 'Edit');
            CommonHelper.hideProgress();
        },
        validate: function (infoCode, infoType) {
            switch (infoType) {
                case "LTC":
                    //var valLTC = eval("CKEDITOR.instances.txtProdInfoL2_" + infoCode).getData();
                    //valLTC = valLTC.substring(3, valLTC.length - 5);
                    //alert(valLTC);
                    break;
                default:
                    if (!FormCtrlValidationHelper.validateTextCtrl($("#txtProdInfoL2_" + infoCode),
                        "Value", "bottom")) { return false; }
                    break;
            }
            //CommonHelper.disableControl($("#btnSubmitL2_" + infoCode));
            return true;
        },
        save: function (infoCode, infoType) {
            if (EntEntityInfo.validate(infoCode, infoType)) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/SaveL2";
                switch (infoType) {
                    case 'LTC':
                        var valLTC = eval("CKEDITOR.instances.txtProdInfoL2_" + infoCode).getData();
                        //valLTC = valLTC.substring(3, valLTC.length - 5);
                        payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                            + "', 'infoCode' : '" + infoCode
                            + "', 'infoValue' : '" + valLTC
                            + "', 'refId' : '" + "0"
                            + "', 'status' : '" + ($('#chkStatusL2_' + infoCode).is(":checked") ? 1 : 0)
                            + "' }";
                        break;
                    default:
                        var strValue = JSON.stringify($("#txtProdInfoL2_" + infoCode).val());
                        payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                            + "', 'infoCode' : '" + infoCode
                            + "', 'infoValue' : '" + strValue
                            + "', 'refId' : '" + "0"
                            + "', 'status' : '" + ($('#chkStatusL2_' + infoCode).is(":checked") ? 1 : 0)
                            + "' }";
                        break;
                }
                FormRequestHelper.saveData(payload, EntEntityInfo.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.showModalMsgBox("Sucess", msg);
                //EntEntityInfo.back();
            }
            else {
                CommonHelper.showModalMsgBox("Error", msg);
            }
            //CommonHelper.enableControl($("#btnSubmitL2"), EntEntityInfo.save);
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEditL2', '#divDataList', '');
        }
    };
}();

