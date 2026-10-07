$(document).ready(function () {
    $('#tblList1').DataTable({
        responsive: true
    });
    $('#tblList2').DataTable({
        responsive: true
    });
    $('#tblList3').DataTable({
        responsive: true
    });
});

$(document).ready(function () {
    BindDatePicker();
    ShowDateSelection();    
    GetWithdrawnRFP();
});

Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
    BindDatePicker();
    SetDataTablePaging("#tblList1");
    SetDataTablePaging("#tblList2");
    SetDataTablePaging("#tblList3");
});



function BindDatePicker() {
    var d = new Date();
    var day = d.getDate();
    var mnth = d.getMonth() + 1;
    var y = d.getFullYear();

    $("#ContentPlaceHolder1_xtxtFromDate").datepicker({
        dateFormat: 'dd/mm/yy',
        //maxDate: d,
        onSelect: function (dateText, inst) {
            $("#ContentPlaceHolder1_xtxtToDate").val('');
            $("#ContentPlaceHolder1_xtxtToDate").datepicker("destroy");
            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                minDate: $("#ContentPlaceHolder1_xtxtFromDate").val(),
                dateFormat: 'dd/mm/yy',
                //maxDate: d,
                onSelect: function (dateReturnText, inst) { $("#ContentPlaceHolder1_xtxtToDate").text(""); $("#ContentPlaceHolder1_xtxtToDate").text(dateReturnText); return false; }
            });            
            $("#ContentPlaceHolder1_xtxtToDate").val(day + '/' + mnth + '/' + y);
            return false;
        }
    }).attr('readonly', 'true');

    $("#ContentPlaceHolder1_xtxtToDate").datepicker({
        dateFormat: 'dd/mm/yy',
        //maxDate: d
    }).attr('readonly', 'true');

    $("#ContentPlaceHolder1_xtxtFromDate1").datepicker({
        dateFormat: 'dd/mm/yy',
        maxDate: d,
        onSelect: function (dateText, inst) {
            $("#ContentPlaceHolder1_xtxtToDate1").val('');
            $("#ContentPlaceHolder1_xtxtToDate1").datepicker("destroy");
            $("#ContentPlaceHolder1_xtxtToDate1").datepicker({
                minDate: $("#ContentPlaceHolder1_xtxtFromDate1").val(),
                dateFormat: 'dd/mm/yy',
                maxDate: d,
                onSelect: function (dateReturnText, inst) { $("#ContentPlaceHolder1_xtxtToDate1").text(""); $("#ContentPlaceHolder1_xtxtToDate1").text(dateReturnText); return false; }
            });            
            $("#ContentPlaceHolder1_xtxtToDate1").val(day + '/' + mnth + '/' + y);
            return false;
        }
    }).attr('readonly', 'true');

    $("#ContentPlaceHolder1_xtxtToDate1").datepicker({
        dateFormat: 'dd/mm/yy',
        maxDate: d
    }).attr('readonly', 'true');



}

function ShowDateSelection() {
    if ($("#ContentPlaceHolder1_rdRFPEndDate").is(":checked")) {

        $("#xdivModifiedFromDate").hide();
        $("#xdivModifiedToDate").hide();

        $("#xdivFromDate").show();
        $("#xdivToDate").show();
    }
    else {

        $("#xdivFromDate").hide();
        $("#xdivToDate").hide();
        
        $("#xdivModifiedFromDate").show();
        $("#xdivModifiedToDate").show();
    }
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
    if ($("#ContentPlaceHolder1_xtxtFromDate1").val() == '') {
        msg = "Please select From Date.";
        ShowToolTip("#ContentPlaceHolder1_xtxtFromDate1", msg, "top");
        return false;
    }
    if ($("#ContentPlaceHolder1_xtxtToDate1").val() == '') {
        msg = "Please select To Date.";
        ShowToolTip("#ContentPlaceHolder1_xtxtToDate1", msg, "top");
        return false;
    }

    if (msg.length <= 0) {
        return true;
    }
    return false;
}

function GetWithdrawnRFP() {
    if (ValidateSearch()) {        
        var mode = 0;
        var ramid = 0;        
        var stateid = 0;
        var dateselector = 0;
        var showallRFP = true;
        var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
        var todate = $("#ContentPlaceHolder1_xtxtToDate").val();

        var modifiedfromdate = $("#ContentPlaceHolder1_xtxtFromDate1").val();
        var modifiedtodate = $("#ContentPlaceHolder1_xtxtToDate1").val();

        if ($("#ContentPlaceHolder1_xddlState option:selected").index() > 0) {
            stateid = $("#ContentPlaceHolder1_xddlState").val();
        }

        if ($("#ContentPlaceHolder1_xddlRAMList option:selected").index() > 0) {
            ramid = $("#ContentPlaceHolder1_xddlRAMList").val();
        }
        if ($("#ContentPlaceHolder1_rdRFPModifiedDate").is(":checked")) {
            dateselector = 1; //For RFP Modified Date
        }
        $("#divWithdrawnRFP").html('')
        $.ajax({            
            url: strUrl + 'ReportCenter/RFPReports/RAMReports.aspx/GetWithdrawnRFP',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: "{'fromDate' : '" + fromdate + "','todate' : '" + todate + "','modifiedfromDate' : '" + modifiedfromdate + "','modifiedtodate' : '" + modifiedtodate + "','stateid' : '" + stateid + "','ramid' : '" + ramid + "','mode' : '" + mode + "','dateselector' : '" + dateselector + "'}",
            cache: false,
            success: function (msg) {
                if (msg.d != "") {
                    if (msg.d == "1") {
                        $("#divWithdrawnRFP").html("<h6>No data found</h6>");                                              
                        $("#divDownload1").hide();
                    }
                    else {
                        $("#divDownload1").show();
                        $("#divWithdrawnRFP").html(msg.d);
                        SetDataTablePaging("#tblList1");                        
                    }
                }
                else {
                    ShowModalMsgBox("Error", msg.d);
                    $("#divDownload1").hide();
                }
            },
            error: function (data) {
                ShowModalMsgBox("Error", data);
            }
        });
    }
}

