<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_AuctionCenter_Closed, App_Web_closed.aspx.aadda0d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <link href="../Scripts/TimePicker/jquery.ui.timepicker.css?v=0.3.3" rel="stylesheet" />
    <script src="../Scripts/TimePicker/jquery.ui.timepicker.js"></script>
    <asp:UpdatePanel ID="xupnlAuction" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <script type="text/javascript">

                $(document).ready(function () {
                    SetDataTablePaging("#tblList");
                    BindDatePicker();
                });
                function BindDatePicker() {
                    $("#ContentPlaceHolder1_xtxtDealDate").datepicker({
                        dateFormat: 'dd/mm/yy'
                    });
                }

                function vender_onchange(ctrl) {
                    var val = ctrl.value.split('|');
                    $("#ContentPlaceHolder1_xtxtCommission").val(val[1]);
                }

                function AUC_click(Id) {
                    ShowProgress(true);
                    $("#ContentPlaceHolder1_xhdnRFPId").val(Id);
                    $("#ContentPlaceHolder1_xbtnView").click();
                }
                function RaisePO(Id) {
                    ShowProgress();
                    $("#ContentPlaceHolder1_xhdnSuppId").val(Id);
                    $("#ContentPlaceHolder1_xbtnPO").click();
                }
                function ViewMore(Id) {
                    //  var rfpId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'AuctionCenter/Closed.aspx/ViewMore',
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

                function RFP_click(Id) {
                    $.ajax({
                        type: 'POST',
                        url: strUrl + 'AuctionCenter/Closed.aspx/RFP_click',
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

                function OnDealChkChange() {
                    if ($('#ContentPlaceHolder1_xchkDealTag').is(':checked')) {
                        $("#ContentPlaceHolder1_divLostResion").attr('style', 'display:none;');
                        $("#ContentPlaceHolder1_divdealtagdata").attr('style', 'display:block;');
                    }
                    else if ($('#ContentPlaceHolder1_xchkLostdeal').is(':checked')) {
                        $("#ContentPlaceHolder1_divLostResion").attr('style', 'display:block;');
                        $("#ContentPlaceHolder1_divdealtagdata").attr('style', 'display:none;');
                    }
                }

                function lostreason_onchange(ctrl) {
                    var val = ctrl.value;
                    if (val == 'OTH') {
                        $("#ContentPlaceHolder1_divOtherreason").attr('style', 'display:block;');
                    }
                    else {
                        $("#ContentPlaceHolder1_divOtherreason").attr('style', 'display:none;');
                    }
                }

                function validateDealTag() {
                    var msg = "";
                    if ($('#ContentPlaceHolder1_xchkDealTag').is(':checked')) {
                        if ($("#ContentPlaceHolder1_xtxtBestQuote").val() == "0.00" || $("#ContentPlaceHolder1_xtxtBestQuote").val() == "") {
                            $("#ContentPlaceHolder1_xtxtBestQuote").focus();
                            msg = "Please enter Best Quote";
                            ShowToolTip("#ContentPlaceHolder1_xtxtBestQuote", msg, "bottom");
                            return false;
                        }
                    }
                    else if ($('#ContentPlaceHolder1_xchkLostdeal').is(':checked')) {
                        if ($("#ContentPlaceHolder1_xddlLostReason option:selected").index() <= 0) {
                            $("#ContentPlaceHolder1_xddlLostReason").focus();
                            msg = "Please select reason";
                            ShowToolTip("#ContentPlaceHolder1_xddlLostReason", msg, "bottom");
                            return false;
                        }
                        else if ($("#ContentPlaceHolder1_xddlLostReason").val() == 'OTH') {
                            if ($("#ContentPlaceHolder1_xtxtOtherreason").val() == "") {
                                $("#ContentPlaceHolder1_xtxtOtherreason").focus();
                                ShowToolTip($("#ContentPlaceHolder1_xtxtOtherreason"), "Please Enter other reason.", "bottom");
                                return false;
                            }
                        }
                    }
                    return true;
                }

                function InsertDealTag() {
                    if (validateDealTag()) {
                        var status = 0;
                        var auctionId = $("#ContentPlaceHolder1_xhdnRFPId").val();
                        var bestQuote = $("#ContentPlaceHolder1_xtxtBestQuote").val();
                        var commission = $("#ContentPlaceHolder1_xtxtCommission").val();
                        var vendorId = $("#ContentPlaceHolder1_xddlSupplierName").val();
                        var dealDate = $("#ContentPlaceHolder1_xtxtDealDate").val();
                        var lstrreason = '';
                        var lstrreasonDesp = '';
                        var dealtype = '';

                        if ($('#ContentPlaceHolder1_xchkLostdeal').is(':checked')) {
                            dealtype = 'LOST';
                            if ($("#ContentPlaceHolder1_xddlLostReason").val() == 'OTH') {
                                lstrreason = '0';
                                lstrreasonDesp = $("#ContentPlaceHolder1_xtxtOtherreason").val();
                            }
                            else {
                                lstrreason = $("#ContentPlaceHolder1_xddlLostReason").val();
                            }
                            status = 0;
                        }
                        else {
                            dealtype = 'DEAL';
                            if ($('#ContentPlaceHolder1_xchkstatus').is(':checked')) {
                                status = 1;
                            }
                            else {
                                status = 0;
                            }
                        }
                        ShowProgress();
                        $.ajax({
                            url: strUrl + 'AuctionCenter/Closed.aspx/InsertDealTag',
                            type: 'POST',
                            contentType: 'application/json;charset=utf-8',
                            dataType: 'json',
                            data: "{'AuctionId' : '" + auctionId + "','BestQuote' : '" + bestQuote + "','VendorId' : '" + vendorId + "','Commission' : '" + commission + "','Date' : '" + dealDate + "','status' : " + status + ",'lstrreason' : '" + lstrreason + "', 'lstrreasonDesp' : '" + lstrreasonDesp + "', 'dealtype' : '" + dealtype + "'}",
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

            </script>
            <style>
                .modal-dialog {
                    width: 500px;
                }

                .formRow > label {
                    margin-top: 12px;
                }

                .billInfo .btnRed {
                    padding: 10px 15px;
                }
            </style>
            <asp:Button ID="xbtnView" OnClick="xbtnView_Click" runat="server" Style="display: none;" />
            <input type="hidden" id="xhdnRFPId" runat="server" />
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
                                    onclick="HideModalBox('#divExtendCrfm'); ShowProgress();"
                                    onserverclick="lnkExtendRFP_ServerClick">CONTINUE</a>
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
                                <h4 class="modal-title" id="H1">Withdraw the Negotiation?</h4>
                            </div>
                            <div class="modal-body">
                                <p id="pRegMsg">
                                    This order will move to Draft RFP section, for you to re-issue later. Do you want to proceed?
                                </p>
                            </div>
                            <div class="modal-footer">
                                <a class="btnRed" href="#" id="lnkWithdrawAuc" runat="server"
                                    onclick="HideModalBox('#divWthdrawCrfm'); ShowProgress();"
                                    onserverclick="lnkWithdrawAuc_ServerClick">CONTINUE</a>
                            </div>
                        </div>
                    </div>
                </div>
                <br class="cl" />
            </div>
            <div id="xdivAuctionDet" runat="server" visible="false" class="Newclmn1">
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
                    <div class="innerBx ">
                        <div class="innerBxhead bgRed">
                            <asp:Literal ID="xlitAucCloses" runat="server"></asp:Literal>
                            <a href="#" class="fr">
                                <img src="../images/icn-rfp1.png" /></a>
                        </div>
                    </div>
                    <div class='innerBxbody brdGrey RFPDetail'>
                        <asp:Literal ID="xlitSupplier" runat="server"></asp:Literal>
                    </div>
                    <div id="divDealTag" class='innerBxbody brdGrey RFPDetail Liverfp' runat="server" visible="false">
                        <div class="innerBxhead bgRed">
                            <lable id="Lable1" runat="server">Deal Tagging</lable>
                            <a href="#" class="fr">
                                <img id="img2" runat="server" src="~/images/icn-quote.png" /></a>
                        </div>
                        <br class="cl" />
                        <div class="formRow">
                            <div class="addCheckbx">
                                <label for="option">&nbsp Deal Tag</label>
                                <asp:RadioButton ID="xchkDealTag" GroupName="DealTag" Checked="true" onchange="OnDealChkChange();" runat="server" />
                            </div>
                            <div class="addCheckbx">
                                <label for="option">&nbsp Lost Deal</label>
                                <asp:RadioButton ID="xchkLostdeal" GroupName="DealTag" onchange="OnDealChkChange();" runat="server" />
                            </div>
                        </div>
                        <div id="divdealtagdata" style="display: block;" runat="server">
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
                                    <label for="option">&nbsp Deal</label>
                                    <asp:CheckBox ID="xchkstatus" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div id="divLostResion" style="display: none;" runat="server">
                            <div class="formRow">
                                <label>&nbsp Lost Reason</label>
                                <div class="formRow1">
                                    <div class="imw80p fl bgGrey">
                                        <div class="styled-select selOrganization">
                                            <asp:DropDownList ID="xddlLostReason" onchange="javascript:lostreason_onchange(this)" runat="server">
                                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Above Benchmark" Value="Above Benchmark"></asp:ListItem>
                                                <asp:ListItem Text="Own Supplier" Value="Own Supplier"></asp:ListItem>
                                                <asp:ListItem Text="Not Required" Value="Not Required"></asp:ListItem>
                                                <asp:ListItem Text="Other" Value="OTH"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br class="cl" />
                                    <div id="divOtherreason" runat="server" class="moreFields" style="display: none;">
                                        <div class="fl bgGrey">
                                            <asp:TextBox ID="xtxtOtherreason" runat="server" MaxLength="50" autocomplete="off" placeholder="First Name" />
                                        </div>
                                    </div>
                                </div>
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
                <div class="whiteBox immrt20">
                    <h2>Quote History</h2>
                    <asp:UpdatePanel ID="xupnlOthSupBidDet" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Literal ID="xlitOthSuppBid" runat="server"></asp:Literal>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br class="cl" />
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
            <div id="divBtnAuction" class="immrt30 txtAligncenter" runat="server" visible="false">
                <button type="button" id="xbtnPO" style="display: none;" class="btnRed immrt20"
                    runat="server" onserverclick="xlnkbtnPO_Click">
                </button>
            </div>
            <asp:HiddenField ID="xhdnSuppId" runat="server" />
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            <div class="whiteBox" id="xdivAucList" runat="server" visible="false">
                <asp:Literal ID="xlitRFPDetails" runat="server"></asp:Literal>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

