var AdmRequestHelper = function () {
    return {
        fillRoles: function (ctrl, selVal) {
            ctrl.html("<option value='0'>Select Role</option>");
            //ShowProgress();
            RequestHelper.post({
                url: strBaseUrl + 'admin/helpers/AdmHelper.aspx/FillRoles',
                data: "{'selVal': '" + selVal + "' }"
            }).then(result => {
                ctrl.html(result);
                ctrl.attr('disabled', false).trigger("chosen:updated");
                //HideProgress();
            }).catch(error => {
                CommonHelper.showErrorMessage("Error", error.message, null);
            });
        }
    };
}();