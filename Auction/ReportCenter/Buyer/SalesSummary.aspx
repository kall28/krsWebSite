<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="ReportCenter_Buyer_SalesSummary, App_Web_salessummary.aspx.75aa18d1" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <%--Start link for [sales month by month]--%>
    <link href="../../Styles/morris.css" rel="stylesheet" />
    <script src="../../Scripts/morris.min.js"></script>
    <script src="../../Scripts/raphael-min.js"></script>
    <%------------------------ End ---------------------%>

    <%--Start link for [sales by month by category]--%>

    <link href="../../Styles/barchart.css" rel="stylesheet" />
    <%--<script src="../../Scripts/jquery-2.2.0.min.js" type="text/javascript"></script>--%>
    <script src="../../Scripts/barchart.jquery.js" type="text/javascript"></script>
    <script src="../../Scripts/json2.js" type="text/javascript"></script>
    <%------------------------ End ---------------------%>

    <%--Start link for [Top Clients Pie Chart]--%>
    <script src="../../Scripts/PieChart/d3.min.js" type="text/javascript"></script>
    <script src="../../Scripts/PieChart/d3pie.js" type="text/javascript"></script>
    <%--<script src="../../Scripts/PieChart/jquery.js" type="text/javascript"></script>--%>
    <%------------------------ End ---------------------%>
    <script src="../../Scripts/ReportCenter/sales.buyer-1.0.js"></script>
    <style>
       .toolTipCont {
        background: #ececec none repeat scroll 0 0;
        border-radius: 5px;
        color: #666;
        display: none;
        font-size: 15px;
        line-height: 16px;    
        padding: 6px 8px;
        position: absolute;    
        right: 37px;           
        text-align: left;
        top: -1px; 
        left:auto;     
        width:auto;     
       }
      
       .toolTip {
        float: right;
        right: 0;
        top: -30px;
        }

       .toolTipCont::before {
        border-color: transparent transparent transparent #ececec; right:-16px;                
        left:auto;        
        }
       

        .glyphicon-minus, .glyphicon-plus
        {
            color: #333;
        }

        .panel-default > .panel-heading
        {
            border-color: #fff;
            color: #e4a823;
            border-radius: 0;
            background: #fff; /* Old browsers */
            position:relative;
        }

        #accordion h5
        {
            font-size: 15px;
        }

        .panel-title
        {
            font-size: 18px;
            /*color: #fff;*/
        }

        table.pinkTable
        {
            border-collapse: collapse;
            width: 100%;
            font-size: 14px;
            box-shadow: 0px 0px 3px #999;
        }

            table.pinkTable td
            {
                color: #373737;
                padding: 9px 6px;
                border-bottom: 1px solid #fff;
                background: #fbefef;
                position: static;
            }

            table.pinkTable th
            {
                padding: 12px 6px;
                text-align: left;
                font-size: 14px;
                background: #fcecca!important;
            }
    </style>

    <%--<div class="main supplier">--%>
        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="Reporting"></asp:Literal>
            </div>
            <ul class="rightBtn">
                <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk fR" Visible="false" OnClick="xlbtnback_Click">Close</asp:LinkButton>
            </ul>
            <br class="cl" />
        </div>
        <div class="clmn1 imw100p fl">
            <div class="row1 imw100p">
                <div class="whiteBox brdPink imw95p" style="display:block;">
                    <div class="buyRegis imw100p">
                        <div class="formRow imw100p">
                            <div class="formRow1 imw100p" >
                                Select the dates to customize your view
                            </div>
                        </div>
                        <div class="formRow imw100p">
                            <div class="formRow1 imw80p" >
                                <input type="text" id="xtxtFromDate" class="selDate imw45p icnCal" runat="server"
                                maxlength="10" autocomplete="off" ondrop="return false;" placeholder="From Date"
                                onpaste="return false;" />

                                <label style="width:5%; clear:right;">To</label>

                                <input type="text" id="xtxtToDate" class="selDate imw45p icnCal" runat="server"
                                maxlength="10" autocomplete="off" ondrop="return false;" placeholder="To Date"
                                onpaste="return false;" />
                                
                            </div>
                            <div class="formRow1 imw20p immrt10" >
                                <button type="button" id="btnSearch" class="btnBrdr imw62p " onclick="return HideAll();">Search</button>
                            </div>
                        </div>
                        <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>
                        <br class="cl" />
                    </div>
                </div>
            </div>
            <br class="cl" />
            <div>
                <div class="row1 immrb20">
                    <%--<div class="container">--%>
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default" id="divYourSpending" > 
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" >
                                        <i id="licollapse1" class="glyphicon glyphicon-plus"></i>&nbsp;Your Spending
                                    </a>
                                    <%--<i id="licollapse1" class="indicator glyphicon glyphicon-chevron-down  pull-right"></i>--%>
                                </h4>
                                <div class="toolTip">
		                            <a tabindex="-1" href="#">?
			                        <div class="toolTipCont">Total sales by month,category, and top suppliers</div>
		                            </a>
                                </div>
                            </div>
                            <%--<div id="collapse1" class="panel-collapse collapse in">--%>
                            <div id="collapse1" class="panel-collapse collapse" >
                                <div class="panel-body">
                                    <h5 >By month</h5>
                                    <div class='panel-body'>
                                        <div id="divChart">
                                            <div id="chart"></div>
                                        </div>
                                    </div>
                                    <%--<div class='panel-body'>
                                            <div id='morris-bar-chart'></div>
                                        </div>--%>
                                    <br class="cl" />
                                    <div class="leftClmn">
                                        <h5>By Category</h5>
                                        <div id="pie"></div>
                                    </div>
                                    <div class="rightClmn">
                                        <h5>By Supplier</h5>
                                        <div id="divTopSuppliersData" class='table'></div>
                                    </div>
                                    <%--<br class="cl" />
                                    <h5>By month by category</h5>
                                    <div class='panel-body'>
                                        <div>
                                            <div id="chart"></div>
                                        </div>
                                    </div>--%>
                                </div>
                                <div class="innBox downloadBx">
                                    <p class="immr15 txtLine " >To download in Excel format, enter your date range,</p>
                                    <div class="imw20p fl immr15">
                                            <input type="text" id="txtFromDate_1" class="selDate imw85p icnCal "
                                                maxlength="10" autocomplete="off" ondrop="return false;" placeholder="DD/MM/YYYY"
                                                onpaste="return false;" />
                                        </div>
                                        <p class="immr15 txtTo">To</p>
                                        <div class="imw20p fl immr15">
                                            <input type="text" id="txtToDate_1" class="selDate imw85p icnCal "
                                                maxlength="10" autocomplete="off" ondrop="return false;" placeholder="DD/MM/YYYY"
                                                onpaste="return false;" />
                                        </div>
                                        <div class="immrt10 fl">
                                            <button id="btnDownload" type="button" value="Download"
                                                class="btnBrdr" onclick="javascript:DownloadHistory(1);return false;">
                                                Download Data</button>
                                        </div>                                    
                                    <%--<h2>Download Previous History</h2>
                                        <br class="cl" />--%>                                   
                                    <br class="cl" />
                                </div>
                            </div>
                        </div>

                        <%--<div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <i id="licollapse2" class="glyphicon glyphicon-plus"></i>
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Top suppliers</a>
                                    
                                </h4>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div id="divTopSuppliersData" class='table'></div>
                                    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                                </div>
                                <div class="innBox">
                                        <div class="leftClmn">
                                            <div class="imw48p fl">
                                                    <label>From Date</label>
                                                    <input type="text" id="txtFromDate_2" class="selDate imw85p icnCal "
                                                        maxlength="10" autocomplete="off" ondrop="return false;"
                                                        onpaste="return false;" />
                                                </div>
                                            <div class="imw48p fr">
                                                    <label>To Date</label>
                                                    <input type="text" id="txtToDate_2" class="selDate imw85p icnCal "
                                                        maxlength="10" autocomplete="off" ondrop="return false;"
                                                        onpaste="return false;" />
                                                </div>
                                        </div>
                                        <div class="rightClmn">
                                            <div class="immrt0">
                                            <button id="xlbtnDwnldTopSuppliers" type="button" value="Download"
                                                        class="btnBrdr" onclick="javascript:DownloadHistory(2);return false;">
                                                        Download Data</button>
                                                </div>
                                        </div>
                                        <br class="cl" />
                                    </div>
                            </div>
                        </div>--%>

                        <div class="panel panel-default" id="divTrackYourActivities" > 
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3"><i id="licollapse3" class="glyphicon glyphicon-plus"></i>&nbsp;Track your recent activity</a>
                                    <%--<i id="licollapse3" class="indicator glyphicon glyphicon-chevron-up  pull-right"></i>--%>
                                </h4>
                                <div class="toolTip">
		                            <a tabindex="-1" href="#">?
			                        <div class="toolTipCont">Summary of all activities RFPs,POs,Invoices,Payments</div>
		                            </a>
                                </div>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div id="divActivityData" class='table'></div>
                                    <br class="cl" />
                                    <asp:Literal ID="xlitScript2" runat="server"></asp:Literal>
                                </div>
                                <div class="innBox downloadBx">
                                    <p class="immr15 txtLine " >To download in Excel format, enter your date range,</p>
                                    <div class="imw20p fl immr15">
                                            <input type="text" id="txtFromDate_3" class="selDate imw85p icnCal "
                                                maxlength="10" autocomplete="off" ondrop="return false;" placeholder="DD/MM/YYYY"
                                                onpaste="return false;" />
                                        </div>
                                        <p class="immr15 txtTo">To</p>
                                        <div class="imw20p fl immr15">
                                            <input type="text" id="txtToDate_3" class="selDate imw85p icnCal "
                                                maxlength="10" autocomplete="off" ondrop="return false;" placeholder="DD/MM/YYYY"
                                                onpaste="return false;" />
                                        </div>
                                        <div class="immrt10 fl">
                                            <button id="lbtnDwnldActivityRpt" type="button" value="Download"
                                                class="btnBrdr" onclick="javascript:DownloadHistory(3); return false;">
                                                Download Data</button>
                                        </div>                                    
                                    <%--<h2>Download Previous History</h2>
                                        <br class="cl" />--%>                                   
                                    <br class="cl" />
                                </div>                                
                            </div>
                        </div>

                        <div class="panel panel-default" id="divBuildYourReport"> 
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse4"><i id="licollapse4" class="glyphicon glyphicon-plus"></i>&nbsp;Build your reports</a>
                                    <%--<i id="licollapse4" class="indicator glyphicon glyphicon-chevron-up  pull-right"></i>--%>                                    
                                </h4>
                                <div class="toolTip">
		                            <a tabindex="-1" href="#">?
			                        <div class="toolTipCont">Choose your own fields to generate report</div>
		                            </a>
                                </div>
                            </div>
                            <div id="collapse4" class="panel-collapse collapse">
                                <div class="panel-body reports">
                                    <%--Please wait...--%>
                                    <div id="DivSearch" runat="server">
                                        <div class="leftClmn">
                                            <ul>
                                                <li>
                                                    <input type="checkbox" value="RFP No" id="xchkRFP" class="fL chkBx" checked="checked" required="required" disabled="disabled" /><label for="xchkRFP">RFP no</label></li>
                                                <li>
                                                    <input type="checkbox" value="RFP Start Date" id="xchkStartDate" class="fL chkBx" /><label for="xchkStartDate">RFP start date</label></li>
                                                <li>
                                                    <input type="checkbox" value="RFP Close Date" id="xchkEndDate" class="fL chkBx" /><label for="xchkEndDate">RFP close date</label></li>
                                                <li>
                                                    <input type="checkbox" value="Product Description" id="xcheckProduct" class="fL chkBx" /><label for="xcheckProduct">Product description</label></li>
                                                <li>
                                                    <input type="checkbox" value="Qty" id="xchkQty" class="fL chkBx" /><label for="xchkQty">Quantity</label></li>
                                                <li>
                                                    <input type="checkbox" value="Category" id="xchkCategory" class="fL chkBx" /><label for="xchkCategory">Category</label></li>
                                                <li>
                                                    <input type="checkbox" value="RFP Status" id="xchkRFPStatus" class="fL chkBx" /><label for="xchkRFPStatus">RFP status - Awarded/Withdrawn/Negotiation</label></li>
                                                <li>
                                                    <input type="checkbox" value="Highest Quote" id="xchkHighQuote" class="fL chkBx" /><label for="xchkHighQuote">Highest quote received - RFP</label></li>
                                                <li>
                                                    <input type="checkbox" value="Highest Quote Supplier Name" id="xchkHighestQuoteSupplier" class="fL chkBx" /><label for="xchkHighestQuoteSupplier">Highest Quote Supplier Name</label></li>
                                                <li>
                                                    <input type="checkbox" value="Lowest Quote" id="xChkLowestQuote" class="fL chkBx" /><label for="xChkLowestQuote">Lowest quote received - RFP/Negotiation</label></li>
                                                <li>
                                                    <input type="checkbox" value="Lowest Quote Supplier Name" id="xchkLowestQuoteSupplier" class="fL chkBx" /><label for="xchkLowestQuoteSupplier">Lowest Quote Supplier Name</label></li>
                                                <li>
                                                    <input type="checkbox" value="Negotiation Start Date" id="xchkNegStartDate" class="fL chkBx" /><label for="xchkNegStartDate">Negotiation Start Date</label></li>
                                                <li>
                                                    <input type="checkbox" value="Negotiation Close Date" id="xchkNegCloseDate" class="fL chkBx" /><label for="xchkNegCloseDate">Negotiation Start Date</label></li>
                                            </ul>
                                        </div>
                                        <div class="rightClmn">
                                            <ul>
                                                <li>
                                                    <input type="checkbox" value="Highest Bid" id="xchkHighestBid" class="fL chkBx" /><label for="xchkHighestBid">Highest Bid</label></li>
                                                <li>
                                                    <input type="checkbox" value="Highest Bid Supplier Name" id="xchkHighestBidSup" class="fL chkBx" /><label for="xchkHighestBidSup">Highest Bid Supplier Name</label></li>
                                                <li>
                                                    <input type="checkbox" value="Lowest Bid" id="xchkLowestBid" class="fL chkBx" /><label for="xchkLowestBid">Lowest Bid</label></li>
                                                <li>
                                                    <input type="checkbox" value="Lowest Bid Supplier Name" id="xchkLowestBidSup" class="fL chkBx" /><label for="xchkLowestBidSup">Lowest Bid Supplier Name</label></li>
                                                <li>
                                                    <input type="checkbox" value="Winning Supplier" id="xchkWinningSupp" class="fL chkBx" /><label for="xchkWinningSupp">Winning supplier name</label></li>
                                                <li>
                                                    <input type="checkbox" value="PO Date" id="xchkPODate" class="fL chkBx" /><label for="xchkPODate">PO date</label></li>
                                                <li>
                                                    <input type="checkbox" value="PO No" id="xchkPOId" class="fL chkBx" /><label for="xchkPOId">PO number</label></li>
                                                <li>
                                                    <input type="checkbox" value="PO Amt" id="xchkPOAmt" class="fL chkBx" /><label for="xchkPOAmt">PO amount</label></li>
                                                <li>
                                                    <input type="checkbox" value="Invoice No" id="xchkInvoiceNo" class="fL chkBx" /><label for="xchkInvoiceNo">Invoice number</label></li>
                                                <li>
                                                    <input type="checkbox" value="Invoice Date" id="xchkInvoiceDate" class="fL chkBx" /><label for="xchkInvoiceDate">Invoice Date</label></li>
                                                <li>
                                                    <input type="checkbox" value="Invoice Amt" id="xchkInvoiceAmt" class="fL chkBx" /><label for="xchkInvoiceAmt">Invoice amount</label></li>
                                                <li>
                                                    <input type="checkbox" value="Payment Type" id="xchkkPayType" class="fL chkBx" /><label for="xchkkPayType">Payment by card/NEFT/other</label></li>
                                                <li>
                                                    <input type="checkbox" value="Payment Date" id="xchkPayDate" class="fL chkBx" /><label for="xchkPayDate">Payment date</label></li>
                                            </ul>
                                        </div>
                                        <button id="btnBuildYourRpt" type="button" value="Download" class="btnBlk immrt0"
                                            onclick="javascript:DownloadBuildYourReport(0); return false;" style="display: none">
                                            Download Data</button>
                                    </div>

                                </div>
                                <div class="innBox downloadBx">
                                    <p class="immr15 txtLine " >To download in Excel format, enter your date range,</p>
                                    <div class="imw20p fl immr15">
                                            <input type="text" id="txtFromDate_4" class="selDate imw85p icnCal "
                                                maxlength="10" autocomplete="off" ondrop="return false;" placeholder="DD/MM/YYYY"
                                                onpaste="return false;" />
                                        </div>
                                        <p class="immr15 txtTo">To</p>
                                        <div class="imw20p fl immr15">
                                            <input type="text" id="txtToDate_4" class="selDate imw85p icnCal "
                                                maxlength="10" autocomplete="off" ondrop="return false;" placeholder="DD/MM/YYYY"
                                                onpaste="return false;" />
                                        </div>
                                        <div class="immrt10 fl">
                                            <button id="lbtnDwnldBuildYourRpt" type="button" value="Download"
                                                class="btnBrdr" onclick="javascript:DownloadBuildYourReport(1);return false;">
                                                Download Data</button>
                                        </div>                                    
                                    <%--<h2>Download Previous History</h2>
                                        <br class="cl" />--%>                                   
                                    <br class="cl" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--</div>--%>
                </div>
            </div>
            <br />
            <br />
        </div>
        <script>           
            function HideAll() {
                $('#collapse1').collapse('hide');
                $('#collapse3').collapse('hide');
                $('#collapse4').collapse('hide');
                $('#collapse1').collapse('show');
            }

            $("#collapse1").on('show.bs.collapse', function () {


                //GetGraphByMonth();
                GetGraphByMonthByCategory();
                GetGraphBySpendByCategory();
                GetTopSuppliers();
                setclass($("#licollapse1"), 'glyphicon-minus', 'glyphicon-plus');
            });

            $("#collapse1").on('hidden.bs.collapse', function () {
                setclass($("#licollapse1"), 'glyphicon-plus', 'glyphicon-minus');                
            });

            //$("#collapse2").on('show.bs.collapse', function () {
            //    //GetTopSuppliers();
            //    //setclass($("#licollapse2"), 'glyphicon-minus', 'glyphicon-plus');
            //});

            //$("#collapse2").on('hidden.bs.collapse', function () {
            //    setclass($("#licollapse2"), 'glyphicon-plus', 'glyphicon-minus');
            //});

            $("#collapse3").on('show.bs.collapse', function () {
                GetActivityRpt();
                setclass($("#licollapse3"), 'glyphicon-minus', 'glyphicon-plus');                
            });

            $("#collapse3").on('hidden.bs.collapse', function () {
                setclass($("#licollapse3"), 'glyphicon-plus', 'glyphicon-minus');                
            });

            $("#collapse4").on('show.bs.collapse', function () {
                setclass($("#licollapse4"), 'glyphicon-minus', 'glyphicon-plus');
            });

            $("#collapse4").on('hidden.bs.collapse', function () {
                setclass($("#licollapse4"), 'glyphicon-plus', 'glyphicon-minus');
            });

            function setclass(control, addclass, removeclass) {
                $(control).addClass(addclass);
                $(control).removeClass(removeclass);
            }
        </script>
    <%--</div>--%>

</asp:Content>

