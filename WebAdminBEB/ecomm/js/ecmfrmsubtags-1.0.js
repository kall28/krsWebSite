/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var isEcmFarmSubTagsInitiated = false;
var EcmFarmSubTags = function () {
    var PageUrl = "FarmSubscriptions.aspx";
    return {
        init: function (id, title) {
            if (!isEcmFarmSubTagsInitiated) {
                $("#btnSubmitL3").click(function () { EcmFarmSubTags.save(); return false; });
                $("#btnBackL3").click(function () { EcmFarmSubTags.back(); return false; });
                isEcmFarmSubTagsInitiated = true;
            }
            $("#hdnRef").val(id);
            $("#headerEditL3").html("<i class='fa fa-pencil'></i><strong>" + title + "</strong> - Tags");
            //$("#txtTitleEditP").val(title);
            //$("#lblTitleEditP").html(title);
            //$("#divFormEditL2").html("");
            //$("#divMessageL2").html("");
            EcmFarmSubTags.update(id);
        },
        show: function (data) {
            $("#divFormEditL3").html(data);
        },
        update: function (id) {
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL3";
            payload.data = "{'Id':'" + id.toString() + "'}";
            payload.showData = EcmFarmSubTags.show;
            payload.ctrlHeader = "";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, EcmFarmSubTags.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEditL3', 'Edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            return true;
        },
        save: function () {
            if (EcmFarmSubTags.validate()) {
                var tags = [];

                $.each($("input[name='chkTag']:checked"), function () {
                    tags.push($(this).val());
                });
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/SaveL3";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'tags' : '" + tags.join(',') + "'}";
                FormRequestHelper.saveData(payload, EcmFarmSubTags.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.showModalMsgBox("Sucess", msg);
                //EcmFarmSubTags.back();
            }
            else {
                CommonHelper.showModalMsgBox("Error", msg);
            }
            //CommonHelper.enableControl($("#btnSubmitL2"), EcmFarmSubTags.save);
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEditL3', '#divDataList', '');
        }
    };
}();

