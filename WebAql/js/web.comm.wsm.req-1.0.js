var WsmRequestHelper = function () {
    return {
        fillOffices: function (ctrl, selVal) {
            ctrl.html("<option value='0'>Select Office</option>");
            //ShowProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/fillOffices',
                data: "{'selVal': '" + selVal + "' }"
            }).then(result => {
                ctrl.html(result);
                //ctrl.attr('disabled', false).trigger("chosen:updated");
                //HideProgress();
            }).catch(error => {
                CommonHelper.showErrorMessage("Error", error.message, null);
            });
        },
        fillFloor: function (ctrl, branchId, selVal) {
            ctrl.html("<option value='0'>Select Floor</option>");
            //ShowProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/fillFloor',
                data: "{'branchId':'" + branchId + "','selVal': '" + selVal + "' }"
            }).then(result => {
                ctrl.html(result);
                //ctrl.attr('disabled', false).trigger("chosen:updated");
                //HideProgress();
            }).catch(error => {
                CommonHelper.showErrorMessage("Error", error.message, null);
            });
        },
        fillSpace: function (ctrl, branchId, locationId, selVal) {
            ctrl.html("<option value='0'>Select Space</option>");
            //ShowProgress();
            RequestHelper.post({
                url: WebNavHelper.getBaseUrl() + 'Helpers/WebReqHelper.aspx/fillSpace',
                data: "{'branchId':'" + branchId + "','locationId':'" + locationId + "','selVal': '" + selVal + "' }"
            }).then(result => {
                ctrl.html(result);
                //ctrl.attr('disabled', false).trigger("chosen:updated");
                //HideProgress();
            }).catch(error => {
                CommonHelper.showErrorMessage("Error", error.message, null);
            });
        }
    };
}();