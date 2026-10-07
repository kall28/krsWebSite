var strUrl = GetBaseUrl();
var DocumentUrl = GetDocumentUrl();

function GetBaseUrl() {
    var baseUrl = "http://";
    //alert(window.location.href);
    if (window.location.href.indexOf("www") >= 0) {
        baseUrl += "www.";
    }
    baseUrl += "localhost:50438/";
    return baseUrl;
}

function GetDocumentUrl() {
    var DOCUrl = "http://";
    //alert(window.location.href);
    if (window.location.href.indexOf("www") >= 0) {
        DOCUrl += "www.";
    }
    DOCUrl += "localhost:50438/";
    return DOCUrl;
}

$(document).ready(function () {
    window.onerror = function (msg, url, line, col, error) {
        ShowModalMsgBox("Error", msg);
        HideProgress();
        // Note that col & error are new to the HTML 5 spec and may not be 
        // supported in every browser.  It worked for me in Chrome.
        //        var extra = !col ? '' : '\ncolumn: ' + col;
        //        extra += !error ? '' : '\nerror: ' + error;

        // You can view the information in an alert to see things working like this:
        //        alert("Error: " + msg + "\nurl: " + url + "\nline: " + line + extra);

        // TODO: Report this error via ajax so you can keep track
        //       of what pages have JS issues

        //var suppressErrorAlert = true;
        // If you return true, then error alerts (like in older versions of 
        // Internet Explorer) will be suppressed.
        //return suppressErrorAlert;
    };
});

function link_click(mode) {
    var siteURL = strUrl;
    ShowProgress();
    switch (mode) {
        case "H": siteURL += "Default.aspx"; break;
        case "HL": siteURL += "Default.aspx?mode=login"; break;
        case "D": siteURL += "Dashboard.aspx"; break;
        case "AU": siteURL += "Innerpages/AboutUs.aspx"; break;
        case "Disclaimer": siteURL += "InnerPages/Disclaimer.aspx"; break;
        case "Policy": siteURL += "InnerPages/PrivacyPolicy.aspx"; break;
        case "TNC": siteURL += "InnerPages/TNC.aspx"; break;
        case "RFD": siteURL += "InnerPages/RefundPolicy.aspx"; break;
        case "CNT": siteURL += "InnerPages/ContactUs.aspx"; break;
        case "FAQs": siteURL += "InnerPages/FAQs.aspx"; break;
        case "TFN": siteURL += "InnerPages/TollFreeNo.aspx"; break;
        case "CU": siteURL += "InnerPages/ContactUs.aspx"; break;
        case "RA": siteURL += "Admin/RegistrationBuyer.aspx"; break;
        case "RS": siteURL += "Admin/RegistrationSupplier.aspx"; break;
        case "RSA": siteURL += "Admin/RegistrationSupplierAdditionalDet.aspx"; break;
        case "LO": siteURL += "Admin/Logout.aspx"; break;
        case "PR": siteURL += "Admin/Profile.aspx"; break;
        case "RU": siteURL += "Admin/Registration.aspx"; break;
        case "RP": siteURL += "Admin/RegistrationPackages.aspx"; break;
        case "RC": siteURL += "Admin/RegistrationConfirmation.aspx"; break;
        case "U": siteURL += "Admin/Users.aspx"; break;
        case "PL": siteURL += "PurchaseCenter/POList.aspx"; break;
        case "PD": siteURL += "PurchaseCenter/PODrafted.aspx"; break;
        case "IL": siteURL += "PurchaseCenter/InvoiceList.aspx"; break;
        case "ID": siteURL += "PurchaseCenter/InvoiceDrafted.aspx"; break;
        case "PYL": siteURL += "PurchaseCenter/PaymentList.aspx"; break;
        case "AD": siteURL += "Masters/AddSupplier.aspx"; break;
        case "S": siteURL += "Admin/Suppliers.aspx"; break;
        case "B": siteURL += "Admin/Buyers.aspx"; break;
            return true;
    }
    window.location.href = siteURL;
    return false;
}

function menu_click(id, url) {
    var siteURL = strUrl + url;
    ShowProgress();
    setActiveCookie('activeLi', id, function () { alert(getCookie('activeLi')); window.location.href = siteURL; });
    return false;
}

function trim(s) {
    var l = 0; var r = s.length - 1;
    while (l < s.length && s[l] == ' ')
    { l++; }
    while (r > l && s[r] == ' ')
    { r -= 1; }
    return s.substring(l, r + 1);
}

function IsValidMobileNoNew(ctrl) {

    var ctrlVal = trim(ctrl.val());
    if (!ValidateNumber(ctrlVal)) {
        alert("Invalid Mobile");
        ctrl.val("");
        if (ctrl.type != "textarea") {
            ctrl.focus();
        }
        return false;
    }
    return true;
}

