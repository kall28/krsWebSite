var EcmRequestHelper = function () {
    return {
        fillCategories: function (ctrl, selVal) {
            ctrl.html("<option value='0'>Select Category</option>");
            //ShowProgress();
            RequestHelper.post({
                url: strBaseUrl + 'ecomm/helpers/EcommHelper.aspx/FillCategories',
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