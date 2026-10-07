var arrTimeOutId = new Array(1);
arrTimeOutId[0] = 0;
function showClock(index) {
    var days = 0; hr = 0; var min = 1; var sec = 0;
    var isTimeout = false;
    var strTime = "";
    var div = $("#divTime" + index).html().split(':');

    days = div[0]; hr = div[1]; min = div[2]; sec = div[3];

    clearTimeout(arrTimeOutId[index]);

    if (days>0 || hr > 0 || min > 0 || sec > 0) {
        if (sec == 0 && (min > 0 || hr > 0)) { sec = 59; if (min > 0) { min--; } }
        else { if (sec > 0) { sec--; } }
        if (min == 0 && hr > 0) { min = 59; if (hr > 0) { hr--; } }
        if (hr == 0 && days > 0) { hr = 23; if (days > 0) { days--; } }
        if (days <= 0 && hr <= 0 && min <= 0 && sec <= 0) { isTimeout = true; }

        if (!isTimeout) {
            strTime = "<ul>";
            strTime += "<li>";
            if (days.toString().length == 1)
            { strTime += "0"; }
            strTime += days.toString() + "<p>DAYS</p></li>";
            strTime += "<li>";

            if (hr.toString().length == 1)
            { strTime += "0"; }
            strTime += hr.toString() + "<p>HOURS</p></li>";
            strTime += "<li>";
            //            else {
            if (min.toString().length == 1)
            { strTime += "0"; }

            strTime += min.toString() + "<p>MINUTES</p></li>";

            //strTime += "<li>:</li><li>";
            //if (sec.toString().length == 1)
            //{ strTime += "0"; }

            //strTime += sec.toString() + "<p>SECONDS</p></li>";
            //            }
            strTime += "</ul>";

            $("#divTime" + index).html(days + ":" + hr + ":" + min + ":" + sec + ":");
            $("#spnTime" + index).html(strTime);
            //arrTimeOutId[index] = setTimeout(showClock, 1000);
            arrTimeOutId[index] = setTimeout(function () { showClock(index); }, 1000)
        }
        else {
            //alert($("#divTime" + arrTimeOutId[index]).html());
            $("#divTime" + index).html("0:0:0:0");
            $("#spnTime" + index).html("Processing....");
            clearTimeout(arrTimeOutId[index]);
            onTimeOut();
        }
    }
    else {
        $("#divTime" + index).html("0:0:0:0");
        $("#spnTime" + index).html("Time is up !!!");
        clearTimeout(arrTimeOutId[index]);
        onTimeOut();
    }
}
function showClock1(index) {
    var hr = 0; var min = 1; var sec = 0;
    var isTimeout = false;
    var strTime = "";
    var div = $("#divTime" + index).html().split(':');

    hr = div[0]; min = div[1]; sec = div[2];

    clearTimeout(arrTimeOutId[index]);

    if (hr > 0 || min > 0 || sec > 0) {
        if (sec == 0 && (min > 0 || hr > 0)) { sec = 59; if (min > 0) { min--; } }
        else { if (sec > 0) { sec--; } }
        if (min == 0 && hr > 0) { min = 59; if (hr > 0) { hr--; } }
        if (hr <= 0 && min <= 0 && sec <= 0) { isTimeout = true; }

        if (!isTimeout) {
            strTime = "<ul>";
            if (hr > 0) {
                strTime += "<li>";
                if (hr.toString().length == 1)
                { strTime += "0"; }
                strTime += hr.toString() + "<p>HOURS</p></li><li>:</li>";
            }
            strTime += "<li>";
//            else {
                if (min.toString().length == 1)
                { strTime += "0"; }

                strTime += min.toString() + "<p>MINUTES</p></li><li>:</li>";

                strTime += "<li>";
                if (sec.toString().length == 1)
                { strTime += "0"; }

                strTime += sec.toString() + "<p>SECONDS</p></li>";
            //            }
                strTime += "</ul>";

            $("#divTime" + index).html(hr + ":" + min + ":" + sec + ":");
            $("#spnTime" + index).html(strTime);
            //arrTimeOutId[index] = setTimeout(showClock, 1000);
            arrTimeOutId[index] = setTimeout(function () { showClock(index); }, 1000)
        }
        else {
            //alert($("#divTime" + arrTimeOutId[index]).html());
            $("#divTime" + index).html("0:0:0");
            $("#spnTime" + index).html("Processing....");
            clearTimeout(arrTimeOutId[index]);
            onTimeOut();
        }
    }
    else {
        $("#divTime" + index).html("0:0:0");
        $("#spnTime" + index).html("Time is up !!!");
        clearTimeout(arrTimeOutId[index]);
        onTimeOut();
    }
}