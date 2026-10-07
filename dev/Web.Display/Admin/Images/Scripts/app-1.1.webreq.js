var ajaxWebRequest;

function GetMessagePanel(msg) {
    var pnlProcess = "<div style='width:100%;text-align:center;padding:20px;font-weight:bold;font-size:11pt;'>" + msg + "</div>";
    return pnlProcess;
}

function GetProcessingPanel() {
    var pnlProcess = "<div style='width:100%;text-align:center;padding:20px;font-weight:bold;font-size:11pt;'><img src='images/processing.gif'>&nbsp;&nbsp;&nbsp;Please Wait....</div>";
    return pnlProcess;
}