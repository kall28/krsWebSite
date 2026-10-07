/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var isEntEntityTypeTagTypeInitiated = false; 
var EntEntityTypeTagType = function () {
    var PageUrl = "EntityTypes.aspx";
    return {
        init: function (id, title) {
            if (!isEntEntityTypeTagTypeInitiated) {
                $("#btnSubmitL3").click(function () { EntEntityTypeTagType.save(); return false; });
                $("#btnBackL3").click(function () { EntEntityTypeTagType.back(); return false; });
                isEntEntityTypeTagTypeInitiated = true;
            }
            $("#hdnRef").val(id);
            $("#headerEditL3").html("<i class='fa fa-pencil'></i><strong>" + title + "</strong> - Tag Types");
            //$("#txtTitleEditP").val(title);
            //$("#lblTitleEditP").html(title);
            //$("#divFormEditL2").html("");
            //$("#divMessageL2").html("");
            EntEntityTypeTagType.update(id);
        },
        show: function (data) {
            $("#divFormEditL3").html(data);
        },
        update: function (id) {
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL3";
            payload.data = "{'code':'" + id.toString() + "'}";
            payload.showData = EntEntityTypeTagType.show;
            payload.ctrlHeader = "";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, EntEntityTypeTagType.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEditL3', 'Edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            return true;
        },
        save: function () {
            if (EntEntityTypeTagType.validate()) {
                var tagTypes = [];

                $.each($("input[name='chkTagType']:checked"), function () {
                    tagTypes.push($(this).val());
                });

                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/SaveL3";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'tagTypes' : '" + tagTypes.join(',') + "'}";
                FormRequestHelper.saveData(payload, EntEntityTypeTagType.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.showModalMsgBox("Sucess", msg);
                //EntEntityTypeTagType.back();
            }
            else {
                CommonHelper.showModalMsgBox("Error", msg);
            }
            //CommonHelper.enableControl($("#btnSubmitL2"), EntEntityTypeTagType.save);
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEditL3', '#divDataList', '');
        }
    };
}();

