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
        }
    };
}();