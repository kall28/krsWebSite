function GetPageDetails() {
    var terminalNo = $("#xhdnTerminalNo").val();
    var pageNo = 0; //$("#xhdnPageNo").val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "default.aspx/ShowPage",
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
                $("#xhdnPageNo").val(data[0].PageNo);
                $.each(data, function (index, schDet) {
                    pageNo
                    if (movId != schDet.MovieId) {
                        movieList.movie.push({ 'MovieId': schDet.MovieId,
                            'MovieName': schDet.MovieName, 'Rating': schDet.Rating,
                            'Perc': schDet.Perc
                        });
                        movId = schDet.MovieId;

                        switch (movcnt) {
                            case 1:
                                perc = schDet.Perc;
                                switch (schDet.Perc) {
                                    case 100: pageType = 1; break;
                                    case 25: pageType = 4; break;
                                }
                                break;
                            case 2:
                                switch (schDet.Perc) {
                                    case 50: pageType = 2; break;
                                    case 25:
                                        if (perc == 50)
                                        { pageType = 3; }
                                        break;
                                }
                                break;
                        }
                        movcnt++;
                    }
                });

                switch (pageType) {

                    case 1:
                        $.each(movieList.movie, function (index, movDet) {
                            str += "<div class='col0'>";
                            str += "<div class='img'><img src='Gallery/Movies/Thumbnail/" + movDet.MovieId + ".jpg' width='194' height='277' alt='' /></div>"
                                + "<div class='mvcontHlr'><div class='conthead'><p>" + movDet.MovieName + "</p><span>" + movDet.Rating + "</span></div>"

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
                        break;
                    case 2:
                        $.each(movieList.movie, function (index, movDet) {
                            switch (cnt) {
                                case 0: str += "<div class='col3 brdr'>"; break;
                                case 1: str += "<div class='col3'>"; break;
                            }

                            str += "<div class='col2-1 '><div class='img'><img src='Gallery/Movies/Thumbnail/" + movDet.MovieId + ".jpg' width='194' height='277' alt='' /></div>"
                                + "<div class='mvcontHlr'><div class='conthead'><p>" + movDet.MovieName + "</p><span>" + movDet.Rating + "</span></div>"

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
                            str += "<div class='clr'></div></div></div>";
                            cnt++;
                        });
                        break;
                    case 3:
                        $.each(movieList.movie, function (index, movDet) {
                            switch (cnt) {
                                case 0: str += "<div class='col3 brdr'>"; break;
                                case 1: str += "<div class='col3'><div class='col3-1 '>"; break;
                                case 2: str += "<div class='col3-1 brdTop'>"; break;
                            }

                            str += "<div class='img'><img src='Gallery/Movies/Thumbnail/" + movDet.MovieId + ".jpg' width='194' height='277' alt='' /></div>"
                                + "<div class='mvcontHlr'><div class='conthead'><p>" + movDet.MovieName + "</p><span>" + movDet.Rating + "</span></div>"

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
                            switch (cnt) {
                                case 0: str += "<div class='clr'></div></div>"; break;
                                case 1: str += "<div class='clr'></div></div>"; break;
                                case 2: str += "<div class='clr'></div></div></div>"; break;
                            }
                            cnt++;
                        });
                        for (var i = cnt; i <= 3; i++) {
                            switch (i) {
                                case 0: str += "<div class='col3 brdr'><div class='clr'></div></div>"; break;
                                case 1: str += "<div class='col3'><div class='col3-1 '><div class='clr'></div></div>"; break;
                                case 2: str += "<div class='col3-1 brdTop'><div class='clr'></div></div></div>"; break;
                            }
                        }
                        break;
                    case 4:
                        $.each(movieList.movie, function (index, movDet) {
                            switch (cnt) {
                                case 0: str += "<div class='col3 brdr'><div class='col3-1 '>"; break;
                                case 1: str += "<div class='col3-1 brdTop'>"; break;
                                case 2: str += "<div class='col3'><div class='col3-1 '>"; break;
                                case 3: str += "<div class='col3-1 brdTop'>"; break;
                            }

                            str += "<div class='img'><img src='Gallery/Movies/Thumbnail/" + movDet.MovieId + ".jpg' width='194' height='277' alt='' /></div>"
                                + "<div class='mvcontHlr'><div class='conthead'><p>" + movDet.MovieName + "</p><span>" + movDet.Rating + "</span></div>"

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
                            switch (cnt) {
                                case 0: str += "<div class='clr'></div></div>"; break;
                                case 1: str += "<div class='clr'></div></div></div>"; break;
                                case 2: str += "<div class='clr'></div></div>"; break;
                                case 3: str += "<div class='clr'></div></div></div>"; break;
                            }
                            cnt++;
                        });

                        for (var i = cnt; i <= 5; i++) {
                            switch (i) {
                                case 0: str += "<div class='col3 brdr'><div class='col3-1 '><div class='clr'></div></div>"; break;
                                case 1: str += "<div class='col3-1 brdTop'><div class='clr'></div></div></div>"; break;
                                case 2: str += "<div class='col3'><div class='col3-1 '><div class='clr'></div></div>"; break;
                                case 3: str += "<div class='col3-1 brdTop'><div class='clr'></div></div></div>"; break;
                            }
                        }
                        break;
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

function startTime() {
    GetPageDetails();
    t = setTimeout(function () { startTime() }, 1000);
}