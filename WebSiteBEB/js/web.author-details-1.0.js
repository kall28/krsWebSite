$(document).ready(function () {
    WebAuthorDetHelper.init();
});

var IsAuthorDetIntiated = false;
var WebAuthorDetHelper = function () {
    var PageUrl = "AuthorDetails.aspx";
    return {
        init: function () {
            if (!IsAuthorDetIntiated) {
                $("#lnkBCHome").click(function () { WebNavHelper.redirectToPageMain("home"); });
                $("#lnkBCAuthors").click(function () { WebNavHelper.redirectToPageMain("authors"); });
                IsAuthorDetIntiated = true;
            }
        },
        prodAddToCartQty: function (configId) {
            let qty = parseInt($("#ddlProdQty").val());
            CommonCartHelper.addToCart(configId, qty, WebAuthorDetHelper.prodAddToCartCallback);
        },
        prodAddToCartCallback: function () {
            CommonHelper.showToast("Cart", "Your product added to cart.", 2000);
            CommonPageHelper.showCartItemCount();
            CommonPageHelper.showCartTotal();
            CommonPageHelper.refreshCartDetails();
        },
    };
}();