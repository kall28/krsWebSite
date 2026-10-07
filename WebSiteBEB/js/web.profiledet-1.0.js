$(document).ready(function () {
    WebProfileHelper.init();
});

var IsProfileIntiated = false;
var WebProfileHelper = function () {
    var PageUrl = "ProfileDetails.aspx";
    return {
        init: function () {
            if (!IsProfileIntiated) {
                $("#lnkBCHome").click(function () { WebNavHelper.redirectToPageMain("home"); });
                $("#lnkBCAccount").click(function () { WebNavHelper.redirectToPageMain("profile"); });
                $("#lnkProfileSignOut").click(function () { CommonPageHelper.signOut(); });
                $("#lnkProfileSignOutAdd").click(function () { CommonPageHelper.signOut(); });
                $("#lnkProfileSignOutOrd").click(function () { CommonPageHelper.signOut(); });
                $("#lnkProfileSignOutWish").click(function () { CommonPageHelper.signOut(); });                
                $("#btnCPSubmit").click(function () { WebProfileHelper.changePwd(); });
                $("#btnProfileSubmit").click(function () { WebProfileHelper.changeProfile(); });
                $("#lnkAddAddress").click(function () { WebProfileHelper.addAddress(); });
                $("#btnModSaveAddress").click(function () { WebProfileHelper.saveAddress(); });
                $("#btnModDelAddNo").click(function () { CommonHelper.hideModalBox("#modDelAdd"); });
                $("#btnModDelAddYes").click(function () { WebProfileHelper.delAddress(); });                                 
               
                $("#lnkNavOrders").click(function () { WebProfileHelper.viewOrders(); });
                $("#lnkNavWishlist").click(function () { WebProfileHelper.viewWishlist(); });
                $("#lnkNavProfileInfo").click(function () { WebProfileHelper.viewProfile(); });
                $("#lnkNavAddresses").click(function () { WebProfileHelper.viewAddress(); });                

                $("#ddlModCountry").change(function () {
                    CommonPageHelper.fillStates($("#ddlModState"), $("#ddlModCountry").val(), "");
                    CommonPageHelper.fillCities($("#ddlModCity"), "", "", "");
                    CommonPageHelper.fillArea($("#ddlModPincode"), "", "", "", 0);
                });

                $("#ddlModState").change(function () {
                    CommonPageHelper.fillCities($("#ddlModCity"), $("#ddlModCountry").val(), $("#ddlModState").val(), "");
                    CommonPageHelper.fillArea($("#ddlModPincode"), "", "", "", 0);
                });

                $("#ddlModCity").change(function () {
                    CommonPageHelper.fillArea($("#ddlModPincode"), $("#ddlModCountry").val(),
                        $("#ddlModState").val(), $("#ddlModCity").val(), 0);
                });

                WebProfileHelper.clearChangePwd();
                WebProfileHelper.clearAddress();
                WebProfileHelper.showProfileDetails();                
                IsProfileIntiated = true;
            }

            var url = window.location.href.split('#');
            if (url.length > 1) {

                switch (url[1]) {
                    case "profile":
                        WebProfileHelper.viewProfile();
                        break;
                    case "wishlist":
                        WebProfileHelper.viewWishlist();
                        break;
                    case "address":
                        WebProfileHelper.viewAddress();
                        break;                    
                    default:
                        WebProfileHelper.viewOrders();
                        break;
                }
            }
            else {
                WebProfileHelper.viewOrders();
            }
        },
        viewOrders: function () {
            $("a[name='lnkNavProfile']").removeClass("active");
            $("#lnkNavOrders").addClass("active");
            $("section[name='secTabs']").hide();
            $("#secOrders").show();
            $("#hdrCaption").html("My Orders");
            WebProfileHelper.showOrders();
        },
        viewWishlist: function () {
            $("a[name='lnkNavProfile']").removeClass("active");
            $("#lnkNavWishlist").addClass("active");
            $("section[name='secTabs']").hide();
            $("#secWishlist").show();
            $("#hdrCaption").html("My Wishlist");
            WebProfileHelper.showUserWishList();
        },
        viewProfile: function () {
            $("a[name='lnkNavProfile']").removeClass("active");
            $("#lnkNavProfileInfo").addClass("active");
            $("section[name='secTabs']").hide();
            $("#secProfileInfo").show();
            $("#hdrCaption").html("Profile Info");
            WebProfileHelper.clearChangePwd();
        },
        viewAddress: function () {
            $("a[name='lnkNavProfile']").removeClass("active");
            $("#lnkNavAddresses").addClass("active");
            $("section[name='secTabs']").hide();
            $("#secAddresses").show();
            $("#hdrCaption").html("Addresses");
            WebProfileHelper.showAddresses();
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
        showProfileDetails: function () {
            RequestHelper.post({
                url: PageUrl + '/ShowProfileDetails',
                data: ""
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#divProfileDetails").html(result.DataObject);
                }
                else {
                    CommonHelper.showErrorMessage("Profile Error", result.ErrDescription.ErrorMessage, null);
                }
            }).catch(error => {
                CommonHelper.hideProgress();
                CommonHelper.showErrorMessage("Profile Error", error.message, null);
            });
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
        clearAddress: function () {
            $("#hdnRefAdd").val("");
            $("#txtModFirstName").val("");
            $("#txtModLastName").val("");
            $("#txtModCompanyName").val("");
            $("#txtModAddress1").val("");
            $("#txtModAddress2").val("");
            $("#txtModStreet").val("");
            $("#txtModLandmark").val("");
            CommonPageHelper.fillCountries($("#ddlModCountry"), "");
            CommonPageHelper.fillStates($("#ddlModState"), "", "");
            CommonPageHelper.fillCities($("#ddlModCity"), "", "", "");
            CommonPageHelper.fillArea($("#ddlModPincode"), "", "", "", 0);
        },
        addAddress: function () {
            WebProfileHelper.clearAddress();
            CommonHelper.showModalBox("#modAddress");
        },
        editAddress: function (id) {
            $("#hdnRefAdd").val("");
            //WebProfileHelper.clearAddress();
            RequestHelper.post({
                url: PageUrl + '/GetAddresse',
                data: "{'id':'" + id + "'}"
            }).then(result => {
                if (result.ErrDescription.ErrorCode === 0) {
                    $("#hdnRefAdd").val(result.DataObject.Id);
                    $("#txtModFirstName").val(result.DataObject.FirstName);
                    $("#txtModLastName").val(result.DataObject.LastName);
                    $("#txtModCompanyName").val(result.DataObject.CompanyTitle);
                    $("#txtModAddress1").val(result.DataObject.Address1);
                    $("#txtModAddress2").val(result.DataObject.Address2);
                    $("#txtModStreet").val(result.DataObject.Street);
                    $("#txtModLandmark").val(result.DataObject.Landmark);
                    CommonPageHelper.fillCountries($("#ddlModCountry"), result.DataObject.CountryCode.Code);
                    CommonPageHelper.fillStates($("#ddlModState"),
                        result.DataObject.CountryCode.Code, result.DataObject.StateCode.Code);
                    CommonPageHelper.fillCities($("#ddlModCity"),
                        result.DataObject.CountryCode.Code, result.DataObject.StateCode.Code,
                        result.DataObject.CityCode.Code);
                    CommonPageHelper.fillArea($("#ddlModPincode"),
                        result.DataObject.CountryCode.Code, result.DataObject.StateCode.Code,
                        result.DataObject.CityCode.Code, result.DataObject.AreaId.Id);
                    CommonHelper.showModalBox("#modAddress");
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
        validateAddress: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtModFirstName"), "First Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtModLastName"), "Last Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtModAddress1"), "Address", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlModPincode"), "ZIP Code", "bottom")) { return false; }
            return true;
        },
        saveAddress: function () {
            if (WebProfileHelper.validateAddress()) {
                CommonHelper.showProgress();
                if ($("#hdnRefAdd").val() === "") {
                    CommonAddHelper.add($("#txtModCompanyName").val(), $("#txtModFirstName").val(), $("#txtModLastName").val(),
                        $("#txtModAddress1").val(), $("#txtModAddress2").val(), $("#txtModStreet").val(),
                        $("#txtModLandmark").val(), $("#ddlModPincode").val(), WebProfileHelper.saveAddressCallback);
                }
                else {
                    CommonAddHelper.update($("#hdnRefAdd").val(), $("#txtModCompanyName").val(), $("#txtModFirstName").val(),
                        $("#txtModLastName").val(), $("#txtModAddress1").val(), $("#txtModAddress2").val(),
                        $("#txtModStreet").val(), $("#txtModLandmark").val(), $("#ddlModPincode").val(),
                        WebProfileHelper.saveAddressCallback);
                }
            }
        },
        saveAddressCallback: function () {
            WebProfileHelper.clearAddress();
            CommonHelper.hideProgress();
            CommonHelper.hideModalBox("#modAddress");
            CommonHelper.showErrorMessage("Save Address", "Your Address saved successfully.", null);
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
            CommonHelper.hideModalBox("#modDelAdd");
            CommonHelper.showErrorMessage("Delete Address", "Your Address deleted successfully.", null);            
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