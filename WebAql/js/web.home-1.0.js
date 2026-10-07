$(document).ready(function () {
    WebHome.init();
});

var IsWebHomeitiated = false;
var WebHome = function () {
    var PageUrl = "Home.aspx";
    return {
        init: function () {
            if (!IsWebHomeitiated) {
                $("#lnkBnnrShopNow1").click(function () { WebNavHelper.redirectToPageMain("products"); });
                $("#lnkBnnrShopNow2").click(function () { WebNavHelper.redirectToPageMain("products"); });
                $("#lnkHomeProdLoadMore").click(function () { WebNavHelper.redirectToPageMain("products"); }); 
                $("#lnkHomeViewBlogs").click(function () { WebNavHelper.redirectToPageMain("blogs"); }); 
                $("#lnkHomeViewRecipes").click(function () { WebNavHelper.redirectToPageMain("recipes"); }); 

                WebHome.getBestSellers();
                WebHome.getNewProduct();
                WebHome.getSubscriptions();
                WebHome.getBlogs();
                WebHome.getRecipes();
                IsWebHomeitiated = true;
            }
            
        },
        getBestSellers: function () {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/GetBestSellers',
                data: ""
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#BestProduct").html(result.DataObject);
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
        getNewProduct: function () {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/GetNewProduct',
                data: ""
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#NewProduct").html(result.DataObject);
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
        getSubscriptions: function () {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/GetSubscriptions',
                data: ""
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divSubscriptions").html(result.DataObject);
                    CommonHelper.hideProgress();
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Get Subscriptions Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Get Subscriptions Error", error.message, null);
            });
        },
        getRecipes: function () {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/GetRecipes',
                data: ""
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divRecipes").html(result.DataObject);
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
        getBlogs: function () {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/GetBlogs',
                data: ""
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divBlogs").html(result.DataObject);
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
        getInstaList: function () {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/getInstaList',
                data: ""
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#ContentPlaceHolder1_divInstaList").html(result.DataObject);
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
    };
}();