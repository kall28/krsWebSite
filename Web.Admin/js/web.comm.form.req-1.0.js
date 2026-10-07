var FormRequestHelper = function () {
    return {
        searchData: function (payload, callback) {
            $("#" + payload.ctrlList).html('');
            RequestHelper.post({ url: payload.url, data: payload.data })
                .then(result => {
                    $("#" + payload.ctrlList).html(result);
                    if (jQuery.isFunction(callback)) { callback(); }
                })
                .catch(error => {
                    CommonHelper.showErrorMessage("Error", error.message, null);
                });
        },        
        addData: function (payload, callback) {
            CommonHelper.showProgress();
            RequestHelper.post({ url: payload.url, data: payload.data })
                .then(result => {
                    if (result.ErrDescription.ErrorCode === 0) {
                        $("#" + payload.ctrlRef).val(result.DataObject);
                        $("#" + payload.ctrlHeader).html("<i class='fa fa-pencil'></i><strong>Add</strong> Details");
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
        updateData: function (payload, callback) {
            CommonHelper.showProgress();
            RequestHelper.post({ url: payload.url, data: payload.data })
                .then(result => {
                    if (result.ErrDescription.ErrorCode === 0) {
                        payload.showData(result.DataObject);
                        if (payload.ctrlHeader !== "") {
                            $("#" + payload.ctrlHeader).html("<i class='fa fa-pencil'></i><strong>Edit</strong> Details");
                        }
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
        saveData: function (payload, callback) {
            CommonHelper.showProgress();
            RequestHelper.post({ url: payload.url, data: payload.data })
                .then(result => {
                    if (result.ErrorCode === 0) {
                        callback(true, result.ErrorMessage);
                    }
                    else {
                        callback(false, result.ErrorMessage);
                    }                    
                })
                .catch(error => {
                    CommonHelper.showErrorMessage("Error", error.message, null);
                });            
        }
    };
}();

var FormRequestPayloadHelper = function () {
    return {
        searchDataPayload: function () {
            return {
                ctrlList: '',
                url: '',
                data: ''
            };
        },
        addDataPayload: function () {
            return {
                url: '',
                data: '',
                ctrlRef: '',
                ctrlHeader: ''
            };
        },
        updateDataPayload: function () {
            return {
                url: '',
                data: '',
                showData: null,
                ctrlHeader: ''
            };
        },
        saveDataPayload: function () {
            return {
                url: '',
                data: ''
            };
        },
        searchDataDefaultPayload: function (pageUrl, data) {
            var payload = this.searchDataPayload();
            payload.url = pageUrl + "/SearchData";
            payload.data = data;
            payload.ctrlList = "divList";
            return payload;
        },
        addDataPayloadDefault: function (pageUrl, data) {
            var payload = this.addDataPayload();
            payload.url = pageUrl + "/Add";
            payload.data = data;
            payload.ctrlRef = "hdnRef";
            payload.ctrlHeader = "headerEdit";
            return payload;
        },
        updateDataPayloadDefault: function (pageUrl, data, showData) {
            var payload = this.updateDataPayload();
            payload.url = pageUrl + "/Update";
            payload.data = data;
            payload.showData = showData;
            payload.ctrlHeader = "headerEdit";
            return payload;
        }
    };
}();