$(document).ready(function () {
    WebCartHelper.showCartItems();
    WebCartHelper.showCartSummary();
});

var IsCartIntiated = false;
var WebCartHelper = function () {
    var PageUrl = WebNavHelper.getBaseUrl() + "Cart.aspx";
    return {
        init: function () {
            if (!IsCartIntiated) {
                $('header').addClass("bg-dark");
                IsCartIntiated = true;
            }
        },
        calcTotal: function () {
           // $("#cartItem")
        },
        showCartItems: function () {
            RequestHelper.post({
                url: PageUrl + '/ShowCartItems',
                data: ""
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divCartItems").html(result.DataObject);
                    $('.counter-plus').click(function () {
                        var fieldID = $(this).attr('field'),
                            fieldVal = parseInt($('input[name=' + fieldID + ']').val());
                        if (!isNaN(fieldVal)) {
                            if (fieldVal < 10) {
                                $('input[name=' + fieldID + ']').val(fieldVal + 1);
                                WebCartHelper.cartAddItem(fieldID, 1);
                            }
                        } else {
                            $('input[name=' + fieldID + ']').val(0);
                            WebCartHelper.cartRemoveItem(10);
                        }
                    });

                    $(".counter-minus").click(function () {
                        var fieldID = $(this).attr('field'),
                            fieldVal = parseInt($('input[name=' + fieldID + ']').val());

                        if (!isNaN(fieldVal) && fieldVal > 0) {
                            $('input[name=' + fieldID + ']').val(fieldVal - 1);
                            WebCartHelper.cartRemoveItem(fieldID, 1);
                        } else {
                            $('input[name=' + fieldID + ']').val(0);
                            WebCartHelper.cartRemoveItem(fieldID, 10);
                        }
                    });
                }
                else {
                    //CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Cart Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                //CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Cart Error", error.message, null);
            });
        },
        showCartSummary: function () {
            RequestHelper.post({
                url: PageUrl + '/ShowCartSummary',
                data: ""
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divCartSummary").html(result.DataObject);
                }
                else {
                    //CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Cart Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                //CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Cart Error", error.message, null);
            });
        },
        cartAddItem: function (configId, qty) {
            CommonCartHelper.addToCart(configId, qty, WebCartHelper.cartAddItemCallback);
        },
        cartAddItemCallback: function () {
            WebCartHelper.showCartItems();
            WebCartHelper.showCartSummary();
        },
        cartRemoveItem: function (configId, qty) {
            CommonCartHelper.removeCartItem(configId, qty, WebCartHelper.cartRemoveItemCallback);
        },
        cartRemoveItemCallback: function () {
            WebCartHelper.showCartItems();
            WebCartHelper.showCartSummary();
        },
        checkDetails: function () {
            RequestHelper.post({
                url: PageUrl + '/CheckDetails',
                data: ""
            }).then(result => {
                switch (result.ErrDescription.ErrorCode)
                {
                    case 0:
                        WebNavHelper.redirectToPageMain("checkout");
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
        },
    };
}();
