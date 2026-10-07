
function HideProgress() {
    $("#divProgressBox").modal('hide');
}

function SetAction(val) {
    $("#btnPRO").show();
    $("#btnRFP").show();
    $("#btnAUC").show();
    $("#btnPO").show();
    $("#btnTRN").show();
    $("#btnInv").show();

    $("#divPRO").hide();
    $("#divRFP").hide();
    $("#divAUC").hide();
    $("#divPO").hide();
    $("#divTRN").hide();
    $("#divInv").hide();

    $("#btn" + val).hide();
    $("#div" + val).show();
}

function CustomerSearch() {
    ShowProgress(true);
    $("#divCustList").html('');    
    $("#divFullDet").hide();
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/CustomerSearch',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'Email': '" + $("#txtEmail").val() + "','Mobile':'" + $("#txtMobile").val()
                    + "','Name':'" + $("#txtName").val() + "','ContactPerson':'" + $("#txtContactPerson").val() + "'}",
        cache: false,
        success: function (msg) {
            $("#divCustList").html(msg.d);
            SetDataTablePaging("#tblList");            
            HideProgress();
        },
        error: ShowError
    });
   
}
function CustomerFullDetailsBack() {
    ShowProgress(true);
    $("#divSearch").show();
    $("#divClose").show();    
    $("#divPRO").html('');
    $("#divFullDet").hide();
    CustomerSearch();
    $("#divCustList").show();
    HideProgress();
}

function CustomerFullDetails(Id, entityType) {
    ShowProgress(true);
    $("#divDet").html('')
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/CustomerFullDetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'Id': '" + Id + "','entityType':'" + entityType + "'}",
        cache: false,
        success: function (msg) {
            $("#divClose").hide();
            $("#divSearch").hide();
            $("#divDet").html(msg.d);
            $("#divCustList").html('');
            $("#divFullDet").show();
            SetAction("PRO");
            HideProgress();
        },
        error: ShowError
    });
}

function CustomerRFPDetails(Id, entityType, mode) {
    ShowProgress(true);
    SetAction("RFP");
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/CustomerRFPDetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'Id': '" + Id + "','entityType':'" + entityType
                    + "', 'mode': " + mode + "}",
        cache: false,
        success: function (msg) {
            $("#divRFP").html(msg.d);
            SetDataTablePaging("#tblRFP");
            //ShowProgress(false);
            HideProgress();
        },
        error: ShowError
    });
}

function RFPDetails(Id) {
    ShowProgress(true);
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/ShowRFPDetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'Id': '" + Id + "'}",
        cache: false,
        success: function (msg) {
            ShowModalReportBox("RFP Details", msg.d);
            HideProgress();            
        },
        error: ShowError
    });
}

function AuctionDetails(Id) {
    ShowProgress(true);
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/ShowAuctionDetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'Id': '" + Id + "'}",
        cache: false,
        success: function (msg) {
            ShowModalReportBox("Auction Details", msg.d);
            HideProgress();            
        },
        error: ShowError
    });
}

function RFPVendorDetails(Id, entityId) {
    ShowProgress(true);
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/ShowRFPVendorDetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'Id': '" + Id + "','entityId' :'" + entityId + "'}",
        cache: false,
        success: function (msg) {
            ShowModalReportBox("RFP Vendor Details", msg.d);
           // ShowGenPopup(msg.d);
            SetDataTablePaging("#tblRFPVendors");
            HideProgress();
        },
        error: ShowError
    });
}
function CustomerAUCDetails(Id, entityType, mode) {
    ShowProgress(true);
    SetAction("AUC");
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/CustomerAUCDetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'Id': '" + Id + "','entityType':'" + entityType
                    + "', 'mode': " + mode + "}",
        cache: false,
        success: function (msg) {
            $("#divAUC").html(msg.d);
            SetDataTablePaging("#tblAUC");
            HideProgress();
        },
        error: ShowError
    });
}
function ShowAuctionVendorList(aucId,vendorId) {
    isNewQue = false;
    ShowProgress(true);
    $.ajax({
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/ShowAUCVendorList',
        type: 'POST',  // or get
        contentType: 'application/json; charset =utf-8',
        data: "{'aucId' : '" + aucId + "','vendorId': '" + vendorId + "'}",
        dataType: 'json',
        success: function (data) {            
            ShowModalReportBox("", data.d);
            SetDataTablePaging("#tblAucVendors");
            HideProgress();
        },
        error: ShowError
    });
}