function GetRFPInProgress(showallRFP) {
    if (ValidateSearch()) {
        var mode = 1;
        var ramid = 0;        
        var stateid = 0;
        var dateselector =0;
        var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
        var todate = $("#ContentPlaceHolder1_xtxtToDate").val();

        var modifiedfromdate = $("#ContentPlaceHolder1_xtxtFromDate1").val();
        var modifiedtodate = $("#ContentPlaceHolder1_xtxtToDate1").val();

        if ($("#ContentPlaceHolder1_xddlState option:selected").index() > 0) {
            stateid = $("#ContentPlaceHolder1_xddlState").val();
        }
        if ($("#ContentPlaceHolder1_xddlRAMList option:selected").index() > 0) {
            ramid = $("#ContentPlaceHolder1_xddlRAMList").val();
        }
        if ($("#ContentPlaceHolder1_rdRFPModifiedDate").is(":checked")) {
            dateselector = 1; //For RFP Modified Date
        }

        $("#divRFPInProgress").html('')
        $.ajax({
            url: strUrl + 'ReportCenter/RFPReports/RAMReports.aspx/GetRFPInProgress',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',            
            data: "{'fromDate' : '" + fromdate + "','todate' : '" + todate + "','modifiedfromDate' : '" + modifiedfromdate + "','modifiedtodate' : '" + modifiedtodate
                + "','stateid' : '" + stateid + "','ramid' : '" + ramid + "','mode' : '" + mode + "','dateselector' : '" + dateselector + "','showallRFP' : '" + showallRFP + "'}",
            
            cache: false,
            success: function (msg) {
                if (msg.d != "") {
                    if (msg.d == "1") {
                        $("#divRFPInProgress").html("<h6>No data found</h6>");
                        $("#divDownload2").hide();
                        
                    }
                    else {                        
                        $("#divDownload2").show();
                        $("#divRFPInProgress").html(msg.d);
                        SetDataTablePaging("#tblList2");
                    }

                }
                else {
                    ShowModalMsgBox("Error", msg.d);
                    $("#divDownload2").hide();
                }
            },
            error: function (data) {
                ShowModalMsgBox("Error", data);
            }
        });
    }
}

function GetRFPInNegotiation() {
    if (ValidateSearch()) {        
        var mode = 2;
        var ramid = 0;        
        var stateid = 0;
        var dateselector = 0;
        var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
        var todate = $("#ContentPlaceHolder1_xtxtToDate").val();

        var modifiedfromdate = $("#ContentPlaceHolder1_xtxtFromDate1").val();
        var modifiedtodate = $("#ContentPlaceHolder1_xtxtToDate1").val();

        if ($("#ContentPlaceHolder1_xddlState option:selected").index() > 0) {
            stateid = $("#ContentPlaceHolder1_xddlState").val();
        }
        if ($("#ContentPlaceHolder1_xddlRAMList option:selected").index() > 0) {
            ramid = $("#ContentPlaceHolder1_xddlRAMList").val();
        }
        if ($("#ContentPlaceHolder1_rdRFPModifiedDate").is(":checked")) {
            dateselector = 1; //For RFP Modified Date
        }

        $("#divRFPInNegotiation").html('')
        $.ajax({
            url: strUrl + 'ReportCenter/RFPReports/RAMReports.aspx/GetRFPInNegotiation',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: "{'fromDate' : '" + fromdate + "','todate' : '" + todate + "','modifiedfromDate' : '" + modifiedfromdate + "','modifiedtodate' : '" + modifiedtodate + "','stateid' : '" + stateid + "','ramid' : '" + ramid + "','mode' : '" + mode + "','dateselector' : '" + dateselector + "'}",
            cache: false,
            success: function (msg) {
                if (msg.d != "") {
                    if (msg.d == "1") {
                        $("#divRFPInNegotiation").html("<h6>No data found</h6>");
                        $("#divDownload3").hide();
                    }
                    else {
                        $("#divDownload3").show();
                        $("#divRFPInNegotiation").html(msg.d);                        
                        SetDataTablePaging("#tblList3");
                    }
                }
                else {
                    ShowModalMsgBox("Error", msg.d);
                    $("#divDownload3").hide();
                }
            },
            error: function (data) {
                ShowModalMsgBox("Error", data);
            }
        });
    }
}

function DownloadReport(mode) { 
    if (ValidateSearch()) {        
        ShowProgress(true);
        $.ajax({            
            url: strUrl + 'ReportCenter/RFPReports/RAMReports.aspx/DownloadReport',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: "{ 'mode' : '" + mode + "'}",
            cache: false,
            success: function (data) {
                try {
                    var exportResponse = data.d;
                    if (exportResponse != null) {

                        window.open(strUrl + "Handlers/FileCreate.ashx?det="
							+ exportResponse.Mode + "/"
							+ exportResponse.Key);
                    }
                    else {
                        ShowMessageBox("Invalid file parameter");
                    }
                    HideProgress(true);

                }
                catch (e) {
                    HideProgress(true);
                    ShowModalMsgBox("Error", e.message);

                }
            },
            error: function (data) {
                ShowModalMsgBox("Error", data);
            }
        });
    }
}