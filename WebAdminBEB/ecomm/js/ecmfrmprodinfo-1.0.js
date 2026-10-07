/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var isEcmFarmProdInfoInitiated = false;
var EcmFarmProdInfo = function () {
    var PageUrl = "FarmProducts.aspx";
    return {
        init: function (id, title) {
            if (!isEcmFarmProdInfoInitiated) {
                $("#btnSubmitL2").click(function () { EcmFarmProdInfo.save(); return false; });
                $("#btnBackL2").click(function () { EcmFarmProdInfo.back(); return false; });
                isEcmFarmProdInfoInitiated = true;
            }
            $("#hdnRef").val(id);
            $("#headerEditL2").html("<i class='fa fa-pencil'></i><strong>" + title + "</strong> - Additional Details");
            //$("#txtTitleEditP").val(title);
            //$("#lblTitleEditP").html(title);
            //$("#divFormEditL2").html("");
            $("#divMessageL2").html("");
            EcmFarmProdInfo.update(id);
        },
        show: function (data) {
            $("#divFormEditL2").html(data);
        },
        update: function (id) {
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL2";
            payload.data = "{'Id':'" + id.toString() + "'}";
            payload.showData = EcmFarmProdInfo.show;
            payload.ctrlHeader = "";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, EcmFarmProdInfo.updateCallback);
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
            if (EcmFarmProdInfo.validate(infoCode, infoType)) {
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
                        var strValue = CommonHelper.parseString($("#txtProdInfoL2_" + infoCode).val());
                        payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                            + "', 'infoCode' : '" + infoCode
                            + "', 'infoValue' : '" + CommonHelper.parseString(strValue)
                            + "', 'refId' : '" + "0"
                            + "', 'status' : '" + ($('#chkStatusL2_' + infoCode).is(":checked") ? 1 : 0)
                            + "' }";
                        break;
                }
                FormRequestHelper.saveData(payload, EcmFarmProdInfo.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.showModalMsgBox("Sucess", msg);
                //EcmFarmProdInfo.back();
            }
            else {
                CommonHelper.showModalMsgBox("Error", msg);
            }
            //CommonHelper.enableControl($("#btnSubmitL2"), EcmFarmProdInfo.save);
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEditL2', '#divDataList', '');
        }
    };
}();

