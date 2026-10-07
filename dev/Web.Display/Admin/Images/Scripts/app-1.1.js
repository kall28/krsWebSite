//--------------------------------------------------------
function GetProcessingPanel() {
    var pnlProcess = "<div style='width:100%;text-align:center;padding:20px;font-weight:bold;font-size:11pt;'><img src='images/processing.gif'>&nbsp;&nbsp;&nbsp;Please Wait....</div>";
    //    var pnlProcess = "<table width='100%' cellpadding='4' cellspacing='4' style='border:solid 1pt green; background-color:#FFF;><tr><td>Plase wait.</td><td height='30px' align='center'>"
    //    pnlProcess += "<img src='images/processing.gif'></td></tr></table>";
    return pnlProcess;
}
//--------------------------------------------------------
function GetMessagePanel(msg) {
    var pnlProcess = "<div style='width:100%;text-align:center;padding:20px;font-weight:bold;font-size:11pt;'>" + msg + "</div>";
    //    var pnlProcess = "<table width='100%' cellpadding='4' cellspacing='4' style='border:solid 1pt green; background-color:#FFF;><tr><td>Plase wait.</td><td height='30px' align='center'>"
    //    pnlProcess += "<img src='images/processing.gif'></td></tr></table>";
    return pnlProcess;
}
//-------------------------------------------------------
function ShowOverlay(visible) {
    if (visible) {
        var WinW = $(window).width();
        var WinH = $(window).height();
        $("#blackOverlay").css({ "width": WinW, "height": WinH, "opacity": 0.4 });
        if ($("#blackOverlay").is(":hidden"))
        { $("#blackOverlay").fadeIn(800); }
    }
    else {
        $("#blackOverlay").fadeOut(800);
    }
}
//--------------------------------------------------------
function ShowModalPopup(div) {
    var WinW = $(window).width()
    var WinH = $(window).height()
    var bH = $("#" + div).height();
    var bW = $("#" + div).width();
    $("#" + div).css({ "position": "absolute", "z-index": 2010 });
    $("#" + div).css("left", (WinW - bW) / 2);
    $("#" + div).css("top", (WinH - bH) / 2);
    $("#" + div).fadeIn(800);
    ShowOverlay(true);
}
//-------------------------------------------------------
function HideModalPopup(div) {
    ShowOverlay(false);
    $("#" + div).fadeOut(500);
}
//-------------------------------------------------------

function ResetModalPopup(div) {
    var WinW = $(window).width()
    var WinH = $(window).height()
    var bH = $("#" + div).height();
    var bW = $("#" + div).width();
    //$("#" + div).css({ "position": "fixed", "z-index": 2010 })
    $("#" + div).css({ "position": "absolute", "z-index": 2010 })
    $("#" + div).css("left", (WinW - bW) / 2);
    $("#" + div).css("top", (WinH - bH) / 2);
}
//--------------------------------------------------------

