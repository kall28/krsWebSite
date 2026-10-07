$(document).ready(function () {
    WebPaymentHelper.init();    
});

var IsPaymentIntiated = false;
var WebPaymentHelper = function () {
    var PageUrl = WebNavHelper.getBaseUrl() + "Payments.aspx";
    return {
        init: function () {
            if (!IsPaymentIntiated) {
                $("#lnkBCHome").click(function () { WebNavHelper.redirectToPageMain("home"); });
                $("#lnkBCShop").click(function () { WebNavHelper.redirectToPageMain("products"); });
                $("#lnkCartNavCart").click(function () { WebNavHelper.redirectToPageMain("cart"); });
                $("#lnkCartNavDetails").click(function () { WebNavHelper.redirectToPageMain("checkout"); });
                $("#lnkCartNavShipping").click(function () { WebNavHelper.redirectToPageMain("shipping"); });
                $("#lnkBackToShipping").click(function () { WebNavHelper.redirectToPageMain("shipping"); });
                $("#lnkProceed").click(function () { WebShippingHelper.setShippingMethodSelected(); });
                $("#lnkBackToShippingMob").click(function () { WebNavHelper.redirectToPageMain("shipping"); });
                $("#lnkProceedMob").click(function () { WebShippingHelper.setAddressSelected(); });
                $("#btnPlaceOrderCOD").click(function () { WebPaymentHelper.processPayment("COD"); });
                IsPaymentIntiated = true;
            }
        },
        processPayment: function (payMode) {
            CommonHelper.showProgress();
            RequestHelper.post({
                url: PageUrl + '/ProcessPayment',
                data: "{ 'payMode': '" + payMode + "'}"
            }).then(result => {
                switch (result.ErrDescription.ErrorCode) {
                    case 0:
                        WebNavHelper.redirectToPageMain("processcod");
                        break;
                    case 201:
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Payment Error", "Your cart is empty. Please add products to continue.", null);
                        break;
                    case 202:
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Payment Error", "Your cart is empty. Please add products to continue.", null);
                        break;
                    case 203:
                        CommonHelper.hideProgress();
                        CommonPageHelper.showSigninModal();
                        break;
                    default:
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Payment Error", result.ErrDescription.ErrorMessage, null);
                        break;
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Payment Error", error.message, null);
            });
        },
    };
}();
