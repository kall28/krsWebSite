$(document).ready(function () {
    CommonPageHelper.init();
    $('.toast').toast({ delay: 2000 });
    $('.toast').toast('show');
});

var IsCommPageHelperInitiated = false;
var ProdSubscriptionId = 0;
var ProdCategoryId = 0;
var CartItemCnt = 0;
var CommonPageHelper = function () {
    return {
        init: function () {
            if (!IsCommPageHelperInitiated) {
                $("#lnkHdrLogo").click(function () { WebNavHelper.redirectToPageMain("home"); });
                $("#lnkHdrNavHome").click(function () { WebNavHelper.redirectToPageMain("home"); });
                $("#lnkHdrNavShop").click(function () { WebNavHelper.redirectToPageMain("products"); });
                $("#lnkHdrNavSubscription").click(function () { WebNavHelper.redirectToPageMain("subscription"); });
                $("#lnkHdrNavBlogs").click(function () { WebNavHelper.redirectToPageMain("blogs"); });
                $("#lnkHdrNavRecipes").click(function () { WebNavHelper.redirectToPageMain("recipes"); });
                $("#lnkHdrNavLogin").click(function () { CommonPageHelper.showSigninModal(); });
                $("#lnkModFPwd").click(function () { WebNavHelper.redirectToPageMain("fpwd"); });
                $("#lnkHdrCart").click(function () { CommonPageHelper.viewCart(); });

                $("#lnkHdrCartViewItems").click(function () { WebNavHelper.redirectToPageMain("cart"); });
                $("#lnkHdrCartCheckOut").click(function () { CommonPageHelper.productCheckout(); });

                $("#lnkNavProfile").click(function () { WebNavHelper.redirectToPageMain("profile"); });
                $("#lnkNavOrder").click(function () { WebNavHelper.redirectToPageMain("profileord"); });
                $("#lnkNavSubscription").click(function () { WebNavHelper.redirectToPageMain("profilesub"); });
                $("#lnkNavAddress").click(function () { WebNavHelper.redirectToPageMain("profileadd"); });
                $("#lnkNavWishlist").click(function () { WebNavHelper.redirectToPageMain("profilewish"); });
                $("#lnkNavSignOut").click(function () { CommonPageHelper.signOut(); });

                $("#lnkFtrAbout").click(function () { WebNavHelper.redirectToPageMain("aboutUs"); });
                $("#lnkFtrContact").click(function () { WebNavHelper.redirectToPageMain("contactUs"); });
                $("#lnkFtrFAQ").click(function () { WebNavHelper.redirectToPageMain("faq"); });
                $("#lnkFtrBlog").click(function () { WebNavHelper.redirectToPageMain("blogs"); });
                $("#lnkFtrTNC").click(function () { WebNavHelper.redirectToPageMain("tnc"); });
                $("#lnkFtrPolicy").click(function () { WebNavHelper.redirectToPageMain("policy"); });
                $("#btnFtrSubSubmit").click(function () { CommonPageHelper.userSubscriptionReq(); });                

                $("#btnMSignin").click(function () { CommonPageHelper.signIn(); });
                $("#btnMSignInClose").click(function () { CommonHelper.hideModalBox("#modalSignIn"); });
                $("#btnMRegVerify").click(function () { CommonPageHelper.verifyUser(); });
                $("#btnMSignUpOTPClose").click(function () { CommonHelper.hideModalBox("#modalSignUpOTP"); });
                $("#btnMVerSignup").click(function () { CommonPageHelper.signUp(); });
                $("#btnMVerResend").click(function () { CommonPageHelper.resendOTP(); });

                $("#lnkHomeProdLoadMore").click(function () { WebNavHelper.redirectToPageMain("shop"); });
                
                IsCommPageHelperInitiated = true;
            }
            CommonPageHelper.clear();
            CommonPageHelper.clearReg();
        },
        clear: function () {
            $("#txtMUserName").val('');
            $("#txtMPassword").val('');
        },
        clearReg: function () {
            $("#txtMRegFirstName").val('');
            $("#txtMRegLastName").val('');
            $("#txtMRegEmail").val('');
            $("#txtMRegMobileNo").val('');
            $("#txtMRegPwd").val('');
            $("#txtMRegPwdCrfm").val('');            
        },
        showSigninModal: function () {
            CommonPageHelper.clear();
            CommonPageHelper.clearReg();            
            $("#collapseSignIn").collapse('show');
            //$("#collapseReg").collapse('hide');
            CommonHelper.showModalBox("#modalSignIn");
        },
        fillArea: function (ctrl, selVal) {
            ctrl.html("<option value='0'>Select Area</option>");
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/FillAreas',
                data: "{'selVal': '" + selVal + "' }"
            }).then(result => {
                ctrl.html(result);
            }).catch(error => {
                CommonHelper.showErrorMessage("Error", error.message, null);
            });
        },
        showItemCount: function () {           
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/ShowItemCount',
                data: ""
            }).then(result => {
                $("#spnCartCnt").html(result);
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Get Product Error", error.message, null);
            });
        },
        commAddToCart: function (configId) {
            var qty = 1;
            CommonCartHelper.addToCart(configId, qty, CommonPageHelper.commAddToCartCallback);            
        },
        commAddToCartCallback: function () {
            CommonHelper.showToast("Cart", "Your product added to cart.", 2000);
            CommonPageHelper.showItemCount();
        },
        commRemoveCartItem: function (configId, qty) {
            CommonCartHelper.removeCartItem(configId, qty, CommonPageHelper.commRemoveCartItemCallback);
        },
        commRemoveCartItemCallback: function (configId, qty) {
            CommonPageHelper.refreshCartDetails();
            CommonPageHelper.showItemCount();
        },
        refreshCartDetails: function () {
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/ModalShowCart',
                data: ""
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divCartLst").html(result.DataObject);
                }
                else {
                    //CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Get Product Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                //CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Get Product Error", error.message, null);
            });

        },
        viewCart: function () {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/ModalShowCart',
                data: ""
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divCartLst").html(result.DataObject);
                    CommonHelper.showModalBox("#cart");
                    //CommonHelper.hideProgress();
                }
                else {
                    //CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Get Product Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                //CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Get Product Error", error.message, null);
            });

        },
        subscriptionCheckout: function (configId) {
            CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/SubscriptionCheckout',
                data: "{ 'configId':'" + configId + "'  }"
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    WebNavHelper.redirectToPageMain("checkout");
                }
                else {
                    if (result.ErrDescription.ErrorCode === 203) {
                        CommonHelper.hideProgress();
                        CommonPageHelper.showSigninModal();
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Checkout Error", result.ErrDescription.ErrorMessage, null);
                    }
                }
            }).catch(error => {
                //CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Checkout Error", error.message, null);
            });
        },
        productCheckout: function () {
            CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/ProductCheckout',
                data: ""
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    WebNavHelper.redirectToPageMain("checkout");
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Checkout Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Checkout Error", error.message, null);
            });

        },
        addToWishlist: function (configId) {
            CommonCartHelper.addToWishList(configId, CommonPageHelper.addToWishlistCallback);
        },
        addToWishlistCallback: function (configId) {
            $("a[name=\"wishListItem_" + configId + "\"]").addClass("active");
            $("a[name=\"wishListItemCap_" + configId + "\"]").html("Added To Wishlist");
            //$("#wishListItem_" + configId).addClass("active");
            //CommonCartHelper.refreshWishList();
        },
        removeFromWishlist: function (configId) {
            CommonCartHelper.removeWishListItem(configId, CommonPageHelper.removeFromWishlistCallback);
        },
        removeFromWishlistCallback: function () {
            //CommonCartHelper.refreshWishList();
        },
        viewProdDetails: function (configId) {
            window.location = WebNavHelper.getBaseUrl() + "ProductDetails.aspx?ref=" + configId;
        },
        viewSubDetails: function (configId) {
            window.location = WebNavHelper.getBaseUrl() + "SubscriptionDetails.aspx?ref=" + configId;
        },
        viewBlogDetails: function (configId) {
            window.location = WebNavHelper.getBaseUrl() + "BlogDetails.aspx?ref=" + configId;
        },
        viewRecipeDetails: function (configId) {
            window.location = WebNavHelper.getBaseUrl() + "RecipeDetails.aspx?ref=" + configId;
        },
        viewSignUp: function () {
            CommonHelper.hideModalBox("#modal-signin");
            CommonHelper.showModalBox("#modal-signup");
        },
        validateSignIn: function () {
            if (!FormCtrlValidationHelper.validateEmailTextCtrl($("#txtMUserName"), "Email", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtMPassword"), "Password", "bottom")) { return false; }
            return true;
        },
        signIn: function () {
            if (CommonPageHelper.validateSignIn()) {
                CommonHelper.hideModalBox("#modalSignIn");
                CommonHelper.showProgress();
                var formData = new FormData();
                formData.append('mode', "cst-signin");
                formData.append('userName', $("#txtMUserName").val());
                formData.append('pwd', $("#txtMPassword").val());
                $.ajax({
                    type: 'post',
                    url: WebNavHelper.getBaseUrl() + 'handlers/ProcessAcc.ashx/ProcessRequest',
                    data: formData,
                    success: function (status) {
                        if (status === "0") {
                            CommonHelper.hideProgress();
                            location.reload();
                        }
                        else {
                            CommonHelper.hideProgress();
                            $("#txtMPassword").val("");
                            CommonHelper.showModalBox("#modalSignIn");
                            CommonHelper.showErrorMessage("Sign In Error", status, null);
                        }
                    },
                    processData: false,
                    contentType: false,
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        CommonHelper.showErrorMessage("Sign In Error", err.Message);
                    }
                });
            }
        },
        validateVerifyUser: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtMRegFirstName"), "First Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtMRegLastName"), "Last Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateEmailTextCtrl($("#txtMRegEmail"), "Email", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtMRegMobileNo"), "Mobile No", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtMRegPwd"), "Password", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtMRegPwdCrfm"), "Confirm Password", "bottom")) { return false; }
            if ($("#txtRegPwd").val() !== $("#txtRegPwdCrfm").val()) { CommonHelper.showToolTip($("#txtRegPwdCrfm"), "Confirm password mismatch.", "bottom"); return false; }
            return true;
        },
        verifyUser: function () {
            if (CommonPageHelper.validateVerifyUser()) {
                CommonHelper.hideModalBox("#modalSignIn");
                CommonHelper.showProgress();
                var formData = new FormData();
                formData.append('mode', "cst-verify");
                formData.append('firstName', $("#txtMRegFirstName").val());
                formData.append('lastName', $("#txtMRegLastName").val());
                formData.append('email', $("#txtMRegEmail").val());
                formData.append('mobileNo', $("#txtMRegMobileNo").val());
                formData.append('pwd', $("#txtMRegPwd").val());
                $.ajax({
                    type: 'post',
                    url: WebNavHelper.getBaseUrl() + 'handlers/ProcessAcc.ashx/ProcessRequest',
                    data: formData,
                    success: function (status) {
                        if (status === "0") {
                            CommonHelper.hideProgress();
                            CommonPageHelper.showModalSignUpOTP();
                        }
                        else {
                            CommonHelper.hideProgress();
                            CommonHelper.showModalBox("#modalSignIn");
                            CommonHelper.showErrorMessage("Sign In Error", status, null);
                        }
                    },
                    processData: false,
                    contentType: false,
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        CommonHelper.showErrorMessage("Sign In Error", err.Message);
                    }
                });              
            }
        },
        showModalSignUpOTP: function () {
            $("#divMVerOTPMsg").html("");
            CommonHelper.showModalBox("#modalSignUpOTP");
        },
        resendOTP: function () {
            CommonHelper.showProgress();
            var formData = new FormData();
            formData.append('mode', "cst-resend");
            $.ajax({
                type: 'post',
                url: WebNavHelper.getBaseUrl() + 'handlers/ProcessAcc.ashx/ProcessRequest',
                data: formData,
                success: function (status) {
                    if (status === "0") {
                        CommonHelper.hideProgress();
                        CommonHelper.showModalMsgBox("Sign Up", "OTP Sent successfully.");
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Sign In Error", status, null);
                    }
                },
                processData: false,
                contentType: false,
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    CommonHelper.showErrorMessage("Sign In Error", err.Message);
                }
            });            
        },
        validateSignUp: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtMVerOTP"), "OTP", "bottom")) { return false; }
            return true;
        },
        signUp: function () {
            if (CommonPageHelper.validateSignUp()) {
                //CommonHelper.hideModalBox("#modalSignUpOTP");
                CommonHelper.showProgress();
                var formData = new FormData();
                formData.append('mode', "cst-singup");
                formData.append('otp', $("#txtMVerOTP").val());
                $.ajax({
                    type: 'post',
                    url: WebNavHelper.getBaseUrl() + 'handlers/ProcessAcc.ashx/ProcessRequest',
                    data: formData,
                    success: function (status) {
                        if (status === "0") {
                            CommonHelper.hideModalBox("#modalSignUpOTP");
                            CommonHelper.hideProgress();
                            CommonPageHelper.signUpCallback();
                        }
                        else {
                            CommonHelper.hideProgress();
                            $("#divMVerOTPMsg").html(status);
                            //CommonHelper.showModalBox("#modalSignUpOTP");
                            //CommonHelper.showErrorMessage("Sign In Error", status, CommonPageHelper.showModalSignUpOTP);
                        }
                    },
                    processData: false,
                    contentType: false,
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        CommonHelper.showErrorMessage("Sign In Error", err.Message);
                    }
                });                 
            }
        },
        signUpCallback: function () {
            CommonHelper.showModalMsgBox("Sign Up", "Your registration processed successfully. Please login to continue.");
            //location.reload();
        },
        signOut: function () {
            CommonHelper.showProgress();
            var formData = new FormData();
            formData.append('mode', "cst-signout");
            $.ajax({
                type: 'post',
                url: WebNavHelper.getBaseUrl() + 'handlers/ProcessAcc.ashx/ProcessRequest',
                data: formData,
                success: function (status) {
                    if (status === "0") {
                        CommonHelper.hideProgress();
                        WebNavHelper.redirectToPageMain("home");
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Sign Out Error", status, null);
                    }
                },
                processData: false,
                contentType: false,
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    CommonHelper.showErrorMessage("Sign Out Error", err.Message);
                }
            });
        },
        validateUserSubscriptionReq: function () {
            if (!FormCtrlValidationHelper.validateEmailTextCtrl($("#txtFtrSubEmail"), "Email", "bottom")) { return false; }
            return true;
        },
        userSubscriptionReq: function () {
            if (CommonPageHelper.validateUserSubscriptionReq()) {
                CommonHelper.showModalBox();
                RequestHelper.post({
                    url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/UpdateUserSubscription',
                    data: "{ 'email':'" + $("#txtFtrSubEmail").val() + "'  }"
                }).then(result => {
                    console.log(result);
                    if (result.ErrorCode === 0 || result.ErrorCode === 10) {
                        $("#txtFtrSubEmail").val("");
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Subscribe", "Thanks for subscribing.", null);
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Subscribe Error", result.ErrorMessage, null);
                    }
                }).catch(error => {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Subscribe Error", error.message, null);
                });
            }
        }
    };
}();