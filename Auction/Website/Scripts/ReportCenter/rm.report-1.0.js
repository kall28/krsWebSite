$(document).ready(function () {
    BindDatePicker();
    //ValidateSearch(1,false);
});

Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
    BindDatePicker();
});

function tbllistStyle(tbl) {
    $(document).ready(function () {
        //$('#tblList').DataTable({
        var t = '#' + tbl;
        $(t).DataTable({
            responsive: true
        });
    });
}

function BindDatePicker() {
    var d = new Date();
    var day = d.getDate();
    var mnth = d.getMonth() + 1;
    var y = d.getFullYear();

    $("#ContentPlaceHolder1_xtxtFromDate").datepicker({
        dateFormat: 'dd/mm/yy',
        maxDate: d,
        onSelect: function (dateText, inst) {
            $("#ContentPlaceHolder1_xtxtToDate").val('');
            $("#ContentPlaceHolder1_xtxtToDate").datepicker("destroy");
            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                minDate: $("#ContentPlaceHolder1_xtxtFromDate").val(),
                dateFormat: 'dd/mm/yy',
                //maxDate: d,
                onSelect: function (dateReturnText, inst) { $("#ContentPlaceHolder1_xtxtToDate").text(""); $("#ContentPlaceHolder1_xtxtToDate").text(dateReturnText); return false; }
            });
            //$("#ContentPlaceHolder1_xtxtToDate").text("").text(dateText.toString());
            $("#ContentPlaceHolder1_xtxtToDate").val(day + '/' + mnth + '/' + y);
            return false;
        }
    }).attr('readonly', 'true');

    $("#ContentPlaceHolder1_xtxtToDate").datepicker({
        dateFormat: 'dd/mm/yy',
        //maxDate: d
    }).attr('readonly', 'true');

}

function ValidateSearch(vmode, showAllLiveRFP) {
    var msg = "";
    if (($("#ContentPlaceHolder1_xtxtFromDate").val() == '') && ($("#ContentPlaceHolder1_xtxtToDate").val() == '')) {
        msg = "Please select From Date and To Date.";
        ShowModalMsgBox("Renepay", msg);
        HideProgress();
        return false;
    }
    else {
        if ($("#ContentPlaceHolder1_xtxtFromDate").val() == '') {
            msg = "Please select From Date.";
            ShowToolTip("#ContentPlaceHolder1_xtxtFromDate", msg, "top");
            HideProgress();
            return false;
        }
        if ($("#ContentPlaceHolder1_xtxtToDate").val() == '') {
            msg = "Please select To Date.";
            ShowToolTip("#ContentPlaceHolder1_xtxtToDate", msg, "top");
            HideProgress();
            return false;
        }
    }
    if (msg.length <= 0) {
        //ShowProgress(true);
        GetRMReport(vmode, showAllLiveRFP);
        //ShowProgress(false);
        //HideProgress();
        
        return true;
    }
    HideProgress();
    return false;
    //ShowProgress(false);
}

function GetRMReport(vmode,showAllLiveRFP) {
    var errroMsg = '<h5>No data found.</h5>';
    var mode = vmode;
    var rmid = 0;
    var companyid = 0;
    var stateid = 0;
    var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
    var todate = $("#ContentPlaceHolder1_xtxtToDate").val();

    if ($("#ContentPlaceHolder1_xddlAcManager option:selected").index() > 0) {
        rmid = $("#ContentPlaceHolder1_xddlAcManager").val();
    }
    if ($("#ContentPlaceHolder1_xddlState option:selected").index() > 0) {
        stateid = $("#ContentPlaceHolder1_xddlState").val();
    }
    if ($("#ContentPlaceHolder1_xddlCompany option:selected").index() > 0) {
        companyid = $("#ContentPlaceHolder1_xddlCompany").val();
    }

    $("#divWithdrawn").html('');
    $("#divLiveStage").html('');
    $("#divPendingStage").html('');
    $("#divPOStage").html('');
    $.ajax({
        url: strUrl + 'ReportCenter/RFPReports/RMReportOld.aspx/GetRMReport',
        type: 'POST',
        contentType: 'application/json;charset=utf-8',
        dataType: 'json',
        data: "{'fromDate' : '" + fromdate + "','todate' : '" + todate + "','companyid' : " + companyid + ",'stateid' : " + stateid + ",'rmid' : "
                        + rmid + ",'mode' : " + mode + ",'showAllLiveRFP' : " + showAllLiveRFP + "}",
        cache: false,
        success: function (msg) {
            //if (msg.d != "0") {
            if (msg.d != "") {
                switch (mode) {
                    case 1:
                        if (msg.d != "1") {
                            $("#divWithdrawn").html(msg.d);
                            tbllistStyle('tblList1');
                            document.getElementById('ContentPlaceHolder1_btnDownloadWithdrawn').style.visibility = 'visible';
                            showcollapse1();
                        }
                        else {
                            $("#divWithdrawn").html(errroMsg);
                            document.getElementById('ContentPlaceHolder1_btnDownloadWithdrawn').style.visibility = 'hidden';
                            showcollapse1();
                        }
                        break;
                    case 2:
                        if (msg.d != "1") {
                            $("#divLiveStage").html(msg.d);
                            tbllistStyle('tblList2');
                            document.getElementById('ContentPlaceHolder1_btnDownloadLive').style.visibility = 'visible';
                            break;
                        }
                        else {
                            $("#divLiveStage").html(errroMsg);
                            document.getElementById('ContentPlaceHolder1_btnDownloadLive').style.visibility = 'hidden';
                            break;
                        }
                    case 3:
                        if (msg.d != "1") {
                            $("#divPendingStage").html(msg.d);
                            tbllistStyle('tblList3');
                            document.getElementById('ContentPlaceHolder1_btnDownloadPending').style.visibility = 'visible';
                            break;
                        }
                        else {
                            $("#divPendingStage").html(errroMsg);
                            document.getElementById('ContentPlaceHolder1_btnDownloadPending').style.visibility = 'hidden';
                            break;
                        }
                    case 4:
                        if (msg.d != "1") {
                            $("#divPOStage").html(msg.d);
                            tbllistStyle('tblList4');
                            document.getElementById('ContentPlaceHolder1_btnDownloadPOStage').style.visibility = 'visible';
                            break;
                        }
                        else {
                            $("#divPOStage").html(errroMsg);
                            document.getElementById('ContentPlaceHolder1_btnDownloadPOStage').style.visibility = 'hidden';
                            break;
                        }
                }
            }
            else {
                ShowModalMsgBox("Renepay", "No data found.");
            }
        },
        error: function (data) {
            ShowModalMsgBox("Renepay", data);
        }
    });
    //HideProgress();
    //ShowProgress(false);
}

