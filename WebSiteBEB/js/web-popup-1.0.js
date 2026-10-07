
var url =siteURL;
//alert(url);
var imgUrl = url + "Images/";

//----------------------------------------------------------------------------------
function trim(inputString) {
    // Removes leading and trailing spaces from the passed string. Also removes
    // consecutive spaces and replaces it with one space. If something besides
    // a string is passed in (null, custom object, etc.) then return the input.

    //if (typeof inputString != "string") { return inputString; }

    var retValue = inputString;
    var ch = retValue.substring(0, 1);
    while (ch == " ") { // Check for spaces at the beginning of the string
        retValue = retValue.substring(1, retValue.length);
        ch = retValue.substring(0, 1);
    }
    ch = retValue.substring(retValue.length - 1, retValue.length);
    while (ch == " ") { // Check for spaces at the end of the string
        retValue = retValue.substring(0, retValue.length - 1);
        ch = retValue.substring(retValue.length - 1, retValue.length);
    }
    while (retValue.indexOf("  ") != -1) { // Note that there are two spaces in the string - look for multiple spaces within the string
        retValue = retValue.substring(0, retValue.indexOf("  ")) + retValue.substring(retValue.indexOf("  ") + 1, retValue.length); // Again, there are two spaces in each of the strings
    }
    return retValue; // Return the trimmed string back to the user
}
//----------------------------------------------------------------------------------
function InitShowPanel() {
    //alert('');
    var divPanelOverlay = "";
    if ($("#divPanelOverlay").html() == undefined) {
        divPanelOverlay = "<div id='divPanelOverlay' style='display: none;'></div>";
        divPanelOverlay += "<div id='divPanelMain' style='display:none;padding:10;'>"
            + "<div class='setHoldr'><div class='seat-cont'>"
            + "<div id='divPanelClose' class='seat-close' style='display: none;'>"
            + "<a id='lnkPanelClose' class='curHand' onclick = 'javascript:ClosePanel();'"
            + "><img src='" + imgUrl + "bt-close.gif' width='14' height='14'></a></div>"
            + "<div id='divPanelWait' style='display: none;padding:5px;background-color:#fff;border:solid 1pt #000'><p>"
            + "Please wait"
        //+ "<img src='" + imgUrl + "Processing.gif'>"
            + "</p><p id='pPanelAdv'></p></div>"
            + "<div id='divPanelContent' style='display: none;'></div></div><div class='clr'></div></div>";
        $("body").append(divPanelOverlay);
    }
}


