
$(document).ready(function () {  
    BindDatePicker();    
    //GetGraphs();    

});

Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
    BindDatePicker();
});

function BindDatePicker(fromdate, todate) {
    var d = new Date();
    var day = d.getDate();
    var mnth = d.getMonth() + 1;
    var y = d.getFullYear();    

    $("#ContentPlaceHolder1_xtxtFromDate").val('01/01/' + y);
    $("#ContentPlaceHolder1_xtxtToDate").val(day + '/' + mnth + '/' + y);
    
    var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
    var todate = $("#ContentPlaceHolder1_xtxtToDate").val();

    $("#ContentPlaceHolder1_xtxtFromDate").datepicker({
        dateFormat: 'dd/mm/yy',
        minDate: fromdate,
        maxDate: todate,               
        onSelect: function (dateText, inst) {
            $("#ContentPlaceHolder1_xtxtToDate").val('');
            $("#ContentPlaceHolder1_xtxtToDate").datepicker("destroy");
            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                minDate: $("#ContentPlaceHolder1_xtxtFromDate").val(),
                dateFormat: 'dd/mm/yy',
                maxDate: todate,
                onSelect: function (dateReturnText, inst) {
                    $("#ContentPlaceHolder1_xtxtToDate").text("");
                    $("#ContentPlaceHolder1_xtxtToDate").text(dateReturnText);
                    return false;
                }
            });
            $("#ContentPlaceHolder1_xtxtToDate").text("").text(dateText.toString());
            return false;
        }
    }).attr('readonly', 'true');

    $("#ContentPlaceHolder1_xtxtToDate").datepicker({
        dateFormat: 'dd/mm/yy',
        minDate: fromdate,
        maxDate: todate
    }).attr('readonly', 'true');

    $("#txtFromDate_1").datepicker({
        dateFormat: 'dd/mm/yy',
        onSelect: function (dateText, inst) {
        $("#txtToDate_1").val('');
        $("#txtToDate_1").datepicker("destroy");
        $("#txtToDate_1").datepicker({
            minDate: $("#txtFromDate_1").val(),
            dateFormat: 'dd/mm/yy',
            //maxDate: todate,
            onSelect: function (dateReturnText, inst) { $("#txtToDate_1").text(""); $("#txtToDate_1").text(dateReturnText); return false; }
        });
        $("#txtToDate_1").text("").text(dateText.toString());
        return false;
    }
    }).attr('readonly', 'true');

    $("#txtToDate_1").datepicker({
        dateFormat: 'dd/mm/yy'
    }).attr('readonly', 'true');

    $("#txtFromDate_2").datepicker({
        dateFormat: 'dd/mm/yy',
        onSelect: function (dateText, inst) {
            $("#txtToDate_2").val('');
            $("#txtToDate_2").datepicker("destroy");
            $("#txtToDate_2").datepicker({
                minDate: $("#txtFromDate_2").val(),
                dateFormat: 'dd/mm/yy',
                //maxDate: todate,
                onSelect: function (dateReturnText, inst) { $("#txtToDate_2").text(""); $("#txtToDate_2").text(dateReturnText); return false; }
            });
            $("#txtToDate_2").text("").text(dateText.toString());
            return false;
        }
    }).attr('readonly', 'true');

    $("#txtToDate_2").datepicker({
        dateFormat: 'dd/mm/yy'
    }).attr('readonly', 'true');

    $("#txtFromDate_3").datepicker({
        dateFormat: 'dd/mm/yy',
        onSelect: function (dateText, inst) {
            $("#txtToDate_3").val('');
            $("#txtToDate_3").datepicker("destroy");
            $("#txtToDate_3").datepicker({
                minDate: $("#txtFromDate_3").val(),
                dateFormat: 'dd/mm/yy',
                //maxDate: todate,
                onSelect: function (dateReturnText, inst) { $("#txtToDate_3").text(""); $("#txtToDate_3").text(dateReturnText); return false; }
            });
            $("#txtToDate_3").text("").text(dateText.toString());
            return false;
        }
    }).attr('readonly', 'true');

    $("#txtToDate_3").datepicker({
        dateFormat: 'dd/mm/yy'
    }).attr('readonly', 'true');

    $("#txtFromDate_4").datepicker({
        dateFormat: 'dd/mm/yy',
        onSelect: function (dateText, inst) {
            $("#txtToDate_4").val('');
            $("#txtToDate_4").datepicker("destroy");
            $("#txtToDate_4").datepicker({
                minDate: $("#txtFromDate_4").val(),
                dateFormat: 'dd/mm/yy',
                //maxDate: todate,
                onSelect: function (dateReturnText, inst) { $("#txtToDate_4").text(""); $("#txtToDate_4").text(dateReturnText); return false; }
            });
            $("#txtToDate_4").text("").text(dateText.toString());
            return false;
        }
    }).attr('readonly', true);

    $("#txtToDate_4").datepicker({
        dateFormat: 'dd/mm/yy'
    }).attr('readonly', true);

}


