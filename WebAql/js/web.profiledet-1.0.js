$(document).ready(function () {
    WebProfileHelper.init();
});

var IsProfileIntiated = false;
var WebProfileHelper = function () {
    var PageUrl = "ProfileDetails.aspx";
    return {
        init: function () {
            if (!IsProfileIntiated) {
                $('header').addClass("bg-dark");
                //
                WebProfileHelper.clearChangePwd();
                $("#lnkProfileSignOut").click(function () { CommonPageHelper.signOut(); });
                $("#lnkCPSubmit").click(function () { WebProfileHelper.changePwd(); });
                $("#lnkProfileSubmit").click(function () { WebProfileHelper.changeProfile(); });
                $("#lnkWishlstTab").click(function () { WebProfileHelper.viewWishlist(); });
                $("#lnkAddressTab").click(function () { WebProfileHelper.viewAddress(); });
                $("#lnkOrdersTab").click(function () { WebProfileHelper.viewOrders(); });
                $("#lnkSubsTab").click(function () { WebProfileHelper.viewSubscriptions(); });
                $("#lnkProfileTab").click(function () { WebProfileHelper.viewProfile(); });
                $("#lnkAddAddress").click(function () { WebProfileHelper.addAddress(); });
                $("#btnEditAddress").click(function () { WebProfileHelper.updAddress(); });    
                $("#btnModDelAddNo").click(function () { CommonHelper.hideModalBox("#modDelAdd"); });
                $("#btnModDelAddYes").click(function () { WebProfileHelper.delAddress(); });    
                CommonPageHelper.fillArea($("#ddlNewArea"), "");               
                
                IsProfileIntiated = true;
            }

            var url = window.location.href.split('#');
            if (url.length > 1) {

                switch (url[1]) {
                    case "orders":
                        WebProfileHelper.viewOrders();
                        break;
                    case "subscriptions":
                        WebProfileHelper.viewOrders();
                        break;
                    case "address":
                        WebProfileHelper.viewAddress();
                        break;
                    case "wishlist":
                        WebProfileHelper.viewWishlist();
                        break;
                    default:
                        WebProfileHelper.viewProfile();
                        break;
                }
            }
            else {
                WebProfileHelper.viewProfile();
            }
        },
        viewProfile: function () {
            $("#lnkWishlstTab").removeClass("active");
            $("#lnkAddressTab").removeClass("active");
            $("#lnkOrdersTab").removeClass("active");
            $("#lnkSubsTab").removeClass("active");
            $("#lnkProfileTab").addClass("active");
            $("#divOrderlst").removeClass("active show");
            $("#divAddresslst").removeClass("active show");
            $("#divWishlst").removeClass("active show");
            $("#divProfiledet").addClass("active show");
            WebProfileHelper.clearChangePwd();
        },
        viewOrders: function () {
            $("#lnkWishlstTab").removeClass("active");
            $("#lnkAddressTab").removeClass("active");
            $("#lnkProfileTab").removeClass("active");
            $("#lnkSubsTab").removeClass("active");
            $("#lnkOrdersTab").addClass("active");
            $("#divAddresslst").removeClass("show active");
            $("#divWishlst").removeClass("show active");
            $("#divProfiledet").removeClass("show active");
            $("#divSublst").removeClass("show active");
            $("#divOrderlst").addClass("show active");
            WebProfileHelper.showOrders();
        },
        viewSubscriptions: function () {
            $("#lnkWishlstTab").removeClass("active");
            $("#lnkAddressTab").removeClass("active");
            $("#lnkProfileTab").removeClass("active");
            $("#lnkOrdersTab").removeClass("active");
            $("#lnkSubsTab").addClass("active");
            $("#divAddresslst").removeClass("show active");
            $("#divWishlst").removeClass("show active");
            $("#divProfiledet").removeClass("show active");
            $("#divOrderlst").removeClass("show active");
            $("#divSublst").addClass("show active");
            WebProfileHelper.showUserSubscriptions();
        },
        viewAddress: function () {
            $("#lnkWishlstTab").removeClass("active");
            $("#lnkOrdersTab").removeClass("active");
            $("#lnkProfileTab").removeClass("active");
            $("#lnkSubsTab").removeClass("active");
            $("#lnkAddressTab").addClass("active");
            $("#divOrderlst").removeClass("show active");
            $("#divSublst").removeClass("show active");
            $("#divWishlst").removeClass("show active");
            $("#divProfiledet").removeClass("show active");
            $("#divAddresslst").addClass("show active");
            WebProfileHelper.showAddresses();
        },
        viewWishlist: function () {
            $("#lnkWishlstTab").addClass("active");
            $("#lnkAddressTab").removeClass("active");
            $("#lnkOrdersTab").removeClass("active");
            $("#lnkSubsTab").removeClass("active");
            $("#lnkProfileTab").removeClass("active");
            $("#divOrderlst").removeClass("show active");
            $("#divSublst").removeClass("show active");
            $("#divAddresslst").removeClass("show active");
            $("#divProfiledet").removeClass("show active");
            $("#divWishlst").addClass("show active");
            WebProfileHelper.showUserWishList();
        },
        clearChangePwd: function () {
            $("#txtCPPwd").val('');
            $("#txtCPNewPwd").val('');
            $("#txtCPNewPwdCrfm").val('');
        },
        validateChangePwd: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtCPPwd"), "Password", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtCPNewPwd"), "New Password", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtCPNewPwdCrfm"), "Confirm new Password", "bottom")) { return false; }
            if ($("#txtCPNewPwd").val() !== $("#txtCPNewPwdCrfm").val()) { CommonHelper.showToolTip($("#txtCPNewPwdCrfm"), "Confirm password mismatch.", "bottom"); return false; }
            return true;
        },
        changePwd: function () {
            if (WebProfileHelper.validateChangePwd()) {
                CommonHelper.showProgress();
                RequestHelper.post({
                    url: PageUrl + '/ChangePwdRequest',
                    data: "{'pwd': '" + $("#txtCPPwd").val() + "','newPwd':'" +
                        $("#txtCPNewPwd").val() + "'}"
                }).then(result => {
                    WebProfileHelper.clearChangePwd();
                    if (result.ErrDescription.ErrorCode === 0) {
                        CommonHelper.hideProgress();                        
                        CommonHelper.showModalMsgBox("Change Password", "Password Changed Successfully.");
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Change Password Error", result.ErrDescription.ErrorMessage, null);
                    }
                }).catch(error => {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Change Password Error", error.message, null);
                });
            }
        }, 
        validateChangeProfile: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#ContentPlaceHolder1_txtFirstName"), "First Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#ContentPlaceHolder1_txtLastName"), "Last Name", "bottom")) { return false; }
            return true;
        },
        changeProfile: function () {
            if (WebProfileHelper.validateChangeProfile()) {
                CommonHelper.showProgress();
                RequestHelper.post({
                    url: PageUrl + '/ChangeProfileDetRequest',
                    data: "{'firstName': '" + $("#ContentPlaceHolder1_txtFirstName").val() + "','lastName':'" +
                        $("#ContentPlaceHolder1_txtLastName").val() + "'}"
                }).then(result => {
                    if (result.ErrDescription.ErrorCode === 0) {
                        CommonHelper.hideProgress();
                        CommonHelper.showModalMsgBox("Profile", "Profile Details Changed Successfully.",
                            WebProfileHelper.changeProfileCallBack);                        
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Profile Error", result.ErrDescription.ErrorMessage, null);
                    }
                }).catch(error => {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Profile Error", error.message, null);
                });
            }
        }, 
        changeProfileCallBack: function () {
            window.location.reload();
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
        clearEditAddress: function () {
            $("#hdnRef").val("");
            $("#txtEditFirstName").val("");
            $("#txtEditLastName").val("");
            $("#txtEditAddress1").val("");
            $("#txtEditAddress2").val("");
            $("#txtEditStreet").val("");
            $("#txtEditLandmark").val("");
            $("#ddlEditArea").val("");
        },
        validateAddAddress: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtNewFirstName"), "First Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtNewLastName"), "Last Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtNewAddress1"), "Address", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlNewArea"), "Area", "bottom")) { return false; }
            return true;
        },
        addAddress: function () {
            if (WebProfileHelper.validateAddAddress()) {
                CommonHelper.showProgress();
                CommonAddHelper.add("", $("#txtNewFirstName").val(), $("#txtNewLastName").val(),
                    $("#txtNewAddress1").val(), $("#txtNewAddress2").val(), $("#txtNewStreet").val(),
                    $("#txtNewLandmark").val(), $("#ddlNewArea").val(), WebProfileHelper.addAddressCallback);
            }
        },
        addAddressCallback: function () {
            WebProfileHelper.clearNewAddress();
            CommonHelper.hideProgress();
            CommonHelper.showErrorMessage("Add Address", "Your Address added successfully.", null);
            WebProfileHelper.showAddresses();
        },
        editAddress: function (id) {
            WebProfileHelper.clearEditAddress();
            RequestHelper.post({
                url: PageUrl + '/GetAddresse',
                data: "{'id':'" + id + "'}"
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#hdnRef").val(result.DataObject.Id);
                    $("#txtEditFirstName").val(result.DataObject.FirstName);
                    $("#txtEditLastName").val(result.DataObject.LastName);
                    $("#txtEditAddress1").val(result.DataObject.Address1);
                    $("#txtEditAddress2").val(result.DataObject.Address2);
                    $("#txtEditStreet").val(result.DataObject.Street);
                    $("#txtEditLandmark").val(result.DataObject.Landmark);
                    CommonPageHelper.fillArea($("#ddlEditArea"), result.DataObject.AreaId.Id);
                    CommonHelper.showModalBox("#editAddress");
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
        validateUpdAddress: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtEditFirstName"), "First Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtEditLastName"), "Last Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtEditAddress1"), "Address", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlEditArea"), "Area", "bottom")) { return false; }
            return true;
        },
        updAddress: function () {
            if (WebProfileHelper.validateUpdAddress()) {
                CommonHelper.showProgress();
                CommonAddHelper.update($("#hdnRef").val(), "", $("#txtEditFirstName").val(),
                    $("#txtEditLastName").val(), $("#txtEditAddress1").val(), $("#txtEditAddress2").val(),
                    $("#txtEditStreet").val(), $("#txtEditLandmark").val(), $("#ddlEditArea").val(),
                    WebProfileHelper.updAddressCallback);
            }
        },
        updAddressCallback: function () {
            WebProfileHelper.clearEditAddress();
            CommonHelper.hideModalBox("#editAddress");
            CommonHelper.hideProgress();
            CommonHelper.showErrorMessage("Update Address", "Your Address updated successfully.", null);
            WebProfileHelper.showAddresses();
        },
        showAddressDelete: function (id) {
            $("#hdnRefDel").val(id);
            CommonHelper.showModalBox("#modDelAdd");
        },
        delAddress: function () {
            CommonHelper.showProgress();
            CommonAddHelper.delete($("#hdnRefDel").val(),
                WebProfileHelper.updAddressCallback);
        },
        delAddressCallback: function () {
            $("#hdnRefDel").val("");
            CommonHelper.hideProgress();
            CommonHelper.showErrorMessage("Delete Address", "Your Address deleted successfully.", null);
            CommonHelper.hideModalBox("#modDelAdd");
            WebProfileHelper.showAddresses();
        },      
        showOrders: function () {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/ShowUserOrders',
                data: ""
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divOrderlst").html(result.DataObject);
                    CommonHelper.hideProgress();
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Orders Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Orders Error", error.message, null);
            });
        },
        showOrderDetails: function (orderNo) {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/ShowOrderDetails',
                data: "{'orderNo': '" + orderNo + "'}"
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divOdrSummary").html(result.DataObject);
                    CommonHelper.showModalBox("#orderDetail");
                    CommonHelper.hideProgress();
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Order Details Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Order Details Error", error.message, null);
            });
        },
        showUserSubscriptions: function () {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/ShowUserSubscriptions',
                data: ""
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divSublst").html(result.DataObject);
                    CommonHelper.hideProgress();
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Subscriptions Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Subscriptions Error", error.message, null);
            });
        },
        showUserWishList: function () {
            //CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/ShowWishList',
                data: ""
            }).then(result => {
                console.log(result);
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divWishlst").html(result.DataObject);
                    CommonHelper.hideProgress();
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
        RemoveFromWishList: function (configId) {
            CommonHelper.showProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + PageUrl + '/RemoveWishListItem',
                data: "{'configId':'" + configId + "'}"
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    WebProfileHelper.showUserWishList();
                    CommonHelper.hideProgress();
                }
                else {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Subscriptions Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Subscriptions Error", error.message, null);
            });
        },
    };
}();