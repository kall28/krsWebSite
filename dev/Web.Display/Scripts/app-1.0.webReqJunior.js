//var strURL = "http://localhost:61658/Web.Display/";
function GetPageDetails() {
    var terminalNo = $("#xhdnTerminalNo").val();
    var pageNo = 0; //$("#xhdnPageNo").val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: strURL + "Junior.aspx/ShowPage",
        data: "{'terminalNo': '" + terminalNo + "', 'pageNo' : '" + pageNo + "'}",
        dataType: "json",
        success: function (msg) {
            var data = msg.d;
            if (data.length > 0) {
                var movieList = { movie: [] };
                var movId = "";
                var classType = "";
                var showTime = "";
                var str = "";
                var cnt = 0;
                var perc = 0;
                var pageType = 1;
                var movcnt = 1;
                var strShowD = "";
                var strShow = "";
                $("#xhdnPageNo").val(data[0].PageNo);
                $.each(data, function (index, schDet) {
                    if (movId != schDet.MovieId) {
                        movieList.movie.push({
                            'MovieId': schDet.MovieId,
                            'MovieName': schDet.MovieName, 'Rating': schDet.Rating,
                            'Perc': schDet.Perc
                        });
                        movId = schDet.MovieId;
                        movcnt++;
                    }
                });

                $.each(movieList.movie, function (index, movDet) {
                    str += "<div class='col2 mvImg'><img width='330' height='500' src='" + strURL + "Gallery/Movies/Thumbnail/" + movDet.MovieId + ".jpg' alt='' /></div>";
                    str += "<div class='col3 showCont'><h1>" + movDet.MovieName + " <span class='ftItlic'>(" + movDet.Rating + ")</span></h1>";
                    strShowD = "<div class='door'><ul><li class='ftItlic ftNorm'>Door Opens :</li>";
                    strShow = "<div class='door showTime'><ul><li class='ftItlic ftNorm'>Show Time :</li>";

                    $.each(data, function (index, schDet) {
                        strShow += GetShowDetails(schDet, "S");
                        strShowD += GetShowDetails(schDet, "D");
                    });
                    strShowD += "</ul></div>";
                    strShow += "</ul></div>";

                    str += strShowD;
                    str += strShow;
                    str += "</div>";
                });

                //alert(movieList.movie.length);
                $("#divData").html(str);
            }
        },
        error: function () {
            //alert('Error while getting data. Please try again.'); 
        }
    });
}

function GetShowDetails(schDet, mode) {
    var str = "";
    var showTime = "";
    if (schDet.MovieType != '2D') {
        if (mode == "D") {
            showTime = schDet.ShowTime + "(" + schDet.MovieType + ")";
        }
        else {
            showTime = schDet.DoorOpenTime + "(" + schDet.MovieType + ")";
        }
    }
    else {
        if (mode == "D") {
            showTime = schDet.ShowTime;
        }
        else {
            showTime = schDet.DoorOpenTime;
        }
    }
    //if (schDet.MovieType != '2D')
    //{
    //    if (mode == "D") {
    //        showTime = schDet.DoorOpenTime + "(" + schDet.MovieType + ")";
    //    }
    //    else {
    //        showTime = schDet.ShowTime + "(" + schDet.MovieType + ")";
    //    }
    //}
    //else {
    //    if (mode == "D") {
    //        showTime = schDet.DoorOpenTime;
    //    }
    //    else {
    //        showTime = schDet.ShowTime;
    //    }
    //}

    if (schDet.AvalPerc <= 1) {
        str += "<li class='colRed'>" + showTime + "</li> ";
    }
    else if (schDet.AvalPerc > 1 && schDet.AvalPerc <= 30) {
        str += " <li class='colOrg'>" + showTime + "</li>";
    }
    else {
        str += " <li class=''>" + showTime + "</li>";
    }
    return str;
}

function startTime() {
    GetPageDetails();
    t = setTimeout(function () { startTime() }, 5000);
}