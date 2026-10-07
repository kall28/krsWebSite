$(document).ready(function () {
    WebResetPwd.init();
});

var IsResetPwdInitiated = false;
var WebResetPwd = function () {
    var PageUrl = WebNavHelper.getBaseUrl() + "PasswordRecovery.aspx";
    return {
        init: function () {
            if (!IsResetPwdInitiated) {
                CommonHelper.switchPanelView("#divFPVerify", "#divFP");
                $("#btnFPSubmit").click(function () { WebResetPwd.initResetPwd(); });
                $("#btnFPVerSubmit").click(function () { WebResetPwd.verifyOTP(); });
                $("#btnFPVerResend").click(function () { WebResetPwd.resendOTP(); });
                $("#btnFPResetSubmit").click(function () { WebResetPwd.resetPwd(); });
                $("#btnFPCrfm").click(function () { CommonPageHelper.showSigninModal(); });   
                IsResetPwdInitiated = true;
            }
            WebResetPwd.clear();
        },
        clear: function () {
            $("#txtFPUserName").val('');
            $("#txtFPVerOTP").val('');
            $("#txtFPResetPwd").val();
            $("#txtFPResetPwdCrfm").val();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateEmailTextCtrl($("#txtFPUserName"), "Email", "bottom")) { return false; }
            return true;
        },
        initResetPwd: function () {
            if (WebResetPwd.validate()) {
                CommonHelper.showProgress();
                RequestHelper.post({
                    url: PageUrl + '/InitResetPwdRequest',
                    data: "{'userName': '" + $("#txtFPUserName").val() + "' }"
                }).then(result => {
                    if (result.ErrDescription.ErrorCode === 0) {
                        CommonHelper.hideProgress();
                        WebResetPwd.initResetPwdCallback();
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Reset Password Error", result.ErrDescription.ErrorMessage, null);
                    }
                }).catch(error => {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Reset Password Error", error.message, null);
                });
            }
        },
        initResetPwdCallback: function () {
            CommonHelper.switchPanelView('#divFP', '#divFPVerify', '');
        },
        validateVerifyOTP: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtFPVerOTP"), "OTP", "bottom")) { return false; }
            return true;
        },
        verifyOTP: function () {
            if (WebResetPwd.validateVerifyOTP()) {
                CommonHelper.showProgress();
                RequestHelper.post({
                    url: PageUrl + '/ValidateOTP',
                    data: "{'userName': '" + $("#txtFPUserName").val()
                        + "','otp': '" + $("#txtFPVerOTP").val() + "' }"
                }).then(result => {
                    if (result.ErrorCode === 0) {
                        CommonHelper.hideProgress();
                        WebResetPwd.verifyOTPCallback();
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Reset Password Error", result.ErrorMessage, null);
                    }
                }).catch(error => {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Reset Password Error", error.message, null);
                });
            }
        },
        verifyOTPCallback: function () {
            CommonHelper.switchPanelView('#divFPVerify', '#divFPResetPwd', '');
        },
        resendOTP: function () {
            CommonHelper.showProgress();
            RequestHelper.post({
                url: PageUrl + '/OTPRequestResend',
                data: "{'userName': '" + $("#txtFPUserName").val() + "' }"
            }).then(result => {
                if (result.ErrorCode === 0) {
                    CommonHelper.hideProgress();
                    CommonHelper.showModalMsgBox("Reset Password", "OTP Sent successfully.");
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Reset Password Error", result.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Reset Password Error", error.message, null);
            });
        },
        validateResetPwd: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtFPResetPwd"), "Password", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtFPResetPwdCrfm"), "Confirm Password", "bottom")) { return false; }
            if ($("#txtFPResetPwd").val() !== $("#txtFPResetPwdCrfm").val()) { CommonHelper.showToolTip($("#txtFPResetPwdCrfm"), "Confirm password mismatch.", "bottom"); return false; }
            return true;
        },
        resetPwd: function () {
            if (WebResetPwd.validateResetPwd()) {
                var userName = $("#txtFPUserName").val();
                var pwd = $("#txtFPResetPwd").val();
                CommonHelper.showProgress();
                RequestHelper.post({
                    url: PageUrl + '/ResetPwdRequest',
                    data: "{'userName': '" + userName + "', 'pwd':'" + pwd + "' }"
                }).then(result => {
                    if (result.ErrorCode === 0) {
                        CommonHelper.hideProgress();
                        WebResetPwd.resetPwdCallback();
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Sign Up Error", result.ErrorMessage, null);
                    }
                }).catch(error => {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Sign Up Error", error.message, null);
                });
            } 
        },
        resetPwdCallback: function () {
            CommonHelper.switchPanelView('#divFPResetPwd', '#divFpCrfm', '');
        }, 
    };
}();