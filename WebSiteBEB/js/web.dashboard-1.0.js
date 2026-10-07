$(document).ready(function () {
    WebDashboard.init();
});

var IsWebDashboardInitiated = false;
var WebDashboard = function () {
    var PageUrl = "Login.aspx";
    return {
        init: function () {
            // CommonHelper.switchPanelView('#divOTP', '#divEmail', '');

            if (!IsWebDashboardInitiated) {
                $("#btnSubmit").click(function () { WebDashboard.submit(); });
                $("#btnBack").click(function () { WebDashboard.back(); });
                $("#btnResend").click(function () { WebDashboard.resend(); });
                $("#btnSignin").click(function () { WebDashboard.signin(); });
                IsWebDashboardInitiated = true;
            }
            WebDashboard.clear();
            WsmRequestHelper.fillOffices($("#ddlEntityBranch"), 0);
            $("#ddlEntityBranch").change(function () {
                WsmRequestHelper.fillFloor($("#ddlFloor"), $("#ddlEntityBranch").val(), 0);
                // WsmRequestHelper.fillSpace($("#ddlSection"), $("#ddlEntityBranch").val(), 0, 0);
            });
            //$("#ddlFloor").change(function () {
            //    WsmRequestHelper.fillSpace($("#ddlSection"), $("#ddlEntityBranch").val(), $("#ddlFloor").val(), 0);
            //});
        },
        clear: function () {
            $("#txtEmail").val('');
            $("#txtPassword").val('');
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlEntityBranch"), "Office", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlFloor"), "Floor", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlSection"), "Space", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtDate"), "From Time", "bottom")) { return false; }
            //if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlFromTime"), "From Time", "bottom")) { return false; }
            //if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlToTime"), "To Time", "bottom")) { return false; }
            return true;
        },
        submit: function () {
            if (WebDashboard.validate()) {
                var branchId = $("#ddlEntityBranch").val();
                var locationId = $("#ddlFloor").val();
                var sectiontypeCode = $("#ddlSection").val();
                var bookDate = $("#txtDate").val();
                var fromTime = $("#ddlFromTime").val();
                var toTime = $("#ddlToTime").val();

                CommonHelper.showProgress();
                RequestHelper.post({
                    url: WebNavHelper.getBaseUrl() + 'Dashboard.aspx/SearchSeat',
                    data: "{'branchId':'" + branchId + "','locationId':'" + locationId + "','sectiontypeCode': '" + sectiontypeCode
                        + "','bookDate':'" + bookDate + "','fromTime':'" + fromTime + "','toTime':'" + toTime + "'}"
                }).then(result => {
                    if (result.ErrDescription.ErrorCode === 0) {
                        $("#divSeats").html(result.DataObject);
                        WebDashboard.submitCallback();
                        CommonHelper.hideProgress();
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Search Seat", result.ErrDescription.ErrorMessage, null);
                    }
                }).catch(error => {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Search Seat", error.message, null);
                });
            }
        },
        submitCallback: function () {
            if ($("#ddlSection").val() === "DSP") {
                $("#headerCap").html($("#ddlSection option:selected").text());
                $("#headerCapSel").html("Select Seat");                
            }
            else {
                $("#headerCap").html($("#ddlSection option:selected").text());    
                $("#headerCapSel").html("Select Room");     
            }
            
            $("#lblEntityBranch").text($("#ddlEntityBranch option:selected").text());
            if ($("#ddlFloor").val() > 0) { $("#lblFloor").text($("#ddlFloor option:selected").text()); } else { $("#lblFloor").text("-"); }

            $("#lblSection").text($("#ddlSection option:selected").text());
            //var date = new Date($("#txtDate").val());
            $("#lblDate").text($("#txtDate").val());
            $("#lblFromTime").text($("#ddlFromTime option:selected").text());
            $("#lblToTime").text($("#ddlToTime option:selected").text());

            CommonHelper.switchPanelView('#divSearchSeat', '#divAvailableSeat', '');
        },
        backCall: function () {
            CommonHelper.switchPanelView('#divAvailableSeat', '#divSearchSeat', '');
        },
        validateBookSeat: function () {
            if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlEntityBranch"), "Office", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlSection"), "Space", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtDate"), "From Time", "bottom")) { return false; }
            //if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlFromTime"), "From Time", "bottom")) { return false; }
            //if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlToTime"), "To Time", "bottom")) { }
            //if ($('#radio_button').is(':checked')) { return false; }
            if (!$("input[name='rdbSeats']").is(':checked')) { return false; }
            return true;
        },
        bookSeat: function () {
            if (WebDashboard.validateBookSeat()) {
                var branchId = $("#ddlEntityBranch").val();
                var locationId = $("#ddlFloor").val();
                var sectiontypeCode = $("#ddlSection").val();
                var bookDate = $("#txtDate").val();
                var fromTime = $("#ddlFromTime").val();
                var toTime = $("#ddlToTime").val();
                var seatId = 0;
                if ($("input[name='rdbSeats']").is(':checked')) {
                    var seatdet = new Array();
                    seatdet = $("input[name='rdbSeats']:checked").val().split('|');
                   // locationId = seatdet[0];
                    sectionId = seatdet[0];
                    seatId = seatdet[1];
                    sectiontypeCode = seatdet[2];
                }
                CommonHelper.showProgress();
                RequestHelper.post({
                    url: WebNavHelper.getBaseUrl() + 'Dashboard.aspx/bookSeat',
                    data: "{'branchId':'" + branchId + "','locationId':'" + locationId + "','sectionId': '" + sectionId + "','sectiontypeCode': '" + sectiontypeCode
                        + "','seatId':'" + seatId + "','bookDate':'" + bookDate + "','fromTime':'" + fromTime + "','toTime':'" + toTime + "'}"
                }).then(result => {
                    if (result.ErrDescription.ErrorCode === 0) {

                        $("#spnOrderNo").text(result.DataObject);
                        CommonHelper.showModalBox("#OdrConfirmMsgBox");
                        CommonHelper.hideProgress();
                        // WebDashboard.submitCallback();
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Seat Booking Error", result.ErrDescription.ErrorMessage, null);
                    }
                }).catch(error => {
                    CommonHelper.hideProgress();
                    CommonHelper.showErrorMessage("Seat Booking Error", error.message, null);
                });
            }
            else { CommonHelper.showErrorMessage("Seat Booking Error", "Please select seat", null); }
        },
        signinCallback: function () {
            CommonHelper.switchPanelView('#divOTP', '#divEmail', '');
        },
        back: function () {
            CommonHelper.switchPanelView('#divOTP', '#divEmail', '');
        }
    };
}();

