/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var isAdmUserMenusInitiated = false;
var AdmUserMenus = function () {
    var PageUrl = "AdminUsers.aspx";
    return {
        init: function (configId, title) {
            if (!isAdmUserMenusInitiated) {
                $("#btnSubmitL2").click(function () { AdmUserMenus.save(); return false; });
                $("#btnBackL2").click(function () { AdmUserMenus.back(); return false; });
                isAdmUserMenusInitiated = true;
            }
            $("#hdnRef").val(configId);
            $("#headerEditL2").html("<i class='fa fa-pencil'></i><strong>" + title + "</strong> - Rights");
            //$("#txtTitleEditP").val(title);
            //$("#lblTitleEditP").html(title);
            //$("#divFormEditL2").html("");
            //$("#divMessageL2").html("");
            this.update(configId);
        },
        show: function (data) {
            $("#divFormEditL2").html(data);
        },
        update: function (configId) {
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL2";
            payload.data = "{'configId':'" + configId.toString() + "'}";
            payload.showData = this.show;
            payload.ctrlHeader = "";
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, this.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEditL2', 'Edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            return true;
        },
        save: function () {
            if (AdmUserMenus.validate()) {
                var tags = [];

                $.each($("input[name='chkTag']:checked"), function () {
                    tags.push($(this).val());
                });
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/SaveL2";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'menus' : '" + tags.join(',') + "'}";
                FormRequestHelper.saveData(payload, AdmUserMenus.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.showModalMsgBox("Sucess", msg);
                //AdmUserMenus.back();
            }
            else {
                CommonHelper.showModalMsgBox("Error", msg);
            }
            //CommonHelper.enableControl($("#btnSubmitL2"), this.save);
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEditL2', '#divDataList', '');
        }
    };
}();

