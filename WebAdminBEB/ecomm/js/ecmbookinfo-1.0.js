/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var isEcmBookInfoInitiated = false;
var EcmBookInfo = function () {
    var PageUrl = "Books.aspx";
    return {
        init: function (id, title) {
            if (!isEcmBookInfoInitiated) {
                $("#btnSubmitL2").click(function () { EcmBookInfo.save(); return false; });
                $("#btnBackL2").click(function () { EcmBookInfo.back(); return false; });
                isEcmBookInfoInitiated = true;
            }
            $("#hdnRef").val(id);
            $("#headerEditL2").html("<i class='fa fa-pencil'></i><strong>" + title + "</strong> - Additional Details");
            //$("#txtTitleEditP").val(title);
            //$("#lblTitleEditP").html(title);
            //$("#divFormEditL2").html("");
            $("#divMessageL2").html("");
            EcmBookInfo.update(id);
        },
        show: function (data) {
            $("#divFormEditL2").html(data);
        },
        update: function (id) {
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL2";
            payload.data = "{'Id':'" + id.toString() + "'}";
            payload.showData = EcmBookInfo.show;
            payload.ctrlHeader = "";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, EcmBookInfo.updateCallback);
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
            if (EcmBookInfo.validate(infoCode, infoType)) {
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
                FormRequestHelper.saveData(payload, EcmBookInfo.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.showModalMsgBox("Sucess", msg);
                //EcmBookInfo.back();
            }
            else {
                CommonHelper.showModalMsgBox("Error", msg);
            }
            //CommonHelper.enableControl($("#btnSubmitL2"), EcmBookInfo.save);
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEditL2', '#divDataList', '');
        }
    };
}();

