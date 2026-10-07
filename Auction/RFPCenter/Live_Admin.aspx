<%@ page language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="RFPCenter_Live_Admin, App_Web_live_admin.aspx.f5f1fac" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <link href="../Scripts/TimePicker/jquery.ui.timepicker.css?v=0.3.3" rel="stylesheet" />
    <asp:UpdatePanel ID="xupnlRFP" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <script src="../Scripts/common.timer-1.0.js" type="text/javascript"></script>
            <script src="../Scripts/TimePicker/jquery.ui.timepicker.js"></script>
            <script src="../Scripts/jquery.signalR-2.2.0.min.js"></script>
            <script src="/signalr/hubs"></script>
            <script>
                $(document).ready(function () {
                    //toggle the componenet with class accordion_body
                    $(".accordion_head").click(function () {
                        //alert($(this).attr('id'));
                        if ($(this).next('.accordion_body').is(':visible')) {
                            $(this).next(".accordion_body").slideUp(300);
                            $(this).children(".plusminus").text('+');
                        }
                        else {
                            if ($('.accordion_body').is(':visible')) {
                                $(".accordion_body").slideUp(300);
                                $(".plusminus").text('+');
                            }
                            $(this).next(".accordion_body").slideDown(300);
                            $(this).removeClass("chatAlert");
                            $('#' + $(this).attr('id').replace('div', 'ulChat')).scrollTop($('#' + $(this).attr('id').replace('div', 'ulChat'))[0].scrollHeight);
                            $(this).children(".plusminus").text('-');
                        }
                    });

                    $(".modal").on('hidden.bs.modal', function () {
                        $('body').css('padding-right', '0px');
                    });

                });
            </script>
            <script>
                function ShowTotal() {
                    var uPrice = 0;
                    var qty = 0;
                    var total = 0;
                    var delChrg = 0;
                    var tax1 = 0;
                    var tax2 = 0;
                    var tax3 = 0;
                    var NetAmt = 0;
                    if ($("#txtUnitPrice").val() != "") {
                        uPrice = parseFloat($("#txtUnitPrice").val());
                    }

                    if ($("#txtQuantity").val() != "") {
                        qty = parseInt($("#txtQuantity").val());
                    }

                    total = qty * uPrice;

                    if ($("#txtDeliveryCharge").val() != "") {
                        delChrg = parseFloat($("#txtDeliveryCharge").val());
                    }

                    if ($("#txtTaxVal1").val() != "") {
                        tax1 = parseFloat($("#txtTaxVal1").val());
                    }

                    if ($("#txtTaxVal2").val() != "") {
                        tax2 = parseFloat($("#txtTaxVal2").val());
                    }

                    if ($("#txtTaxVal3").val() != "") {
                        tax3 = parseFloat($("#txtTaxVal3").val());
                    }

                    $("#txtTotal").val(total.toFixed(2));
                    NetAmt = total + delChrg + tax1 + tax2 + tax3;
                    $("#txtFinalQuote").val(NetAmt.toFixed(2));
                }
                function Setfocus(ctrl) {
                    var val = $("#" + ctrl + "").val();
                    if (val != undefined && (val == "" || val == "0.00")) {
                        $("#" + ctrl + "").val('');
                    }
                }

                function Hidefocus(ctrl) {
                    var text = $("#" + ctrl + "").val();
                    if (text != undefined && text == "") {
                        $("#" + ctrl + "").val('0.00');
                    }
                }
                function InitRFPRequest() {
                    //setInterval(GetRFPSummary, 10000);
                }

                function onTimeOut() {
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'RFPCenter/Live.aspx/OnTimeOut',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData != "0") {
                                    //$("#ContentPlaceHolder1_xbtnBidDetails").click();
                                    //ShowRFPSummary(newData);
                                    window.location = newData;
                                }
                                else {
                                    //alert(newData.ErrDesc);
                                }
                            }
                            catch (e) { //alert(e.Message); 
                            }
                        },
                        error: function (data) {
                            //alert(data);
                        }
                    });
                    //  window.location = strUrl + "AuctionCenter/AuctionCenterRoom.aspx?Id=" + $("#ContentPlaceHolderMaster_xhdnRFPId").val();
                }

                function GetRFPSummary(selectedVendorId) {
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'RFPCenter/Live_Admin.aspx/GetRFPSummary',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "','vendorId':'" + selectedVendorId + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData.ErrDesc == "0") {                                    
                                    ShowSupplierView(newData, selectedVendorId);
                                }
                                else {                                    
                                     window.location.href = "Live_Admin.aspx";                                    
                                }
                            }
                            catch (e) {
                                ShowModalMsgBox("Error", e.message); 
                            }
                        },
                        error: function (data) {
                            ShowModalMsgBox("Error", data);                            
                        }
                    });
                }

                function ShowRFPSummary(rfpSummary) {
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $("#divTime0").html(rfpSummary.TimeRemaining);
                    if (rfpSummary.CurrentVendorId > 0) {
                        //Changes for SupplierManager View
                        // ShowSupplierView(rfpSummary); --Doe not require to refresh supplier screen                        
                    }
                    else {
                        //  $("#ContentPlaceHolderMaster_xlblBestQuote").val(rfpSummary.BestQuote);                        
                        ShowCompanyView(rfpSummary);
                        //ShowBidDetails(rfpId, 0);
                        if (rfpSummary.BestQuote > 0) {

                        }
                    }
                }

                function ShowCompanyView(rfpSummary) {
                    var cnt = 0;
                    var str = "";
                    str += "<br/><table cellspacing='0' cellpadding='0' border='0' class='billInfo'>" +
                           "<tr><td>Best quote</td><td>" + rfpSummary.BestQuote + "</td></tr>"
                         + "<tr> <td>Suppliers invited</td><td>" + rfpSummary.NoOfVendors + "</td></tr>"
                         + "<tr><td>Suppliers participated</td><td>" + rfpSummary.NoOfVendorsActive + "</td></tr>" +
                            "</table>";
                    $("#ContentPlaceHolder1_divSuppBidDet").html(str);
                }

                function ShowSupplierView(rfpSummary,selectedVendor) {                    
                    var str = "";
                    var strtax = "";
                    var cnt = 1;
                    
                    if (rfpSummary.TimeRemaining != "00:00" && rfpSummary.Status > 0) {                        
                        if (rfpSummary.VendorList[0].BidDet.BidAmount > 0) {
                            $("#ContentPlaceHolder1_DivTnc").attr('style', 'display:none;');                          

                            //for (var i = 0; i < rfpSummary.VendorList[0].BidDet.TaxDetailsList.length; i++) {

                            //    strtax += "<div class='formRow'><label>"
                            //        + rfpSummary.VendorList[0].BidDet.TaxDetailsList[i].Name + "" + " (" + rfpSummary.Currency + ")</label>"
                            //        + "<div class='formRow1'>"
                            //        + "<input type='text' id='txtTax" + rfpSummary.VendorList[0].BidDet.TaxDetailsList[i].Name + "' autocomplete='off' value='" + rfpSummary.VendorList[0].BidDet.TaxDetailsList[i].Amount + "' readonly='true'/>"
                            //        + "</div></div>"
                            //}
                            str = "<h3>" + rfpSummary.VendorList[0].Name + "</h3>"

                            str += "<div class='formRow'><label>Unit Price</label>"
                                + "<div class='formRow1'><input type='text' id='txtUnitPrice' autocomplete='off' value='"
                                + rfpSummary.VendorList[0].BidDet.UnitePrice + "' readonly='true'  onkeydown='javascript:return IsDecimal(this);'/>"
                                + "</div></div>"
                                + "<div class='formRow'><label>Quantity</label>"
                                + "<div class='formRow1'><input type='text' id='txtQuantity' autocomplete='off' value='" + rfpSummary.Qty + "' readonly='true' />"
                                + "</div></div>"
                                + "<div class='formRow'><label>Total</label>"
                                + "<div class='formRow1'><input type='text' id='txtTotal' autocomplete='off' value='"
                                + rfpSummary.VendorList[0].BidDet.TotalAmt + "'  readonly='true' />"
                                + "</div></div>"
                                + "<div class='formRow'><label>Delivery Charge</label>"
                                + "<div class='formRow1'><input type='text' id='txtDeliveryCharge' value='"
                                + rfpSummary.VendorList[0].BidDet.DeliveryCharges + "' onkeydown='javascript:return IsDecimal(this);' readonly='true'/>"
                                + "</div></div>"                                                             
                                //+ strtax
                                + "<div class='formRow'><label>Total Tax</label>"
                                + "<div class='formRow1'><input type='text' id='txtTotalTax' value='"
                                + rfpSummary.VendorList[0].BidDet.TotalTaxAmt + "'readonly='true'/>"
                                + "</div></div>"

                                + "<div class='formRow'><label>Final Quote</label>"
                                + "<div class='formRow1'><input type='text' id='txtFinalQuote'  value='" + rfpSummary.VendorList[0].BidDet.BidAmount + "' readonly='true'/>"
                                + "</div></div>"
                                + "<div class='formRow'><label>MRP per unit</label>"
                                + "<div class='formRow1'><input type='text' id='txtMRPAmt' autocomplete='off' value='"
                                + rfpSummary.VendorList[0].BidDet.MRPAmt + "' onkeydown='javascript:return IsDecimal(this);'/>"
                                + "</div></div>"
                                + "<div class='formRow'><label>Remarks</label>"
                                + "<div class='formRow1'><textarea name='' rows='2' cols='20' class='imw100p' id='txtComment' autocomplete='off' readonly='true'>" + rfpSummary.VendorList[0].BidDet.Remark + "</textarea>"                                
                                + "</div></div>"
                                + "<div class='formRow'>"                                
                                + "<div class='immrt20'>"                                
                                + "<input class='btnRed fl' type='button' id='btnSubmit' value='Reset Quote' "
                                + "onclick='javascript:btnEdit_Click(" + selectedVendor + ");' />"
                                + "<input class='btnRed fr' type='button' id='btnSubmit' value='Cancel' onclick='javascript:HideBidData();' />"
                                + "</div></div>"
                            
                        }
                        else {
                            for (var i = cnt; i <= 3; i++) {                               

                                strtax += "<div class='formRow'>"
                                    + "<div class='moreFields'><div class='imw35p fl'><input type='text' class='imw80p' style='float:left;' id='txtTaxCap" + i + "' value='' placeholder='Tax" + i + "' />"
                                    + "</div><div class='imw45p fl'>"
                                    +"<input type='text'  id='txtTaxVal" + i + "' value='0.00' onkeydown='javascript:return IsDecimal(this);'"
                                    + "onkeyup='javascript:ShowTotal();' onblur='javascript:Hidefocus(this.id);' onfocus='javascript:Setfocus(this.id);'/>"
                                    + "</div></div></div>"
                            }                            
                            str = "<h3>" + rfpSummary.VendorList[0].Name + "</h3>"                           

                            str += "<div class='formRow'><label>Unit Price</label>"
                                +"<div class='formRow1'><input type='text' id='txtUnitPrice' autocomplete='off'  value='" + rfpSummary.VendorList[0].BidDet.UnitePrice + "' onkeydown='javascript:return IsDecimal(this);'"
                                +"onkeyup='javascript:ShowTotal();' onblur='javascript:Hidefocus(this.id);' onfocus='javascript:Setfocus(this.id);'/>"
                                + "</div></div>"
                                + "<div class='formRow'><label>Quantity</label>"
                                +"<div class='formRow1'><input type='text' id='txtQuantity' autocomplete='off' value='" + rfpSummary.Qty + "' readonly='true'/>"
                                + "</div></div>"
                                + "<div class='formRow'><label>Total</label>"
                                +"<div class='formRow1'><input type='text' id='txtTotal' autocomplete='off' value='" + rfpSummary.VendorList[0].BidDet.TotalAmt + "' readonly='true'/>"
                                + "</div></div>"
                                + "<div class='formRow'><label>Delivery Charge</label>"
                                + "<div class='formRow1'><input type='text' id='txtDeliveryCharge' value='" + rfpSummary.VendorList[0].BidDet.DeliveryCharges + "' autocomplete='off' onkeydown='javascript:return IsDecimal(this);'"
                                + " onkeyup='javascript:ShowTotal();' onblur='javascript:Hidefocus(this.id);' onfocus='javascript:Setfocus(this.id);'/>"
                                + "</div></div>"
                                + strtax                                
                                + "<div class='formRow'><label>Final Quote</label>"
                                + "<div class='formRow1'><input type='text' id='txtFinalQuote' autocomplete='off' value='" + rfpSummary.VendorList[0].BidDet.BidAmount + "' readonly='true'/>"
                                + "</div></div>"
                                + "<div class='formRow'><label>MRP per unit</label>"
                                + "<div class='formRow1'><input type='text' id='txtMRPAmt' autocomplete='off' value='" + rfpSummary.VendorList[0].BidDet.MRPAmt + "' onkeydown='javascript:return IsDecimal(this);'/>"
                                + "</div></div>"
                                + "<div class='formRow'><label>Remarks</label>"
                                + "<div class='formRow1'><textarea name='' rows='2' cols='20' class='imw100p' placeholder='Type your remarks' ondrop='return false;' id='txtRemark' autocomplete='off' value='" + rfpSummary.VendorList[0].BidDet.Remark + "' ></textarea>"
                                + "</div></div>"

                            $("#ContentPlaceHolder1_DivTnc").attr('style', 'display:block;');
                        }
                        $("#ContentPlaceHolder1_divSuppBidDet").html(str);
                        HideProgress();
                    }
                }

                function ShowBidDetails(rfpId, vendorId) {                    
                    $.ajax({
                        type: 'POST',
                        url: strUrl + 'RFPCenter/Live.aspx/ShowBidDetails',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: "{'rfpId': " + rfpId + ",'vendorId':" + vendorId + "}",
                        cache: false,
                        success: function (msg) {
                            //$("#ContentPlaceHolder1_divBidDet").html(msg.d);
                            HideProgress();
                        },
                        error: ShowError
                    });
                }

                function ShowBidData(vendorId) {
                    ShowProgress(true);
                    //ShowProgress();
                    //$("#ContentPlaceHolder1_divSupplierList").attr('style', 'display:none;');
                    //$("#ContentPlaceHolder1_divSupplierQuote").attr('style', 'display:block;');
                    $("#ContentPlaceHolder1_xhdnVendorId").val(vendorId);
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();

                    $("#ContentPlaceHolder1_xbtnView").click();

                    //GetRFPSummary(vendorId);                    
                    //HideProgress();
                }   
                
                function HideBidData() {
                    //ShowProgress();
                    //$("#ContentPlaceHolder1_divSupplierList").attr('style', 'display:block;');
                    //$("#ContentPlaceHolder1_divSupplierQuote").attr('style', 'display:none;');

                    $("#ContentPlaceHolder1_xbtnHideBidData").click();

                    HideProgress();
                }                              

                function UpdateRFPBid(IsReset) {                    
                    var selectedvendor = $("#ContentPlaceHolder1_xhdnVendorId").val();
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    var uPrice = 0;
                    var qty = 0;
                    var delChrg = 0;
                    var tax1 = "";
                    var tax2 = "";
                    var tax3 = "";
                    var taxVal1 = 0;
                    var taxVal2 = 0;
                    var taxVal3 = 0;
                    var bidAmt = 0;
                    var MRPAmt = 0;
                    var remark = "";
                    var IsNotIns = 0;
                    var Description = "";
                    if (IsReset) {
                        //Reset Quote
                        if ($("#txtResetUnitPrice").val() == "" || $("#txtResetUnitPrice").val() <= 0) {
                            $("#txtResetUnitPrice").focus();
                            ShowToolTip($("#txtResetUnitPrice"), "Please enter unit price.", "bottom");
                            return false;
                        }
                        if ($("#txtResetTaxCap1").val() == "" && $("#txtResetTaxVal1").val() > 0) {
                            $("#txtResetTaxCap1").focus();
                            ShowToolTip($("#txtResetTaxCap1"), "Please enter tax caption.", "bottom");
                            return false;
                        }
                        else if ($("#txtResetTaxVal1").val() <= 0 && $("#txtResetTaxCap1").val() != "") {
                            $("#txtResetTaxVal1").focus();
                            ShowToolTip($("#txtResetTaxVal1"), "Please enter tax value.", "bottom");
                            return false;
                        }
                        if ($("#txtResetTaxCap2").val() == "" && $("#txtResetTaxVal2").val() > 0) {
                            $("#txtResetTaxCap2").focus();
                            ShowToolTip($("#txtResetTaxCap2"), "Please enter tax caption.", "bottom");
                            return false;
                        }
                        else if ($("#txtResetTaxVal2").val() <= 0 && $("#txtResetTaxCap2").val() != "") {
                            $("#txtResetTaxVal2").focus();
                            ShowToolTip($("#txtResetTaxVal2"), "Please enter tax value.", "bottom");
                            return false;
                        }
                        if ($("#txtResetTaxCap3").val() == "" && $("#txtResetTaxVal3").val() > 0) {
                            $("#txtResetTaxCap3").focus();
                            ShowToolTip($("#txtResetTaxCap3"), "Please enter tax caption.", "bottom");
                            return false;
                        }
                        else if ($("#txtResetTaxVal3").val() <= 0 && $("#txtResetTaxCap3").val() != "") {
                            $("#txtResetTaxVal3").focus();
                            ShowToolTip($("#txtResetTaxVal3"), "Please enter tax value.", "bottom");
                            return false;
                        }
                        if ($("#txtResetMRPAmt").val() == "" || $("#txtResetMRPAmt").val() <= 0) {
                            $("#txtResetMRPAmt").focus();
                            ShowToolTip($("#txtResetMRPAmt"), "Please enter MRP unit price.", "bottom");
                            return false;
                        }
                        if ($("#txtResetMRPAmt").val() != "") {
                            MRPAmt = parseFloat($("#txtResetMRPAmt").val());
                        }
                        if ($("#txtResetUnitPrice").val() != "") {
                            uPrice = parseFloat($("#txtResetUnitPrice").val());
                        }
                        if ($("#txtResetQuantity").val() != "") {
                            qty = parseInt($("#txtResetQuantity").val());
                        }
                        if ($("#txtResetDeliveryCharge").val() != "") {
                            delChrg = parseFloat($("#txtResetDeliveryCharge").val());
                        }
                        tax1 = $("#txtResetTaxCap1").val();

                        if ($("#txtResetTaxVal1").val() != "") {
                            taxVal1 = parseFloat($("#txtResetTaxVal1").val());
                        }
                        tax2 = $("#txtResetTaxCap2").val();

                        if ($("#txtResetTaxVal2").val() != "") {
                            taxVal2 = parseFloat($("#txtResetTaxVal2").val());
                        }

                        tax3 = $("#txtResetTaxCap3").val();
                        if ($("#txtResetTaxVal3").val() != "") {
                            taxVal3 = parseFloat($("#txtResetTaxVal3").val());
                        }
                        HideModalBox("#divBidReset");
                    } //RFP First Quote
                    else {
                        if ($("#txtUnitPrice").val() == "" || $("#txtUnitPrice").val() <= 0) {
                            $("#txtUnitPrice").focus();
                            ShowToolTip($("#txtUnitPrice"), "Please enter unit price.", "bottom");
                            return false;
                        }
                        if ($("#txtTaxCap1").val() == "" && $("#txtTaxVal1").val() > 0) {
                            $("#txtTaxCap1").focus();
                            ShowToolTip($("#txtTaxCap1"), "Please enter tax caption.", "bottom");
                            return false;
                        }
                        else if ($("#txtTaxVal1").val() <= 0 && $("#txtTaxCap1").val() != "") {
                            $("#txtTaxVal1").focus();
                            ShowToolTip($("#txtTaxVal1"), "Please enter tax value.", "bottom");
                            return false;
                        }
                        if ($("#txtTaxCap2").val() == "" && $("#txtTaxVal2").val() > 0) {
                            $("#txtTaxCap2").focus();
                            ShowToolTip($("#txtTaxCap2"), "Please enter tax caption.", "bottom");
                            return false;
                        }
                        else if ($("#txtTaxVal2").val() <= 0 && $("#txtTaxCap2").val() != "") {
                            $("#txtTaxVal2").focus();
                            ShowToolTip($("#txtTaxVal2"), "Please enter tax value.", "bottom");
                            return false;
                        }
                        if ($("#txtTaxCap3").val() == "" && $("#txtTaxVal3").val() > 0) {
                            $("#txtTaxCap3").focus();
                            ShowToolTip($("#txtTaxCap3"), "Please enter tax caption.", "bottom");
                            return false;
                        }
                        else if ($("#txtTaxVal3").val() <= 0 && $("#txtTaxCap3").val() != "") {
                            $("#txtTaxVal3").focus();
                            ShowToolTip($("#txtTaxVal3"), "Please enter tax value.", "bottom");
                            return false;
                        }
                        
                        if ($("#txtMRPAmt").val() == "" || $("#txtMRPAmt").val() <= 0) {
                            $("#txtMRPAmt").focus();
                            ShowToolTip($("#txtMRPAmt"), "Please enter MRP unit price.", "bottom");
                            return false;
                        }
                        //if (!$('#Checkbox3').is(':checked')) {
                        //    $("#Checkbox3").focus();
                        //    ShowToolTip($("#Checkbox3"), "Please accept terms & conditions", "right");
                        //    return false;
                        //}
                        if ($("#txtMRPAmt").val() != "") {
                            MRPAmt = parseFloat($("#txtMRPAmt").val());
                        }

                        if ($("#txtUnitPrice").val() != "") {
                            uPrice = parseFloat($("#txtUnitPrice").val());
                        }
                        if ($("#txtQuantity").val() != "") {
                            qty = parseInt($("#txtQuantity").val());
                        }

                        if ($("#txtDeliveryCharge").val() != "") {
                            delChrg = parseFloat($("#txtDeliveryCharge").val());
                        }

                        tax1 = $("#txtTaxCap1").val();

                        if ($("#txtTaxVal1").val() != "") {
                            taxVal1 = parseFloat($("#txtTaxVal1").val());
                        }

                        tax2 = $("#txtTaxCap2").val();

                        if ($("#txtTaxVal2").val() != "") {
                            taxVal2 = parseFloat($("#txtTaxVal2").val());
                        }

                        tax3 = $("#txtTaxCap3").val();

                        if ($("#txtTaxVal3").val() != "") {
                            taxVal3 = parseFloat($("#txtTaxVal3").val());
                        }                        
                    }
                    remark = $("#txtRemark").val();
                    remark = remark.replace("'", "`");
                    bidAmt = (uPrice * qty) + delChrg + taxVal1 + taxVal2 + taxVal3;
                    bidAmt = bidAmt.toFixed(2);
                    ShowProgress(true);
                    $.ajax({
                        url: strUrl + 'RFPCenter/Live_Admin.aspx/UpdateRFPBid',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'selectedVendor':'" + selectedvendor + "','rfpId':'" + rfpId + "', 'bidAmt' : '" + bidAmt + "', 'uPrice' : '"
                            + uPrice + "', 'delChrg' : '" + delChrg + "', 'tax1' : '" + tax1
                            + "', 'tax2' : '" + tax2 + "', 'tax3' : '" + tax3 + "', 'taxVal1' : '"
                            + taxVal1 + "', 'taxVal2' : '" + taxVal2 + "', 'taxVal3' : '"
                            + taxVal3 + "', 'bidAmt' : '" + bidAmt + "','remark' : '"
                            + remark + "', 'MRPAmt' : '" + MRPAmt + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData == "0") {
                                    ShowModalBox("ReNePay", "Your quote submitted sucessfully.");                                    
                                    window.location = "Live_Admin.aspx";                                    
                                }
                                else {
                                    ShowModalBox("Error", newData);
                                }
                                HideProgress();
                            }
                            catch (e) {
                                //ShowModalBox("Error", e.Message);
                                //ShowMessageBox(e.Message);
                                HideProgress();
                            }
                        },
                        error: ShowError
                    });
                }

                function UpdateDocument() {
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    var VndrId = $("#ContentPlaceHolder1_xhdnVendorId").val();
                    var SupplierDoc1 = window["xfileSupplierDoc1_GetUploadedFileName"]();
                    var SupplierDoc2 = window["xfileSupplierDoc2_GetUploadedFileName"]();
                    var SupplierDoc3 = window["xfileSupplierDoc3_GetUploadedFileName"]();
                    $.ajax({
                        url: strUrl + 'RFPCenter/Live_Admin.aspx/UpdateDocument',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "','VndrId':'" + VndrId + "','SupplierDoc1':'"
                            + SupplierDoc1 + "','SupplierDoc2':'" + SupplierDoc2
                            + "','SupplierDoc3':'" + SupplierDoc3 + "'}",
                        dataType: 'json',
                        success: function (data) {
                            //data.d
                        },
                        error: ShowError
                    });
                }

                function ViewMore() {
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'RFPCenter/Live.aspx/ViewMore',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData != "") {
                                    ShowModalReportBox("RFP Details", newData);
                                }
                                else {
                                    //alert(newData.ErrDesc);
                                }
                            }
                            catch (e) { //alert(e.Message); 
                            }
                        },
                        error: function (data) {
                            //alert(data);
                        }
                    });
                }

                function HideDetails() {
                    $("#ContentPlaceHolder1_divViewMore").attr('style', 'display:none;');
                    $("#divLiveDet").attr('style', 'display:block;');
                }

                function btnEdit_Click(VendorId) {
                    ShowProgress();
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'RFPCenter/Live_Admin.aspx/EditBid',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "','VendorId':'" + VendorId + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData != "") {
                                    //ShowModalMsgBox("Reset Quote", newData);
                                    $('#DivResetBidDet').html('');
                                    $('#DivResetBidDet').html(data.d);
                                    ShowModalBox("#divBidReset");
                                    HideProgress();
                                }
                                else {
                                    //alert(newData.ErrDesc);
                                    HideProgress();
                                }
                            }
                            catch (e) { //alert(e.Message); 
                            }                            
                        },
                        error: function (data) {
                            //alert(data);
                            HideProgress();
                        }
                    });
                }

                function ResetTotal() {
                    var uPrice = 0;
                    var qty = 0;
                    var total = 0;
                    var delChrg = 0;
                    var tax1 = 0;
                    var tax2 = 0;
                    var tax3 = 0;
                    var NetAmt = 0;
                    if ($("#txtResetUnitPrice").val() != "") {
                        uPrice = parseFloat($("#txtResetUnitPrice").val());
                    }

                    if ($("#txtResetQuantity").val() != "") {
                        qty = parseInt($("#txtResetQuantity").val());
                    }

                    total = qty * uPrice;

                    if ($("#txtResetDeliveryCharge").val() != "") {
                        delChrg = parseFloat($("#txtResetDeliveryCharge").val());
                    }

                    if ($("#txtResetTaxVal1").val() != "") {
                        tax1 = parseFloat($("#txtResetTaxVal1").val());
                    }

                    if ($("#txtResetTaxVal2").val() != "") {
                        tax2 = parseFloat($("#txtResetTaxVal2").val());
                    }

                    if ($("#txtResetTaxVal3").val() != "") {
                        tax3 = parseFloat($("#txtResetTaxVal3").val());
                    }

                    $("#txtResetTotal").val(total.toFixed(2));
                    NetAmt = total + delChrg + tax1 + tax2 + tax3;
                    $("#txtResetFinalQuote").val(NetAmt.toFixed(2));
                }

                function EditRFPDet() {
                    ShowProgress();
                    HideModalBox("#ContentPlaceHolder1_divRFPDetEdit");
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    var ProductDoc1 = window["xctrlProdctDoc1_GetUploadedFileName"]();
                    var ProductDoc2 = window["xctrlProdctDoc2_GetUploadedFileName"]();
                    var ProductDoc3 = window["xctrlProdctDoc3_GetUploadedFileName"]();
                    var Name = $("#ContentPlaceHolder1_xtxtName").val();
                    var Description = $("#ContentPlaceHolder1_xtxtDescription").val();
                    var ExpectedDelivery = $("#ContentPlaceHolder1_xtxtNoDays").val();
                    var EndDate = $("#ContentPlaceHolder1_xtxtEndDate").val();
                    var EndTime = $("#ContentPlaceHolder1_xtxtEndTime").val();
                    $.ajax({
                        url: strUrl + 'RFPCenter/Live.aspx/EditRFPDet',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "','ProductDoc1':'" + ProductDoc1 + "','ProductDoc2':'"
                            + ProductDoc2 + "','ProductDoc3':'" + ProductDoc3 + "','Name':'"
                            + Name + "','Description':'" + Description + "','ExpectedDelivery':'"
                            + ExpectedDelivery + "','EndDate':'" + EndDate + "','EndTime':'" + EndTime + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                ShowModalMsgBox("Renepay", newData);
                                HideProgress();
                            }
                            catch (e) { //alert(e.Message); 
                            }
                        },
                        error: function (data) {
                            //alert(data);
                        }
                    });
                }

                function ViewBuyerEditRFPDet() {
                    BindDateTimePicker();
                    BindRFPDet();
                    ShowModalBox("#ContentPlaceHolder1_divRFPDetEdit");
                }

                function BindDateTimePicker() {
                    $("#ContentPlaceHolder1_xtxtEndDate").datepicker({
                        dateFormat: 'dd/mm/yy',
                    }).attr('readonly', 'true');

                    $('#ContentPlaceHolder1_xtxtEndTime').timepicker({
                        showPeriodLabels: false
                    });

                    //var input = $('#ContentPlaceHolder1_xtxtEndTime').clockpicker({
                    //    placement: 'top',
                    //    autoclose: true
                    //}).attr('readonly', 'true');
                }



                function BindRFPDet() {
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'RFPCenter/Live.aspx/BindRFPDet',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var objrfp = data.d;
                                $("#ContentPlaceHolder1_xtxtName").val(objrfp.Name);
                                $("#ContentPlaceHolder1_xtxtDescription").val(objrfp.Description);
                                window["xctrlProdctDoc1_SetUploadedFile"](objrfp.ProductDoc1);
                                window["xctrlProdctDoc2_SetUploadedFile"](objrfp.ProductDoc2);
                                window["xctrlProdctDoc3_SetUploadedFile"](objrfp.ProductDoc3);
                                $("#ContentPlaceHolder1_xtxtNoDays").val(objrfp.ExpectedDelivery);
                                var strDatetime = objrfp.EndDateTimeDisp.split(' ');
                                $("#ContentPlaceHolder1_xtxtEndDate").val(strDatetime[0]);
                                $("#ContentPlaceHolder1_xtxtEndTime").val(strDatetime[1]);
                                //ShowModalBox("#ContentPlaceHolder1_divRFPDetEdit");
                            }
                            catch (e) { //alert(e.Message); 
                            }
                        },
                        error: function (data) {
                            //alert(data);
                        }
                    });

                }
                //function NotIns_Change() {
                //    if ($("#chcknotIns input[type='checkbox']").is(":checked")) {
                //        $("#divNotIns").attr("style", "display:block;");
                //        return true;
                //    }
                //}
                //function NotIns_Change(chckNotIns) {
                //    var trNotIns = document.getElementById("trOthReason");
                //    trNotIns.style.display = chckNotIns.checked ? "block" : "none";
                //}



                function NotIns_Click() {
                    //ShowModalBox("#divNotIns");
                    ShowProgress();
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'RFPCenter/Live.aspx/NotInterestedBind',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                if (data.d != "") {
                                    $('#divNotInsBody').html('');
                                    $('#divNotInsBody').html(data.d);
                                    ShowModalBox("#divNotIns");
                                    // ShowModalMsgBox("To help us select the right RFPs for you, let us know why you are not interested in this RFP ?", data.d);
                                }
                                HideProgress();
                            }
                            catch (e) { //alert(e.Message); 
                            }
                        },
                    });
                    //var strTemp = "<div>" +
                    //       " <h3>Why are you not interested in this RFP ?</h3>"
                    //        + "<table>"
                    //           + " <tbody>"
                    //                + "<tr>"
                    //                  + "  <td></td><td><input type='checkbox' id='chckNotDealing' />  &nbsp; Not dealing in this product </td>"
                    //                + "</tr>"
                    //                 + "<tr>"
                    //                   + " <td></td><td><input type='checkbox' id='chckNotdelivering'/> &nbsp; Not delivering to this location </td>"
                    //               + " </tr>"
                    //                 + "<tr>"
                    //                   + " <td></td><td> <input type='checkbox' id='chckOrdersize' /> &nbsp; Order size too small/big</td>"
                    //                + "</tr>"
                    //                 + "<tr>"
                    //                   + " <td></td><td><input type='checkbox' id='chckplatform'/> &nbsp; Not interested in the platform</td>"
                    //                + "</tr>"
                    //                 + "<tr>"
                    //                   + " <td></td> <td><input type='checkbox' id='chckOther'/> &nbsp; Other Reason</td>"
                    //                + "</tr>"
                    //                 + "<tr>"
                    //                   + " <td></td><td>Reason&nbsp; <input type='text' id='txtOth' /></td>"
                    //                + "</tr>"
                    //            + "</tbody>"
                    //        + "</table>"
                    //    + "</div>";
                    //HideProgress();
                    //ShowModalMsgBox("", strTemp);
                }

            </script>
            <script>
                //accordian chat
                $(document).ready(function () {
                    var selectIds = $('#chatpanel1,#chatpanel2');
                    $(function ($) {
                        selectIds.on('show.bs.collapse hidden.bs.collapse', function () {
                            $(this).prev().find('.glyphicon').toggleClass('glyphicon-plus glyphicon-minus');
                        })
                    });
                });
            </script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('.btnHelper').click(function () {
                        $('.helpSlide').addClass('HelpMoveRight');
                        $('.helpSlide').show();
                        $('.helpBlockAll').css('display', 'block');
                        $('.helpBlockAll').show();
                        $('.helpSlide').stop().animate({ 'marginRight': '0px' }, 1000);
                        return false;
                    });
                    $('.helpBlockAll').click(function () {
                        $('.helpBlockAll').hide();
                        $('.helpSlide').stop().animate({ 'marginRight': '-768px' }, 200);
                    });
                });
            </script>

            <%--<div class="main negotiation RFP newUI">--%>
            <asp:HiddenField ID="xhdnRFPId" runat="server" />
            <div class="topBlk topBlkInn" id="divbtn" runat="server" >
                <asp:UpdatePanel ID="xupnlAction" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <ul class="rightBtn">
                            <li id="liWithdraw" runat="server" visible="false">
                                <asp:LinkButton ID="xlnkWithdraw" runat="server"
                                    OnCommand="xlnk_Command" CommandName="WTD"
                                    Text="WITHDRAW" CssClass="btnRed"></asp:LinkButton>
                            </li>
                            <%--<li id="liExtend" runat="server" visible="false">
                                    <asp:LinkButton ID="xlnkExtend" runat="server"
                                        OnCommand="xlnk_Command" CommandName="EXT"
                                        Text="EXTEND" CssClass="btnBlk"></asp:LinkButton>
                                </li>--%>
                            <li id="liEdit" runat="server" visible="false">
                                <asp:LinkButton ID="xlnkEdit" runat="server"
                                    OnCommand="xlnk_Command" CommandName="EDIT"
                                    Text="EDIT" CssClass="btnRed"></asp:LinkButton>
                            </li>
                            <li id="liStop" runat="server" visible="false">
                                <asp:LinkButton ID="xlnkStop" runat="server"
                                    OnCommand="xlnk_Command" CommandName="STP"
                                    Text="STOP" CssClass="btnRed"></asp:LinkButton>
                            </li>
                            <li id="liAddMore" runat="server">
                                <asp:LinkButton ID="xlnkAddMore" runat="server"
                                    OnCommand="xlnk_Command" CommandName="ADM"
                                    Text="ADD MORE SUPPLIERS" CssClass="btnRed"></asp:LinkButton>
                            </li>
                            <li id="liReset" runat="server" visible="false">
                                <asp:LinkButton ID="xlnkReset" runat="server"
                                    OnCommand="xlnk_Command" CommandName="RST"
                                    Text="RESET" CssClass="btnRed"></asp:LinkButton>
                            </li>
                            <li>
                                <asp:LinkButton ID="xlnkClose" runat="server" Visible="false"
                                    OnCommand="xlnk_Command" CommandName="CLS"
                                    Text="BACK" CssClass="btnRed"></asp:LinkButton>
                            </li>
                        </ul>
                        <br class="cl">

                        <div class="modal fade" id="divWthdrawCrfm" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" id="btnClose" class="close"
                                            data-dismiss="modal">
                                            &times;</button>
                                        <h4 class="modal-title" id="H1">RFP withdraw Confirmation</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p id="pRegMsg">
                                            Do you want to withdraw RFP at this moment ?
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <a class="btnRed" href="#" id="lnkWithdrawRFP" runat="server"
                                            onclick="HideModalBox('#divWthdrawCrfm'); ShowProgress();" onserverclick="lnkWithdrawRFP_ServerClick">CONTINUE</a>
                                        <a class="btnRed" href="#" id="A1" data-dismiss="modal">CLOSE</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="divExtendCrfm" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" id="Button1" class="close"
                                            data-dismiss="modal">
                                            &times;</button>
                                        <h4 class="modal-title" id="H2">Extend RFP</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>
                                            <div class="aucHead">RFP Deadline</div>
                                            <div class="leftClmn">
                                                <div class="imw45p immr0 fr">
                                                    <label>End Time</label>
                                                    <asp:TextBox ID="xtxtEndTimeExt" CssClass="icnTime" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="imw45p fr">
                                                    <label>End Date</label>
                                                    <asp:TextBox ID="xtxtEndDateExt" CssClass="icnCal" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <br />
                                            <br />
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <a class="btnRed" href="#" id="lnkExtendRFP" runat="server"
                                            onclick="HideModalBox('#divExtendCrfm'); ShowProgress();" onserverclick="lnkExtendRFP_ServerClick">CONTINUE</a>
                                        <a class="btnRed" href="#" id="A3" data-dismiss="modal">CLOSE</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="divStopCrfm" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" id="Button2" class="close"
                                            data-dismiss="modal">
                                            &times;</button>
                                        <h4 class="modal-title" id="H3">RFP stop Confirmation</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p id="p1">
                                            Do you want to stop RFP at this moment ?
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <a class="btnRed" href="#" id="lnkStopRFP" runat="server"
                                            onclick="HideModalBox('#divStopCrfm'); ShowProgress();" onserverclick="lnkStopRFP_ServerClick">CONTINUE</a>
                                        <a class="btnRed" href="#" id="A4" data-dismiss="modal">CLOSE</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="divResetCrfm" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" id="Button3" class="close"
                                            data-dismiss="modal">
                                            &times;</button>
                                        <h4 class="modal-title" id="H4">RFP withdraw Confirmation</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p id="p2">
                                            Do you want to stop RFP at this moment ?
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <a class="btnRed" href="#" id="lnkResetRFP" runat="server"
                                            onclick="HideModalBox('#divResetCrfm'); ShowProgress();" onserverclick="lnkResetRFP_ServerClick">CONTINUE</a>
                                        <a class="btnRed" href="#" id="A5" data-dismiss="modal">CLOSE</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:Literal ID="xlitScrAction" runat="server"></asp:Literal>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <asp:UpdatePanel ID="xupnlRFPDetails" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="divLiveDet" class="Newclmn1">
                        <div class="newCol1 imw42p immr15">
                            <div class="innerBx ">
                                <asp:UpdatePanel ID="xupnlTimer" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="innerBxhead bgGrey">
                                            <asp:Literal ID="xlitRFPCloses" runat="server"></asp:Literal>
                                            <a href="#" class="fr">
                                                <img id="imgIcn" runat="server" src="~/images/icn-rfp-referesh.png" /></a>
                                        </div>
                                        <div class="innerBxbody brdGrey">
                                            <asp:Literal ID="xlitTimer" runat="server"></asp:Literal>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="immrt10">
                                <div class="innerBxhead bgGrey">
                                    RFP Details <a href="#" class="fr">
                                        <img src="../images/icn-rfp1.png" /></a>
                                </div>
                                <div class="innerBxbody brdGrey whiteBox">
                                    <ul class="manage">
                                        <asp:Literal ID="xlitBidDetails" runat="server"></asp:Literal>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="newCol2 imw55p fr" >

                            <div id="divSupplierList" runat="server">
                                <div class="innerBxhead bgRed">                                
                                    <lable id="Lable1" runat="server">Please select supplier to Quote RFP</lable>                                                                
                                 </div>   
                            
                                 <div class="innerBxbody brdPink whiteBox Liverfp">                                
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>                                     
                                        <div id="divSupplierlst" runat="server" ></div>
                                    </ContentTemplate>
                                 </asp:UpdatePanel>
                                     <br class='cl' />
                              </div>   
                                <br class='cl' />
                            </div>

                            <div id="divSupplierQuote" runat="server" style="display:none">
                            <div class="innerBxhead bgRed">                                
                                <lable id="xlblMidelHeader" runat="server">Your Quote</lable>                                
                                <a href="#" class="fr">
                                    <img id="img1" runat="server" src="~/images/icn-quote.png" /></a>
                            </div>                            
                            <div class="innerBxbody brdPink whiteBox Liverfp">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>                                        
                                        <div id="divSuppBidDet" runat="server">
                                        </div>
                                        <div id="divSupplierDoc" runat="server"  >
                                            <div class="formRow">
                                                <label>Attachments</label>
                                                <div class="formRow1">
                                                    <ctrl:UploadFile ID="xfileSupplierDoc1" runat="server" UserType="VND" UploadDocType="RFPSupplierDoc"
                                                        UploadFileType="Doc" Caption="Upload  Document" />
                                                </div>
                                            </div>
                                            <div class="formRow">
                                                <label></label>
                                                <div class="formRow1">
                                                    <ctrl:UploadFile ID="xfileSupplierDoc2" runat="server" UserType="VND" UploadDocType="RFPSupplierDoc"
                                                        UploadFileType="Doc" Caption="Upload  Document" />
                                                </div>
                                            </div>
                                            <div class="formRow">
                                                <label></label>
                                                <div class="formRow1">
                                                    <ctrl:UploadFile ID="xfileSupplierDoc3" runat="server" UserType="VND" UploadDocType="RFPSupplierDoc"
                                                        UploadFileType="Doc" Caption="Upload  Document" />
                                                </div>
                                            </div>
                                            <asp:Literal ID="xlitDoc" runat="server"></asp:Literal>
                                            <br class="cl" />
                                        </div>
                                        <asp:Button ID="xbtnUpdateDoc" runat="server" class="btnBlk immrt20" OnClick="xbtnUpdateDoc_Click" Style="display: none;" Value="show" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div id="DivTnc" runat="server" >
                                    <div class="acceptTerm" style="display:none">
                                        <input type="checkbox" value="option" name="field" id="Checkbox3">
                                        <label for="xchkTnC">I accept the terms and conditions of the RFP</label>
                                    </div>
                                    <div class="formRow">                                        
                                        <div class=" immrt20">
                                            <asp:LinkButton class="btnRed" ID="xlnkSubmit" runat="server" OnClientClick="javascript:return UpdateRFPBid(false);">Submit</asp:LinkButton>
                                            <asp:LinkButton class="btnRed" ID="xlnkCancel" runat="server" OnClientClick="javascript:return HideBidData();">Cancel</asp:LinkButton>
                                            <%--<asp:LinkButton class="ui-icon-link imml5 txtLink" ID="xlnNotIns" runat="server" OnClientClick="javascript:return NotIns_Click();"> Not interested</asp:LinkButton><%--OnClientClick="javascript:return NotIns_Click();"--%> <%--OnClick="xlnNotIns_Click"--%>
                                            <asp:HiddenField ID="xhdnVendorId" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <br class="cl" />
                            </div>
                            </div>

                            <asp:Literal ID="xlitSupplier" runat="server"></asp:Literal>

                            <div id="divBenchmarkPrice" class="newCol2 imw100p fr" runat="server" visible="false">
                                <div class="innerBxhead bgRed">
                                    <lable id="xlblBenchMarkPrice" runat="server">BenchMark Price</lable>
                                </div>
                                <asp:Literal ID="xlitBenchMarkPrices" runat="server"></asp:Literal>
                            </div>

                        </div>
                        
                        <%--<div id="divBidDet" class="whiteBox" runat="server"  visible="false"></div>--%>   <%--style="display: none"--%>
                    </div>

                    <!--help panel start here-->
                    <div class="btn-help btnHelper">
                        <img src="../images/icn-help.png" />
                    </div>
                    <div class="helpBlockAll"></div>
                    <div class="fr helpBlk helpBlkInn srh-help helpSlide">
                        <!-- faq start here -->
                        <ctrl:FAQ ID="xFAQ" runat="server" />
                        <!-- faq end here -->
                        <!-- chat start here -->
                        <div class="chatBlk" style="display:none">
                            <div class="panel-group" id="chataccordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a class="chataccordion-toggle" data-toggle="collapse" data-parent="#chataccordion" href="#chatpanel1">
                                                <img src="../images/icn-chat.png" /><asp:Literal ID="xlitChatCap" runat="server"></asp:Literal><i class="glyphicon glyphicon-minus fr"></i></a>
                                        </h4>
                                    </div>
                                    <div id="chatpanel1" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <div class="innerChat" id="divInnerChat" runat="server">
                                                <%--<div class="whiteBox fl chat accordion_container">--%>
                                                <div class="liveChatBlk" id="ulLiveChat" runat="server">
                                                    <%--<ul class="liveChats" id="ulLiveChat" runat="server">
                                                        </ul>--%>
                                                </div>
                                                <%--</div>--%>
                                            </div>
                                            <%--<div class="innerChat">
                                                    <div class="chatImg">
                                                        <img src="../images/chat-help-img.png" />
                                                        <div class="chatlogo">
                                                            <img src="../images/nav_infilogo.png" />
                                                            <p>Or call us at <em>8898989898 between 9:30 am and 5 pm</em></p>
                                                            <p>Or email us at <em>team@renepay.com</em></p>
                                                        </div>
                                                    </div>
                                                    <div class="chatName">
                                                        <em>RenePay Team:</em>
                                                        <p>How May i help you?</p>
                                                    </div>
                                                    <div class="chatInput">
                                                        <input type="text" placeholder="Type your message here...">
                                                    </div>
                                                </div>--%>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="panel-group" id="chataccordionRenepay">
                                <ctrl:Feedback ID="xFBK" runat="server" Data_Parent="chataccordionRenepay" />
                            </div>
                        </div>
                        <!-- chat end here -->
                    </div>
                    <br class="cl" />
                    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                    <script type="text/javascript">
                        //$(function () {
                        // Declare a proxy to reference the hub.
                        var chatHub = $.connection.chatHub;
                        var grps = [];
                        var groupId = "";
                        var groupName = "";
                        var userId = "";
                        var userName = "";
                        chatHub.client.onConnected = function (allUsers, allMsgs) {
                            //alert(allUsers.length);
                            if (allUsers.length > 0) {
                                groupId = allUsers[0].GroupId;

                                //alert(allMsgs.length);
                                //alert(userName);
                                //for (var i = 0; i < allUsers.length; i++) {
                                //    $('#ulUsers').append('<li><strong>' + allUsers[i].UserName
                                //    + '</strong></li>');
                                //}
                                //Add the message to the page.
                                for (var i = 0; i < allMsgs.length; i++) {

                                    $('#ulChat_' + groupId).append("<em>"
                                        + (allMsgs[i].UserName) + " :</em>" +
                                            "<p>" + allMsgs[i].Message + "</p>");

                                    //if (allMsgs[i].UserId == userId) {
                                    //    $('#ulChat_' + groupId).append("<li class='chatRight'>" +
                                    //        "<img src='../images/user1.png'>" +
                                    //        "<p class='chatName'>" + (allMsgs[i].UserName.length > 12 ? allMsgs[i].UserName.substr(0, 12)
                                    //            + "..." : allMsgs[i].UserName) + "</p>" +
                                    //        "<p class='chatTxt'>" + allMsgs[i].Message + "</p>" +
                                    //        "</li>");
                                    //}
                                    //else {
                                    //    $('#ulChat_' + groupId).append("<li class='chatLeft'>" +
                                    //     "<img src='../images/user1.png'>" +
                                    //        "<p class='chatName'>" + (allMsgs[i].UserName.length > 12 ? allMsgs[i].UserName.substr(0, 12)
                                    //    + "..." : allMsgs[i].UserName) + "</p>" +
                                    //        "<p class='chatTxt'>" + allMsgs[i].Message + "</p>" +
                                    //        "</li>");
                                    //}
                                    //<li class="LightBlue">
                                    //    <img src="images/user.png">
                                    //    <p><span>Lorem Ipsum</span>Lorem Ipsum is simply dummy text of the printing. </p>
                                    //</li>
                                    //<li class="LightRed">
                                    //    <img src="images/user.png">
                                    //    <p><span>Lorem Ipsum</span>Lorem Ipsum is simply dummy text of the printing. </p>
                                    //</li>
                                    //$('#ulMsg').append('<li><strong>' + encodedName
                                    //+ '</strong>:&nbsp;&nbsp;' + encodedMsg + '</li>');
                                }
                                //$('#discussion').append('<li><strong>' + allMsgs[i].UserName
                                //    + '</strong>:&nbsp;&nbsp;' + allMsgs[i].Message + '</li>');
                            }
                        };

                        chatHub.client.messageReceived = function (grpId, groupUserId, userName, message) {
                            $('#ulChat_' + grpId).append("<em>"
                                + (userName) + " :</em>" +
                                    "<p>" + message + "</p>");
                            //if (userId == groupUserId) {
                            //    $('#ulChat_' + grpId).append("<li class='chatRight'>" +
                            //            "<img src='../images/user1.png'>" +
                            //            "<p class='chatName'>" + (userName.length > 12 ? userName.substr(0, 12)
                            //            + "..." : userName) + "</p>" +
                            //            "<p class='chatTxt'>" + message + "</p>" +
                            //        "</li>");
                            //    $('#ulChat_' + grpId).scrollTop($('#ulChat_' + grpId)[0].scrollHeight);
                            //}
                            //else {
                            //    $('#ulChat_' + grpId).append("<li class='chatLeft'>" +
                            //            "<img src='../images/user1.png'>" +
                            //            "<p class='chatName'>" + (userName.length > 12 ? userName.substr(0, 12)
                            //            + "..." : userName) + "</p>" +
                            //            "<p class='chatTxt'>" + message + "</p>" +
                            //        "</li>");
                            //    $('#ulChat_' + grpId).scrollTop($('#ulChat_' + grpId)[0].scrollHeight);
                            //    if ($("#divChat_" + grpId).css('display') == 'none') {
                            //        $("#div_" + grpId).addClass("chatAlert");
                            //    }
                            //}
                        };

                        //// Create a function that the hub can call to broadcast messages.
                        //chat.client.broadcastMessage = function (name, message) {
                        //    // Html encode display name and message.
                        //    var encodedName = $('<div />').text(name).html();
                        //    var encodedMsg = $('<div />').text(message).html();
                        //    // Add the message to the page.
                        //    $('#discussion').append('<li><strong>' + encodedName
                        //        + '</strong>:&nbsp;&nbsp;' + encodedMsg + '</li>');
                        //};
                        //// Get the user name and store it to prepend to messages.
                        //$('#displayname').val(prompt('Enter your name:', ''));
                        //// Set initial focus to message input box.
                        //$('#message').focus();
                    </script>
                    <asp:Literal ID="xlitChatScr" runat="server"></asp:Literal>
                    <script type="text/javascript">
                        // Start the connection.
                        $.connection.hub.start().done(function () {
                            // alert("Connected");
                            for (var i = 0; i < grps.length; i++) {
                                chatHub.server.connect(grps[i].groupId, grps[i].groupName, grps[i].userId, grps[i].userName);
                            };
                            //$.each(grps, function (index, grp) {
                            //    chatHub.server.connect(grp.groupId, grp.groupName, grp.userId, grp.userName);
                            //});
                            //$('#btnChatSend').click(function () {
                            //    // Call the Send method on the hub.
                            //    if ($("#txtChatMsg").val() != "") {
                            //        chatHub.server.send(groupId, userId, $("#txtChatMsg").val());
                            //        //chat.server.send($('#displayname').val(), $('#message').val());
                            //        // Clear text box and reset focus for next comment.
                            //        $('#txtChatMsg').val('').focus();
                            //    }
                            //    else {
                            //        ShowToolTip("#txtChatMsg", "Please enter message.", "bottom");
                            //    }
                            //});

                            $('.chatInput input:text').keyup(function (e) {
                                if (e.keyCode == 13) {
                                    if ($(this).val() != "") {
                                        var txtId = $(this).attr("id");
                                        groupId = txtId.replace('txt_', '');
                                        chatHub.server.send(groupId, userId, $(this).val());
                                        //chat.server.send($('#displayname').val(), $('#message').val());
                                        // Clear text box and reset focus for next comment.
                                        $(this).val('').focus();
                                        //alert(groupId);
                                        //alert($("#divChat_" + groupId).val());
                                        //$("#ulChat_" + groupId).scrollTop($("#ulChat_" + groupId)[0].scrollHeight);
                                    }
                                    else {
                                        ShowToolTip("#" + txtId, "Please enter message.", "bottom");
                                    }
                                }
                            });

                            //$('.txtChat').bind("enterKey", function (e) {
                            //    if ($("#txtChatMsg").val() != "") {
                            //        var txtId = $(this).attr("id");
                            //        groupId = txtId.replace('txt_', '');
                            //        chatHub.server.send(groupId, userId, $(this).val());
                            //        //chat.server.send($('#displayname').val(), $('#message').val());
                            //        // Clear text box and reset focus for next comment.
                            //        $(this).val('').focus();
                            //    }
                            //    else {
                            //        ShowToolTip("#" + txtId, "Please enter message.", "bottom");
                            //    }
                            //});
                        });
                        //});
                    </script>
                    <br class="cl">
                    </div>
                        <div id="divViewMore" runat="server"></div>                        
                        <div id="DivRFPDet" runat="server" style="display: none;"></div>                   

                </ContentTemplate>
            </asp:UpdatePanel>
            <br>
            <br>
            <br>
            </div>
            <div id="divRFPDetEdit" runat="server" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="Button4" class="close"
                                data-dismiss="modal">
                                &times;</button>
                            <h4 class="modal-title" id="H5">RFP Details</h4>
                        </div>
                        <div class="modal-body editRFP">
                            <table style="width: 100%;">
                                <tr style="display: none;">
                                    <td>
                                        <label>Name your RFP</label></td>
                                    <td>
                                        <asp:TextBox ID="xtxtName" runat="server" CssClass="imw97p" onkeypress="return RestrictText(event);" ondrop="return false;" autocomplete="off"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Product specifications, if any</label></td>
                                    <td>
                                        <asp:TextBox ID="xtxtDescription" runat="server" TextMode="MultiLine" Width="97%" onkeypress="return RestrictText(event);"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Product Document 1</label></td>
                                    <td>
                                        <ctrl:UploadFile ID="xctrlProdctDoc1" runat="server" UserType="CMP" UploadDocType="RFPProductDoc"
                                            UploadFileType="Doc" Caption="Upload product specifications Document" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Product Document 2</label></td>
                                    <td>
                                        <ctrl:UploadFile ID="xctrlProdctDoc2" runat="server" UserType="CMP" UploadDocType="RFPProductDoc"
                                            UploadFileType="Doc" Caption="Upload product specifications Document" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Product Document 3</label></td>
                                    <td>
                                        <ctrl:UploadFile ID="xctrlProdctDoc3" runat="server" UserType="CMP" UploadDocType="RFPProductDoc"
                                            UploadFileType="Doc" Caption="Upload product specifications Document" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Delivery expectation(days)</label></td>
                                    <td>
                                        <asp:TextBox ID="xtxtNoDays" runat="server" MaxLength="4" CssClass="imw97p" onkeydown="IsNumeric(event);"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>End Date</label>
                                        <td>
                                            <asp:TextBox ID="xtxtEndDate" CssClass="icnCal" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>End Time</label>
                                        <td>
                                            <asp:TextBox ID="xtxtEndTime" CssClass="icnTime" runat="server"></asp:TextBox></td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <a class="btnRed" href="#" id="lnkNext"
                                onclick="javascript: EditRFPDet();">UPDATE</a>
                            <a class="btnRed" href="#" id="A2" data-dismiss="modal">CLOSE</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" role="dialog" id="divBidReset">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="Button6" class="close"
                                data-dismiss="modal">
                                &times;</button>
                            <h4 class="modal-title" id="H7">Reset Quote</h4>
                        </div>
                        <div class="modal-body editRFP" id="DivResetBidDet">
                        </div>
                        <div class="modal-footer">
                            <a class="btnRed" href="#" id="btnSubmit"
                                onclick="javascript: UpdateRFPBid(true);">RESET QUOTE</a>
                            <%--<asp:LinkButton class="ui-icon-link imml5 txtLink" ID="LinkButton1" runat="server" OnClientClick="javascript:return NotIns_Click();"> Not interested</asp:LinkButton>--%>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="modal fade" role="dialog" id="divNotIns">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="Button5" class="close"
                        data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title" id="H6">Not Interested?</h4>
                </div>
                <div class="modal-body" id="divNotInsBody">
                    <%--<div class="row1">
                        <div class="whiteBox">
                            <div class="leftClmn notIntpop">
                                <h2>To help us select the right RFPs for you, let us know why you are not interested in this RFP ?</h2>
                                <br />
                                <div class="w49 newTheme">
                                    <div class="LeftChk">
                                        <input type="radio" name="radiobutton" id="chckNotDealing" onclick="NotIns_Change(false)" />
                                    </div>
                                    <div class="RightChk" id="pNotDealing">
                                        Not dealing in this product 
                                    </div>
                                </div>
                                <div class="w49">
                                    <div class="LeftChk">
                                        <input type="radio" name="radiobutton" id="chckNotdelivering" onclick="NotIns_Change(false)" />
                                    </div>
                                    <div class="RightChk" id="pNotdelivering">
                                        Not delivering to this location
                                    </div>
                                </div>
                                <div class="w49">
                                    <div class="LeftChk">
                                        <input type="radio" name="radiobutton" id="chckOrdersize" onclick="NotIns_Change(false)" />
                                    </div>

                                    <div class="RightChk" id="pOrdersize">
                                        Order size too small/big
                                    </div>
                                </div>
                                <div class="w49">
                                    <div class="LeftChk">
                                        <input type="radio" name="radiobutton" id="chckOther" onclick="NotIns_Change(true)" />
                                    </div>
                                    <div class="RightChk">
                                        Other Reason
                                    </div>
                                </div>
                                <div id="trOthReason" style="display: none">
                                    <div class="w49">
                                        <div class="LeftChk">
                                        </div>
                                        <div class="RightChk" id="Div1">
                                            <textarea rows="3" cols="40" id="txtOth" placeholder="Type other reason" autocomplete="off" style="float: left; margin-top: 5px; border: solid 1px"> 
                                                              </textarea>
                                        </div>
                                    </div>
                                </div>
                                <br class="cl" />
                                <br class="cl" />
                                <div class="col-1">
                                    <input class="btnRed" type="button" id="btnNotInsSubmit" value="Submit" onclick="javascript: return NotIns_Submit(true);" />
                                </div>
                            </div>

                        </div>
                    </div>--%>
                </div>
                <div class="modal-footer" style="display:none;">
                </div>
            </div>
        </div>
    </div>
    <script>
        function NotIns_Change(val) {
            var trNotIns = document.getElementById("trOthReason");
            trNotIns.style.display = val ? "block" : "none";
        }

        function NotIns_Submit(vendorId) {
            var IsNotIns = 0;
            var description = "";
            var oth = "";
            var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
            // if (boolNotIns == true) {
            //if (!$('#chckNotDealing').is(':checked')) {
            //    if (!$('#chckNotdelivering').is(':checked')) {
            //        if (!$('#chckOrdersize').is(':checked')) {
            //            if (!$('#chckOrdersize').is(':checked')) {
            //                if (!$('#chckplatform').is(':checked')) {
            //                    if (!$('#chckOther').is(':checked')) {
            //                        ShowToolTip($("#chckNotDealing"), "Please atleast one select reason.", "bottom");
            //                        return false;
            //                    }
            //                }
            //            }
            //        }
            //    }
            //}
            if ($('#chckNotDealing').is(':checked')) {
                description = $('#pNotDealing').html();
            }
            if ($('#chckNotdelivering').is(':checked')) {
                description = $('#pNotDealing').html();
            }
            if ($('#chckOrdersize').is(':checked')) {
                description = $('#pOrdersize').html();
            }
            if ($('#chckplatform').is(':checked')) {
                description = $('#pplatform').html();
            }
            if ($('#chckOther').is(':checked')) {
                oth = $("#txtOth").val().trim();
                if (oth == "") {
                    ShowToolTip($("#txtOth"), "Please enter reason.", "bottom");
                    return false;
                }
                else {
                    description = $('#txtOth').val().trim();
                }
            }
            //}
            //else {
            //    if (!$('#chckInsterested').is(':checked')) {
            //        ShowToolTip($("#chckInsterested"), "Please select I am insterested.", "top");
            //        return false;
            //    }
            //    else {
            //        IsNotIns = 0;
            //        description = $('#pInsterested').html();
            //    }
            //}
            //HideModalMsgBox();
            HideModalBox("#divNotIns");
            ShowProgress();
            $.ajax({
                url: strUrl + 'RFPCenter/Live.aspx/NotInterestedSubmit',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'rfpId':'" + rfpId + "','VendorId':'" + vendorId + "','description':'" + description + "'}",
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData == "0") {
                            //ShowModalBox("ReNePay", "Your response submitted sucessfully.");
                            window.location = "Closed.aspx";
                        }
                        else {
                            HideProgress();
                            ShowModalBox("Renepay", newData);
                        }
                    }
                    catch (e) {
                        //ShowModalBox("Error", e.Message);
                        //ShowMessageBox(e.Message);
                        HideProgress();
                    }
                },

                error: ShowError
            });
        }
    </script>
    <asp:Button ID="xbtnView" OnClick="xbtnView_Click" runat="server" Style="display: none;" />
    <input type="hidden" id="xhdnVendorBidId" runat="server" />
    <asp:Button ID="xbtnHideBidData" OnClick="xbtnHideBidData_Click" runat="server" Style="display: none;" />
</asp:Content>

