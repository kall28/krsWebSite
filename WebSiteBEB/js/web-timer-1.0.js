var arrTimeOutId = new Array(1);
arrTimeOutId[0] = 0;
function showClock(index) {
    var min = 0; var sec = 0;
    var isTimeout = false;
    var strTime = "";
    //alert(index);
    clearTimeout(arrTimeOutId[index]);
    if ($("#divTime" + index) != undefined && $("#divTime" + index).html() != undefined) {
        var div = $("#divTime" + index).html().split(':');

        min = div[0]; sec = div[1];

        if (sec == 0 && min > 0) {
            sec = 59;
            if (min > 0) { min--; }
        }
        else { if (sec > 0) { sec--; } }

        if (min <= 0 && sec <= 0) { isTimeout = true; }

        if (!isTimeout) {
            if (min > 0) {
                if (min.toString().length == 1) { strTime = "0"; }
                strTime += min.toString() + ":";

                if (sec.toString().length == 1) { strTime += "0"; }
                strTime += sec.toString();
            }
            else {
                strTime = "00:";
                if (sec.toString().length == 1) { strTime += "0"; }

                strTime += sec.toString();
            }

            $("#divTime" + index).html(min + ":" + sec);
            $("#spnTime" + index).html(strTime);
            arrTimeOutId[index] = setTimeout(function () { showClock(index); }, 1000)
        }
        else {
            $("#divTime" + index).html("0:0:0:0");
            $("#spnTime" + index).html("00:00");
            booking_timeout();
            clearTimeout(arrTimeOutId[index]);
        }
    }
}

function booking_timeout() {
    //CancelBookingRequest("canceled by system - Timeout");
    alert("Transaction Timeout!!! Please try again.");

    window.location = siteURL + 'Index.aspx';
}