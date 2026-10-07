<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="RFPCenter_Live_Buyer, App_Web_live_buyer.aspx.f5f1fac" %>

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
                });

                function FillDate() {
                    $.ajax({
                        type: 'POST',
                        url: 'Live_Buyer.aspx/FillDate',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        cache: false,
                        success: function (msg) {
                            if (msg.d != null) {

                                $("#ContentPlaceHolder1_xtxtEndDate").datepicker({
                                    dateFormat: 'dd/mm/yy',
                                    minDate: msg.d,
                                }).attr('readonly', 'true');
                            }
                        },
                        error: ShowError
                    });
                }
            </script>
            <script>
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
                    setInterval(GetRFPSummary, 10000);
                }

                function onTimeOut() {
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'RFPCenter/Live_Buyer.aspx/OnTimeOut',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData != "0") {
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
                }

                function GetRFPSummary() {
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'RFPCenter/Live_Buyer.aspx/GetRFPSummary',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData.ErrDesc == "0") {
                                    //$("#ContentPlaceHolder1_xbtnBidDetails").click();
                                    ShowRFPSummary(newData);
                                }
                                else {
                                    //ShowModalTimeOutMsgBox("Error", newData.ErrDesc);
                                    // window.location.href = "Live.aspx";
                                    //alert(newData.ErrDesc);
                                }
                            }
                            catch (e) {
                                //ShowModalMsgBox("Error", e.message); //alert(e.Message); 
                            }
                        },
                        error: function (data) {
                            //ShowModalMsgBox("Error", data);
                            //alert(data);
                        }
                    });
                }
                function ShowRFPSummary(rfpSummary) {

                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $("#divTime0").html(rfpSummary.TimeRemaining);
                    if (rfpSummary.CurrentVendorId > 0) {
                        // ShowSupplierView(rfpSummary); --Does not require to refresh supplier screen
                        // ShowBidDetails(rfpId, rfpSummary.CurrentVendorId);
                    }
                    else {
                        ShowCompanyView(rfpSummary);
                        ShowBidDetails(rfpId, 0);
                    }
                }

                function ShowCompanyView(rfpSummary) {
                    var cnt = 0;
                    var str = "";
                    str += "<ul class='manage'><li><em>Best quote:</em><p>" + rfpSummary.BestQuote + "</p></li>" +
                           "<li><em>Suppliers invited:</em><p>" + rfpSummary.NoOfVendors + "</p></li>" +
                           "<li><em>Suppliers participated:</em><p>" + rfpSummary.NoOfVendorsActive + "</p></li></ul>";
                    $("#ContentPlaceHolder1_divRFPHistory").html(str);
                }

                function ShowBidDetails(rfpId, vendorId) {
                    $("#ContentPlaceHolder1_divBidDet").html('')
                    $.ajax({
                        type: 'POST',
                        url: strUrl + 'RFPCenter/Live_Buyer.aspx/ShowBidDetails',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: "{'rfpId': " + rfpId + ",'vendorId':" + vendorId + "}",
                        cache: false,
                        success: function (msg) {
                            $("#ContentPlaceHolder1_divBidDet").html(msg.d);
                            HideProgress();
                        },
                        error: ShowError
                    });
                }

                function HideDetails() {
                    $("#ContentPlaceHolder1_divViewMore").attr('style', 'display:none;');
                    $("#divLiveDet").attr('style', 'display:block;');
                }

                function ViewBuyerEditRFPDet() {
                    ShowProgress();
                    //BindDateTimePicker();
                    FillDate();
                    BindRFPDet();
                    ShowModalBox("#ContentPlaceHolder1_divRFPDetEdit");
                }

                function BindDateTimePicker() {
                    var d = new Date();
                    var day = d.getDate();
                    $("#ContentPlaceHolder1_xtxtEndDate").datepicker({
                        dateFormat: 'dd/mm/yy',
                        minDate: d,
                    }).attr('readonly', 'true');

                    $('#ContentPlaceHolder1_xtxtEndTime').timepicker({
                        showPeriodLabels: false
                    });
                }

                function BindRFPDet() {
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'RFPCenter/Live_Buyer.aspx/BindRFPDet',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var objrfp = data.d;
                                $("#ContentPlaceHolder1_xtxtQty").val(objrfp.Qty);
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

                function EditRFPDet(QtyConfirm) {
                    HideModalBox("#ContentPlaceHolder1_divRFPDetEdit");
                    ShowProgress();
                    var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    var Qty = $("#ContentPlaceHolder1_xtxtQty").val();
                    var ProductDoc1 = window["xctrlProdctDoc1_GetUploadedFileName"]();
                    var ProductDoc2 = window["xctrlProdctDoc2_GetUploadedFileName"]();
                    var ProductDoc3 = window["xctrlProdctDoc3_GetUploadedFileName"]();
                    var Name = $("#ContentPlaceHolder1_xtxtName").val();
                    var Description = $("#ContentPlaceHolder1_xtxtDescription").val();
                    Description = Description.replace("'", "`");
                    var ExpectedDelivery = $("#ContentPlaceHolder1_xtxtNoDays").val();
                    var EndDate = $("#ContentPlaceHolder1_xtxtEndDate").val();
                    var EndTime = $("#ContentPlaceHolder1_xtxtEndTime").val();
                    $.ajax({
                        url: strUrl + 'RFPCenter/Live_Buyer.aspx/EditRFPDet',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "','Qty':'" + Qty + "','ProductDoc1':'"
                            + ProductDoc1 + "','ProductDoc2':'" + ProductDoc2 + "','ProductDoc3':'"
                            + ProductDoc3 + "','Name':'" + Name + "','Description':'"
                            + Description + "','ExpectedDelivery':'"
                            + ExpectedDelivery + "','EndDate':'" + EndDate + "','EndTime':'"
                            + EndTime + "','QtyConfirm':'" + QtyConfirm + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData != "1") {
                                    ShowModalMsgBox("Renepay", newData);
                                    window.location = "Live_Buyer.aspx";
                                    HideProgress();
                                }
                                else {
                                    HideModalBox("#ContentPlaceHolder1_divRFPDetEdit");
                                    ShowModalBox("#ContentPlaceHolder1_divQtyConfirm");
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

                function NotIns_Change(chckNotIns) {
                    var trNotIns = document.getElementById("trOthReason");
                    trNotIns.style.display = chckNotIns.checked ? "block" : "none";
                }

                function QtyConfirm() {
                    HideQtyConfirm();
                    EditRFPDet(true);
                }

                function HideQtyConfirm() {
                    HideModalBox("#ContentPlaceHolder1_divQtyConfirm");
                    ShowModalBox("#ContentPlaceHolder1_divRFPDetEdit");
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

            <script>
                function FillDate() {
                    $.ajax({
                        type: 'POST',
                        url: 'Live_Buyer.aspx/FillDate',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        cache: false,
                        success: function (msg) {
                            if (msg.d != null) {

                                $("#ContentPlaceHolder1_xtxtEndDate").datepicker({
                                    dateFormat: 'dd/mm/yy',
                                    minDate: msg.d,
                                }).attr('readonly', 'true');

                            }
                        },
                        error: ShowError
                    });
                }

                function validateBenchmarkPrice() {
                    var msg = "";
                    if ($("#ContentPlaceHolder1_xddlReason option:selected").index() <= 0) {
                        if ($("#ContentPlaceHolder1_txtCustomerBenchmark").val() == "0.00") {
                            $("#ContentPlaceHolder1_txtCustomerBenchmark").focus();
                            msg = "Please enter benchmark price";
                            ShowToolTip("#ContentPlaceHolder1_txtCustomerBenchmark", msg, "bottom");
                            return false;
                        }
                        else if ($("#ContentPlaceHolder1_txtOnlineBenchmark").val() == "0.00") {
                            $("#ContentPlaceHolder1_txtOnlineBenchmark").focus();
                            msg = "Please enter online price";
                            ShowToolTip("#ContentPlaceHolder1_txtOnlineBenchmark", msg, "bottom");
                            return false;
                        }
                    }
                    return true;
                }

                function InsertRfpBenchmarkPrice() {
                    if (validateBenchmarkPrice()) {
                        var CustomerBenchmarkPrice = $("#ContentPlaceHolder1_txtCustomerBenchmark").val();
                        var OnlineBenchmarkPrice = $("#ContentPlaceHolder1_txtOnlineBenchmark").val();
                        var Remark = $("#ContentPlaceHolder1_xddlReason").val();

                        ShowProgress();
                        $.ajax({
                            url: 'Live_Buyer.aspx/InsertRfpBenchmarkPrice',
                            type: 'POST',
                            contentType: 'application/json;charset=utf-8',
                            dataType: 'json',
                            data: "{'CustomerBenchmarkPrice' : '" + CustomerBenchmarkPrice + "','OnlineBenchmarkPrice' : '" + OnlineBenchmarkPrice + "','Remark' : '" + Remark + "'}",
                            cache: false,
                            success: function (msg) {
                                HideProgress();
                                if (msg.d == "0")
                                    ShowModalMsgBox("Renepay", "Benchmark price added.");
                                else
                                    ShowModalMsgBox("Renepay", msg);
                            },
                            error: function (msg) {
                                ShowModalMsgBox("Renepay", msg);
                            }
                        });
                    }
                }
            </script>

            <%--<div class="main negotiation RFP newUI">--%>
            <asp:HiddenField ID="xhdnRFPId" runat="server" />
            <div class="topBlk topBlkInn">
                <asp:UpdatePanel ID="xupnlAction" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <ul class="rightBtn">
                            <li id="liWithdraw" runat="server" visible="false">
                                <asp:LinkButton ID="xlnkWithdraw" runat="server"
                                    OnCommand="xlnk_Command" CommandName="WTD"
                                    Text="WITHDRAW" CssClass="btnBlk"></asp:LinkButton>
                            </li>
                            <li id="liEdit" runat="server" visible="false">
                                <asp:LinkButton ID="xlnkEdit" runat="server"
                                    OnCommand="xlnk_Command" CommandName="EDIT"
                                    Text="EDIT" CssClass="btnBlk"></asp:LinkButton>
                            </li>
                            <li id="liStop" runat="server" visible="false">
                                <asp:LinkButton ID="xlnkStop" runat="server"
                                    OnCommand="xlnk_Command" CommandName="STP"
                                    Text="STOP" CssClass="btnBlk"></asp:LinkButton>
                            </li>
                            <li id="liAddMore" runat="server" visible="false">
                                <asp:LinkButton ID="xlnkAddMore" runat="server"
                                    OnCommand="xlnk_Command" CommandName="ADM"
                                    Text="ADD MORE SUPPLIERS" CssClass="btnBlk"></asp:LinkButton>
                            </li>
                            <li id="liReset" runat="server" visible="false">
                                <asp:LinkButton ID="xlnkReset" runat="server"
                                    OnCommand="xlnk_Command" CommandName="RST"
                                    Text="RESET" CssClass="btnBlk"></asp:LinkButton>
                            </li>
                            <li>
                                <asp:LinkButton ID="xlnkClose" runat="server" Visible="false"
                                    OnCommand="xlnk_Command" CommandName="CLS" OnClientClick="javascript:ShowProgress();"
                                    Text="BACK" CssClass="btnBlk"></asp:LinkButton>
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
                                        <%--<p id="pRegMsg">
                                            Your withdrawn request will move into Drafts section, 
                                            ready for you to re-issue later. Do you want to proceed?
                                        </p>--%>
                                        <p id="pRegMsg">
                                            Your withdrawn RFP will be moved to the Draft section for re-use later. 
                                            Do you want to proceed?
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <a class="btnRed" href="#" id="lnkWithdrawRFP" runat="server"
                                            onclick="HideModalBox('#divWthdrawCrfm'); ShowProgress();" onserverclick="lnkWithdrawRFP_ServerClick">CONTINUE</a>
                                        <%--<a class="btnRed" href="#" id="A1" data-dismiss="modal">CLOSE</a>--%>
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
                                                <div class="imw45p immr0 fr" style="display: none;">
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
                                            onclick="HideModalBox('#divExtendCrfm'); ShowProgress();"
                                            onserverclick="lnkExtendRFP_ServerClick">CONTINUE</a>
                                        <%--<a class="btnRed" href="#" id="A3" data-dismiss="modal">CLOSE</a>--%>
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
                                        <h4 class="modal-title" id="H3">Stop the RFP?</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p id="p1">
                                            Are you sure you want to stop the RFP?
                                            You will not receive any quote from other suppliers if you stop. 
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <a class="btnRed" href="#" id="lnkStopRFP" runat="server"
                                            onclick="HideModalBox('#divStopCrfm'); ShowProgress();" onserverclick="lnkStopRFP_ServerClick">CONTINUE</a>
                                        <%--<a class="btnRed" href="#" id="A4" data-dismiss="modal">CLOSE</a>--%>
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
                                        <%--<a class="btnRed" href="#" id="A5" data-dismiss="modal">CLOSE</a>--%>
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
                                <div class="innerBxbody brdGrey RFPDetail">
                                    <asp:Literal ID="xlitBidDetails" runat="server"></asp:Literal>
                                </div>
                            </div>
                        </div>
                        <div class="newCol2 imw55p fr">
                            <div class="innerBxhead bgRed">
                                <lable id="xlblMidelHeader" runat="server">Your Quote</lable>
                                <a href="#" class="fr" id="editicon" runat="server">
                                    <img id="img1" runat="server" src="~/images/icn-quote.png" /></a>
                            </div>
                            <div class="innerBxbody brdPink RFPDetail Liverfp">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div id="divRFPHistory" runat="server">
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div id="DivTnc" runat="server" visible="false">
                                    <div class="acceptTerm">
                                        <input type="checkbox" value="option" name="field" id="Checkbox3">
                                        <label for="xchkTnC">I accept the terms and conditions of the RFP</label>
                                    </div>
                                    <div class="formRow">
                                        <label style="width: 68px;"></label>
                                        <div class="formRow1 immrt20">
                                            <asp:LinkButton class="btnRed" ID="xlnkSubmit" runat="server" OnClientClick="javascript:return UpdateRFPBid(false);">Submit</asp:LinkButton>
                                            <asp:LinkButton class="ui-icon-link imml5 txtLink" ID="xlnNotIns" runat="server" OnClientClick="javascript:return NotIns_Click();"> Not interested</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--<br class="cl" />--%>
                            <div class="innerBxbody brdPink RFPDetail Liverfp" id="divCustomerBenchMark" runat="server" visible="false">
                                <div class="innerBxhead bgRed">
                                    <lable id="xlblBenchMarkPrice" runat="server">BenchMark Price</lable>
                                    <a href="#" class="fr">
                                        <img id="img2" runat="server" src="~/images/icn-quote.png" /></a>
                                </div>
                                <table class="quotInfo">
                                    <tr>
                                        <td>Customer Benchmark</td>
                                        <td>
                                            <input type="text" id='txtCustomerBenchmark' runat="server" autocomplete='off'
                                                onkeydown='javascript:return IsDecimal(this);' onblur='javascript:Hidefocus(this.id);' onfocus='javascript:Setfocus(this.id);' />
                                            <%--style="text-align:right"--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Online Benchmark</td>
                                        <td>
                                            <input type="text" id='txtOnlineBenchmark' runat="server" autocomplete='off'
                                                onkeydown='javascript:return IsDecimal(this);' onblur='javascript:Hidefocus(this.id);' onfocus='javascript:Setfocus(this.id);' />

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Reason</td>
                                        <td>
                                            <div class="styled-select selOrganization ">
                                                <select id="xddlReason" runat="server">
                                                    <option value="0">Select</option>
                                                    <option value="PRO">Product N/A</option>
                                                    <option value="QTY">Qty N/A</option>
                                                    <option value="CST">Customise</option>
                                                </select>
                                            </div>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td align="right">
                                            <button type="button" runat="server" class="btnRed" onclick="javascript:InsertRfpBenchmarkPrice();">SUBMIT</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <asp:Literal ID="xlitSupplier" runat="server"></asp:Literal>
                        </div>
                        <br class="cl" />
                        <div id="divBidDet" class="whiteBox immrt20" runat="server" style="display: none"></div>
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
                                                <div class="liveChatBlk" id="ulLiveChat" runat="server">
                                                </div>
                                            </div>
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
                    <!--help panel end here-->
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

                        });
                        //});
                    </script>
                    <br class="cl" />
                    <ctrl:VendorDetails ID='xctrlVendorDet' runat='server' Caption='View' />

                    </div>
                        <div id="divViewMore" runat="server">
                        </div>
                    <div id="DivRFPDet" runat="server" style="display: none;">
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
                                    <div class="buyRegis">
                                        <div class="formRow" style="display: none;">
                                            <label>Name your RFP</label>
                                            <div class="formRow1">
                                                <asp:TextBox ID="xtxtName" runat="server" CssClass="imw30p" onkeypress="return RestrictText(event);" ondrop="return false;" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="formRow">
                                            <label>Quantity</label>
                                            <div class="formRow1">
                                                <asp:TextBox ID="xtxtQty" runat="server" CssClass="imw97p" onkeydown="IsNumeric(event);"
                                                    MaxLength="9" ondrop="return false;" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="formRow">
                                            <label>Description </label>
                                            <div class="formRow1">
                                                <asp:TextBox ID="xtxtDescription" runat="server" TextMode="MultiLine" Width="97%" onkeypress="return RestrictText(event);"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="formRow">
                                            <label>Attachments</label>
                                            <div class="formRow1">
                                                <ctrl:UploadFile ID="xctrlProdctDoc1" runat="server" UserType="CMP" UploadDocType="RFPProductDoc"
                                                    UploadFileType="Doc" Caption="Upload File 1" />
                                            </div>
                                        </div>
                                        <div class="formRow">
                                            <label></label>
                                            <div class="formRow1">
                                                <ctrl:UploadFile ID="xctrlProdctDoc2" runat="server" UserType="CMP" UploadDocType="RFPProductDoc"
                                                    UploadFileType="Doc" Caption="Upload File 2" />
                                            </div>
                                        </div>
                                        <div class="formRow">
                                            <label></label>
                                            <div class="formRow1">
                                                <ctrl:UploadFile ID="xctrlProdctDoc3" runat="server" UserType="CMP" UploadDocType="RFPProductDoc"
                                                    UploadFileType="Doc" Caption="Upload File 3" />
                                            </div>
                                        </div>
                                        <div class="formRow">
                                            <label>Expected delivery (days)</label>
                                            <div class="formRow1">
                                                <asp:TextBox ID="xtxtNoDays" runat="server" MaxLength="4" CssClass="imw97p" onkeydown="IsNumeric(event);"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="formRow">
                                            <label>RFP Deadline</label>
                                            <div class="formRow1">
                                                <div class="imw32p fl immr10">
                                                    <asp:TextBox ID="xtxtEndDate" CssClass="icnCal imw100p immrb20" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="imw32p fl" style="display: none;">
                                                    <asp:TextBox ID="xtxtEndTime" CssClass="icnTime imw100p immrb20" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <br class="cl" />
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <a class="btnRed" href="#" id="lnkNext"
                                        onclick="javascript: EditRFPDet(false);">UPDATE</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="divQtyConfirm" role="dialog" runat="server">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" id="Button5" class="close" data-dismiss="modal" onclick="HideQtyConfirm();">
                                        &times;</button>
                                    <h4 class="modal-title" id="H6">RFP Qty Change Confirmation</h4>
                                </div>
                                <div class="modal-body">
                                    <p id="p3">
                                        Do you know if Qty will be change all suppliers which bided they have to bid again.?
                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <a class="btnRed" href="#" id="A6" runat="server"
                                        onclick="QtyConfirm(); ShowProgress();">CONTINUE</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br>
            <br>
            <br>
            <%--</div>--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

