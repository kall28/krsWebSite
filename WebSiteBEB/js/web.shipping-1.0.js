$(document).ready(function () {
    WebShippingHelper.init();    
});

var IsShippingIntiated = false;
var WebShippingHelper = function () {
    var PageUrl = WebNavHelper.getBaseUrl() + "Shipping.aspx";
    return {
        init: function () {
            if (!IsShippingIntiated) {
                $("#lnkBCHome").click(function () { WebNavHelper.redirectToPageMain("home"); });
                $("#lnkBCShop").click(function () { WebNavHelper.redirectToPageMain("products"); });
                $("#lnkCartNavCart").click(function () { WebNavHelper.redirectToPageMain("cart"); });
                $("#lnkCartNavDetails").click(function () { WebNavHelper.redirectToPageMain("checkout"); });  
                $("#lnkBackToDetails").click(function () { WebNavHelper.redirectToPageMain("checkout"); });
                $("#lnkProceed").click(function () { WebShippingHelper.setShippingMethodSelected(); });
                $("#lnkBackToDetailsMob").click(function () { WebNavHelper.redirectToPageMain("checkout"); });
                $("#lnkProceedMob").click(function () { WebShippingHelper.setAddressSelected(); });
                WebShippingHelper.showShippingMethods();
                $("#lnkAddAddress").click(function () { WebShippingHelper.addAddress(); });

                $("input[name='chkAdd']").on('click', function () {
                    $("input[name='chkAdd']").not(this).prop('checked', false);
                });

                IsShippingIntiated = true;
            }
        },
        calcTotal: function () {
           // $("#cartItem")
        },
        showShippingMethods: function () {
            RequestHelper.post({
                url: PageUrl + '/ShowShippingMethods',
                data: ""
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divShippingMethod").html(result.DataObject);
                }
                else {
                    //CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Shipping Method Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                //CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Shipping Method Error", error.message, null);
            });
        },
        setShippingMethodSelected: function () {
            var plans = [];

            $.each($("input[name='rdbShipping']:checked"), function () {
                plans.push($(this).val());
            });

            if (plans.length > 0) {
                RequestHelper.post({
                    url: PageUrl + '/SetShippingMethod',
                    data: "{ 'planId': '" + plans[0] + "'}"
                }).then(result => {
                    switch (result.ErrDescription.ErrorCode) {
                        case 0:
                            WebNavHelper.redirectToPageMain("payment");
                            break;
                        case 201:
                            CommonHelper.showErrorMessage("Cart Error", "Your cart is empty. Please add products to continue.", null);
                            break;
                        case 202:
                            CommonHelper.showErrorMessage("Cart Error", "Your cart is empty. Please add products to continue.", null);
                            break;
                        case 203:
                            CommonPageHelper.showSigninModal();
                            break;
                        default:
                            CommonHelper.showErrorMessage("Cart Error", result.ErrDescription.ErrorMessage, null);
                            break;
                    }
                }).catch(error => {
                    //CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Cart Error", error.message, null);
                });
            }
            else {
                CommonHelper.showErrorMessage("Cart Error", "Please select address.", null);
            }
        },
    };
}();