function DownloadReport() {
    ShowProgress(true);
    var WithCategories = false;
    if ($("#ContentPlaceHolder1_xrdbCategory").prop("checked")) {
        WithCategories = true;
    }
    $.ajax({
        url: strUrl + 'ReportCenter/RFPReports/RMReportOld.aspx/DownloadReport',
        type: 'POST',  // or get
        contentType: 'application/json; charset =utf-8',
        data: "{'WithCategories':'" + WithCategories + "'}",
        dataType: 'json',
        success: function (data) {
            try {
                var newData = data.d;
                if (newData != "") {
                    window.open(strUrl + "Handlers/FileCreate.ashx?det=0/" + newData);
                }
                else {
                    ShowModalMsgBox("Renepay", "Invalid file parameter");
                }
                HideProgress();
            }
            catch (e) {
                HideProgress();
                ShowModalMsgBox("Renepay", e.Message);
            }
        },
        error: function (data) {
            HideProgress();
            ShowModalMsgBox("Renepay", data);
        }
    });
    return true;
}


function ValidateSearchRMReport() {
    var msg = "";
    if (($("#ContentPlaceHolder1_xtxtFromDate").val() == '') && ($("#ContentPlaceHolder1_xtxtToDate").val() == '')) {
        msg = "Please select From Date and To Date.";
        ShowModalMsgBox("Renepay", msg);
        HideProgress();
        return false;
    }
    else {
        if ($("#ContentPlaceHolder1_xtxtFromDate").val() == '') {
            msg = "Please select From Date.";
            ShowToolTip("#ContentPlaceHolder1_xtxtFromDate", msg, "top");
            HideProgress();
            return false;
        }
        if ($("#ContentPlaceHolder1_xtxtToDate").val() == '') {
            msg = "Please select To Date.";
            ShowToolTip("#ContentPlaceHolder1_xtxtToDate", msg, "top");
            HideProgress();
            return false;
        }
    }
    if (msg.length <= 0) {                        
        return true;
    }
    HideProgress();
    return false;    
}


function DownloadRMReport() {    
    ShowProgress(true);
    if (ValidateSearchRMReport()) {
        var datefilter = 0;
        var rmid = 0;
        var companyid = 0;
        var stateid = 0;        
        var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
        var todate = $("#ContentPlaceHolder1_xtxtToDate").val();        

        if ($("#ContentPlaceHolder1_xddlDateFilter option:selected").index() > 0) {
            datefilter = $("#ContentPlaceHolder1_xddlDateFilter").val();
        }
        if ($("#ContentPlaceHolder1_xddlAcManager option:selected").index() > 0) {
            rmid = $("#ContentPlaceHolder1_xddlAcManager").val();
        }
        if ($("#ContentPlaceHolder1_xddlState option:selected").index() > 0) {
            stateid = $("#ContentPlaceHolder1_xddlState").val();
        }
        if ($("#ContentPlaceHolder1_xddlCompany option:selected").index() > 0) {
            companyid = $("#ContentPlaceHolder1_xddlCompany").val();
        }        
        $.ajax({            
            url: strUrl + 'ReportCenter/RFPReports/RMReport.aspx/DownloadRMData',            
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: "{'datefilter' : '" + datefilter + "','fromDate' : '" + fromdate + "','todate' : '" + todate + "','rmid' : '"
                            + rmid + "','companyid' : '" + companyid + "','stateid' : '" + stateid + "'}",
            cache: false,
            success: function (data) {
                try
                {
                    var newdata=  data.d;
                    if(newdata != ""){
                        window.open(strUrl +"Handlers/FileCreate.ashx?det=0/"+newdata);
                    }
                    else{
                        ShowModalMsgBox("Renepay", "Invalid file parameter");
                    }
                    HideProgress();
                }
                catch(e){                
                    HideProgress();
                    ShowModalMsgBox("Renepay", e.Message);
                }                                
            },
            error:function(data){
                ShowModalMsgBox("Renepay", data);                
            }            

        });
    }    
}

