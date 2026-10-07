var FileHelper = function () {
    return {
        onImageSelect: function (context, imgCtrl, fileNameCtrl) {
            var file, img;
            if ((file = context.files[0])) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#' + imgCtrl).attr('src', e.target.result);
                };
                reader.readAsDataURL(context.files[0]);
                $("#" + fileNameCtrl).val('');
            }
        },
        saveImageFile: function (fileCtrl, mode, ref, fileNameCtrl, callback) {
            if (CommonHelper.trim($("#" + fileNameCtrl).val()) === "") {
                var formData = new FormData();
                formData.append('file', $('#' + fileCtrl)[0].files[0]);
                formData.append('mode', mode);
                formData.append('ref', ref);
                $.ajax({
                    type: 'post',
                    url: strBaseUrl + 'handlers/ProcessImageFile.ashx/ProcessRequest',
                    data: formData,
                    success: function (status) {
                        if (status !== 'error') {
                            $("#" + fileNameCtrl).val(status);
                            if (jQuery.isFunction(callback)) { callback(0); }
                        }
                        else {
                            CommonHelper.showModalMsgBox("Error", "Error while uploading image.");
                        }
                    },
                    processData: false,
                    contentType: false,
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        CommonHelper.showErrorMessage("Error", err.Message);                        
                    }
                });
            }
            else {
                if (jQuery.isFunction(callback)) { callback(0); }
            }
        }
    };
}();

