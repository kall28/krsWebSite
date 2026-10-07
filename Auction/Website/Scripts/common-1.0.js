var strUrl = GetBaseUrl();

function GetBaseUrl() {
    var baseUrl = "http://";
    //alert(window.location.href);
    if (window.location.href.indexOf("www") >= 0) {
        baseUrl += "www.";
    }
    baseUrl += "localhost:50438/InfiAuctionWebsite/";
    return baseUrl;
}

$(document).ready(function () {
    window.onerror = function (msg, url, line, col, error) {
        ShowMessageBox(msg);
        ShowProgress(false);
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
    switch (mode) {
        case "H": siteURL += "Default.aspx"; break;
        case "I": siteURL += "Index.aspx"; break;
        case "AU": siteURL += "AboutUs.aspx"; break;
        case "AUC": siteURL += "AuctionCenter/AuctionCenter.aspx"; break;
        case "RFP": siteURL += "RFPCenter/RFPCenter.aspx"; break;
        case "SUP": siteURL += "Admin/SupplierList.aspx"; break;
        case "TM": siteURL += "Testimonials.aspx"; break;
        case "FAQ": siteURL += "FAQs.aspx"; break;
        case "VID": siteURL += "Videos.aspx"; break;
        case "PP": siteURL += "PrivacyPolicy.aspx"; break;
        case "DC": siteURL += "Disclaimer.aspx"; break;
        case "RefundPolicy": siteURL += "InnerPages/RefundPolicy.aspx"; break;
        case "TS": siteURL += "Terms.aspx"; break;
        case "PAY": siteURL += "Payments.aspx"; break;
        case "AUCConfirm": siteURL += "AuctionCenter/AuctionCenterConfirmation.aspx"; break;
        case "CAT": siteURL += "Masters/CategoryList.aspx"; break;
        case "COMP": siteURL += "Admin/CompanyList.aspx"; break;
        case "U": siteURL += "Admin/UserList.aspx"; break;
        case "PACK": siteURL += "Masters/PackageList.aspx"; break;
        case "RFPCreate": siteURL += "RFPCenter/RFPCenterCreate.aspx"; break;
        case "RFPOwn": siteURL += "RFPCenter/RFPCenterCreateOwn.aspx"; break;
        case "RFPConfirm": siteURL += "RFPCenter/RFPCenterConfirmation.aspx"; break;
        case "Inbox": siteURL += "Inbox/Inbox.aspx"; break;
        case "Disclaimer": siteURL += "InnerPages/Disclaimer.aspx"; break;
        case "RefundPolicy": siteURL += "InnerPages/RefundPolicy"; break;
        case "TNC": siteURL += "InnerPages/TNC.aspx"; break;
        case "Policy": siteURL += "InnerPages/PrivacyPolicy.aspx"; break;
        case "FAQs": siteURL += "InnerPages/FAQs.aspx"; break;
        case "CNT": siteURL += "InnerPages/ContactUs.aspx"; break;
        case "ABT": siteURL += "InnerPages/AboutUs.aspx"; break;
        case "FPWD": siteURL += "Admin/ForgotPassword.aspx"; break;
        case "REG": siteURL += "Default.aspx#registarion"; break;
        case "AC": siteURL += "Admin/AccountAdmin.aspx"; break;
        case "ACC": siteURL += "AuctionCenter/AuctionCenterCreate.aspx"; break;
        case "PC": siteURL += "PurchaseCenter/PurchaseCenter.aspx"; break;
        case "VImp": siteURL += "Utility/ImportSuppliers.aspx"; break;
        case "RC": siteURL += "ReportCenter/ReportCenter.aspx"; break;
        case "PAYC": siteURL += "Admin/PaymentCenter.aspx"; break;
        case "CR": siteURL += "ReportCenter/CustomerReportSelect.aspx"; break;
        case "SR": siteURL += "ReportCenter/SupplierReportSelect.aspx"; break;
        case "PR": siteURL += "ReportCenter/PaymentReportSelect.aspx"; break;
        case "OFF": siteURL += "OfferCenter/OfferCenter.aspx"; break;
        case "OfferConfirm": siteURL += "OfferCenter/OfferCenterConfirmation.aspx"; break;
            return true;
    }
    window.location.href = siteURL;
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
    if (event.charCode == 39 || event.charCode == 34) {
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
    if (event.shiftKey || event.keyCode == 0 || event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 ||
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

function validateEmail(mailid) {
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

function ShowProgress(visible) {
    if (visible) {
        $("#updProgress").show();
    }
    else {
        $("#updProgress").hide();
    }
}

function ShowMessageBox(msg) {
    $("#divMsgHtml").html(msg);
    ShowModalPopup("divMessageBox");
    ResetModalPopup("divMessageBox");
    //    //    $("#divMsgBox").html(msg);
    //    
    //    $("#messageBox").fadeIn(400);
    //    //$("#divMsgBox").effect("highlight", {},500);
    //    //$("#divMsgBox").effect("highlight", { color: 'red' }, 1000, HideMessageBox);
    //    //$("#divMsgBox").effect("highlight", { color: 'red' }, 1000);
    //    //setTimeout(function(){ HideMessageBox(); }, 3000);
}

function HideMessageBox() {
    HideModalPopup("divMessageBox");
    //    setTimeout(function () { $("#messageBox").fadeOut(400); $("#divMsgHtml").html(); }, 2500);
    //    //$("#messageBox").fadeOut(400);    
}

function CloseMessageBox() {
    //$("#messageBox").fadeOut(400);
    HideMessageBox();
    $("#divMsgHtml").html();
}


function ShowLoginPopup() {
    ShowModalPopup("divLoginPopup");
    ResetModalPopup("divLoginPopup");
}

function HideLoginPopup() {
    HideModalPopup("divLoginPopup");
    //    setTimeout(function () { $("#messageBox").fadeOut(400); $("#divMsgHtml").html(); }, 2500);
    //    //$("#messageBox").fadeOut(400);    
}

function CloseLoginPopup() {
    //$("#messageBox").fadeOut(400);
    HideLoginPopup();
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

function DownloadUploadedFile(fileName, path) {
    window.open(strUrl + "FileUpload.ashx?path=2/" + path + "&file=" + fileName);
    return false;
}

function InitMsg(ctrl, position) {
    ctrl.smallipop({
        preferredPosition: position,
        theme: 'orange',
        popupOffset: 0,
        hideDelay: 700
    });
}

function ShowMsg(ctrl, msg) {
    ctrl.smallipop('update', msg);
    ctrl.smallipop('show');
}

function UpdateMsg(ctrl, msg) {
    ctrl.smallipop('update', msg);
}

function NoticeDefault(content) {
    new jBox('Notice', {
        content: content
    });
}
// Notice at the bottom right
function NoticeBottomRight(content) {
    new jBox('Notice', {
        animation: { open: 'zoomIn', close: 'slide:right' },
        content: content,
        attributes: { // Notices have a fixed position, that's why you need to change the attribute option to move them
            x: 'right',
            y: 'bottom'
        },
        autoClose: 15000
    });
}
// Notice at the bottom left with an offset
function NoticeBottomLeft(content) {
    new jBox('Notice', {
        animation: { open: 'zoomIn', close: 'slide:right' },
        content: content,
        attributes: {
            x: 'left',
            y: 'bottom'
        },
        position: {  // The position attribute defines the distance to the window edges
            x: 50,
            y: 5
        },
        autoClose: 15000
    });
}

function ShowModalMsgBox(title, msg) {
    $("#modelHeader").html(title);
    $("#modalBody").html(msg);
    $("#myModal").modal();
}

function ShowToolTip(ctrl, content) {
    $(ctrl).tooltip("show");
    $(ctrl).blur(function () { $(ctrl).tooltip("destroy"); });
    //jQuery(function ($) {
    //    $(ctrl).tooltip({
    //        items: ctrl,
    //        content: function () {
    //            return content;
    //        },
    //        position: {
    //            my: "center bottom-10",
    //            at: "center top",
    //            using: function (position, feedback) {
    //                $(this).css(position);
    //                $("<div>")
    //                        .addClass("arrow")
    //                        .addClass(feedback.vertical)
    //                        .addClass(feedback.horizontal)
    //                        .appendTo(this);
    //            }
    //        },
    //        close: function (event, ui) {
    //            var me = this;
    //            ui.tooltip.hover(
    //                    function () {
    //                        $(this).stop(true).fadeTo(400, 1);
    //                    },
    //                    function () {
    //                        $(this).fadeOut("400", function () {
    //                            $(this).remove();
    //                        });
    //                    }
    //                );
    //            ui.tooltip.on("remove", function () {
    //                $(me).tooltip("destroy");
    //            });
    //        }
    //    });
    //    $(ctrl).tooltip("open");
    //    $(ctrl).focus();
    //});
}


function ShowError(xhr, status, error) {
    var err = eval("(" + xhr.responseText + ")");
    ShowMessageBox(err.Message);
    ShowProgress(false);
}

function SetDataTablePaging(ctrl) {
    if (!$.fn.dataTable.isDataTable(ctrl)) {
        $(ctrl).dataTable({
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            ordering: true
        });
    }
    else {

    }
}

//-------------------------------------------------------
function ShowOverlay(visible) {
    if (visible) {
        var DocW = $(document).width();
        var DocH = $(document).height();
        $("#divPanelOverlay").css({ "position": "fixed", "top": 0, "left": 0,
            "background": "#000", "width": DocW, "height": DocH,
            "opacity": 0.5, 'z-index': 2001, 'text-align': 'center'
        });
        if ($("#divPanelOverlay").is(":hidden"))
        { $("#divPanelOverlay").fadeIn(300); }
    }
    else {
        $("#divPanelOverlay").fadeOut(300);
    }
}
//--------------------------------------------------------
function ShowModalPopup(div) {
    var WinW = $(window).width()
    var WinH = $(window).height()
    var bH = $("#" + div).height();
    var bW = $("#" + div).width();
    //alert(bH + "|" + bW);
    //alert($("#" + div).html());
    $("#" + div).css({ "position": "fixed", "z-index": 2010 });
    $("#" + div).css("left", (WinW - bW) / 2);
    $("#" + div).css("top", (WinH - bH) / 2);
    $("#" + div).fadeIn(300);
    ShowOverlay(true);
}
//-------------------------------------------------------
function HideModalPopup(div) {
    ShowOverlay(false);
    $("#" + div).fadeOut(300);
    $("#" + div).html();
}
//-------------------------------------------------------

function ResetModalPopup(div) {
    var WinW = $(window).width()
    var WinH = $(window).height()
    var bH = $("#" + div).height();
    var bW = $("#" + div).width();
    //alert(bH + "|" + bW);
    $("#" + div).css({ "position": "fixed", "z-index": 2010 })
    //$("#" + div).css({ "position": "absolute", "z-index": 2010 })
    $("#" + div).css("left", (WinW - bW) / 2);
    $("#" + div).css("top", (WinH - bH) / 2);
    ShowOverlay(true);
}
//--------------------------------------------------------

function GetVideoPlayer(id) { var vPlayer = '<iframe width="800" height="445" src="//www.youtube.com/embed/' + id + '?rel=0" frameborder="0" allowfullscreen></iframe>'; return vPlayer; };

function ShowVideoPopup(mode) {
    $("#pContent").html("Please wait...");
    switch (mode) {
        case 1: //Over view
            $("#pContent").html(GetVideoPlayer('ATpqCeF9In4'));
            break;
        case 2: //RFP center
            $("#pContent").html(GetVideoPlayer('9MdiqsdgDuM'));
            break;
        case 3: //Auction Center
            $("#pContent").html(GetVideoPlayer('tbqAv1u298U'));
            break;
        case 4: //Purchase center
            $("#pContent").html(GetVideoPlayer('pkgXcnaHkrA'));
            break;
        default:
            $("#pContent").html("<div style='width: 768px;height:384px;font-weight:bold;font-size:16px'><img src='"
                + strUrl + "images/Coming Soon.png'></div>");
            //$("#pContent").html("<img src='"+strUrl+"images/Coming Soon.png'>");
            break;
    }
    ShowModalPopup("divPopup");
    ResetModalPopup("divPopup");
}

function ResetPopup() {
    if ($("#divPopup").is(":visible")) {
        setTimeout(function () { ResetModalPopup("divPopup"); }, 100);
    }
}

function regClick() {
    HideModalPopup('divLoginPopup');
    ShowRegPopup();
}

function ShowRegPopup() {
    $.ajax({
        type: 'POST',
        url: strUrl + 'Admin/Registration.aspx/ShowRegPopup',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        cache: false,
        success: function (msg) {
            window.location.href = strUrl + msg.d;
        },
        error: ShowError
    });
}
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


function ShowRatings(val) {
    var strImg = "<img src='" + strUrl;

    switch (val) {
        case 1:
            strImg += "images/rate1.png' alt='1'";
            break;
        case 2:
            strImg += "images/rate2.png' alt='2'";
            break;
        case 3:
            strImg += "images/rate3.png' alt='3'";
            break;
        case 4:
            strImg += "images/rate4.png' alt='4'";
            break;
        case 5:
            strImg += "images/rate5.png' alt='5'";
            break;
        default:
            strImg += "images/rate0.png' alt='0'";
            break;
    }

    strImg += ">";
    return strImg;
}

function ShowVerified(val) {
    var strImg = "";
    switch (val) {
        case 1:
            strImg = "<img src='" + strUrl;
            strImg += "images/infi-verfified-stamp1.png' alt='1'";
            strImg += " class='icn-verify'>";
            break;
            //case 2:
            //    strImg += "images/rate2.png' alt='2'";
            //    break;
            //case 3:
            //    strImg += "images/rate3.png' alt='3'";
            //    break;
            //case 4:
            //    strImg += "images/rate4.png' alt='4'";
            //    break;
            //case 5:
            //    strImg += "images/rate5.png' alt='5'";
            //    break;
            //default:
            //    strImg += "images/rate0.png' alt='0'";
            //    break;
    }
    return strImg;
}

$(window).resize(function () {
    ResetPopup();
});
function SetChildTabIndex(parent, addAtt) {
    if (addAtt) {
        $("#" + parent).find('input, input, select, textarea, a, button')
                .each(function () {
                    $(this).attr('tabindex', -1);
                });
    }
    else {
        $("#" + parent).find('input, select, textarea, a, button')
                .each(function () {
                    $(this).removeAttr('tabindex');
                });
        //$("#" + parent + " :first-child").focus();
    }
}

function GetFullSiteUrl(websiteUrl) {
    if (websiteUrl.indexOf("http://") < 0) {
        websiteUrl = "http://" + websiteUrl;
    }
    return websiteUrl;
}

function BindPaging(tbl) {
    $('#' + tbl).dataTable({
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "aaSorting": []
    });
}

function ShowGenPopup(msg) {
    $("#divGenContent").html(msg);
    ShowModalPopup("divGenPopup");
    //setInterval(function () {
    //    ResetModalPopup("divGenPopup");
    //}, 100);
}

function ResetGenPopup() {
    ResetModalPopup("divGenPopup");
}

function HideGenPopup() {
    HideModalPopup("divGenPopup");
}