function ShowAuctionBidHistory(val,vendorId) {
    ShowProgress(true);
    $.ajax({
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/ShowAucBidHistory',
        type: 'POST',  // or get
        contentType: 'application/json; charset =utf-8',
        data: "{'aucId' : '" + val + "','vendorId': '" + vendorId + "'}",
        dataType: 'json',
        success: function (data) {            
            ShowModalReportBox("", data.d);
            SetDataTablePaging("#tblAucBidDet");
            HideProgress();
        },
        error: ShowError
    });
}
function CustomerPODetails(Id, entityType, mode) {
    ShowProgress(true);
    SetAction("PO");
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/CustomerPODetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'Id': '" + Id + "','entityType':'" + entityType
                    + "', 'mode': " + mode + "}",
        cache: false,
        success: function (msg) {
            $("#divPO").html(msg.d);
            SetDataTablePaging("#tblPO");
            HideProgress();
        },
        error: ShowError
    });
}
function PODetails(POId) {
    ShowProgress(true);
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/PODetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'POId': '" + POId + "'}",
        cache: false,
        success: function (msg) {            
            ShowModalReportBox("", msg.d);
            HideProgress();
        },
        error: ShowError
    });
}
function CustomerInvoiceDetails(Id, entityType, mode) {
    ShowProgress(true);
    SetAction("Inv");
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/CustomerInvoiceDetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'Id': '" + Id + "','entityType':'" + entityType
                    + "', 'mode': " + mode + "}",
        cache: false,
        success: function (msg) {
            $("#divInv").html(msg.d);
            SetDataTablePaging("#tblInv");
            HideProgress();
        },
        error: ShowError
    });
}
function InvoiceDetails(InvoiceId) {
    ShowProgress(true);
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/InvoiceDetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'InvoiceId': '" + InvoiceId + "'}",
        cache: false,
        success: function (msg) {            
            ShowModalReportBox("", msg.d);
            HideProgress();
        },
        error: ShowError
    });
}
function ShowInvoiceTaxList(InvoiceId) {
    ShowProgress(true);
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/ShowInvoiceTaxList',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'InvoiceId': '" + InvoiceId + "'}",
        cache: false,
        success: function (msg) {            
            ShowModalReportBox("", msg.d);
            SetDataTablePaging("#tblTaxDet");
            HideProgress();
        },
        error: ShowError
    });
}
function CustomerTRNDetails(Id, entityType, mode) {
   
    ShowProgress(true);
    SetAction("TRN");
//    if ($("#txtFromDate").val() == '' && $("#txtToDate").val() == '') {
//        FromDate ="";
//        Todate = "";
//    }
//    else {
//        FromDate = $('#txtFromDate').val();
//        Todate = $('#txtToDate').val();
//    }
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/CustomerTRNDetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'Id': '" + Id + "','entityType':'" + entityType
                    + "', 'mode': " + mode + "}",
        cache: false,
        success: function (msg) {
            $("#divTRN").html(msg.d);
            SetDataTablePaging("#tblPO");
            HideProgress();
        },
        error: ShowError
    });
}
function TransDetails(TransId) {
    ShowProgress(true);
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/ShowTransDetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'TransId': '" + TransId + "'}",
        cache: false,
        success: function (msg) {            
            ShowModalReportBox("", msg.d);
            HideProgress();
        },
        error: ShowError  
    });
}
function PaymentDetails(PaymentId) {
    ShowProgress(true);
    $.ajax({
        type: 'POST',
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/ShowPaymentDetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: "{'PaymentId': '" + PaymentId + "'}",
        cache: false,
        success: function (msg) {            
            ShowModalReportBox("", msg.d);
            HideProgress();
        },
        error: ShowError
    });
}

function SearchTRNDetails(Id, entityType, mode) {   
    SetAction("TRN");
    $.ajax({
        type: 'POST',        
        url: strUrl + 'SearchCenter/CustomerSearch.aspx/SearchTransactionDetails',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',        
        data: "{'Id': '" + Id + "','entityType':'" + entityType
                    + "', 'mode': " + mode + "','fromDate' : " + $("#txtFromDate").val() + ",'todate' : " + $("#txtToDate").val() + "}",

        cache: false,
        success: function (msg) {
            $("#divTRN").html(msg.d);            
        },
        error: ShowError
    });
}

function HideTransactionDetails() {   
    //$("#divTransDetails").hide();
    $("#divPODet").hide();    
    $("#divTRN").hide();
}