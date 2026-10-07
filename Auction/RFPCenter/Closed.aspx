<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_RFPCenter_Closed, App_Web_closed.aspx.f5f1fac" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <link href="../Scripts/TimePicker/jquery.ui.timepicker.css?v=0.3.3" rel="stylesheet" />
    <script src="../Scripts/common.timer-1.0.js" type="text/javascript"></script>
    <script src="../Scripts/TimePicker/jquery.ui.timepicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            FillDate();
            BindPaging('tblList');
            BindDatePicker();
        });
        function RFP_click(Id) {
            ShowProgress(true);
            $("#ContentPlaceHolder1_xhdnRFPId").val(Id);
            $("#ContentPlaceHolder1_xbtnView").click();
        }

        function vender_onchange(ctrl) {
            var val = ctrl.value.split('|');
            $("#ContentPlaceHolder1_xtxtCommission").val(val[1]);

        }

        function FillDate() {
            $.ajax({
                type: 'POST',
                url: 'Closed.aspx/FillDate',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                success: function (msg) {
                    if (msg.d != null) {

                        $("#ContentPlaceHolder1_xtxtEndDateExt").datepicker({
                            dateFormat: 'dd/mm/yy',
                            minDate: msg.d,
                        }).attr('readonly', 'true');

                    }
                },
                error: ShowError
            });
        }

        //Not Used
        function ViewMore() {
            var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
            $.ajax({
                url: strUrl + 'RFPCenter/Closed.aspx/ViewMore',
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

        function RaisePO(Id) {
            ShowProgress();
            $("#ContentPlaceHolder1_xhdnSuppId").val(Id);
            $("#ContentPlaceHolder1_xbtnPO").click();
        }

        function RFPVendorDetails(Id, mode) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: strUrl + 'RFPCenter/Closed.aspx/ShowRFPVendorDetails',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id': '" + Id + "','mode': '" + mode + "'}",
                cache: false,
                success: function (msg) {
                    ShowModalReportBox("RFP Vendor Details", msg.d);
                    SetDataTablePaging('#tblRFPVendors');
                    HideProgress();
                    //ShowGenPopup(msg.d);
                },
                error: ShowError
            });
        }
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
        function BindDatePicker() {
            $("#ContentPlaceHolder1_xtxtDealDate").datepicker({
                dateFormat: 'dd/mm/yy'
            });
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

        function validateDealTag() {
            var msg = "";
            if ($("#ContentPlaceHolder1_xtxtBestQuote").val() == "0.00") {
                $("#ContentPlaceHolder1_xtxtBestQuote").focus();
                msg = "Please enter Best Quote";
                ShowToolTip("#ContentPlaceHolder1_xtxtBestQuote", msg, "bottom");
                return false;
            }
            return true;
        }

        function InsertDealTag() {
            if (validateDealTag()) {
                var status = 0;
                var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                var bestQuote = $("#ContentPlaceHolder1_xtxtBestQuote").val();
                var commission = $("#ContentPlaceHolder1_xtxtCommission").val();
                var vendorId = $("#ContentPlaceHolder1_xddlSupplierName").val();
                var dealDate = $("#ContentPlaceHolder1_xtxtDealDate").val();
                if ($('#ContentPlaceHolder1_xchkDealTag').is(':checked'))
                    status = 1;
                else
                    status = 0;

                ShowProgress();
                $.ajax({
                    url: 'Closed.aspx/InsertDealTag',
                    type: 'POST',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data: "{'RFPId' : '" + rfpId + "','BestQuote' : '" + bestQuote + "','VendorId' : '" + vendorId + "','Commission' : '" + commission + "','Date' : '" + dealDate + "','status' : " + status + "}",
                    cache: false,
                    success: function (msg) {
                        HideProgress();
                        if (msg.d == "0")
                            ShowModalMsgBox("Renepay", "Deal tag updated.");
                        else
                            ShowModalMsgBox("Renepay", msg);
                    },
                    error: function (msg) {
                        ShowModalMsgBox("Renepay", msg);
                    }
                });
            }
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
                var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                var CustomerBenchmarkPrice = $("#ContentPlaceHolder1_txtCustomerBenchmark").val();
                var OnlineBenchmarkPrice = $("#ContentPlaceHolder1_txtOnlineBenchmark").val();
                var Remark = $("#ContentPlaceHolder1_xddlReason").val();

                ShowProgress();
                $.ajax({
                    url: 'Closed.aspx/InsertRfpBenchmarkPrice',
                    type: 'POST',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data: "{'RFPId' : '" + rfpId + "','CustomerBenchmarkPrice' : '" + CustomerBenchmarkPrice + "','OnlineBenchmarkPrice' : '" + OnlineBenchmarkPrice + "','Remark' : '" + Remark + "'}",
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
    <asp:UpdatePanel ID="xupnlAction" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <input type="hidden" id="xhdnRFPId" runat="server" />
            <asp:Button ID="xbtnView" OnClick="xbtnView_Click" runat="server" Style="display: none;" />
            <asp:Button ID="xbtnPO" runat="server" OnClick="xlnkbtnPO_Click" Style="display: none;" />
            <div class="topBlk topBlkInn">
                <ul class="rightBtn">
                    <li id="liExtend" runat="server" visible="false">
                        <asp:LinkButton ID="xlnkExtend" runat="server"
                            OnClick="xlnkExtend_Click" OnClientClick="ShowProgress(true);"
                            Text="EXTEND" CssClass="btnBlk"></asp:LinkButton>
                    </li>
                    <li id="liReset" runat="server" visible="false">
                        <asp:LinkButton class="btnBlk" ID="xlnkBtnReset"
                            runat="server" OnClick="xlnkBtnReset_Click">RESET RFP</asp:LinkButton>
                    </li>
                    <li id="liAuction" runat="server" visible="false">
                        <asp:LinkButton class="btnBlk" ID="xlnkbtnAuction" runat="server"
                            OnClick="xlnkbtnAuction_Click">START A NEGOTIATION</asp:LinkButton>
                    </li>
                    <li id="liWithdraw" runat="server">
                        <asp:LinkButton ID="xlnkWithdraw" runat="server" OnClientClick="ShowProgress(true);"
                            CssClass="btnBlk" OnClick="xlnkWithdraw_Click">WITHDRAW</asp:LinkButton>
                    </li>
                </ul>
                <br class="cl" />
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
                                            <div class="formRow" style="display: none;">
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
                            </div>
                        </div>
                    </div>
                </div>
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
                                    Your withdrawn request will move into Drafts section, 
                                            ready for you to re-issue later. Do you want to proceed?
                                </p>
                            </div>
                            <div class="modal-footer">
                                <a class="btnRed" href="#" id="lnkWithdrawRFP" runat="server"
                                    onclick="HideModalBox('#divWthdrawCrfm'); ShowProgress();" onserverclick="lnkWithdrawRFP_ServerClick">CONTINUE</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="xdivRFPDet" runat="server" visible="false" class="Newclmn1">
                <%--class="Newclmn1"--%>
                <div class="newCol1 imw42p immr15">
                    <div class="innerBxhead bgGrey">
                        RFP Details <a href="#" class="fr">
                            <img src="../images/icn-rfp1.png" /></a>
                    </div>
                    <div class="innerBxbody brdGrey RFPDetail">
                        <ul class="manage">
                            <asp:Literal ID="xlitBidDetails" runat="server"></asp:Literal>
                        </ul>
                    </div>
                </div>
                <div class="newCol2 imw55p fr">
                    <div class="innerBxhead bgRed">
                        <lable id="xlblMidelHeader" runat="server">History</lable>
                    </div>
                    <asp:Literal ID="xlitSupplier" runat="server"></asp:Literal>
                </div>
                <br />
                <br />
                <div id="divBenchmarkPrice" class="newCol2 imw55p fr" runat="server" visible="false">
                    <div class="innerBxhead bgRed">
                        <lable id="xlblBenchMarkPrice" runat="server">BenchMark Price</lable>
                    </div>
                    <asp:Literal ID="xlitBenchMarkPrices" runat="server"></asp:Literal>
                </div>
                <br />
                <div class="newCol2 imw55p fr" id="divCustomerBenchMark" runat="server" visible="false">
                    <div class="innerBxhead bgRed">
                        <lable id="xlblBenchMarkPriceRM" runat="server">BenchMark Price</lable>
                        <a href="#" class="fr">
                            <img id="img2" runat="server" src="~/images/icn-quote.png" /></a>
                    </div>
                    <div class='innerBxbody brdPink RFPDetail'>
                        <table class="quotInfo">
                            <tr>
                                <td>Customer Benchmark</td>
                                <td>
                                    <input type="text" id='txtCustomerBenchmark' runat="server" autocomplete='off'
                                        onkeydown='javascript:return IsDecimal(this);' onblur='javascript:Hidefocus(this.id);' onfocus='javascript:Setfocus(this.id);' />
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
                                            <option value="QTY">QTY N/A</option>
                                            <option value="CST">customise</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="right">
                                    <button id="btnBenchmarkSubmit" type="button" runat="server" class="btnRed" onclick="javascript:InsertRfpBenchmarkPrice();">SUBMIT</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <br />
                <br />
                <div id="divDealTag" class="newCol2 imw55p fr" runat="server" visible="false">
                    <div class="innerBxhead bgRed">
                        <lable id="Lable1" runat="server">Deal Tagging</lable>
                        <a href="#" class="fr">
                            <img id="img1" runat="server" src="~/images/icn-quote.png" /></a>
                    </div>
                    <div class='innerBxbody brdPink RFPDetail Liverfp'>
                        <br class="cl" />
                        <div class="formRow">
                            <label>&nbsp Best Quote</label>
                            <div class="formRow1">
                                <asp:TextBox ID="xtxtBestQuote" runat="server" CssClass="imw80p" onkeydown="return IsDecimal(event);"></asp:TextBox>
                            </div>
                        </div>

                        <div class="formRow">
                            <label>&nbsp Supplier Name</label>
                            <div class="formRow1">
                                <div class="imw80p fl bgGrey">
                                    <div class="styled-select selOrganization">
                                        <asp:DropDownList ID="xddlSupplierName" onchange="javascript:vender_onchange(this)" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="formRow">
                            <label>&nbsp Commission (%)</label>
                            <div class="formRow1">
                                <asp:TextBox ID="xtxtCommission" runat="server" ReadOnly="true" CssClass="imw80p" onkeydown="return IsNumeric(event);"></asp:TextBox>
                            </div>
                        </div>
                        <div class="formRow">
                            <label>&nbsp Expected PO Date</label>
                            <div class="formRow1">
                                <div class="iconCal imw80p">
                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                    <asp:TextBox ID="xtxtDealDate" runat="server" CssClass="selDate icnCal "></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="formRow">
                            <div class="addCheckbx">
                                <label for="option">&nbsp Deal Tag</label>
                                <asp:CheckBox ID="xchkDealTag" runat="server" />
                            </div>
                        </div>
                        <br class="cl" />
                        <br class="cl" />
                        <div class="formRow">
                            <label></label>
                            <div class="formRow1">
                                <button type="button" id="btnDealSubmit" runat="server" class="btnRed" onclick="javascript:InsertDealTag();">SUBMIT</button>
                            </div>
                        </div>
                        <br class="cl" />
                    </div>
                </div>

                <br class="cl" />
                <div class="whiteBox immrt20" id="DivSuppBidHistory" runat="server">
                    <h2>Quote History</h2>
                    <ctrl:VendorDetails ID='xctrlVendorDet' runat='server' Caption='View' />
                    <asp:UpdatePanel ID="xupnlOthSupBidDet" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Literal ID="xlitOthSuppBid" runat="server"></asp:Literal>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
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
                    <div class="panel-group" id="chataccordionRenepay">
                        <ctrl:Feedback ID="xFBK" runat="server" Data_Parent="chataccordionRenepay" />
                    </div>
                </div>
                <!-- chat end here -->
            </div>
            <!--help panel end here-->

            <asp:HiddenField ID="xhdnSuppId" runat="server" />
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            <div class="whiteBox" id="xdivRFPList" runat="server" visible="false">
                <asp:Literal ID="xlitRFPDetails" runat="server"></asp:Literal>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