function ValidateSearch() {
    var msg = "";
    if ($("#ContentPlaceHolder1_xtxtFromDate").val() == '') {
        msg = "Please select From Date.";
        ShowToolTip("#ContentPlaceHolder1_xtxtFromDate", msg, "top");
        return false;
    }
    if ($("#ContentPlaceHolder1_xtxtToDate").val() == '') {
        msg = "Please select To Date.";
        ShowToolTip("#ContentPlaceHolder1_xtxtToDate", msg, "top");
        return false;
    }   

    if (msg.length <= 0) {
        return true;
    }
    return false;
}

function GetGraphs() {
    if (ValidateSearch()) {
        GetGraphByMonth();
        //GetGraphByMonthByCategory();
        GetGraphBySpendByCategory();
        GetTopSuppliers()
    }
}

function GetGraphByMonth() {
    var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
    var todate = $("#ContentPlaceHolder1_xtxtToDate").val();
    $("#morris-bar-chart").html('');
    $.ajax({
        url: strUrl + 'ReportCenter/Buyer/SalesSummary.aspx/GetGraph',
        type: 'POST',  // or get
        contentType: 'application/json; charset =utf-8',
        data: "{'mode':'0', " + "'fromDate' : '" + fromdate + "','todate' : '" + todate + "'}",
        dataType: 'json',
        success: function (data) {
            var GraphData = data.d;
            var GraphList;
            var gData = new Array(0);;
            var gDataLabelArray;

            var gDataArray;
            var gDataArrayF = new Array(0);
            if (GraphData != null && GraphData.ErrDesc == "0") {
                GraphList = GraphData.GraphParamList;
                if (GraphList.length > 0) {

                    for (var i = 1; i <= GraphData.MaxVal; i++) {
                        switch (i) {
                            case 1:
                                gData.push({ y: 'Jan', a: 0, b: 0, c: 0 });
                                break;
                            case 2:
                                gData.push({ y: 'Feb', a: 0, b: 0, c: 0 });
                                break;
                            case 3:
                                gData.push({ y: 'Mrc', a: 0, b: 0, c: 0 });
                                break;
                            case 4:
                                gData.push({ y: 'Apr', a: 0, b: 0, c: 0 });
                                break;
                            case 5:
                                gData.push({ y: 'May', a: 0, b: 0, c: 0 });
                                break;
                            case 6:
                                gData.push({ y: 'Jun', a: 0, b: 0, c: 0 });
                                break;
                            case 7:
                                gData.push({ y: 'Jul', a: 0, b: 0, c: 0 });
                                break;
                            case 8:
                                gData.push({ y: 'Aug', a: 0, b: 0, c: 0 });
                                break;
                            case 9:
                                gData.push({ y: 'Sep', a: 0, b: 0, c: 0 });
                                break;
                            case 10:
                                gData.push({ y: 'Oct', a: 0, b: 0, c: 0 });
                                break;
                            case 11:
                                gData.push({ y: 'Nov', a: 0, b: 0, c: 0 });
                                break;
                            case 12:
                                gData.push({ y: 'Dec', a: 0, b: 0, c: 0 });
                                break;
                        }

                        for (var lstGrph = 0; lstGrph < GraphList.length; lstGrph++) {
                            if (i == GraphList[lstGrph].Period) {
                                switch (GraphList[lstGrph].Type) {
                                    case "R":
                                        gData[i - 1].a = GraphList[lstGrph].Val;
                                        break;
                                    case "A":
                                        gData[i - 1].b = GraphList[lstGrph].Val;
                                        break;
                                    case "P":
                                        gData[i - 1].c = GraphList[lstGrph].Val;
                                        break;
                                }
                            }
                        }
                    }

                    Morris.Bar({
                        element: 'morris-bar-chart',
                        data: gData,
                        xkey: 'y',
                        ykeys: ['a', 'b', 'c'],
                        labels: ['RFP', 'Negotiation', 'POs'],
                        hideHover: 'auto',
                        resize: true,
                        //ymax: 500000,
                        barColors: ['#ce1e28', '#efc1c1', '#fcae16']
                    });
                }
            }
            else {
                //alert(newData.ErrDesc);
                $("#morris-bar-chart").html("<h6>No data available</h6>");
            }
        },
        error: function (data) {
        }
    });
}

