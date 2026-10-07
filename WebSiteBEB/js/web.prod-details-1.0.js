$(document).ready(function () {
    WebProductDetHelper.init();
});

var IsProductDetIntiated = false;
var WebProductDetHelper = function () {
    var PageUrl = "ProductDetails.aspx";
    return {
        init: function () {
            if (!IsProductDetIntiated) {
                $("#lnkBCHome").click(function () { WebNavHelper.redirectToPageMain("home"); });
                $("#lnkBCShop").click(function () { WebNavHelper.redirectToPageMain("products"); });
                IsProductDetIntiated = true;
            }
        },
        prodAddToCartQty: function (configId) {
            let qty = parseInt($("#ddlProdQty").val());
            CommonCartHelper.addToCart(configId, qty, WebProductDetHelper.prodAddToCartCallback);
        },
        prodAddToCartCallback: function () {
            CommonHelper.showToast("Cart", "Your product added to cart.", 2000);
            CommonPageHelper.showCartItemCount();
            CommonPageHelper.showCartTotal();
            CommonPageHelper.refreshCartDetails();
        },
    };
}();