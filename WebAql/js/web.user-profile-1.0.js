$(document).ready(function () {
    UserProfile.init();
});


var IsProfileInitiated = false;
var UserProfile = function () {
    var PageUrl = "UserProfile.aspx";
    return {
        init: function () {
            if (!IsProfileInitiated) {
                IsProfileInitiated = true;
                UserProfile.getCurrentOdr();
            }
        },
        getCurrentOdr: function () {
            //  var status = 1;
            CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'UserProfile.aspx/getCurrentOdr',
                // data: "{'status': '" + status + "' }"
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#order").addClass("active");
                    $("#odrHistory").removeClass("active");
                    $("#profile").removeClass("active");
                    $("#divCurrentOdrList").html(result.DataObject);
                    $("#divProfile").hide();
                    $("#divOdrHistory").hide();
                    $("#divCurrentOdr").show();

                    // CommonHelper.switchPanelView('#divProfile', '#divCurrentOdr', '');
                    // UserProfile.getBookingCallback();
                    CommonHelper.hideProgress();
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Order Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Order Error", error.message, null);
            });

        },
        getOdrHistory: function () {
            var status = $("#ddlOdrLstStatus").val();
            CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'UserProfile.aspx/getOdrHistory',
                data: "{'status': '" + status + "' }"
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#odrHistory").addClass("active");
                    $("#order").removeClass("active");
                    $("#profile").removeClass("active");
                    $("#divOdrHistoryList").html(result.DataObject);
                    $("#divProfile").hide();
                    $("#divCurrentOdr").hide();
                    $("#divOdrHistory").show();
                    // CommonHelper.switchPanelView('#divProfile', '#divOdrHistory', '');
                    // UserProfile.getBookingCallback();
                    CommonHelper.hideProgress();
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Order History Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Order History Error", error.message, null);
            });

        },
        getProfile: function () {
            $("#odrHistory").removeClass("active");
            $("#order").removeClass("active");
            $("#profile").addClass("active");
            $("#divProfile").show();
            $("#divCurrentOdr").hide();
            $("#divOdrHistory").hide();
        },
        cancelOdr: function (orderId) {
            CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'UserProfile.aspx/cancelOdr',
                data: "{'orderId': '" + orderId + "' }"
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#ddlOdrLstStatus").val(2);
                    UserProfile.getOdrHistory();
                    CommonHelper.showErrorMessage("Cancel Order Confirmation", "Order cancel Successfully.", null);

                    // CommonHelper.switchPanelView('#divProfile', '#divOdrHistory', '');
                    // UserProfile.getBookingCallback();
                    CommonHelper.hideProgress();
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Cancle Order Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Cancle Order Error", error.message, null);
            });

        }

    };
}();
