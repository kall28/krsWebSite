$(document).ready(function () {
    WebCheckoutHelper.init();    
});

var IsCartIntiated = false;
var WebCheckoutHelper = function () {
    var PageUrl = WebNavHelper.getBaseUrl() + "Checkout.aspx";
    return {
        init: function () {
            if (!IsCartIntiated) {       
                WebCheckoutHelper.showAddresses();
                CommonPageHelper.fillArea($("#ddlArea"), "");
                $("#lnkAddAddress").click(function () { WebCheckoutHelper.addAddress(); });                
                IsCartIntiated = true;
            }
        },
        calcTotal: function () {
           // $("#cartItem")
        },
        showAddresses: function () {
            RequestHelper.post({
                url: PageUrl + '/ShowAddresses',
                data: ""
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divAddresses").html(result.DataObject);                    
                }
                else {
                    //CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Address Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                //CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Address Error", error.message, null);
            });
        },
        clearNewAddress: function () {            
            $("#txtNewFirstName").val("");
            $("#txtNewLastName").val("");
            $("#txtNewAddress1").val("");
            $("#txtNewAddress2").val("");
            $("#txtNewStreet").val("");
            $("#txtNewLandmark").val("");
            //$("#ddlArea").val("");
        },
        validateAddAddress: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtNewFirstName"), "First Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtNewLastName"), "Last Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtNewAddress1"), "Address", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlArea"), "Area", "bottom")) { return false; }
            return true;
        },
        addAddress: function () {
            if (WebCheckoutHelper.validateAddAddress()) {
                CommonHelper.showProgress();
                CommonAddHelper.add("", $("#txtNewFirstName").val(), $("#txtNewLastName").val(),
                    $("#txtNewAddress1").val(), $("#txtNewAddress2").val(), $("#txtNewStreet").val(),
                    $("#txtNewLandmark").val(), $("#ddlArea").val(), WebCheckoutHelper.addAddressCallback);
            }
        },
        addAddressCallback: function () {
            WebCheckoutHelper.clearNewAddress();
            CommonHelper.hideProgress();
            CommonHelper.showErrorMessage("Add Address", "Your Address added successfully.", null);
            WebCheckoutHelper.showAddresses();
        },
        cartAddItem: function (configId, qty) {
            CommonCartHelper.addToCart(configId, qty, WebCheckoutHelper.cartAddItemCallback);
        },
        cartAddItemCallback: function () {
            WebCheckoutHelper.showCartItems();
            WebCheckoutHelper.showCartSummary();
        },
        cartRemoveItem: function (configId, qty) {
            CommonCartHelper.removeCartItem(configId, qty, WebCheckoutHelper.cartRemoveItemCallback);
        },
        cartRemoveItemCallback: function () {
            WebCheckoutHelper.showCartItems();
            WebCheckoutHelper.showCartSummary();
        },
        setAddress: function (id) {
            RequestHelper.post({
                url: PageUrl + '/SetAddress',
                data: "{ 'addressId': '" + id + "'}"
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
        },
    };
}();