function GetGraphByMonthByCategory() {
    var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
    var todate = $("#ContentPlaceHolder1_xtxtToDate").val();
    $("#divChart").html('<div id="chart"></div>');          //change 20160726
    $("#chart").html('');
    $.ajax({
        url: strUrl + 'ReportCenter/Buyer/SalesSummary.aspx/GetGraph',
        type: 'POST',  // or get
        contentType: 'application/json; charset =utf-8',
        data: "{'mode':'1', " + "'fromDate' : '" + fromdate + "','todate' : '" + todate + "'}",
        dataType: 'json',
        success: function (data) {
            var GraphData = data.d;
            var GraphList;
            if (GraphData != null && GraphData.ErrDesc == "0") {
                GraphList = GraphData.GraphParamList;
                if (GraphList.length > 0) {
                    var str = '';
                    var strF = '{"height": 500, "bars": [';
                    var Janmth = '[["Jan", 0],';
                    var Febmth = '["Feb", 0],';
                    var Mrcmth = '["March", 0],';
                    var Aprmth = '["Apr", 0],';
                    var Maymth = '["May", 0],';
                    var Junmth = '["Jun", 0],';
                    var Julmth = '["July", 0],';
                    var Augmth = '["Aug", 0],';
                    var Sepmth = '["Sep", 0],';
                    var Octmth = '["Oct", 0],';
                    var Novmth = '["Nov", 0],';
                    var Decmth = '["Dec", 0]]}';


                    if (GraphList.length > 0) {
                        var category;
                        var lstrGrph = 0;

                        for (lstrGrph = 0; lstrGrph < GraphList.length; lstrGrph++) {
                            var t = GraphList[lstrGrph].Type;
                            if (category != t) {
                                category = t;

                                if (str != '') {
                                    str = ',';
                                }
                                else {
                                    str = '';
                                }


                                str = str + '{ "name" : "' + GraphList[lstrGrph].Type + '","values" : '
									+ Janmth + Febmth + Mrcmth + Aprmth + Maymth + Junmth + Julmth + Augmth
									+ Sepmth + Octmth + Novmth + Decmth;
                                var lstGrph = 0;
                                for (lstGrph = 0; lstGrph < GraphList.length; lstGrph++) {
                                    var tt = GraphList[lstGrph].Type;
                                    //if (category = tt) {str1.localeCompare(str2)
                                    var n = category.localeCompare(tt);
                                    if (n == 0) {
                                        //var cs = GraphList[lstGrph].Month;
                                        switch (GraphList[lstGrph].Period) {
                                            case 1:
                                                str = str.replace('[["Jan", 0],', '[["Jan", ' + GraphList[lstGrph].Val + '],');
                                                break;
                                            case 2:
                                                str = str.replace('["Feb", 0],', '["Feb", ' + GraphList[lstGrph].Val + '],');
                                                break;
                                            case 3:
                                                str = str.replace('["March", 0],', '["March", ' + GraphList[lstGrph].Val + '],');
                                                break;
                                            case 4:
                                                str = str.replace('["Apr", 0],', '["Apr", ' + GraphList[lstGrph].Val + '],');
                                                break;
                                            case 5:
                                                str = str.replace('["May", 0],', '["May", ' + GraphList[lstGrph].Val + '],');
                                                break;
                                            case 6:
                                                str = str.replace('["Jun", 0],', '["Jun", ' + GraphList[lstGrph].Val + '],');
                                                break;
                                            case 7:
                                                str = str.replace('["July", 0],', '["July", ' + GraphList[lstGrph].Val + '],');
                                                break;
                                            case 8:
                                                str = str.replace('["Aug", 0],', '["Aug", ' + GraphList[lstGrph].Val + '],');
                                                break;
                                            case 9:
                                                str = str.replace('["Sep", 0],', '["Sep", ' + GraphList[lstGrph].Val + '],');
                                                break;
                                            case 10:
                                                str = str.replace('["Oct", 0],', '["Oct", ' + GraphList[lstGrph].Val + '],');
                                                break;
                                            case 11:
                                                str = str.replace('["Nov", 0],', '["Nov", ' + GraphList[lstGrph].Val + '],');
                                                break;
                                            case 12:
                                                str = str.replace('["Dec", 0]]}', '["Dec", ' + GraphList[lstGrph].Val + ']]}');
                                                break;
                                        }
                                    }
                                }
                                strF += str;
                            }
                        }
                    }
                }
                strF += ']}';
                var obj = JSON.parse(strF);
                $('#chart').barChart(obj);
            }
            else {
                //$('#chart').barChart("")
                //$("#chart").html("");
                $("#divChart").html("<h6>No data available</h6>");
            }
        },
        error: function (data) {
        }
    });
}

