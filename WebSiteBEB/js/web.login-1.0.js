$(document).ready(function () {
    WebLogin.init();
});

var IsWebLoginInitiated = false;
var WebLogin = function () {
    var PageUrl = "Login.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divOTP', '#divEmail', '');
           
            if (!IsWebLoginInitiated) {
                $("#btnSubmit").click(function () { WebLogin.submit(); });
                $("#btnBack").click(function () { WebLogin.back(); });
                $("#btnResend").click(function () { WebLogin.resend(); });
                $("#btnSignin").click(function () { WebLogin.signin(); });
                IsWebLoginInitiated = true;
            }
            WebLogin.clear();
        },
        clear: function () {
            $("#txtEmail").val('');
            $("#txtPassword").val('');
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateEmailTextCtrl($("#txtEmail"), "Email", "bottom")) { return false; }
            return true;
        },
        submit: function () {
            if (WebLogin.validate()) {
                var userName = $("#txtEmail").val();
                CommonHelper.showProgress();
                RequestHelper.post({
                    url: WebNavHelper.getBaseUrl() + 'Login.aspx/OTPRequest',
                    data: "{'userName': '" + userName + "' }"
                }).then(result => {
                    if (result.ErrorCode === 0) {
                        CommonHelper.hideProgress();
                        WebLogin.submitCallback();
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Signin Error", result.ErrorMessage, null);
                    }
                }).catch(error => {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Signin Error", error.message, null);
                });
            }            
        },
        submitCallback: function () {
            CommonHelper.switchPanelView('#divEmail', '#divOTP', '');
        },
        resend: function () {
            var userName = $("#txtEmail").val();
            CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Login.aspx/OTPRequest',
                data: "{'userName': '" + userName + "' }"
            }).then(result => {
                if (result.ErrorCode === 0) {
                    CommonHelper.hideProgress();
                    CommonHelper.showModalMsgBox("Signin", "OTP Sent successfully.");
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Signin Error", result.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Signin Error", error.message, null);
            });
        },
        resendCallback: function () {
            CommonHelper.switchPanelView('#divEmail', '#divOTP', '');
        },
        validatePwd: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtPassword"), "OTP", "bottom")) { return false; }
            return true;
        },
        signin: function () {
            if (WebLogin.validatePwd()) {
                var userName = $("#txtEmail").val();
                var pwd = $("#txtPassword").val();
                CommonHelper.showProgress();
                RequestHelper.post({
                    url: WebNavHelper.getBaseUrl() + 'Login.aspx/LoginRequest',
                    data: "{'userName': '" + userName + "', 'pwd':'" + pwd + "' }"
                }).then(result => {
                    if (result.ErrorCode === 0) {
                        CommonHelper.hideProgress();
                        WebNavHelper.redirectToPageMain("profile");
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Signin Error", result.ErrorMessage, null);
                    }
                }).catch(error => {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Signin Error", error.message, null);
                });
            }              
        },
        signinCallback: function () {
            CommonHelper.switchPanelView('#divOTP', '#divEmail', '');
        },        
        back: function () {
            CommonHelper.switchPanelView('#divOTP', '#divEmail', '');
        }
    };
}();