function ShowPanel(innerHtml, mode, appendContent, closeEvent) {
    
    var divPanelOverlay = "";
    if ($("#divPanelOverlay").html() == undefined) {
        divPanelOverlay = "<div id='divPanelOverlay' style='display: none;'></div>";
        divPanelOverlay += "<div id='divPanelMain' style='display:none;'>"
            + "<div><div>"
            + "<div id='divPanelClose' class='seat-close'";
        switch (mode) {
            case "0": //only wait message
            case "1": //wait message with Adv.
                divPanelOverlay += " style='display: none;'";
                break;
        }

        divPanelOverlay += "><a id='lnkPanelClose' class='curHand'";
        if (closeEvent != undefined && closeEvent != "") {
            divPanelOverlay += " onclick = \"javascript:" + closeEvent + ";\"";
        }
        else
        { divPanelOverlay += " onclick = 'javascript:ClosePanel();'"; }
        divPanelOverlay += "><img src='" + imgUrl + "bt-close.gif' width='14' height='14'></a></div>"
            + "<div id='divPanelWait'";
        switch (mode) {
            case "0": //only wait message
            case "1": //wait message with Adv.
                break;
            default:
                divPanelOverlay += "style='display: none;'";
                break;
        }
        //divPanelOverlay += "><p><img src='"+ imgUrl +"Processing.gif'></p><p id='pPanelAdv'>"

        switch (mode) {
            case "0": //only wait message
                divPanelOverlay += "><p>Please wait...</p><p id='pPanelAdv'>"
                break;
            case "00": //only wait message
                divPanelOverlay += "><p><img src='" + imgUrl + "Processing.gif'></p><p id='pPanelAdv'>"
                break;
            case "1": //wait message with Adv.
                //divPanelOverlay += "<img src='" + imgUrl + "ad-1.gif'>";
                divPanelOverlay += "><p>Please wait...</p><p id='pPanelAdv'>"
                divPanelOverlay += "<div id='divPanelAdv' style='width:301px;height:250;'><script type='text/javascript'>GetWebPagePanel('10012', 'divPanelAdv');</script>";
                break;
            case "PP": //only wait message
                divPanelOverlay += "><p style='text-align: center; margin: 15px;'>Please wait your payment is processing.<br />Please do not refresh or close the page.<br /><br /><img src='https://www.cinemaxxtheater.com/images/loading.GIF' /></p><p id='pPanelAdv'></p>";                
                break;
        }
        divPanelOverlay += "</p></div><div id='divPanelContent'";
        switch (mode) {
            case "0": //only wait message
            case "1": //wait message with Adv.
                divPanelOverlay += "style='display: none;'";
                break;
        }
        divPanelOverlay += ">" + innerHtml + "</div></div><div class='clr'></div></div>";
        $("body").append(divPanelOverlay);
    }
    else {
        switch (mode) {
            case "0": //only wait message
                $("#divPanelClose").hide();
                $("#divPanelWait").html("<p>Please wait...</p><p id='pPanelAdv'></p>")
                //$("#divPanelWait").show();
                //$("#pPanelAdv").hide();
                $("#divPanelContent").hide();
                break;
            case "00": //only wait message
                $("#divPanelClose").hide();
                $("#divPanelWait").html("<p><img src='" + imgUrl + "Processing.gif'></p><p id='pPanelAdv'></p>")
                $("#divPanelWait").show();
                //$("#pPanelAdv").hide();
                $("#divPanelContent").hide();
                break;
            case "1": //wait message with Adv
                $("#divPanelClose").hide();
                $("#divPanelWait").html("<p>Please wait...</p>"
                    + "<p id='pPanelAdv'><div id='divPanelAdv' style='width:301px;height:250;'>&nbsp;"
                    + "<script type='text/javascript'>GetWebPagePanel('10012', 'divPanelAdv');</script></p>");
                $("#divPanelWait").show();
                //$("#pPanelAdv").html("<img src='" + imgUrl + "ad-1.gif'>");
                //$("#pPanelAdv").html("<div id='divPanelAdv' style='width:301px;height:250;'>&nbsp;<script type='text/javascript'>GetWebPagePanel('10012', 'divPanelAdv');</script>");
                //$("#pPanelAdv").show();
                $("#divPanelContent").hide();
                break;
            case "2": //Only Content without close button
                $("#divPanelClose").hide();
                $("#divPanelWait").hide();
                $("#pPanelAdv").html("");
                $("#pPanelAdv").hide();
                $("#divPanelContent").show();
                break;
            case "22": //Only Content with close button
                $("#divPanelClose").show();
                $("#divPanelWait").hide();
                $("#pPanelAdv").html("");
                $("#pPanelAdv").hide();
                $("#divPanelContent").show();
                break;
            case "PP": //only wait message
                $("#divPanelClose").hide();
                $("#divPanelWait").html("<p style='text-align: center; margin: 15px;'>Please wait your payment is processing.<br />Please do not refresh or close the page.<br /><br /><img src='https://www.cinemaxxtheater.com/images/loading.GIF' /></p><p id='pPanelAdv'></p>");
                $("#divPanelWait").show();
                //$("#pPanelAdv").hide();
                $("#divPanelContent").hide();
                break;
        }

        if (closeEvent != undefined && closeEvent != "") {
            $("#lnkPanelClose").attr('onclick', 'javascript:' + closeEvent + ';');
        }
        else
        { $("#lnkPanelClose").attr('onclick', 'javascript:ClosePanel();'); }

        switch (appendContent) {
            case "0": //clear content
                $("#divPanelContent").html("");
                break;
            case "1": //append content
                $("#divPanelContent").append(innerHtml)
                break;
            default:
                $("#divPanelContent").html(innerHtml);
                break;
        }
    }
    ShowModalPopup("divPanelMain");
    ResetPanel();
}


