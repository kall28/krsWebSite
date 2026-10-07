$(document).ready(function () {
    WebProductLstHelper.init();
});

var IsProductLstIntiated = false;
var WebProductLstHelper = function () {
    var PageUrl = "ShopProductList.aspx";
    return {
        init: function () {
            if (!IsProductLstIntiated) {
                $('header').addClass("bg-dark");

                WebProductLstHelper.getSubscription();
                WebProductLstHelper.getCategories();
                WebProductLstHelper.getProducts();
                IsProductLstIntiated = true;
            }

        },
        getSubscription: function () {
            CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/getSubscription',
                data: "{'SubscriptionId': '" + ProdSubscriptionId + "' }"
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#LstSubscriptions").html(result.DataObject);
                    CommonHelper.hideProgress();
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Get Product Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Get Product Error", error.message, null);
            });
        },
        getCategories: function () {
            CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/getCategories',
                data: "{'CategoryId': '" + ProdCategoryId + "' }"
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#LstCategories").html(result.DataObject);
                    CommonHelper.hideProgress();
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Get Product Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Get Product Error", error.message, null);
            });
        },
        getProducts: function () {
            var SubscriptionId = 0;
            var CatLst = [];
            $.each($("input[name='chkCategory']:checked"), function () {
                CatLst.push($(this).val());
            });

            var priceRange = $("#txtPriceRange").val();
            priceRange = priceRange.replace(';', ',');

            CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/getProducts',
                data: "{'SubscriptionId': '" + SubscriptionId + "','strCatLst': '" + CatLst.join(",") + "','priceRange': '" + priceRange + "' }"
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divProductLst").html(result.DataObject);
                    CommonHelper.hideProgress();
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Get Product Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Get Product Error", error.message, null);
            });
        },

    };
}();