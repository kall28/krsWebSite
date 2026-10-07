/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var isAdmAppRoleMenusInitiated = false;
var AdmAppRoleMenus = function () {
    var PageUrl = "AppRoles.aspx";
    return {
        init: function (code, title) {
            if (!isAdmAppRoleMenusInitiated) {
                $("#btnSubmitL2").click(function () { AdmAppRoleMenus.save(); return false; });
                $("#btnBackL2").click(function () { AdmAppRoleMenus.back(); return false; });
                isAdmAppRoleMenusInitiated = true;
            }
            $("#hdnRef").val(code);
            $("#headerEditL2").html("<i class='fa fa-pencil'></i><strong>" + title + "</strong> - Rights");
            //$("#txtTitleEditP").val(title);
            //$("#lblTitleEditP").html(title);
            //$("#divFormEditL2").html("");
            //$("#divMessageL2").html("");
            this.update(code);
        },
        show: function (data) {
            $("#divFormEditL2").html(data);
        },
        update: function (code) {
            var payload = FormRequestPayloadHelper.updateDataPayload();
            payload.url = PageUrl + "/UpdateL2";
            payload.data = "{'code':'" + code.toString() + "'}";
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
            if (AdmAppRoleMenus.validate()) {
                var tags = [];

                $.each($("input[name='chkTag']:checked"), function () {
                    tags.push($(this).val());
                });
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/SaveL2";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'menus' : '" + tags.join(',') + "'}";
                FormRequestHelper.saveData(payload, AdmAppRoleMenus.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.showModalMsgBox("Sucess", msg);
                //AdmAppRoleMenus.back();
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

