var CommonCartHelper = function () {
    return {
        init: function () {
            
        },        
        addToCart: function (configId, qty, callback) {
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/AddToCart',
                data: "{'configId': '" + configId + "','qty': '" + qty + "' }"
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    if (jQuery.isFunction(callback)) { callback(); }
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Cart Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Cart Error", error.message, null);
            });
        },
        removeCartItem: function (configId, qty, callback) {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/RemoveCartItem',
                data: "{'configId': '" + configId + "','qty': '" + qty + "' }"
            }).then(result => {
                //console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    if (jQuery.isFunction(callback)) { callback(); }
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Cart Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Cart Error", error.message, null);
            });
        },
        viewCart: function (callback) {
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/ModalShowCart',
                data: ""
            }).then(result => {
                //console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divCartLst").html(result.DataObject);
                    CommonHelper.showModalBox("#cart");
                    if (jQuery.isFunction(callback)) { callback(); }
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Cart Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Cart Error", error.message, null);
            });
        },       
        addToWishList: function (configId, callback) {
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/AddToWishList',
                data: "{'configId': '" + configId + "'}"
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    if (jQuery.isFunction(callback)) { callback(result.DataObject); }
                }
                else {
                    CommonHelper.hideProgress();
                    switch (result.ErrDescription.ErrorCode)
                    {
                        case 203:
                            CommonPageHelper.showSigninModal();
                            break;
                        default:
                            CommonHelper.showErrorMessage("Wish List Error", result.ErrDescription.ErrorMessage, null);
                            break;
                    }                    
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Wish List Error", error.message, null);
            });
        },
        refreshWishList: function (callback) {
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/RefresWishlist',
                data: ""
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    if (jQuery.isFunction(callback)) { callback(); }
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Wish List Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Wish List Error", error.message, null);
            });
        },
        removeWishListItem: function (configId, callback) {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/RemoveFromWishList',
                data: "{'configId': '" + configId + "'}"
            }).then(result => {
                //console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    if (jQuery.isFunction(callback)) { callback(); }
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Wish List Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Wish List Error", error.message, null);
            });
        },
    };
}();