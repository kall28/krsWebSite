$(document).ready(function () {
    WebProductsHelper.init();
});

var IsProductsitiated = false;
var WebProductsHelper = function () {
    var PageUrl = "Products.aspx";
    return {
        init: function () {
            if (!IsProductsitiated) {               
                $("#lnkBCHome").click(function () { WebNavHelper.redirectToPageMain("home"); });
                $("#lnkBCShop").click(function () { WebNavHelper.redirectToPageMain("products"); });
                $("#ddlSorting").change(function () {
                    WebProductsHelper.getProducts();
                });
                WebProductsHelper.getProducts();
                IsProductsitiated = true;
            }           
        },
        getProducts: function () {
            CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/GetProducts',
                data: "{'sortMode' : " + $("#ddlSorting").val() + ", 'catId':0, 'landId':0}"
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divProductLst").html(result.DataObject.HtmlData);
                    $("#spnNoOfProducts").html("of " + result.DataObject.NoOfProducts + " products")
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