function ValidateNumber(value) {
    var num = /[0-9\+]+/
    var numflag = value.match(num);
    if (numflag != value) {
        return false;
    }
    return true;
}

function IsValidEmailNew(ctrl) {
    var mailid = trim(ctrl.val());
    if (!validateEmail(mailid)) {
        alert("Invalid Email Id.");
        ctrl.val("");
        if (ctrl.type != "textarea") {
            ctrl.focus();
        }
        return false;
    }
    return true;
}
function RestrictText(event) {
    if (event.charCode == 39 || event.charCode == 34 || event.charCode == 60 || event.charCode == 62 || event.charCode == 123 || event.charCode == 125 || event.charCode == 64 || event.charCode == 33 || event.charCode == 35 || event.charCode == 36 || event.charCode == 37 || event.charCode == 94) {
        event.keyCode = 0;
        return false;
    }
}

function checkURL(value) {
    var urlregex = new RegExp("^(http|https|ftp)\://([a-zA-Z0-9\.\-]+(\:[a-zA-Z0-9\.&amp;%\$\-]+)*@)*((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|([a-zA-Z0-9\-]+\.)*[a-zA-Z0-9\-]+\.(com|edu|gov|int|mil|net|org|biz|arpa|info|name|pro|aero|coop|museum|[a-zA-Z]{2}))(\:[0-9]+)*(/($|[a-zA-Z0-9\.\,\?\'\\\+&amp;%\$#\=~_\-]+))*$");
    if (urlregex.test(value)) {
        return (true);
    }
    return (false);
}


var specialKeys = new Array();
specialKeys.push(8); //Backspace
specialKeys.push(9); //Tab
specialKeys.push(46); //Delete
specialKeys.push(36); //Home
specialKeys.push(32); //space
specialKeys.push(35); //End
specialKeys.push(37); //Left
specialKeys.push(39); //Right
//start alphanumeric numbers
function IsCharacter(event) {
    var keyCode = event.keyCode == 0 ? event.charCode : event.keyCode;
    if ((keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122) || (specialKeys.indexOf(event.keyCode) != -1 && event.charCode != event.keyCode)) {
        return true;
    }
    else {
        return false;
    }
    //document.getElementById("error").style.display = ret ? "none" : "inline";
}

function IsNumeric(event) {
    if (event.keyCode == 0 || event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 96 || event.keyCode == 97 ||
        // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) ||
        // Allow: Ctrl+C,Ctrl+V
            (event.keyCode == 67 && event.ctrlKey === true) || (event.keyCode == 86 && event.ctrlKey === true) ||
        // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39)) {
        // let it happen, don't do anything
        return;
    }
    else {
        // Ensure that it is a number and stop the keypress
        if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 98 || event.keyCode > 105)) {
            var ret = event.preventDefault();
            //document.getElementById("error").style.display = ret ? "none" : "inline";
            return ret;
        }
    }
}

function IsAlphaNumeric(event) {
    if (event.charCode == 33 || event.charCode == 34 || event.charCode == 35 || event.charCode == 36 || event.charCode == 37 || event.charCode == 38 || event.charCode == 39 || event.charCode == 40 || event.charCode == 41 || event.charCode == 42 || event.charCode == 43 || event.charCode == 44 || event.charCode == 45 || event.charCode == 46 || event.charCode == 47 || event.charCode == 58 || event.charCode == 59 || event.charCode == 60 || event.charCode == 61 || event.charCode == 62 || event.charCode == 63 || event.charCode == 64 || event.charCode == 91 || event.charCode == 92 || event.charCode == 93 || event.charCode == 94 || event.charCode == 95 || event.charCode == 96 || event.charCode == 123 || event.charCode == 124 || event.charCode == 125 || event.charCode == 126 || event.charCode == 127) {
        event.keyCode = 0;
        return false;
    }
}

function IsDecimal(ctrl) {
    $(ctrl).keypress(function (event) {
        if ((event.which != 46 || $(this).val().indexOf('.') != -1) &&
          ((event.which < 48 || event.which > 57) &&
            (event.which != 0 && event.which != 8))) {
            event.preventDefault();
        }

        var text = $(this).val();

        if ((text.indexOf('.') != -1) &&
          (text.substring(text.indexOf('.')).length > 2) &&
          (event.which != 0 && event.which != 8) &&
          ($(this)[0].selectionStart >= text.length - 2)) {
            event.preventDefault();
        }
    });
}

