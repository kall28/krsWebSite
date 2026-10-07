$(document).ready(function () {
    WebProductsHelper.init();
});

var IsProductsitiated = false;
var WebProductsHelper = function () {
    var PageUrl = "Products.aspx";
    return {
        init: function () {
            if (!IsProductsitiated) {
               

                WebProductsHelper.getProducts();
                IsProductsitiated = true;
            }
           
        },
        getProducts: function () {
            CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/GetProducts',
                data: ""
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divProductLst").html(result.DataObject.HtmlData);
                    $("#spnNoOfProducts").html(result.DataObject.NoOfProducts + " products")
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