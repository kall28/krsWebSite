<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_AuctionCenter_Live, App_Web_live.aspx.aadda0d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <link href="../Styles/clockpicker.css" rel="stylesheet" />--%>
    <asp:UpdatePanel ID="xupnlRFP" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <script src="../Scripts/common.timer-1.0.js" type="text/javascript"></script>
            <%--  <script src="../Scripts/clockpicker.js"></script>--%>
            <script src="../Scripts/jquery.signalR-2.2.0.min.js"></script>
            <script src="/signalr/hubs"></script>
            <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
            <link href="../Scripts/TimePicker/jquery.ui.timepicker.css?v=0.3.3" rel="stylesheet" />
            <script src="../Scripts/TimePicker/jquery.ui.timepicker.js"></script>
            <script>
                $(document).ready(function () {
                    BindDatePicker();
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

                Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
                    BindDatePicker();
                    BindClockPicker();
                });
                
            </script>

            <script>
                function BindDatePicker() {
                    var d = new Date();
                    var day = d.getDate();
                    //var mnth = d.getMonth() + 1;
                    //var y = d.getFullYear();

                    $("#ContentPlaceHolder1_xtxtEndDateExt").datepicker({
                        dateFormat: 'dd/mm/yy',
                        mindate: d,
                    }).attr('readonly', 'true');

                }
                function BindClockPicker() {
                    $('#ContentPlaceHolder1_xtxtEndTimeExt').timepicker({
                        showPeriodLabels: false
                    });
                }
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
                    if (val != undefined && (val == "" || val == "0")) {
                        $("#" + ctrl + "").val('');
                    }
                }

                function Hidefocus(ctrl) {
                    var text = $("#" + ctrl + "").val();
                    if (text != undefined && text == "") {
                        $("#" + ctrl + "").val('0');
                    }
                }
                function InitRFPRequest() {
                    setInterval(GetRFPSummary, 10000);
                }

                function onTimeOut() {
                    var aucId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'AuctionCenter/Live.aspx/OnTimeOut',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'aucId':'" + aucId + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData != "0") {
                                    window.location = newData;
                                }
                                else {
                                }
                            }
                            catch (e) { //alert(e.Message); 
                            }
                        },
                        error: function (data) {
                        }
                    });
                }
                function GetRFPSummary() {
                    var aucId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'AuctionCenter/Live.aspx/GetRFPSummary',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'aucId':'" + aucId + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData.ErrDesc == "0") {
                                    ShowRFPSummary(newData);
                                }
                                else {
                                    ShowModalTimeOutMsgBox("Renapay", newData.ErrDesc);
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
                function ShowRFPSummary(rfpSummary) {
                    var aucId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    //  $("#ContentPlaceHolderMaster_xlblNofoVendors").val(rfpSummary.NoOfVendors);
                    //$("#ContentPlaceHolderMaster_xlblNofoVendorsActive").val(rfpSummary.NoOfVendorsActive);
                    // $("#ContentPlaceHolderMaster_xtxtStartDate").val(rfpSummary.PreStartDateDisp);
                    //  $("#ContentPlaceHolderMaster_xtxtStartTime").val(rfpSummary.PreStartTimeDisp);
                    $("#divTime0").html(rfpSummary.TimeRemaining);
                    if (rfpSummary.CurrentVendorId > 0) {
                        $("#ContentPlaceHolder1_pBestQuoteText").html('');
                        $("#ContentPlaceHolder1_pBestQuoteValue").html('');
                        if (rfpSummary.BidAmount > 0) {
                            $("#ContentPlaceHolder1_pBestQuoteText").html('Lowest Quote :');
                            if (rfpSummary.BidAmount > rfpSummary.OpeningBid) {
                                $("#ContentPlaceHolder1_pBestQuoteValue").html(rfpSummary.OpeningBid.toFixed(2));
                            }
                            else { $("#ContentPlaceHolder1_pBestQuoteValue").html(rfpSummary.BidAmount.toFixed(2)); }
                            
                        }
                        else {
                            $("#ContentPlaceHolder1_pBestQuoteText").html('Opening Bid :');
                            $("#ContentPlaceHolder1_pBestQuoteValue").html(rfpSummary.OpeningBid.toFixed(2));
                        }
                        ShowAucBidHistory(aucId);
                    }
                    else {
                        ShowBidHistory(aucId);
                        ShowCompanyView(rfpSummary);
                        if (rfpSummary.BestQuote > 0) {
                        }
                    }
                }

                function ShowCompanyView(rfpSummary) {
                    var str = "";
                    var cnt = 0;
                    $("#ContentPlaceHolder1_divLastBid").hide(true);

                    $("#ContentPlaceHolder1_divCompanyDet").html('');
                    str = "<table cellspacing='0' cellpadding='0' border='0' class='billInfoPlain imw58p fr'>"
                            + "<thead>"
                            + "<tr><th width='65%'>Suppliers</th><th width='30%'>Quote Amount</th></tr></thead>"
                            + "<tbody>";

                    for (var i = 0; i < rfpSummary.VendorList.length; i++) {
                        //if (rfpSummary.VendorList[i].BidDet.BidAmount > 0) {
                        str += "<tr><td width='60%'>" + rfpSummary.VendorList[i].Name + "</td>"
                                    + "<td width='30%'>" + rfpSummary.VendorList[i].BidDet.BidAmount.toFixed(2) + "</td></tr>";
                            cnt++;
                        //}

                    }
                    //if (cnt > 0) {
                    //    str += "</tbody></table>";
                    //}
                    //else {

                    //    str = "<div >"
                    //            + " <div >NO SUPPLIERS HAVE CURRENTLY RESPONDED TO THE NEGOTIATION WITH A QUOTE.</div></div>";
                    //}
                    $("#divSuppRes").html('');
                    // $("#ContentPlaceHolder1_xlitSupplier").text(str);
                    $("#ContentPlaceHolder1_divCompanyDet").html(str);
                }

                function ShowBidHistory(aucId) {
                    //  ShowProgress(true);
                    //$("#ContentPlaceHolder1_divBidHistory").html('')
                    $.ajax({
                        type: 'POST',
                        url: strUrl + 'AuctionCenter/Live.aspx/ShowBidHistory',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: "{'aucId': " + aucId + "}",
                        cache: false,
                        success: function (msg) {
                           // $("#ContentPlaceHolder1_divBidHistory").html('');
                            $("#ContentPlaceHolder1_divBidHistory").html(msg.d);
                            HideProgress();
                        },
                        error: ShowError
                    });
                }

                function ShowAucBidHistory(aucId) {
                    $.ajax({
                        type: 'POST',
                        url: strUrl + 'AuctionCenter/Live.aspx/ShowSupplierBidHistory',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: "{'aucId': " + aucId + "}",
                        cache: false,
                        success: function (msg) {
                            $("#ContentPlaceHolder1_divBidHistory").html(msg.d);
                            //  HideProgress();
                        },
                        error: ShowError
                    });
                }

                function UpdateRFPBid(Id) {
                    var vendorId = Id;
                    var remark = "";
                    if ($("#txtUnitPrice").val() == "" || $("#txtUnitPrice").val() == "0") {
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
                    remark = $("#txtRemark").val();
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

                    bidAmt = (uPrice * qty) + delChrg + taxVal1 + taxVal2 + taxVal3;

                    ShowProgress(true);
                    $.ajax({
                        url: strUrl + 'AuctionCenter/Live.aspx/UpdateRFPBid',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "', 'bidAmt' : '" + bidAmt + "', 'uPrice' : '"
                            + uPrice + "', 'delChrg' : '" + delChrg + "', 'tax1' : '" + tax1
                            + "', 'tax2' : '" + tax2 + "', 'tax3' : '" + tax3 + "', 'taxVal1' : '"
                            + taxVal1 + "', 'taxVal2' : '" + taxVal2 + "', 'taxVal3' : '"
                            + taxVal3 + "', 'bidAmt' : '" + bidAmt + "','vendorId':'" + vendorId + "','remark' : '"
                            + remark + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData == "0") {
                                    ShowModalMsgBox("ReNePay", "Your quote submitted sucessfully.");
                                    GetRFPSummary();
                                }
                                else {
                                    ShowModalMsgBox("Your Bid", newData);
                                }
                                HideProgress();
                            }
                            catch (e) {
                                ShowModalMsgBox("Error", e.Message);
                                HideProgress();
                            }
                        },
                        error: ShowError
                    });
                }
                function ViewMore(Id) {
                    // var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'AuctionCenter/Live.aspx/ViewMore',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + Id + "'}",
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

                function btnEdit_Click(VendorId) {
                    var aucId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'AuctionCenter/Live.aspx/EditBid',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'aucId':'" + aucId + "','VendorId':'" + VendorId + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData != "") {
                                    ShowModalMsgBox("Reset Quote", newData);
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

                function RFP_click(Id) {
                    $.ajax({
                        type: 'POST',
                        url: strUrl + 'AuctionCenter/Live.aspx/RFP_click',
                        contentType: 'application/json; charset=utf-8',
                        data: "{'rfpId':'" + Id + "'}",
                        dataType: 'json',
                        cache: false,
                        success: function (msg) {
                            if (msg.d != null) {
                                window.location.href = msg.d;
                            }
                        },
                        error: ShowError
                    });
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
               <style>
                .modal-dialog {
                    width: 400px;
                }

                .formRow > label {
                    margin-top: 12px;
                }

                .billInfo .btnRed {
                    padding: 10px 15px;
                }
            </style>
            <%-- <div class="main negotiation RFP newUI">--%>
            <div class="topBlk topBlkInn">
                <ul class="rightBtn">
                    <li id="liWithdraw" runat="server" visible="false">
                        <asp:LinkButton ID="xlnkWithdraw" runat="server"
                            OnCommand="xlnk_Command" CommandName="WTD"
                            Text="WITHDRAW" CssClass="btnBlk"></asp:LinkButton>
                    </li>
                    <li id="liExtend" runat="server" visible="false">
                        <asp:LinkButton ID="xlnkExtend" runat="server"
                            OnCommand="xlnk_Command" CommandName="EXT"
                            Text="EXTEND" CssClass="btnBlk"></asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="xlnkClose" runat="server" Visible="false"
                            OnCommand="xlnk_Command" CommandName="CLS"
                            Text="Back" CssClass="btnBlk"></asp:LinkButton>
                    </li>
                </ul>
                <br class="cl">
                <asp:Literal ID="xlitScrAction" runat="server"></asp:Literal>
                <div class="modal fade" id="divWthdrawCrfm" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" id="btnClose" class="close"
                                    data-dismiss="modal">
                                    &times;</button>
                                <h4 class="modal-title" id="H1">Negotiation withdraw Confirmation</h4>
                            </div>
                            <div class="modal-body">
                                <p id="pRegMsg">
                                    Do you want to withdraw Negotiation at this moment ?
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
                                <h4 class="modal-title" id="H2">Extend Negotiation</h4>
                            </div>
                            <div class="modal-body">
                                <div class="clmn1 fl">
                                    <div class="row1">
                                        <div class="buyRegis">
                                            <div class="formRow">
                                                <label>End Date</label>
                                                <div class="formRow1 iconCal">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                    <asp:TextBox ID="xtxtEndDateExt" CssClass="icnCal imw100p" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="formRow">
                                                <label>End Time</label>
                                                <div class="formRow1 iconTime">
                                                    <i class="fa fa-clock-o" aria-hidden="true"></i>
                                                    <asp:TextBox ID="xtxtEndTimeExt" CssClass="icnTime imw100p" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br class="cl" />
                            </div>
                            <div class="modal-footer">
                                <a class="btnRed" href="#" id="lnkExtendRFP" runat="server"
                                    onclick="HideModalBox('#divExtendCrfm'); ShowProgress();" onserverclick="lnkExtendRFP_ServerClick">CONTINUE</a>
                                <%--<a class="btnRed" href="#" id="A3" data-dismiss="modal">CLOSE</a>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:UpdatePanel ID="xUpdPanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="clmn1">
                            <div class="row1">
                                <div class="immrt30">
                                    <input type="hidden" id="xhdnRFPId" runat="server" />
                                    <%-- <asp:Button ID="xbtnBidDetails" OnClick="xbtnBidDetails_Click" runat="server" />--%>
                                    <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                                    <br class="cl">
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <asp:UpdatePanel ID="xUpdPanelLiveDet" runat="server" UpdateMode="Conditional">
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
                                <div class="innerBxbody brdGrey RFPDetail">
                                        <asp:Literal ID="xlitBidDetails" runat="server"></asp:Literal>
                                </div>
                            </div>
                        </div>
                        <div class="newCol2 imw55p fr">
                            <div class="innerBxhead bgRed">
                                <lable id="xlblMidelHeader" runat="server">Your Quote</lable>
                                <a href="#" class="fr">
                                    <img id="img1" runat="server" src="~/images/icn-quote.png" /></a>
                            </div>
                            <div class="innerBxbody brdPink RFPDetail Liverfp">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div>
                                        <div id="divLastBid" class="lastBid" runat="server">
                                            <p id="pBestQuoteText" runat="server"></p>
                                            <p id="pBestQuoteValue" runat="server"></p>
                                            <br />
                                            <p id="pRank" runat="server"></p>
                                        </div>
                                        </div>
                                        <asp:Literal ID="xlitSupplier" runat="server"></asp:Literal>
                                        <div id="divCompanyDet" runat="server"></div>
                                        <div id="divSuppBidDet" runat="server">
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                               
                                <br class="cl" />
                            </div>
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </div>
                        <br class="cl" />
                        <div class="whiteBox immrt30">
                            <asp:UpdatePanel ID="xupnlBidHistory" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="divBidHistory" runat="server"></div>
                                    <%--<asp:Literal ID="xlitBidHistory" runat="server"></asp:Literal>--%>
                                    <br class="cl" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <div class="btn-help btnHelper">
                        <img src="../images/icn-help.png" />
                    </div>
                    <div class="helpBlockAll"></div>
                    <div class="fr helpBlk helpBlkInn srh-help helpSlide">

                        <!-- faq start here -->
                        <ctrl:FAQ ID="xFAQ" runat="server" />
                        <!-- faq end here -->

                        <!-- chat start here -->
                        <div class="chatBlk">
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
                    <%--<div class="whiteBox imw30p fl">
                                    <h2>RFP Details</h2>
                                    <asp:Literal ID="" runat="server"></asp:Literal>
                                    <asp:UpdatePanel ID="xupnlOthSupBidDet" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Literal ID="xlitOthSuppBid" runat="server"></asp:Literal>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>--%>
                    <%--<div class="imw62p imw62p fr selSupplier">
                            <div class="txtAligncenter">
                                <br class="cl">
                            </div>
                            <div class="lastBid">
                                <p id="pBestQuoteText" runat="server"></p>
                                <p id="pBestQuoteValue" runat="server"></p>
                            </div>
                            <asp:UpdatePanel ID="xupnlSupp_CompView" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>

                                   
                                    <asp:Literal ID="xlitCompany" runat="server"></asp:Literal>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>--%>
                    <br class="cl">
                    </div>
                        </div>
                        <%--<div class="newCol2 imw42p fr">
                            <div class="whiteBox fl chat accordion_container">
                                <div class="liveChatBlk">
                                    <h2 class="fl">Live Chat</h2>
                                    <div class="rightControl">
                                    </div>
                                    <br class="cl">
                                    <ul class="liveChats" id="ulLiveChat" runat="server">
                                    </ul>
                                </div>
                            </div>
                        </div>--%>
                    <br class="cl">
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            <%--</div> MainDiv --%>
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

                    // $('.txtChat').keyup(function (e) {
                    $('.chatInput input:text').keyup(function (e) {
                        if (e.keyCode == 13) {
                            if ($(this).val() != "") {
                                var txtId = $(this).attr("id");
                                groupId = txtId.replace('txt_', '');
                                chatHub.server.send(groupId, userId, $(this).val());
                                //chat.server.send($('#displayname').val(), $('#message').val());
                                // Clear text box and reset focus for next comment.
                                $(this).val('').focus();
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
