$(document).ready(function () {
    WebContactUs.init();
});

var IsContactUsInitiated = false;
var WebContactUs = function () {
    var PageUrl = WebNavHelper.getBaseUrl() + "ContactUs.aspx";
    return {
        init: function () {
            if (!IsContactUsInitiated) {
                $("#btnFBSubmit").click(function () { WebContactUs.feedBackSubmit(); }); 
                IsContactUsInitiated = true;
            }
            WebContactUs.clear();
        },
        clear: function () {
            $("#txtFBFullName").val('');
            $("#txtFBEmail").val('');
            $("#txtFBContactNo").val();
            $("#txtFBSubject").val();
            $("#txtFBMessage").val();
            $("#chkFBSubscribe").prop('checked', true);
        },
        validateFeedback: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtFBFullName"), "Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateEmailTextCtrl($("#txtFBEmail"), "Email", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtFBContactNo"), "Contact No", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtFBSubject"), "Subject", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtFBMessage"), "Message", "bottom")) { return false; }
            return true;
        },
        feedBackSubmit: function () {
            if (WebContactUs.validateFeedback()) {
                CommonHelper.showProgress();
                RequestHelper.post({
                    url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/UpdateUserFeedback',
                    data: "{'categoryCode': 'CUS', 'fullName': '" + $("#txtFBFullName").val()
                        + "', 'email': '" + $("#txtFBEmail").val()
                        + "', 'contactNo': '" + $("#txtFBContactNo").val()
                        + "' ,'subject': '" + $("#txtFBSubject").val()
                        + "' ,'message': '" + $("#txtFBMessage").val()
                        + "' ,'scubscribe': '" + ($('#chkFBSubscribe').is(":checked") ? 1 : 0) + "'}"
                }).then(result => {
                    if (result.ErrorCode === 0) {
                        WebContactUs.clear();
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Contact Us", "Thanks for sending mail.</br> We will contact you shortly.", null);
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Contact Us Error", result.ErrorMessage, null);
                    }
                }).catch(error => {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Contact Us Error", error.message, null);
                });
            }
        } 
    };
}();