function validateEmail( mailid) {
    var email = /[-a-zA-Z0-9_''\.]+@[-a-zA-Z0-9_'']+\.[-a-zA-Z0-9\.]+/
    var eflag = mailid.match(email)
    if (eflag != mailid) { return false }
    else if (mailid.indexOf(".") == 0) { return false }
    var LastIndex = mailid.lastIndexOf(".")
    var FirstIndex = mailid.indexOf(".")
    if ((LastIndex - FirstIndex) == 1 || (mailid.length - 1 == LastIndex)) { return false }
    if (mailid.indexOf("..") >= 1) { return false }
    if (mailid.indexOf("@-") >= 1) { return false }
    if (mailid.indexOf("-.") >= 1) { return false }
    return true
}

function IsValidCardNoNew(payType, ctlCardNo) {
    //alert(cardNo);
    var cardNo = trim(ctlCardNo.val());
    if (cardNo.length > 19) {
        alert("Invalid Card Number");
        ctlCardNo.focus();
        return false;
    }

    if (payType == "MC") {
        if (cardNo.length != 19) {
            if (cardNo.length != 16) {
                alert("Invalid Card Number");
                ctlCardNo.focus();
                return false;
            }
        }
    }

    if (payType == "CC" || payType == "DC") {
        if (cardNo.length != 16) {
            alert("Invalid Card Number");
            ctlCardNo.focus();
            return false;
        }
    }

    //    if (payType == "DB") {
    //        if (cardNo.indexOf("4") != 0) {
    //            alert("Invalid Card Number!");
    //            ctlCardNo.focus();
    //            return false;
    //        }
    //    }
    sum = 0;
    mul = 1;
    l = cardNo.length;
    for (i = 0; i < l; i++) {
        digit = cardNo.substring(l - i - 1, l - i);
        tproduct = parseInt(digit, 10) * mul;
        if (tproduct >= 10)
            sum += (tproduct % 10) + 1;
        else
            sum += tproduct;
        if (mul == 1)
            mul++;
        else
            mul--;
    }
    if ((sum % 10) == 0)
        return (true);
    else {
        alert("Invalid Card Number");
        ctlCardNo.focus();
        return false;
    }
}

function IsValidCardCVVNew(cardType, ctlCVV) {
    var cvvVal = trim(ctlCVV.val());
    var chkVal = "0123456789";
    var isValid = true;

    if (cvvVal == "") {
        alert("Enter CVV code");
        ctlCVV.focus();
        return false;
    }

    for (i = 0; i < cvvVal.length; i++) {
        for (j = 0; j < chkVal.length; j++) {
            if (cvvVal.charAt(i) == chkVal.charAt(j))
                break;
            if (j == chkVal.length) {
                isValid = false;
                break;
            }
        }
    }

    if (!isValid) {
        //alert('Please enter only digits in the CVV number.');
        alert("Invalid CVV code");
        ctlCVV.focus();
        return false;
    }
    switch (cardType) {
        case "American Express":
            if (cvvVal.length < 4 || cvvVal.length > 4) {
                //alert('Please enter valid 4dbc code');
                alert("Invalid CVV code");
                ctlCVV.focus();
                return false;
            }
            break;
        default:
            if (cvvVal.length < 3 || cvvVal.length > 4) {
                //alert('Please enter valid CVV code');
                alert("Invalid CVV code");
                ctlCVV.focus();
                return false;
            }
            break;
    }
    return true;
}


function addCommas(nStr) {
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}

function OpenPopUp(url) {
    window.open(url, '_blank', 'location=yes,scrollbars=yes,status=yes');
    return false;
}

function getQuerystring(key, default_) {
    if (default_ == null) default_ = "";
    key = key.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + key + "=([^&#]*)");
    var qs = regex.exec(window.location.href);
    if (qs == null)
        return default_;
    else
        return qs[1];
}

function checklength(ctrl, lenght) {
    ctrl.setAttribute('maxlength', lenght);
    var currency = ctrl.value.replace(/[,]+/g, '');
    var valid = /^\d{0,13}(\.\d{0,2})?$/.test(currency),
        val = currency;
    if (valid) {
        ctrl = val;
    } else {
        ctrl.setAttribute('maxlength', lenght);
    }
}

function ShowModalBox(ctrl) {
    $(ctrl).modal({ backdrop: "static" });
}

function HideModalBox(ctrl) {
    $(ctrl).modal('hide');
}

function ShowProgress() {
    $("#divProgressBox").modal({ backdrop: "static" });
}

function HideProgress() {
    $("#divProgressBox").modal('hide');
}

function ShowModalMsgBox(title, msg) {
    $("#msgHeader").html(title);
    $("#msgBody").html(msg);
    $("#divMsgBox").modal({ backdrop: "static" });
}

