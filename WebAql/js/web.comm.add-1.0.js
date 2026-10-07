var CommonAddHelper = function () {
    return {
        init: function () {
            
        },        
        add: function (companyName, firstName, lastName, address1, address2,
            street, landmark, areaId, callback) {
            var formData = new FormData();
            formData.append('mode', "add-add");
            formData.append('companyName', companyName);
            formData.append('firstName', firstName);
            formData.append('lastName', lastName);
            formData.append('address1', address1);
            formData.append('address2', address2);
            formData.append('street', street);
            formData.append('landmark', landmark);
            formData.append('areaId', areaId);
            $.ajax({
                type: 'post',
                url: WebNavHelper.getBaseUrl() + 'handlers/ProcessAddress.ashx/ProcessRequest',
                data: formData,
                success: function (status) {
                    if (status === "0") {
                        if (jQuery.isFunction(callback)) { callback(); }
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Add Address Error", status, null);
                    }
                },
                processData: false,
                contentType: false,
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    CommonHelper.showErrorMessage("Add Address Error", err.Message);
                }
            });
        },
        update: function (addressId, companyName, firstName, lastName, address1, address2,
            street, landmark, areaId, callback) {
            var formData = new FormData();
            formData.append('mode', "add-upd");
            formData.append('addressId', addressId);
            formData.append('companyName', companyName);
            formData.append('firstName', firstName);
            formData.append('lastName', lastName);
            formData.append('address1', address1);
            formData.append('address2', address2);
            formData.append('street', street);
            formData.append('landmark', landmark);
            formData.append('areaId', areaId);
            $.ajax({
                type: 'post',
                url: WebNavHelper.getBaseUrl() + 'handlers/ProcessAddress.ashx/ProcessRequest',
                data: formData,
                success: function (status) {
                    if (status === "0") {
                        if (jQuery.isFunction(callback)) { callback(); }
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Update Address Error", status, null);
                    }
                },
                processData: false,
                contentType: false,
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    CommonHelper.showErrorMessage("Update Address Error", err.Message);
                }
            });
        },
        delete: function (addressId, callback) {
            var formData = new FormData();
            formData.append('mode', "add-del");
            formData.append('addressId', addressId);
            $.ajax({
                type: 'post',
                url: WebNavHelper.getBaseUrl() + 'handlers/ProcessAddress.ashx/ProcessRequest',
                data: formData,
                success: function (status) {
                    if (status === "0") {
                        if (jQuery.isFunction(callback)) { callback(); }
                    }
                    else {
                        CommonHelper.hideProgress();
                        CommonHelper.showErrorMessage("Delete Address Error", status, null);
                    }
                },
                processData: false,
                contentType: false,
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    CommonHelper.showErrorMessage("Delete Address Error", err.Message);
                }
            });
        }       
    };
}();