<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="ReportCenter_RfpAuctionReport, App_Web_auctionsummaryreport.aspx.51bd485d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            BindPaging('tblList');
        });

        $(document).ready(function () {
            BindDatePicker();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            BindDatePicker();
        });
        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });

        function BindDatePicker() {

            var d = new Date();
            var y = d.getFullYear();

            $("#ContentPlaceHolder1_xtxtFromDate").datepicker({
                dateFormat: 'dd/mm/yy',
                //minDate: '01/01/' + y,
                //maxDate: '31/12/' + y,
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                dateFormat: 'dd/mm/yy',
                //minDate: '01/01/' + y,
                //maxDate: '31/12/' + y,
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtRFPFromDate").datepicker({
                dateFormat: 'dd/mm/yy',
                //minDate: '01/01/' + y,
                //maxDate: '31/12/' + y,
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtRFPToDate").datepicker({
                dateFormat: 'dd/mm/yy',
                //minDate: '01/01/' + y,
                //maxDate: '31/12/' + y,
            }).attr('readonly', 'true');

        }

        function ValidateSearch() {
            var msg = "";
            // $('#tblList').empty();
            //if ($("#ContentPlaceHolder1_xddlLoggedType option:selected").index() <= 0) {
            //    msg = "Please select search type..";
            //    ShowToolTip("#ContentPlaceHolder1_xddlLoggedType", msg, "top");
            //    return false;
            //}
            //else {
            if (($("#ContentPlaceHolder1_xtxtFromDate").val() == '') && ($("#ContentPlaceHolder1_xtxtToDate").val() == '')) {
                msg = "Please select From Date and To Date.";
                //ShowMessageBox(msg);
                ShowModalMsgBox("Error", msg);
                return false;
            }
            else {
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
            }
            //}
            if (msg.length <= 0) {
                ShowProgress(true);
                return true;
            }
            return false;
        }

        function ValidateRFPSearch() {
            var msg = "";
            if (($("#ContentPlaceHolder1_xtxtRFPFromDate").val() == '') && ($("#ContentPlaceHolder1_xtxtRFPToDate").val() == '')) {
                msg = "Please select From Date and To Date.";
                //ShowMessageBox(msg);
                ShowModalMsgBox("Error", msg);
                return false;
            }
            else {
                if ($("#ContentPlaceHolder1_xtxtRFPFromDate").val() == '') {
                    msg = "Please select From Date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtRFPFromDate", msg, "top");
                    return false;
                }
                if ($("#ContentPlaceHolder1_xtxtRFPToDate").val() == '') {
                    msg = "Please select To Date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtRFPToDate", msg, "top");
                    return false;
                }
            }
            //}
            if (msg.length <= 0) {
                ShowProgress(true);
                return true;
            }
            return false;
        }

        function DownloadReport() {
            //ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/RfpAuctionReport.aspx/DownloadFile',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det=0/" + newData);
                        }
                        else {
                            ShowModalMsgBox("Error", "Invalid file parameter");
                        }
                        HideProgress();

                    }
                    catch (e) {
                        //ShowProgress(false);
                        //ShowMessageBox(e.Message);
                        ShowModalMsgBox("Error", e.Message);
                    }
                },
                error: function (data) {
                    HideProgress();
                    ShowModalMsgBox("Error", e.Message);
                }
            });
            return true;
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#collapseOne').on('hidden.bs.collapse', function () {
                setclass($("#col1"), 'glyphicon glyphicon-plus', 'glyphicon glyphicon-minus');
            });
            $('#collapseOne').on('shown.bs.collapse', function () {
                setclass($("#col1"), 'glyphicon glyphicon-minus', 'glyphicon glyphicon-plus');
            });

            $('#collapseTwo').on('hidden.bs.collapse', function () {
                setclass("#col2", 'glyphicon glyphicon-plus', 'glyphicon glyphicon-minus');
            });
            $('#collapseTwo').on('shown.bs.collapse', function () {
                setclass("#col2", 'glyphicon glyphicon-minus', 'glyphicon glyphicon-plus');
            });
        });
        function setclass(control, addclass, removeclass) {
            $(control).addClass(addclass);
            $(control).removeClass(removeclass);
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            BindPaging('data-table');
        });

        function RFP_click(Id, EntityId) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: strUrl + 'ReportCenter/AuctionSummaryReport.aspx/ShowRFPSummary',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id': '" + Id + "','EntityId':'" + EntityId + "'}",
                cache: false,
                success: function (msg) {
                    //ShowModalReportBox("RFP Summary Details", msg.d);
                    SetDataTablePaging('#tblRFPSummary');
                    $("#ContentPlaceHolder1_divRFPSummaryData").html(msg.d);
                    HideProgress();
                },
                error: ShowError
            });
        }

        function DownloadRFPReport(Id, EntityId) {
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/AuctionSummaryReport.aspx/DownloadRFPReport',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'Id': '" + Id + "','EntityId':'" + EntityId + "'}",
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det=0/" + newData);
                        }
                        else {
                            ShowModalMsgBox("Error", "Invalid file parameter");
                        }
                        HideProgress();
                    }
                    catch (e) {
                        HideProgress();
                        ShowModalMsgBox("Error", e.Message);
                    }
                },
                error: function (data) {
                    HideProgress();
                    ShowModalMsgBox("Error", data);
                }
            });
        }

        function DownloadAUCReport(Id, EntityId) {
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/AuctionSummaryReport.aspx/DownloadAUCReport',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'Id': '" + Id + "','EntityId':'" + EntityId + "'}",
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det=0/" + newData);
                        }
                        else {
                            ShowModalMsgBox("Error", "Invalid file parameter");
                        }
                        HideProgress();
                    }
                    catch (e) {
                        HideProgress();
                        ShowModalMsgBox("Error", e.Message);
                    }
                },
                error: function (data) {
                    HideProgress();
                    ShowModalMsgBox("Error", data);
                }
            });
        }

        function Auction_click(Id, EntityId) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: strUrl + 'ReportCenter/AuctionSummaryReport.aspx/ShowAuctionSummary',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id': '" + Id + "','EntityId':'" + EntityId + "'}",
                cache: false,
                success: function (msg) {
                    //ShowModalReportBox("RFP Summary Details", msg.d);
                    SetDataTablePaging('#tblAuctionSummary');
                    $("#ContentPlaceHolder1_divAuctionSummaryData").html(msg.d);
                    HideProgress();
                },
                error: ShowError
            });
        }



    </script>

    <asp:UpdatePanel ID="xupnlReport" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <%--<div class="main supplier">
                <div class="clmn1">
                    <div id="divSearchName" runat="server">
                        <div class="row1">
                            <div class="whiteBox brdPink">
                                <div class="leftClmn">
                                  
                                     <div class="imw48p fl">
                                        <label>From Date</label>
                                        <div class="formRow1">
                                            <div class="bgGrey fl">
                                                <div class="iconCal">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                    <asp:TextBox ID="xtxtFromDate" runat="server" CssClass="selDate icnCal" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="imw48p fr">
                                        <label>To Date</label>
                                        <div class="formRow1">
                                            <div class="bgGrey fl">
                                                <div class="iconCal">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                    <asp:TextBox ID="xtxtToDate" runat="server" CssClass="selDate icnCal" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br class="cl" />
                                </div>
                                <div class="rightClmn">
                                     <div id="divSearchType" class="imw48p fl" runat="server" visible="true">
                                        <label class="fL">Search By Auction No</label>
                                        <asp:TextBox ID="xtxtRFPAuctionNo" runat="server" MaxLength="50" CssClass="selDate imw85p"></asp:TextBox>
                                       
                                    </div>
                                    <div class="imw48p fr">
                                        <label class="fL">Search By Quote Amount</label>
                                        <asp:TextBox ID="xtxtRFPAuctionName" runat="server" MaxLength="50" CssClass="selDate imw85p"></asp:TextBox>
                                    </div>
                                    <br class="cl" />
                                </div>
                                <br class="cl" />
                                <div class="immrt10">
                                    <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnRed" OnClick="btnSearch_click" OnClientClick="javascript:if(!(ValidateSearch())){return false;}">Search</asp:LinkButton>
                                    <asp:LinkButton ID="xlbtnDownload" runat="server" CssClass="btnRed" Visible="false" OnClientClick="javascript:DownloadReport();return false;">Export to Excel</asp:LinkButton>
                                </div>
                                <br class="cl" />
                                <select id="ddlName" runat="server" style="display: none;">
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row1">
                        <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>
                    </div>
                    <br class="cl">
                    <div class="whiteBox">
                        <div class="row1 immrb20">
                            <div class="table mT10">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>--%>

            <div id="divRFPSummary" class="panel panel-default" runat="server" visible="true">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                            <i id="col4" class="glyphicon glyphicon-plus"></i>RFP Summary Report</a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse">
                    <div class="panel-body">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <%-- <div id="divPayment" runat="server">
                                    <div class="clmn1 fl imw100p">
                                        <div class='innerBxbody whiteBox'>
                                            <div class="buyRegis">
                                            </div>
                                            <br class="cl">
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="main supplier">
                                    <div class="clmn1">
                                        <div id="div1" runat="server">
                                            <div class="row1">
                                                <div class="whiteBox brdPink">
                                                    <div class="leftClmn">

                                                        <div class="imw48p fl">
                                                            <label>From Date</label>
                                                            <div class="formRow1">
                                                                <div class="bgGrey fl">
                                                                    <div class="iconCal">
                                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                                        <asp:TextBox ID="xtxtRFPFromDate" runat="server" CssClass="selDate icnCal" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="imw48p fr">
                                                            <label>To Date</label>
                                                            <div class="formRow1">
                                                                <div class="bgGrey fl">
                                                                    <div class="iconCal">
                                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                                        <asp:TextBox ID="xtxtRFPToDate" runat="server" CssClass="selDate icnCal" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br class="cl" />
                                                    </div>
                                                    <div class="rightClmn">
                                                        <div id="div2" class="imw48p fl" runat="server" visible="true">
                                                            <label class="fL">Search By RFP No</label>
                                                            <asp:TextBox ID="xtxtRFPNo" runat="server" MaxLength="50" CssClass="selDate imw85p"></asp:TextBox>
                                                        </div>
                                                        <div class="imw48p fr">
                                                            <label class="fL">Search By RFP Name</label>
                                                            <asp:TextBox ID="xtxtRFPName" runat="server" MaxLength="50" CssClass="selDate imw85p"></asp:TextBox>
                                                        </div>
                                                        <br class="cl" />
                                                    </div>
                                                    <br class="cl" />
                                                    <div class="immrt10">
                                                        <asp:LinkButton ID="xlbtnRFPSearch" runat="server" CssClass="btnRed" OnClick="btnRFPSearch_click" OnClientClick="javascript:if(!(ValidateRFPSearch())){return false;}">Search</asp:LinkButton>
                                                        <asp:LinkButton ID="xlbtnRFPDownload" runat="server" CssClass="btnRed" Visible="false" OnClientClick="javascript:DownloadReport();return false;">Export to Excel</asp:LinkButton>
                                                    </div>
                                                    <br class="cl" />
                                                    <select id="Select1" runat="server" style="display: none;">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row1">
                                            <asp:Literal ID="xlitRFPMsg" runat="server"></asp:Literal>
                                        </div>
                                        <br class="cl">
                                        <div class="whiteBox">
                                            <div class="row1 immrb20">
                                                <div class="table mT10">
                                                    <table border="0" cellspacing="0" cellpadding="0">
                                                        <asp:Literal ID="xlitRFPList" runat="server"></asp:Literal>
                                                    </table>
                                                    <div id="divRFPSummaryData" runat="server">
                                                        <asp:Literal ID="xlitRFPSummary" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>

            <div id="divAuctionSummary" class="panel panel-default" runat="server" visible="true">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                            <i id="I1" class="glyphicon glyphicon-plus"></i>Auction Summary Report</a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <%-- <div id="div3" runat="server">
                                    <div class="clmn1 fl imw100p">
                                        <div class='innerBxbody whiteBox'>
                                            <div class="buyRegis">
                                            </div>
                                            <br class="cl">
                                        </div>
                                    </div>
                                </div>--%>

                                <div class="main supplier">
                                    <div class="clmn1">
                                        <div id="divSearchName" runat="server">
                                            <div class="row1">
                                                <div class="whiteBox brdPink">
                                                    <div class="leftClmn">

                                                        <div class="imw48p fl">
                                                            <label>From Date</label>
                                                            <div class="formRow1">
                                                                <div class="bgGrey fl">
                                                                    <div class="iconCal">
                                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                                        <asp:TextBox ID="xtxtFromDate" runat="server" CssClass="selDate icnCal" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="imw48p fr">
                                                            <label>To Date</label>
                                                            <div class="formRow1">
                                                                <div class="bgGrey fl">
                                                                    <div class="iconCal">
                                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                                        <asp:TextBox ID="xtxtToDate" runat="server" CssClass="selDate icnCal" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br class="cl" />
                                                    </div>
                                                    <div class="rightClmn">
                                                        <div id="divSearchType" class="imw48p fl" runat="server" visible="true">
                                                            <label class="fL">Search By Auction No</label>
                                                            <asp:TextBox ID="xtxtRFPAuctionNo" runat="server" MaxLength="50" CssClass="selDate imw85p"></asp:TextBox>

                                                        </div>
                                                        <div class="imw48p fr">
                                                            <label class="fL">Search By Quote Amount</label>
                                                            <asp:TextBox ID="xtxtRFPAuctionName" runat="server" MaxLength="50" CssClass="selDate imw85p"></asp:TextBox>
                                                        </div>
                                                        <br class="cl" />
                                                    </div>
                                                    <br class="cl" />
                                                    <div class="immrt10">
                                                        <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnRed" OnClick="btnSearch_click" OnClientClick="javascript:if(!(ValidateSearch())){return false;}">Search</asp:LinkButton>
                                                        <asp:LinkButton ID="xlbtnDownload" runat="server" CssClass="btnRed" Visible="false" OnClientClick="javascript:DownloadReport();return false;">Export to Excel</asp:LinkButton>
                                                    </div>
                                                    <br class="cl" />
                                                    <select id="ddlName" runat="server" style="display: none;">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row1">
                                            <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>
                                        </div>
                                        <br class="cl">
                                        <div class="whiteBox">
                                            <div class="row1 immrb20">
                                                <div class="table mT10">
                                                    <table border="0" cellspacing="0" cellpadding="0">
                                                        <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                                                    </table>
                                                    <div id="divAuctionSummaryData" runat="server">
                                                        <asp:Literal ID="xlitAuctionSummary" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
