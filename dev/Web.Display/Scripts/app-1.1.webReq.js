//var strURL = "http://localhost:61658/Web.Display/";
function GetPageDetails() {
    var terminalNo = $("#xhdnTerminalNo").val();
    var pageNo = 0; //$("#xhdnPageNo").val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: strURL + "Display.aspx/ShowPage",
        data: "{'terminalNo': '" + terminalNo + "', 'pageNo' : '" + pageNo + "'}",
        dataType: "json",
        success: function (msg) {
            var data = msg.d;
            if (data.length > 0) {
                var movieList = { movie: [] };
                var panelList = { panel: [] };
                var movId = "";
                var classType = "";
                var showTime = "";
                var str = "";
                var cnt = 0;
                var perc = 0;
                var pageType = 1;
                var movcnt = 1;
                var panelNo = 0;
                $("#xhdnPageNo").val(data[0].PageNo);
                $.each(data, function (index, schDet) {
                    if (movId !== schDet.MovieId) {
                        movieList.movie.push({ 'MovieId': schDet.MovieId,
                            'MovieName': schDet.MovieName, 'Rating': schDet.Rating,
                            'Perc': schDet.Perc, 'Genre': schDet.Genre
                        });
                        movId = schDet.MovieId;
                    }

                    if (panelNo !== schDet.PanelNo) {
                        panelList.panel.push({
                            'PanelNo': schDet.PanelNo, 'MovieId': schDet.MovieId
                        });
                        panelNo = schDet.PanelNo;
                    }
                });

                $.each(panelList.panel, function (index, panelDet) {                    
                    $.each(movieList.movie, function (index, movDet) {
                        if (panelDet.MovieId === movDet.MovieId) {
                            str += "<div class='Digi_Col'>"
                                + "<div class='digi_movieImg'><img src='" + strURL + "Gallery/Movies/Thumbnail/"
                                + movDet.MovieId + ".jpg'/></div>"
                                + "<div class='digi_movieInfoHdr'><div class='digi_movieTitle'>"
                                + movDet.MovieName + "</div><div class='digi_movieType'>(" + movDet.Rating
                                + ") " + movDet.Genre + "</div>";

                            classType = "";
                            $.each(data, function (index, schDet) {
                                if (panelDet.PanelNo === schDet.PanelNo
                                    && movDet.MovieId === schDet.MovieId) {
                                    if (classType !== schDet.ClassType) {
                                        if (classType !== "") { str += "</div></div>"; }
                                        str += "<div class='digi_movieCinma'>" + schDet.ClassType + "</div>";
                                        str += "<div class='digi_movieShowtimeHdr'>"
                                            + "<div class='digi_movieShowtime'>";
                                        classType = schDet.ClassType;
                                    }
                                    str += GetShowDetails(schDet);
                                    cnt++;
                                }
                            });
                            str += "</div></div></div></div>";  
                        }
                    });                   
                });       

                for (var j = cnt; j <= 5; j++) {
                    switch (j) {
                        case 0: str += "<div class='Digi_Col'></div>"; break;
                        case 1: str += "<div class='Digi_Col'></div>"; break;
                        case 2: str += "<div class='Digi_Col'></div>"; break;
                        case 3: str += "<div class='Digi_Col'></div>"; break;
                    }
                }

                //alert(movieList.movie.length);
                $("#divData").html(str);
            }
        },
        error: function () {
            //alert('Error while getting data. Please try again.'); 
        }
    });
}

function GetShowDetails(schDet) {
    var str = "";

    if (schDet.AvalPerc <= 1) {
        str = "<span class='colRed'>" + schDet.ShowTime + "</span>";
    }
    else if (schDet.AvalPerc > 1 && schDet.AvalPerc <= 30) {
        str = "<span class='colYelow'>" + schDet.ShowTime + "</span>";
    }
    else {
        str = "<span class='colWht'>" + schDet.ShowTime + "</span>";
    }
    return str;
}

//function GetShowDetails(schDet) {
//    var str = "";
//    var showTime = "";
//    if (schDet.MovieType !== '2D')
//    { showTime = schDet.ShowTime + "(" + schDet.MovieType + ")"; }
//    else {
//        showTime = schDet.ShowTime;
//    }

//    if (schDet.AvalPerc <= 1) {
//        str += "<a class='colRed'>" + showTime + "</a> ";
//    }
//    else if (schDet.AvalPerc > 1 && schDet.AvalPerc <= 30) {
//        str += " <a class='colOrg'>" + showTime + "</a>";
//    }
//    else {
//        str += " <a class=''>" + showTime + "</a>";
//    }
//    return str;
//}

function startTime() {
    GetPageDetails();
    t = setTimeout(function () { startTime() }, 2000);
}