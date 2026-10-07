/*
 *  Document   : web.main-1.0.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in Login page
 */

$(document).ready(function () {
    WebMain.init();
});

var WebMain = function() {
    return {
        init: function() {
            $('#btnSavePwd').click(function () {
                WebMain.changePwd();
                return false;
            });
        },
        changePwd: function () {
            if (WebMain.validateChangePwd()) {
                CommonHelper.hideModalBox($("#modal-user-settings"));
                var formData = new FormData();
                formData.append('mode', "ent-chpwd");
                formData.append('pwd', $("#txtPwd").val());
                formData.append('newpwd', $("#txtNewPwd").val());
                CommonHelper.showProgress();
                $.ajax({
                    type: 'post',
                    url: strBaseUrl + 'handlers/ProcessAcc.ashx/ProcessRequest',
                    data: formData,
                    success: function (status) {
                        if (status === '0') {
                            CommonHelper.hideProgress();
                            CommonHelper.showErrorMessage("Change Password",
                                "Password changed successfully!</br>Please login.", WebMain.changePwdCallback);
                        }
                        else {
                            CommonHelper.hideProgress();
                            CommonHelper.showErrorMessage("Change Password Error",
                                status, null);
                        }
                    },
                    processData: false,
                    contentType: false,
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        CommonHelper.showErrorMessage("Change Password Error", err.Message);
                    }
                });
            }
        },
        validateChangePwd: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtPwd"), "Password", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtNewPwd"), "New Password", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtNewPwdRe"), "Confirm Password", "bottom")) { return false; }
            if ($("#txtNewPwd").val() !== $("#txtNewPwdRe").val()) {
                $("#txtNewPwdRe").val('');
                $("#txtNewPwdRe").focus();
                CommonHelper.showToolTip($("#txtNewPwdRe"), "New password and confirm password not matching", "bottom");
                return false;
            }
            return true;
        },
        changePwdCallback: function () {
            WebNavHelper.redirectToPageMain('logout');
        }
    };
}();