var pageNo = 0;
var totalRec=0;
var currRec = 0;
var cineStatus = null;
var isInit = false;
var schCnt = 0;
function GetShows1() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "VideoWall.aspx/GetShows",
        data: "{'pageNo' : '" + pageNo + "'}",
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

                pageNo = data[0].PageNo;

                $.each(data, function (index, schDet) {
                    if (movId != schDet.MovieId) {
                        movieList.movie.push({ 'MovieId': schDet.MovieId,
                            'MovieName': schDet.MovieName, 'Rating': schDet.Rating
                        });
                        movId = schDet.MovieId;
                        movcnt++;
                    }
                });

                if(isInit)
//                str += "<marquee behavior='scroll' direction='up' scrollamount='2' "
//                    + " scrolldelay='20' height='450px'>";

                $.each(movieList.movie, function (index, movDet) {
                    if (index == 0)
                    { str += "<div class='col3-1 '>"; }
                    else
                    { str += "<div class='col3-1 brdTop'>"; }
                    str += "<div class='img'><img src='Gallery/Movies/Thumbnail/" + movDet.MovieId
                        + ".jpg' width='194' height='277' alt='' /></div><div class='mvcontHlr'>"
                        + "<div class='conthead'><p>" + movDet.MovieName + "</p><span>" + movDet.Rating
                        + "</span></div>";

                    classType = "";
                    $.each(data, function (index, schDet) {
                        if (movDet.MovieId == schDet.MovieId) {
                            if (classType != schDet.ClassType) {
                                if (classType != "") { str += "</div>"; }
                                str += "<div class='screen'>" + schDet.ClassType + "</div><div class='schedule'>";
                                classType = schDet.ClassType;
                            }

                            str += GetShowDetails(schDet);
                        }
                    });

                    str += "</div></div>";
                    str += "<div class='clr'></div></div>";
                    cnt++;
                });
                //str += "</marquee>";
                //alert(movieList.movie.length);
                $("#divData").html(str);
            }
        },
        error: function () {
            //alert('Error while getting data. Please try again.'); 
        }
    });
}

function GetShows() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "VideoWall.aspx/GetShows",
        data: "{'pageNo' : '" + pageNo + "'}",
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

                pageNo = data[0].PageNo;

                $.each(data, function (index, schDet) {
                    if (movId != schDet.MovieId) {
                        movieList.movie.push({ 'MovieId': schDet.MovieId,
                            'MovieName': schDet.MovieName, 'Rating': schDet.Rating
                        });
                        movId = schDet.MovieId;
                        movcnt++;
                    }
                });

                if (!isInit || schCnt != movcnt) {
                    schCnt = movcnt;
                    str += "<ul id='ulData'>";
                    $.each(movieList.movie, function (index, movDet) {
                        str += "<li id='li" + index + "'><div class='col3-1 brdTop'>";
                        str += "<div class='img'><img src='Gallery/Movies/Thumbnail/" + movDet.MovieId
                            + ".jpg' width='194' height='277' alt='' /></div><div class='mvcontHlr'>"
                            + "<div class='conthead'><p>" + movDet.MovieName + "</p><span>" + movDet.Rating
                            + "</span></div>";
                        classType = "";
                        $.each(data, function (index, schDet) {
                            if (movDet.MovieId == schDet.MovieId) {
                                if (classType != schDet.ClassType) {
                                    if (classType != "") { str += "</div>"; }
                                    str += "<div class='screen'>" + schDet.ClassType + "</div><div class='schedule'>";
                                    classType = schDet.ClassType;
                                }

                                str += GetShowDetails(schDet);
                            }
                        });

                        str += "</div></div>";
                        str += "<div class='clr'></div></div></li>";
                        cnt++;
                    });
                    str += "</ul>";
                    //str += "</marquee>";
                    //alert(movieList.movie.length);
                    $("#divData").html(str);                    
                    var dd = $('.col3').easyTicker({
                        direction: 'up',
                        easing: 'easeOutQuad',
                        speed: 'slow',
                        interval: 3000,
                        height: 'auto',
                        visible: 3,
                        mousePause: 0,
                        controls: {
                            up: '.up',
                            down: '.down',
                            toggle: '.toggle',
                            stopText: 'Stop !!!'
                        }
                    }).data('easyTicker');
                    isInit = true;
                }
                else {
                    $.each(movieList.movie, function (index, movDet) {
                        str = "<div class='col3-1 brdTop'>";
                        str += "<div class='img'><img src='Gallery/Movies/Thumbnail/" + movDet.MovieId
                        + ".jpg' width='194' height='277' alt='' /></div><div class='mvcontHlr'>"
                        + "<div class='conthead'><p>" + movDet.MovieName + "</p><span>" + movDet.Rating
                        + "</span></div>";

                        classType = "";
                        $.each(data, function (index, schDet) {
                            if (movDet.MovieId == schDet.MovieId) {
                                if (classType != schDet.ClassType) {
                                    if (classType != "") { str += "</div>"; }
                                    str += "<div class='screen'>" + schDet.ClassType + "</div><div class='schedule'>";
                                    classType = schDet.ClassType;
                                }

                                str += GetShowDetails(schDet);
                            }
                        });

                        str += "</div></div>";
                        str += "<div class='clr'></div></div>";
                        $("#li" + index).html(str);
                        cnt++;
                    });
                }
            }
        },
        error: function () {
            //alert('Error while getting data. Please try again.'); 
        }
    });
}


