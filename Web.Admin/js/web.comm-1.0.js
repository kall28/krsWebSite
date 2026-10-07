
var CommonHelper = function () {
    return {
        trim: function (s) {
            var l = 0; var r = s.length - 1;
            while (l < s.length && s[l] === ' ') { l++; }
            while (r > l && s[r] === ' ') { r -= 1; }
            return s.substring(l, r + 1);
        },
        stringify: function (str) {
            var strVal = str.replace('\'', '`');
            strVal = JSON.stringify(strVal);
            return strVal;
        },
        parseString: function (str) {
            var strVal = str.replace('\'', '`');
            return strVal;
        },
        showProgress: function () {
            $("#modalProgressBox").modal({ backdrop: "static" });
        },
        hideProgress: function () {
            $("#modalProgressBox").modal('hide');
        },
        showModalMsgBox: function (title, msg) {
            $("#modalSiteMsgBoxTitle").html(title);
            $("#modalSiteMsgBoxBody").html(msg);
            $("#modalSiteMsgBox").modal({ backdrop: "static" });
        },
        showModalBox: function (ctrl) {
            $(ctrl).modal({ backdrop: "static" });
        },
        hideModalBox: function (ctrl) {
            $(ctrl).modal('hide');
        },
        showToolTip: function (ctrl, content, placement) {
            ctrl.tooltip({ title: content, animation: true, placement: placement });
            ctrl.tooltip("show");
            ctrl.focus();
            setTimeout(this.hideToolTip, 3000);
            ctrl.blur(function () { ctrl.tooltip('destroy', true); });
        },
        hideToolTip: function () {
            $('.tooltip').hide();
        },
        disableControl: function (ctrl, onclickMethod) {
            ctrl.addClass("disabled");
            if (jQuery.isFunction(onclickMethod)) {
                ctrl.off("click");
                //ctrl.unbind("click", onclickMethod);
            }
            else {
                ctrl.click(function () { return false; });
            }
        },
        enableControl: function (ctrl, onclickMethod) {
            ctrl.removeClass("disabled");
            if (jQuery.isFunction(onclickMethod)) {
                ctrl.off("click");
                ctrl.bind("click", onclickMethod);
            }
        },
        showError: function (xhr, status, error, callback) {
            var err = eval("(" + xhr.responseText + ")");
            ShowModalMsgBox("Error", err.Message);
            //HideProgress();
            if (jQuery.isFunction(callback)) { callback(); }
        },
        showErrorMessage: function (title, msg, callback) {
            CommonHelper.hideProgress();
            CommonHelper.showModalMsgBox(title, msg);
            if (jQuery.isFunction(callback)) { callback(); }
        },
        showMessagePanel: function (ctrl, messageType, message) {
            var cssClass = "alert-info";
            ctrl.html("");
            switch (messageType) {
                case "success":
                    cssClass = "alert-success";
                    break;
                case "warning":
                    cssClass = "alert-warning";
                    break;
                case "fail":
                    cssClass = "alert-danger";
                    break;
            }

            if (message !== "") {
                ctrl.html("<div class='alert " + cssClass + " alert-dismissable'>" +
                    "<button class='close' type='button' data-dismiss='alert' aria-hidden='true'>×</button>" +
                    message + "</div>");
            }
        },
        switchPanelView: function (viewHide, viewShow, viewHash) {
            $(viewHide).slideUp(250);
            $(viewShow).slideDown(250, function () {
                $('input').placeholder();
            });

            if (viewHash) {
                window.location = '#' + viewHash;
            } else {
                window.location = '#';
            }
        },
        isValidURL: function (value) {
            var urlregex = new RegExp("^(http|https|ftp)\://([a-zA-Z0-9\.\-]+(\:[a-zA-Z0-9\.&amp;%\$\-]+)*@)*((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|([a-zA-Z0-9\-]+\.)*[a-zA-Z0-9\-]+\.(com|edu|gov|int|mil|net|org|biz|arpa|info|name|pro|aero|coop|museum|[a-zA-Z]{2}))(\:[0-9]+)*(/($|[a-zA-Z0-9\.\,\?\'\\\+&amp;%\$#\=~_\-]+))*$");
            if (urlregex.test(value)) {
                return true;
            }
            return false;
        },
        openPopUp: function (pageUrl) {
            if (this.isValidURL(pageUrl)) {
                window.open(pageUrl, '_blank', 'location=yes,scrollbars=yes,status=yes');
            }
            return false;
        },
        getQuerystringValue: function (key, default_) {
            if (default_ === null) default_ = "";
            key = key.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regex = new RegExp("[\\?&]" + key + "=([^&#]*)");
            var qs = regex.exec(window.location.href);
            if (qs === null)
                return default_;
            else
                return qs[1];
        },
        formatJSONDate: function (JSONDate) {
            var formattedDate = new Date(parseInt(JSONDate.substr(6)));
            var d = formattedDate.getDate();
            if (d < 10) {
                d = "0" + d;
            }
            var m = formattedDate.getMonth();
            m += 1;  // JavaScript months are 0-11
            if (m < 10) {
                m = "0" + m;
            }
            var y = formattedDate.getFullYear();
            return nowDate = d + "/" + m + "/" + y;
        },
        formatJSONTime: function (JSONDate) {
            var formattedDate = new Date(parseInt(JSONDate.substr(6)));
            var h = formattedDate.getHours();
            
            if (h < 10) {
                h = "0" + h;
            }
            var m = formattedDate.getMinutes();
            if (m < 10) {
                m = "0" + m;
            }

            var s = formattedDate.getSeconds();
            if (s < 10) {
                s = "0" + s;
            }
            return h + ":" + m + ":" + s;
        },
        getCurrentDate: function () {
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1;
            var yyyy = today.getFullYear();

            if (dd < 10) {
                dd = '0' + dd;
            }
            if (mm < 10) {
                mm = '0' + mm;
            }
            return dd + '/' + mm + '/' + yyyy;
        },
        getCurrentTime: function () {
            var today = new Date(),
                h = today.getHours(),
                m = today.getMinutes(),
                s = today.getSeconds();
            if (h < 10) { h = '0' + h; }
            if (m < 10) { m = '0' + m; }
            if (s < 10) { s = '0' + s; }
            return h + ":" + m + ":" + s;
        }
    };
}();