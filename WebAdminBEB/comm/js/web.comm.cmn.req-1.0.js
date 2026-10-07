var CmnRequestHelper = function () {
    return {
        fillCommCategories: function (ctrl, selVal) {
            ctrl.html("<option value='0'>Select Comm Category</option>");
            //ShowProgress();
            RequestHelper.post({
                url: strBaseUrl + 'comm/helpers/CommHelper.aspx/FillCommCategories',
                data: "{'selVal': '" + selVal + "' }"
            }).then(result => {
                ctrl.html(result);
                ctrl.attr('disabled', false).trigger("chosen:updated");
                //HideProgress();
            }).catch(error => {
                CommonHelper.showErrorMessage("Error", error.message, null);
            });
        },
        fillMessageTypeCodes: function (ctrl, selVal) {
            ctrl.html("<option value='0'>Select Message Type</option>");
            //ShowProgress();
            RequestHelper.post({
                url: strBaseUrl + 'comm/helpers/CommHelper.aspx/FillMessageTypeCodes',
                data: "{'selVal': '" + selVal + "' }"
            }).then(result => {
                ctrl.html(result);
                ctrl.attr('disabled', false).trigger("chosen:updated");
                //HideProgress();
            }).catch(error => {
                CommonHelper.showErrorMessage("Error", error.message, null);
            });
        },
        fillLogTypes: function (ctrl, selVal) {
            ctrl.html("<option value='0'>Select Log Type</option>");
            //ShowProgress();
            RequestHelper.post({
                url: strBaseUrl + 'comm/helpers/CommHelper.aspx/FillLogTypes',
                data: "{'selVal': '" + selVal + "' }"
            }).then(result => {
                ctrl.html(result);
                ctrl.attr('disabled', false).trigger("chosen:updated");
                //HideProgress();
            }).catch(error => {
                CommonHelper.showErrorMessage("Error", error.message, null);
            });
        },
        fillCommTypeCode: function (ctrl, selVal) {
            ctrl.html("<option value='0'>Select Type Code</option>");
            //ShowProgress();
            RequestHelper.post({
                url: strBaseUrl + 'comm/helpers/CommHelper.aspx/FillCommTypeCode',
                data: "{'selVal': '" + selVal + "' }"
            }).then(result => {
                ctrl.html(result);
                ctrl.attr('disabled', false).trigger("chosen:updated");
                //HideProgress();
            }).catch(error => {
                CommonHelper.showErrorMessage("Error", error.message, null);
            });
        },
        fillCommProcessModes: function (ctrl, selVal) {
            ctrl.html("<option value='0'>Select Process Mode</option>");
            //ShowProgress();
            RequestHelper.post({
                url: strBaseUrl + 'comm/helpers/CommHelper.aspx/FillCommProcessModes',
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