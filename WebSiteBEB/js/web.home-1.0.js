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
                $("#lnkHomeNewArrivalLoadMore").click(function () { WebNavHelper.redirectToPageMain("products"); });
                $("#lnkHomeBestSellingLoadMore").click(function () { WebNavHelper.redirectToPageMain("products"); });
                $("#lnkHomeAllAuthors").click(function () { WebNavHelper.redirectToPageMain("authors"); });
                $("#lnkHomeViewRecipes").click(function () { WebNavHelper.redirectToPageMain("recipes"); });

                WebHome.getBestSellers();
                WebHome.getNewProduct();
                WebHome.showAuthorDetails();

                $("#ddlFilterCategories").change(function () {
                    WebHome.getBestSellers();
                    WebHome.getNewProduct();
                });

                $("#ddlFilterLanguages").change(function () {
                    WebHome.getBestSellers();
                    WebHome.getNewProduct();
                });
                IsWebHomeitiated = true;
            }            
        },
        getBestSellers: function () {
            //CommonHelper.showProgress();
            var tagId = $("#ddlFilterLanguages").val();
            var catId = $("#ddlFilterCategories").val();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/GetBestSellers',
                data: "{ 'tagId': " + tagId + ", 'catId':" + catId + " }"
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divBestProduct").html(result.DataObject);
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
            var tagId = $("#ddlFilterLanguages").val();
            var catId = $("#ddlFilterCategories").val();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/GetNewProduct',
                data: "{ 'tagId': " + tagId + ", 'catId':" + catId + " }"
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divNewProduct").html(result.DataObject);
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
        showAuthorDetails: function () {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/ShowAuthorDetails',
                data: ""
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divAuthorDet").html(result.DataObject);
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
        }        
    };
}();