<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="ReportCenter_Supplier_SupplierSalesSummary, App_Web_suppliersalessummary.aspx.18aeed28" %>

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
    <script src="../../Scripts/ReportCenter/sales.supplier-1.0.js"></script>

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
        border-color: transparent transparent transparent #ececec; 
        right:-16px;    
        left:auto;                
        }

        .bar-chart-wrapper .bar-legend .legend-item-wrapper
        {
            width: 50%;
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
        }

        #accordion h5
        {
            font-size: 15px;
        }

        .panel-title
        {
            font-size: 18px; /*color:#fff;*/
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
                <%--<asp:Literal ID="xlitCap" runat="server" Text="View Your Spend History"></asp:Literal>--%>
                <asp:Literal ID="xlitCap" runat="server" Text="Reporting"></asp:Literal>
            </div>
            <ul class="rightBtn">
                <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk" Visible="false" OnClick="xlbtnback_Click" OnClientClick="javascript:ShowProgress(true);">CLOSE</asp:LinkButton>
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
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default" id="divYourSalesActivity" > 
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <%--<i id="licollapse1" class="glyphicon glyphicon-minus"></i>--%>
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"><i id="licollapse1" class="glyphicon glyphicon-plus"></i>&nbsp;Your sales activity</a>
                                </h4>
                                <div class="toolTip">
		                            <a tabindex="-1" href="#">?
			                        <div class="toolTipCont">Total sales by month,category, and top suppliers</div>
		                            </a>
                                </div>
                            </div>
                            <%--<div id="collapse1" class="panel-collapse collapse in">--%>
                            <div id="collapse1" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class='panel-body'>
                                        <div id='morris-bar-chart'></div>
                                    </div>
                                    <br class="cl" />
                                    <div class="leftClmn">
                                        <%--<h5>Sales by Month by Category</h5>--%>
                                        <h5>By month by category</h5>
                                        <div class='panel-body'>
                                            <div id="divChart">
                                                <div id="chart"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="rightClmn">
                                        <%--<h5>Sales Opportunity</h5>--%>
                                        <%--<h5>By client</h5>--%>
                                        <h5>Top Clients</h5>
                                        <div id="divTopClient" class="imw100p">
                                        </div>
                                        <br class="cl" />
                                        <div id="pie"></div>
                                        <div class="pieDetail">
                                            <h4>Sales Opportunity</h4>
                                            <label id="lblOpertunity"></label>
                                        </div>
                                    </div>
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

                        <div class="panel panel-default" id="divTrackYourOrder" > 
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2"><i id="licollapse2" class="glyphicon glyphicon-plus"></i>&nbsp;Track your orders</a>
                                </h4>
                                <div class="toolTip">
		                            <a tabindex="-1" href="#">?
			                        <div class="toolTipCont">Summary of all activities RFPs,POs,Invoices,Payments</div>
		                            </a>
                                </div>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse">
                                <div class="panel-body" id="divDet">
                                    <div id="divActivityData" class='table'></div>
                                    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                                </div>
                                <div class="innBox downloadBx">
                                    <p class="immr15 txtLine " >To download in Excel format, enter your date range,</p>
                                    <div class="imw20p fl immr15">
                                            <input type="text" id="txtFromDate_2" class="selDate imw85p icnCal "
                                                maxlength="10" autocomplete="off" ondrop="return false;" placeholder="DD/MM/YYYY"
                                                onpaste="return false;" />
                                        </div>
                                        <p class="immr15 txtTo">To</p>
                                        <div class="imw20p fl immr15">
                                            <input type="text" id="txtToDate_2" class="selDate imw85p icnCal "
                                                maxlength="10" autocomplete="off" ondrop="return false;" placeholder="DD/MM/YYYY"
                                                onpaste="return false;" />
                                        </div>
                                        <div class="immrt10 fl">
                                            <button id="Button1" type="button" value="Download"
                                                class="btnBrdr" onclick="javascript:DownloadHistory(2);return false;">
                                                Download Data</button>
                                        </div>                                    
                                    <%--<h2>Download Previous History</h2>
                                        <br class="cl" />--%>
                                   
                                    <br class="cl" />
                                </div>                                
                            </div>
                        </div>

                        <div class="panel panel-default" id="divYourPricing" > 
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <%--<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Your pricing – A sample to show how competitive you are:</a>--%>
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3"><i id="licollapse3" class="glyphicon glyphicon-plus"></i>&nbsp;Your pricing</a>
                                </h4>
                                <div class="toolTip">
		                            <a tabindex="-1" href="#">?
			                        <div class="toolTipCont">Your prices vs your competitors-across random sample of RFPs</div>
		                            </a>
                                </div>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div id='morris-bar-chart-price'></div>
                                    <div class="txtCenter">
                                        <img id="imgLegend" src="../../images/chart-rate.jpg" style="display:none;" />
                                    </div>
                                    <br class="cl" />
                                    <table style="width: 100%; display: none;">
                                        <tr>
                                            <td colspan="3">Download Previous History</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 33%;">
                                                <div class="imw100p fl">
                                                    <input type="text" id="txtFromDate_3" class="selDate imw85p" placeholder="From Date"
                                                        maxlength="10" autocomplete="off" ondrop="return false;"
                                                        onpaste="return false;" />
                                                </div>
                                            </td>
                                            <td style="width: 33%;">
                                                <div class="imw100p fl">
                                                    <input type="text" id="txtToDate_3" class="selDate imw85p" placeholder="To Date"
                                                        maxlength="10" autocomplete="off" ondrop="return false;"
                                                        onpaste="return false;" />
                                                </div>
                                            </td>
                                            <td style="width: 33%; text-align: right;">
                                                <div class="imw100p fl">
                                                    <button id="lbtnDwnldActivityRpt" type="button" value="Download"
                                                        class="btnBlk immrt30" onclick="javascript:DownloadHistory(3)">
                                                        Download Data</button>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default" id="divBuildYourReport" > 
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse4"><i id="licollapse4" class="glyphicon glyphicon-plus"></i>&nbsp;Build your reports</a>
                                </h4>
                                <div class="toolTip">
		                            <a tabindex="-1" href="#">?
			                        <div class="toolTipCont">Choose your own fields to generate report</div>
		                            </a>
                                </div>
                            </div>
                            <div id="collapse4" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div id="DivSearch" class="supplier reports" runat="server">
                                        <%--<h5>Build your reports</h5>--%>
                                        <div class="leftClmn">
                                            <ul>
                                                <li>
                                                    <input type="checkbox" value="RFP No" id="xchkRFPv" class="fL chkBx" checked="checked" required="required" disabled="disabled" /><label for="xchkRFPv">RFP no</label></li>
                                                <li>
                                                    <input type="checkbox" value="RFP Close Date" id="xchkEndDatev" class="fL chkBx" /><label for="xchkEndDatev">RFP close date</label></li>
                                                <li>
                                                    <input type="checkbox" value="Product Description" id="xcheckProductv" class="fL chkBx" /><label for="xcheckProductv">Product description</label></li>
                                                <li>
                                                    <input type="checkbox" value="Qty" id="xchkQtyv" class="fL chkBx" /><label for="xchkQtyv">Quantity</label></li>
                                                <li>
                                                    <input type="checkbox" value="Category" id="xchkCategoryv" class="fL chkBx" /><label for="xchkCategoryv">Category</label></li>
                                                <li>
                                                    <input type="checkbox" value="State" id="xchkSatev" class="fL chkBx" /><label for="xchkSatev">State</label></li>
                                                <li>
                                                    <input type="checkbox" value="YourQuote" id="xchkYourQuote" class="fL chkBx" /><label for="xchkYourQuote">Your quote</label></li>
                                                <li>
                                                    <input type="checkbox" value="RFP Status" id="xchkRFPStatusv" class="fL chkBx" /><label for="xchkRFPStatusv">RFP status</label></li>
                                            </ul>
                                        </div>
                                        <div class="rightClmn">
                                            <ul>
                                                <li>
                                                    <input type="checkbox" value="Highest Quote" id="xchkHighQuotev" class="fL chkBx" /><label for="xchkHighQuotev">Highest quote received</label></li>
                                                <li>
                                                    <input type="checkbox" value="Lowest Quote" id="xChkLowestQuotev" class="fL chkBx" /><label for="xChkLowestQuotev">Lowest quote received</label></li>
                                                <li>
                                                    <input type="checkbox" value="PO Date" id="xchkPODatev" class="fL chkBx" /><label for="xchkPODatev">PO date</label></li>
                                                <li>
                                                    <input type="checkbox" value="PO No" id="xchkPOIdv" class="fL chkBx" /><label for="xchkPOIdv">PO no</label></li>
                                                <li>
                                                    <input type="checkbox" value="PO Amt" id="xchkPOAmtv" class="fL chkBx" /><label for="xchkPOAmtv">PO amount</label></li>
                                                <li>
                                                    <input type="checkbox" value="Invoice No" id="xchkInvoiceNov" class="fL chkBx" /><label for="xchkInvoiceNov">Invoice no</label></li>
                                                <li>
                                                    <input type="checkbox" value="Invoice Amt" id="xchkInvoiceAmtv" class="fL chkBx" /><label for="xchkInvoiceAmtv">Invoice amount</label></li>
                                                <li>
                                                    <input type="checkbox" value="Payment Mode" id="xchkkPayTypev" class="fL chkBx" /><label for="xchkkPayTypev">Payment type</label></li>
                                                <li>
                                                    <input type="checkbox" value="Payment Date" id="xchkPayDatev" class="fL chkBx" /><label for="xchkPayDatev">Payment date</label></li>
                                            </ul>
                                        </div>
                                        <button id="btnBuildYourRpt" type="button" value="Download" class="btnBlk immrt30"
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
                                                class="btnBrdr" onclick="javascript:DownloadBuildYourReport(1)">
                                                Download Data</button>
                                        </div>

                                    
                                    <%--<h2>Download Previous History</h2>
                                        <br class="cl" />--%>
                                   
                                    <br class="cl" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
            </div>
        </div>
    <%--</div>--%>
    <script>
        function HideAll() {
            $("#collapse1").collapse('hide');
            $("#collapse2").collapse('hide');
            $("#collapse3").collapse('hide');
            $("#collapse4").collapse('hide');
        }

        $("#collapse1").on('show.bs.collapse', function () {
            GetGraphs();
            setclass($("#licollapse1"), 'glyphicon-minus', 'glyphicon-plus');            
        });
        $("#collapse1").on('hidden.bs.collapse', function () {
            setclass($("#licollapse1"), 'glyphicon-plus', 'glyphicon-minus');            
        });

        $("#collapse2").on('show.bs.collapse', function () {
            GetActivityRpt();
            setclass($("#licollapse2"), 'glyphicon-minus', 'glyphicon-plus');            
        });
        $("#collapse2").on('hidden.bs.collapse', function () {
            setclass($("#licollapse2"), 'glyphicon-plus', 'glyphicon-minus');            
        });

        $("#collapse3").on('show.bs.collapse', function () {
            GetGraphByYourBid();
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
    <br />
    <br />
</asp:Content>