function ClosePanel() {
    setTimeout(function () { HideModalPopup("divPanelMain") }, 1000);
}

function ResetPanel() {
    //alert($("#divPanelMain").html());
    if ($("#divPanelMain").is(":visible")) {
        setTimeout(function () { ResetModalPopup("divPanelMain"); }, 100);
    }
}

function ShowPanelProcessing() {
    var divProc = "<div class='setHoldr'>" //"<div style='width: 100%; text-align: center; padding: 25px; font-weight: bold; font-size: 11pt; background: #fff;'>";
    divProc += "<div><img src='" + imgUrl + "processing.gif' /></div></div>";
    ShowPanel(divProc);
}
function ShowPanelProcessingEvent(eventName) {
    var divProc = "<div class='setHoldr'>"; //"<div style='width: 100%; text-align: center; padding: 25px; font-weight: bold; font-size: 11pt; background: #fff;'>";
    divProc += "<div><img src='" + imgUrl + "mm_spacer.gif' onload='javascript:" + eventName + "();' /></div></div>";
    ShowPanel(divProc);
}
function HidePanelProcessing() {
    HideModalPopup("divPanelInnerHTML");
}

function ResetPanelProcessing() {
    ResetModalPopup("divPanelInnerHTML");
}
//----------------------------------------------------------------------------------
function ShowPanel1(innerHtml) {
    var divPanelOverlay = "";
    if ($("#divPanelOverlay").html() == undefined) {
        divPanelOverlay = "<div id='divPanelOverlay' style='display: none;'></div>";
        divPanelOverlay += "<div id='divPanelInnerHTML' style='display: none;padding:10;'>" + innerHtml + "</div>";
        $("body").append(divPanelOverlay);
    }
    else { $("#divPanelInnerHTML").html(innerHtml); }
    ShowModalPopup("divPanelInnerHTML");
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
        { $("#divPanelOverlay").fadeIn(100); }
    }
    else {
        $("#divPanelOverlay").fadeOut(100);
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
    $("#" + div).fadeIn(100);
    ShowOverlay(true);
}
//-------------------------------------------------------
function HideModalPopup(div) {

    ShowOverlay(false);
    $("#" + div).fadeOut(100);
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

//$(function () {
//    $(window).resize(function () {
//        // get the screen height and width  
//        var maskHeight = $(window).height();
//        var maskWidth = $(window).width();

//        // calculate the values for center alignment
//        var dialogTop = (maskHeight - $('#dialog-box').height()) / 2;
//        var dialogLeft = (maskWidth - $('#dialog-box').width()) / 2;

//        // assign values to the overlay and dialog box
//        $('#dialog-overlay').css({ height: $(document).height(), width: $(document).width() }).show();
//        $('#dialog-box').css({ top: dialogTop, left: dialogLeft, position: "fixed" }).show();
//    }).resize();
//});



//function movieName_click(movieId) {
//    var dt=new Date();
//    //alert(movieId);
//    //window.location = url + "MovieSchedule.aspx?mid=" + movieId + "&dt=" + $("#selShowDate").val();
//    window.location = url + "MovieSchedule.aspx?mid=" + movieId + "&dt=" + dt.getFullYear() + dt.getMonth() + dt.getDate();
//}

$(window).resize(function () {
    ResetPanel();
});

$(document).ready(function () {
    InitShowPanel();
});