function GetShowDetails(schDet) {
    var str = "";
    var showTime = "";
    if (schDet.MovieType != '2D')
    { showTime = schDet.ShowTime + "(" + schDet.MovieType + ")"; }
    else {
        showTime = schDet.ShowTime;
    }

    if (schDet.AvalPerc <= 1) {
        str += "<a class='colRed'>" + showTime + "</a> ";
    }
    else if (schDet.AvalPerc > 1 && schDet.AvalPerc <= 30) {
        str += " <a class='colOrg'>" + showTime + "</a>";
    }
    else {
        str += " <a class=''>" + showTime + "</a>";
    }
    return str;
}

function GetCinemaStatus() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "VideoWall.aspx/GetCinemaStatus",
        //data: "{'terminalNo': '" + terminalNo + "', 'pageNo' : '" + pageNo + "'}",
        dataType: "json",
        success: function (msg) {
            var disp = false;
            if (cineStatus == null) { disp = true; }
            cineStatus = msg.d;

            if (disp) { setShowStatus(); startStatusTime(); }
            //            var data = msg.d;
            //            var str = "<ul>";
            //            var cnt = 0;
            //            if (data.length > 0) {
            //                totalRec = data.length;
            //                $.each(data, function (index, cinema) {
            //                    if ((index) <= (currRec + cnt) && cnt < 2) {
            //                        str += "<li><div class='cinmStsA'>" + cinema.Title + "</div><div class='cinmStsB'>"
            //                        + cinema.Status + "</div><div class='clr'></div></li>";
            //                        cnt++;
            //                    }
            //                });

            //            }
            //            str += "<div class='clr'></div></ul>";
            //            $("#divStatus").html(str);
        },
        error: function () {
            //alert('Error while getting data. Please try again.'); 
        }
    });
}

function setShowStatus() {
    var str = "<ul>";
    var cnt = 0;
    if (cineStatus != null) {
        if (cineStatus.length > 0) {
            if (currRec >= cineStatus.length) { currRec = 0; }
            $.each(cineStatus, function (index, cinema) {
                if (index >= currRec && cnt < 3) {
                    str += "<li><div class='cinmStsA'>" + cinema.Title + "</div><div class='cinmStsB'>"
                        + cinema.Status + "</div><div class='clr'></div></li>";
                    cnt++;
                    currRec++;
                }
            });

        }
        else
        { currRec = 0; }
    }
    str += "<div class='clr'></div></ul>";
    $("#divStatus").html(str);
}

function startTime() {
    GetShows();
    GetCinemaStatus();
    t = setTimeout(function () { startTime() }, 2000);
}

function startStatusTime() {
    setShowStatus();
    t = setTimeout(function () { startStatusTime() }, 10000);
}

