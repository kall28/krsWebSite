var FormRequestHelperOld = function () {
    return {
        searchData: function (pageUrl, data, callback) {
            $("#divList").html('');
            RequestHelper.post({ url: pageUrl + '/SearchData', data: data })
                .then(result => {
                    $("#divList").html(result);
                    if (jQuery.isFunction(callback)) { callback(); }
                })
                .catch(error => {
                    CommonHelper.showErrorMessage("Error", error.message, null);
                });
        },
        addData: function (pageUrl, data, callback) {
            CommonHelper.showProgress();
            RequestHelper.post({ url: pageUrl + '/Add', data: data })
                .then(result => {
                    if (result.ErrDescription.ErrorCode === 0) {
                        $("#hdnRef").val(result.DataObject);
                        $("#headerEdit").html("<i class='fa fa-pencil'></i><strong>Add</strong> Details");
                        CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
                        CommonHelper.hideProgress();
                        if (jQuery.isFunction(callback)) { callback(); }
                    }
                    else {
                        CommonHelper.showErrorMessage("Error", result.ErrDescription.ErrorMessage, null);
                    }
                })
                .catch(error => {
                    CommonHelper.showErrorMessage("Error", error.message, null);                  
                });
        },
        updateData: function (pageUrl, data, showData, callback) {
            CommonHelper.showProgress();
            RequestHelper.post({ url: pageUrl + '/Update', data: data })
                .then(result => {
                    if (result.ErrDescription.ErrorCode === 0) {
                        showData(result.DataObject);
                        $("#headerEdit").html("<i class='fa fa-pencil'></i><strong>Edit</strong> Details");
                        CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
                        CommonHelper.hideProgress();
                        if (jQuery.isFunction(callback)) { callback(); }
                    }
                    else {
                        CommonHelper.showErrorMessage("Error", result.ErrDescription.ErrorMessage, null);
                    }
                })
                .catch(error => {
                    CommonHelper.showErrorMessage("Error", error.message, null);
                });            
        },
        saveData: function (pageUrl, data, callback) {
            CommonHelper.showProgress();
            RequestHelper.post({ url: pageUrl + '/Save', data: data })
                .then(result => {
                    if (result.ErrorCode === 0) {
                        callback(true, result.ErrorMessage);
                    }
                    else {
                        callback(false, result.ErrorMessage);
                    }
                    CommonHelper.hideProgress();
                })
                .catch(error => {
                    CommonHelper.showErrorMessage("Error", error.message, null);
                });            
        }
    };
}();