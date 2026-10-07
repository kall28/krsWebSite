/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsAdmUsersInitiated = false;
var AdmUsers = function () {
    var PageUrl = "AdminUsers.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            AdmUsers.search();
            if (!IsAdmUsersInitiated) {
                $("#btnAdd").click(function () { AdmUsers.add(); });
                $("#btnSubmit").click(function () { AdmUsers.save(); });
                $("#btnBack").click(function () { AdmUsers.back(); });
                $("#btnBackTop").click(function () { AdmUsers.back(); });
                IsAdmUsersInitiated = true;
            }
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#lblRoleEdit").html('');
            $("#lblRoleEdit").hide();
            $("#ddlRoleEdit").show();
            AdmRequestHelper.fillRoles($("#ddlRoleEdit"), "");            
            $("#txtFirstName").val('');
            $("#txtLastName").val('');
            $("#txtEmail").removeAttr("disabled");
            $("#txtEmail").val('');
            //$("#txtMobileNo").val('');
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, AdmUsers.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));   
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#lblRoleEdit").html(data.RoleCode.Title);
            $("#lblRoleEdit").show();
            $("#ddlRoleEdit").hide();
            //AdmRequestHelper.fillRoles($("#ddlRoleEdit"), data.RoleCode.Code);            
            $("#txtFirstName").val(data.FirstName);
            $("#txtLastName").val(data.LastName);
            $("#txtEmail").attr("disabled", "disabled");
            $("#txtEmail").val(data.Email);
            //$("#txtMobileNo").val(data.MobileNo);
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            AdmUsers.clear();
            FormRequestHelper.addData(payload, AdmUsers.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (configId) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'configId':'" + configId + "'}", AdmUsers.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, AdmUsers.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtFirstName"), "First Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtLastName"), "Last Name", "bottom")) { return false; }
            if (!FormCtrlValidationHelper.validateEmailTextCtrl($("#txtEmail"), "Email", "bottom")) { return false; }
            //if (!FormCtrlValidationHelper.validateNumericCtrl($("#txtMobileNo"), "Mobile No", "bottom")) { return false; }
            if ($("#ddlRoleEdit").is(":visible")) {
                if (!FormCtrlValidationHelper.validateSelectCtrl($("#ddlRoleEdit"), "User Role", "bottom")) { return false; }
            }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (AdmUsers.validate()) {
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/Save";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'firstName' : '" + $("#txtFirstName").val()
                    + "', 'lastName' : '" + $("#txtLastName").val()
                    + "', 'email' : '" + $("#txtEmail").val()
                    //+ "', 'mobileNo' : '" + $("#txtMobileNo").val()
                    + "', 'roleCode' : '" + $("#ddlRoleEdit").val()
                    + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, AdmUsers.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), AdmUsers.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                AdmUsers.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), AdmUsers.save);
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }            
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();