function GetGraphBySpendByCategory() {
    var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
    var todate = $("#ContentPlaceHolder1_xtxtToDate").val();
    $("#pie").html('');
    $.ajax({
        url: strUrl + 'ReportCenter/Buyer/SalesSummary.aspx/GetGraph',
        type: 'POST',  // or get
        contentType: 'application/json; charset =utf-8',
        data: "{'mode':'3', " + "'fromDate' : '" + fromdate + "','todate' : '" + todate + "'}",
        dataType: 'json',
        success: function (data) {
            var GraphData = data.d;
            var GraphList;
            if (GraphData != null && GraphData.ErrDesc == "0") {
                GraphList = GraphData.GraphParamList;
                if (GraphList.length > 0) {
                    var strF = '{"data": { "content": ['

                    var lstrGrphT = 0;
                    if (GraphList.length > 0) {
                        for (lstrGrphT = 0; lstrGrphT < GraphList.length; lstrGrphT++) {
                            strF += '{ "label": "' + GraphList[lstrGrphT].Type
								+ '", "value": ' + GraphList[lstrGrphT].Val + ' }';
                            if ((lstrGrphT + 1) != GraphList.length) {
                                strF += ',';
                            }
                        }
                    }
                    strF += ']}}';
                    var obj = JSON.parse(strF);
                    var pie = new d3pie("pie", obj);
                }
                else {
                    $("#pie").html("<h6>No data available</h6>");
                }
            }
            else {
                //alert(newData.ErrDesc);
                $("#pie").html("<h6>No data available</h6>");
            }
        },
        error: function (data) {
        }
    });
}

function GetTopSuppliers() {
    if (ValidateSearch()) {
        var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
        var todate = $("#ContentPlaceHolder1_xtxtToDate").val();
        $("#divTopSuppliersData").html('')
        $.ajax({
            url: strUrl + 'ReportCenter/Buyer/SalesSummary.aspx/GetTopSuppliers',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: "{'fromDate' : '" + fromdate + "','todate' : '" + todate + "'}",
            cache: false,
            success: function (msg) {
                if (msg.d != "0") {
                    $("#divTopSuppliersData").html(msg.d);
                }
                else {
                    ShowModalMsgBox("Renepay", msg.d);
                }
            },
            error: function (data) {
                ShowModalMsgBox("Renepay", data);
            }
        });
    }
}

function GetActivityRpt() {
    if (ValidateSearch()) {
        var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
        var todate = $("#ContentPlaceHolder1_xtxtToDate").val();
        $("#divTopSuppliersData").html('')
        $.ajax({
            url: strUrl + 'ReportCenter/Buyer/SalesSummary.aspx/GetActivityReport',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: "{'fromDate' : '" + fromdate + "','todate' : '" + todate + "'}",
            cache: false,
            success: function (msg) {
                if (msg.d != "0") {
                    $("#divActivityData").html(msg.d);
                }
                else {
                    ShowModalMsgBox("Renepay", msg.d);
                }
            },
            error: function (data) {
                ShowModalMsgBox("Renepay", data);
            }
        });
    }
}

function DownloadBuildYourReport(mode) {
    if (ValidateSearch()) {
        var sel = [];
        var fromdate = "";
        var todate = "";
        if (mode == 0) {
            fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
            todate = $("#ContentPlaceHolder1_xtxtToDate").val();
        }
        else {//To Download Prev. History
            var msg = "";
            if ($("#txtFromDate_4").val() == '') {
                msg = "Please select From Date.";
                ShowToolTip("#txtFromDate_4", msg, "top");
                return false;
            }
            if ($("#txtToDate_4").val() == '') {
                msg = "Please select To Date.";
                ShowToolTip("#txtToDate_4", msg, "top");
                return false;
            }

            if (msg.length <= 0) {
                fromdate = $("#txtFromDate_4").val();
                todate = $("#txtToDate_4").val();
            }
        }

        $('div#ContentPlaceHolder1_DivSearch input[type=checkbox]').each(function () {
            if ($(this).is(":checked")) {
                sel.push($(this).attr('value'));
            }
        });

        if (sel.length > 0) {
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/Buyer/SalesSummary.aspx/DownloadBuildYourReport',
                type: 'POST',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                //data: jsonTxt,
                data: "{ 'arr' : '" + sel + "','fromDate' : '" + fromdate + "','toDate' : '" + todate + "'}",
                cache: false,
                success: function (data) {
                    try {
                        var exportResponse = data.d;
                        if (exportResponse != null & exportResponse.ErrDesc == "0") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det="
                                + exportResponse.Mode + "/" + exportResponse.Key);
                        }
                        else {
                            ShowModalMsgBox("Renepay", "Invalid file parameter");
                        }
                        HideProgress(true);

                    }
                    catch (e) {
                        HideProgress(true);
                        ShowModalMsgBox("Renepay", e.message);

                    }
                },
                error: function (data) {
                    ShowModalMsgBox("Renepay", data);
                }
            });
        }
        else {
            ShowModalMsgBox("Renepay", "Please select at least one field.");
        }
    }
}

