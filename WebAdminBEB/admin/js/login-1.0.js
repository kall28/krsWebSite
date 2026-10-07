/*
 *  Document   : login.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in Login page
 */

var Login = function() {

    // Function for switching form views (login, reminder and register forms)
    var switchView = function(viewHide, viewShow, viewHash){
        viewHide.slideUp(250);
        viewShow.slideDown(250, function(){
            $('input').placeholder();
        });

        if ( viewHash ) {
            window.location = '#' + viewHash;
        } else {
            window.location = '#';
        }
    };

    return {
        init: function() {
            /* Switch Login, Reminder and Register form views */
            var formLogin       = $('#form-login'),
                formReminder    = $('#form-reminder'),
                formRegister    = $('#form-register');

            $('#link-register-login').click(function(){
                switchView(formLogin, formRegister, 'register');
            });

            $('#link-register').click(function(){
                switchView(formRegister, formLogin, '');
            });

            $('#link-reminder-login').click(function(){
                switchView(formLogin, formReminder, 'reminder');
            });

            $('#link-reminder').click(function(){
                switchView(formReminder, formLogin, '');
            });

            // If the link includes the hashtag 'register', show the register form instead of login
            if (window.location.hash === '#register') {
                formLogin.hide();
                formRegister.show();
            }

            // If the link includes the hashtag 'reminder', show the reminder form instead of login
            if (window.location.hash === '#reminder') {
                formLogin.hide();
                formReminder.show();
            }

            $('#btnLogin').click(function () {
                Login.login();
                return false;
            });

            $('#btnResetPwd').click(function () {
                Login.resetPwd();
                return false;
            });
        },
        login: function () {
            if (Login.validate()) {
                var userName = $("#login-email").val();
                var pwd = $("#login-password").val();
                CommonHelper.showProgress();
                RequestHelper.post({
                    url: strBaseUrl + 'admin/Login.aspx/LoginRequest',
                    data: "{'userName': '" + userName + "', 'pwd':'" + pwd + "' }"
                }).then(result => {
                    if (result.ErrorCode === 0) {
                        CommonHelper.hideProgress();
                        WebNavHelper.redirectToPageMain("home");
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Login Error", result.ErrorMessage, null);
                    }                    
                }).catch(error => {
                    CommonHelper.showErrorMessage("Login Error", error.message, null);
                });
            }
        },
        resetPwd: function () {
            if (Login.validateResetPwd()) {
                var formData = new FormData();
                formData.append('mode', "ent-fgpwd");
                formData.append('userName', $("#reminder-email").val());
                CommonHelper.showProgress();
                $.ajax({
                    type: 'post',
                    url: strBaseUrl + 'handlers/ProcessAcc.ashx/ProcessRequest',
                    data: formData,
                    success: function (status) {
                        if (status === '0') {
                            CommonHelper.hideProgress();
                            CommonHelper.showErrorMessage("Password Reset",
                                "Password reset successfully! </br> Please check registered email address.", null);
                            $("#login-email").val($("#reminder-email").val());
                            $('#link-reminder').click();
                        }
                        else {
                            CommonHelper.hideProgress();
                            CommonHelper.showErrorMessage("Password Reset Error",
                                "Error while resetting password.</br> Please try again.", null);
                        }
                    },
                    processData: false,
                    contentType: false,
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        CommonHelper.showErrorMessage("Password Reset Error", err.Message);
                    }
                });
            }
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateEmailTextCtrl($("#login-email"), "Login Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#login-password"), "Password", "bottom")) { return false; }
            //CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        validateResetPwd: function () {
            if (!FormCtrlValidationHelper.validateEmailTextCtrl($("#reminder-email"), "Login Name", "bottom")) { return false; }
            return true;
        }
    };
}();