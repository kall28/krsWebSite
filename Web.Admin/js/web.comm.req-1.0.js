var RequestHelper = function () {
    return {
        post: function (payload) {
            return new Promise(function (resolve, reject) {
                $.ajax({
                    type: 'POST',
                    url: payload.url,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    data: payload.data,
                    cache: false,
                    success: function (msg) {
                        resolve(msg.d);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        //CommonHelper.showErrorMessage("Error", err.Message, null);
                        Promise.reject(new Error(err.Message));
                    }
                });
            }).catch(err => {
                CommonHelper.showErrorMessage("Error", err.Message, null);
            });
        }
    };
}();