function DownloadHistory(mode) {
    var msg = "";
    if ($("#txtFromDate_" + mode).val() == '') {
        msg = "Please select From Date.";
        ShowToolTip("#txtFromDate_" + mode, msg, "top");
        return false;
    }
    if ($("#txtToDate_" + mode).val() == '') {
        msg = "Please select To Date.";
        ShowToolTip("#txtToDate_" + mode, msg, "top");
        return false;
    }

    if (msg.length <= 0) {
        var fromdate = $("#txtFromDate_" + mode).val();
        var todate = $("#txtToDate_" + mode).val();
        ShowProgress(true);
        $.ajax({
            url: strUrl + 'ReportCenter/Buyer/SalesSummary.aspx/DownloadHistory',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: "{ 'mode' : '" + mode + "', 'fromDate' : '" + fromdate
				+ "','todate' : '" + todate + "'}",
            cache: false,
            success: function (data) {
                try {
                    var exportResponse = data.d;
                    if (exportResponse != null & exportResponse.ErrDesc == "0") {

                        window.open(strUrl + "Handlers/FileCreate.ashx?det="
							+ exportResponse.Mode + "/"
							+ exportResponse.Key);
                    }
                    else {
                        ShowModalMsgBox("Renepay", "Invalid file parameter");
                    }
                    HideProgress(true);

                }
                catch (e) {
                    HideProgress(true);
                    ShowModalMsgBox("Renepay", e.message);

                }
            },
            error: function (data) {
                ShowModalMsgBox("Renepay", data);
            }
        });
    }
}

//function GetGraphByMonth() {
//    var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
//    var todate = $("#ContentPlaceHolder1_xtxtToDate").val();
//    $("#morris-bar-chart").html('');
//    $.ajax({
//        url: strUrl + 'ReportCenter/Buyer/SalesSummary.aspx/GetGraph',
//        type: 'POST',  // or get
//        contentType: 'application/json; charset =utf-8',
//        data: "{'mode':'0', " + "'fromDate' : '" + fromdate + "','todate' : '" + todate + "'}",
//        dataType: 'json',
//        success: function (data) {
//            var GraphData = data.d;
//            var GraphList;
//            var gData;
//            if (GraphData != null && GraphData.ErrDesc == "0") {
//                GraphList = GraphData.GraphParamList;
//                if (GraphList.length > 0) {
//                    switch (GraphData.Type) {
//                        case "MTH":
//                            gData = [{ y: 'Jan', a: 0 }, { y: 'Feb', a: 0 }, { y: 'Mar', a: 0 },
//									{ y: 'Apr', a: 0 }, { y: 'May', a: 0 }, { y: 'Jun', a: 0 }];
//                            for (var i = 0; i < GraphList.length; i++) {
//                                gData[GraphList[i].Period - 1].a = GraphList[i].Val;
//                            }
//                            break;
//                        case "QTR":
//                            gData = [{ y: 'Jan-Mar', a: 0 }, { y: 'Apr-Jun', a: 0 },
//								{ y: 'Jul-Sep', a: 0 }, { y: 'Oct-Dec', a: 0 }];
//                            for (var i = 0; i < GraphList.length; i++) {
//                                gData[GraphList[i].Period - 1].a = GraphList[i].Val;
//                            }
//                            break;
//                    }

//                    Morris.Bar({
//                        element: 'morris-bar-chart',
//                        data: gData,
//                        xkey: 'y',
//                        ykeys: ['a'],
//                        labels: ['Amount'],
//                        hideHover: 'auto',
//                        resize: true,
//                        //ymax: 500000,
//                        barColors: ['#ce2127']
//                    });
//                }
//            }
//            else {
//                //alert(newData.ErrDesc);
//            }
//        },
//        error: function (data) {
//        }
//    });
//}