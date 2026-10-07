
var FormCtrlHelper = function () {
    return {
        isNumeric: function (event) {
            if (event.keyCode === 0 || event.keyCode === 46 || event.keyCode === 8 || event.keyCode === 9 ||
                event.keyCode === 27 || event.keyCode === 96 || event.keyCode === 97 ||
                // Allow: Ctrl+A
                (event.keyCode === 65 && event.ctrlKey === true) ||
                // Allow: Ctrl+C,Ctrl+V
                (event.keyCode === 67 && event.ctrlKey === true) || (event.keyCode === 86 && event.ctrlKey === true) ||
                // Allow: home, end, left, right
                (event.keyCode >= 35 && event.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
            }
            else {
                // Ensure that it is a number and stop the keypress
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) &&
                    (event.keyCode < 98 || event.keyCode > 105)) {
                    var ret = event.preventDefault();
                    //document.getElementById("error").style.display = ret ? "none" : "inline";
                    return ret;
                }
            }
        },
        restrictText: function (event) {
            if (event.charCode === 39 || event.charCode === 34) {
                event.keyCode = 0;
                return false;
            }
        },
        isCharacter: function (event) {
            var keyCode = event.keyCode === 0 ? event.charCode : event.keyCode;
            if ((keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122) ||
                (specialKeys.indexOf(event.keyCode) !== -1 && event.charCode !== event.keyCode)) {
                return true;
            }
            else {
                return false;
            }
            //document.getElementById("error").style.display = ret ? "none" : "inline";
        },
        isAlphaNumeric: function (event) {
            if (event.charCode === 33 || event.charCode === 34 || event.charCode === 35 ||
                event.charCode === 36 || event.charCode === 37 || event.charCode === 38 ||
                event.charCode === 39 || event.charCode === 40 || event.charCode === 41 ||
                event.charCode === 42 || event.charCode === 43 || event.charCode === 44 ||
                event.charCode === 45 || event.charCode === 46 || event.charCode === 47 ||
                event.charCode === 58 || event.charCode === 59 || event.charCode === 60 ||
                event.charCode === 61 || event.charCode === 62 || event.charCode === 63 ||
                event.charCode === 64 || event.charCode === 91 || event.charCode === 92 ||
                event.charCode === 93 || event.charCode === 94 || event.charCode === 95 ||
                event.charCode === 96 || event.charCode === 123 || event.charCode === 124 ||
                event.charCode === 125 || event.charCode === 126 || event.charCode === 127) {
                event.keyCode = 0;
                return false;
            }
        },
        isDecimal: function (ctrl) {
            $(ctrl).keypress(function (event) {
                if ((event.which !== 46 || $(this).val().indexOf('.') !== -1) &&
                    ((event.which < 48 || event.which > 57) &&
                        (event.which !== 0 && event.which !== 8))) {
                    event.preventDefault();
                }

                var text = $(this).val();

                if ((text.indexOf('.') !== -1) &&
                    (text.substring(text.indexOf('.')).length > 2) &&
                    (event.which !== 0 && event.which !== 8) &&
                    ($(this)[0].selectionStart >= text.length - 2)) {
                    event.preventDefault();
                }
            });
        }
    };
}();

var FormCtrlValidationHelper = function () {
    return {
        isValidNumber: function (value) {
            var re = /^[0-9]+$/;
            return re.test(value); 
            //var numflag = value.match(num);
            //if (numflag !== value) {
            //    return false;
            //}
            //return true;
        },                
        isValidMobileNo: function (ctrl) {
            var ctrlVal = CommonHelper.trim(ctrl.val());
            if (!FormCtrlValidationHelper.isValidNumber(ctrlVal)) {
                alert("Invalid Mobile");
                ctrl.val("");
                if (ctrl.type !== "textarea") {
                    ctrl.focus();
                }
                return false;
            }
            return true;
        },
        validateEmail: function (mailid) {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(mailid);
        },
        isValidEmail: function (ctrl) {
            var mailid = CommonHelper.trim(ctrl.val());
            if (!FormCtrlValidationHelper.validateEmail(mailid)) {
                alert("Invalid Email Id.");
                ctrl.val("");
                if (ctrl.type !== "textarea") {
                    ctrl.focus();
                }
                return false;
            }
            return true;
        },
        validateTextCtrl: function (ctrl, caption, toolTipPlacement) {
            if (CommonHelper.trim(ctrl.val()) === "") {
                ctrl.val('');
                ctrl.focus();
                CommonHelper.showToolTip(ctrl, "Please Enter " + caption, toolTipPlacement);
                return false;
            }
            return true;
        },
        validateNumericCtrl: function (ctrl, caption, toolTipPlacement) {
            if (CommonHelper.trim(ctrl.val()) === "") {
                ctrl.val('');
                ctrl.focus();
                CommonHelper.showToolTip(ctrl, "Please Enter " + caption, toolTipPlacement);
                return false;
            }

            if (!FormCtrlValidationHelper.isValidNumber(ctrl.val())) {
                ctrl.focus();
                CommonHelper.showToolTip(ctrl, "Please Enter valid " + caption, toolTipPlacement);
                return false;
            }
            return true;
        },
        validateCodeCtrl: function (ctrl, len, caption, toolTipPlacement) {
            if (CommonHelper.trim(ctrl.val()) === "") {
                ctrl.val('');
                ctrl.focus();
                CommonHelper.showToolTip(ctrl, "Please Enter " + caption, toolTipPlacement);
                return false;
            }
            else {
                if (CommonHelper.trim(ctrl.val()).length !== len) {
                    ctrl.val('');
                    ctrl.focus();
                    CommonHelper.showToolTip(ctrl, "Please Enter valid" + caption, toolTipPlacement);
                    return false;
                }
            }
            return true;
        },
        validateEmailTextCtrl: function (ctrl, caption, toolTipPlacement) {
            if (CommonHelper.trim(ctrl.val()) === "") {
                ctrl.val('');
                ctrl.focus();
                CommonHelper.showToolTip(ctrl, "Please Enter " + caption, toolTipPlacement);
                return false;
            }
            else {
                if (!this.validateEmail(ctrl.val())) {
                    ctrl.val('');
                    ctrl.focus();
                    CommonHelper.showToolTip(ctrl, "Please Enter proper " + caption, toolTipPlacement);
                    return false;
                }
            }
            return true;
        },
        validateSelectCtrl: function (ctrl, caption, toolTipPlacement) {
            if (ctrl.find(":selected").index() <= 0) {
                ctrl.focus();
                CommonHelper.showToolTip(ctrl, "Please Select " + caption, toolTipPlacement);
                return false;
            }
            return true;
        }
    };
}();