//function FileUploadMsgBox(MsgCode) {
//    var img = "";
//    var msgHeader = "";
//    var msgDesc = "";
//    //Ds--Document Save,DF--Document Failed,DD--Document Delete
//    switch (MsgCode) {
//        case "DS":
//            img = "images/icn-right.gif";
//            msgHeader = "File uploaded sucessfully.";
//            msgDesc = "";
//            break;
//        case "DF":
//            img = "images/icn-exlamation.gif";
//            msgHeader = "Failed to upload the file";
//            msgDesc = "You can upload only jpeg, pdf, doc, xlsx, txt, zip, rar extensions files.";
//            break;
//        case "DD":
//            img = "images/alt-img03.gif";
//            msgHeader = "File deleted successfully.";
//            msgDesc = "";
//            break;
//        default:
//            img = "images/icn-exlamation.gif";
//            msgHeader = "Failed to upload the file";
//            msgDesc = "You can upload only jpeg, pdf, doc, xlsx, txt, zip, rar extensions files.";
//            break;
//    }
//    $("#DocImg").attr('src', img);
//    $("#HeaderMsg").html(msgHeader);
//    $("#MsgDesc").html(msgDesc);
//    $("#divDocumentMsgBox").modal();
//}

function HideModalMsgBox() {
    $("#msgHeader").html('');
    $("#msgBody").html('');
    $("#divMsgBox").modal('hide');
}

function ShowToolTip(ctrl, content, placement) {
    $(ctrl).tooltip({ title: content, animation: true, placement: placement });
    $(ctrl).tooltip("show");
    setTimeout(HideToolTip, 2000);
    $(ctrl).blur(function () { $(ctrl).tooltip('destroy', true); });
}

function HideToolTip() {
    $('.tooltip').hide();
}

function ShowError(xhr, status, error) {
    var err = eval("(" + xhr.responseText + ")");
    ShowModalMsgBox("Error", err.Message);
}

function SetDataTablePaging(ctrl) {
    if (!$.fn.dataTable.isDataTable(ctrl)) {
        $(ctrl).dataTable({
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            "pagingType": "simple",
            ordering: true
        });
    }
    else {

    }
}

//--------------------------------------------------------

function GetVideoPlayer(id) { var vPlayer = '<iframe width="800" height="445" src="//www.youtube.com/embed/' + id + '?rel=0" frameborder="0" allowfullscreen></iframe>'; return vPlayer; };

//get file path from client system
function getNameFromPath(strFilepath) {
    var objRE = new RegExp(/([^\/\\]+)$/);
    var strName = objRE.exec(strFilepath);
    if (strName == null) {
        return null;
    }
    else {
        return strName[0];
    }
}


$(window).resize(function () {
    //ResetPopup();
});

function GetFullSiteUrl(websiteUrl) {
    if (websiteUrl.indexOf("http://") < 0) {
        websiteUrl = "http://" + websiteUrl;
    }
    return websiteUrl;
}

function BindPaging(tbl) {
    $('#' + tbl).dataTable({
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "aaSorting": [],
    });
}

function DownloadUploadedFile(fileName, path) {
    window.open(DocumentUrl + "FileUpload.ashx?path=2/" + path + "&file=" + fileName);
    return false;
}

function ShowModalReportBox(title, msg) {
    $("#Header").html(title);
    $("#Body").html(msg);
    $("#divReportDet").modal({ backdrop: "static" });
}

function HideModalReportBox() {
    $("#Header").html('');
    $("#Body").html('');
    $("#divReportDet").modal('hide');
}

function ShowModalBoxAny(Id, title, msg) {
    $("#msgHeaderVendor").html(title);
    $("#msgBodyVendor").html(msg);
    $(Id).modal({ backdrop: "static" });
}
//function ShowModalDeleteBox(title, msg,method) {
//    $("#dlttitle").html(title);
//    $("#dltmsg").html(msg);
//    $("#divDelConfirm").modal({ backdrop: "static" });
  
//}

//function HideModalDeleteBox() {
//    $("#dlttitle").html('');
//    $("#dltmsg").html('');
//    $("#divDelConfirm").modal('hide');
//}
function ShowModalTimeOutMsgBox(title, msg) {
    $("#msgHeaderTimeOut").html(title);
    $("#msgbodytimeOut").html(msg);
    $("#divtimeOut").modal({ backdrop: "static" });
}

function setActiveCookie(cname, cvalue, callback) {
    //document.cookie="activeLi="+active;
    var d = new Date();
    d.setTime(d.getTime() + (30 * 24 * 60 * 60 * 1000)); // expire in 30 days
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
    callback();
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}