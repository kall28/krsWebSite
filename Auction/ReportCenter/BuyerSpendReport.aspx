<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="ReportCenter_BuyerSpendReport, App_Web_buyerspendreport.aspx.51bd485d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <script type="text/javascript">

        $(document).ready(function () {
            BindDatePicker();
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
           
        }

        function ValidateSearch() {
            var msg = "";            
            if (($("#ContentPlaceHolder1_xtxtFromDate").val() == '') && ($("#ContentPlaceHolder1_xtxtToDate").val() == '')) {
                msg = "Please select From Date and To Date.";
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
            if (!$('div#ContentPlaceHolder1_DivSearch input[type=checkbox]').is(":checked")) {
                msg = "Please  select RFP No.";                                
                ShowModalMsgBox("Error", msg);
                return false;

            }
            if (msg.length <= 0) {                
                DownloadCustomerReport();
                return true;
            }
            return false;
        }

        function getCheckedCustomerParam() {
            var selected = [];
            $('div#ContentPlaceHolder1_DivSearch input[type=checkbox]').each(function () {
                if ($(this).is(":checked")) {
                    selected.push($(this).attr('value'));
                }
            });
            return selected;
        }

        function DownloadCustomerReport() {
            var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
            var todate = $("#ContentPlaceHolder1_xtxtToDate").val();
            var select = [];
            select = getCheckedCustomerParam();            
            var dataToPass = { arr: select };
            var jsonTxt = JSON.stringify(dataToPass);
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/BuyerSpendReport.aspx/DownloadCustomerFile',
                type: 'POST',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                //data: jsonTxt,
                data: "{ 'arr' : '" + select + "','fromDate' : '" + fromdate + "','todate' : '" + todate + "'}",
                cache: false,
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det=0/" + newData);
                        }
                        else {
                            ShowMessageBox("Invalid file parameter");
                        }
                        HideProgress(true);

                    }
                    catch (e) {
                        HideProgress(true);
                        ShowModalMsgBox("Error", e.message);

                    }
                },
                error: function (data) {
                    ShowModalMsgBox("Error", data);
                }
            });
            return true;
        }

        function ValidateVendorSearch() {
            var msg = "";
            if (($("#ContentPlaceHolder1_xtxtFromDate").val() == '') && ($("#ContentPlaceHolder1_xtxtToDate").val() == '')) {
                msg = "Please select From Date and To Date.";
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
            if (!$('div#ContentPlaceHolder1_DivSearchVendor input[type=checkbox]').is(":checked")) {
                msg = "Please  select RFP No.";
                ShowModalMsgBox("Error", msg);
                return false;

            }
            if (msg.length <= 0) {
                DownloadVendorReport();
                return true;
            }
            return false;
        }

        function getCheckedVendorParam() {
            var selected = [];
            $('div#ContentPlaceHolder1_DivSearchVendor input[type=checkbox]').each(function () {
                if ($(this).is(":checked")) {
                    selected.push($(this).attr('value'));
                }
            });
            return selected;
        }

        function DownloadVendorReport() {
            var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
            var todate = $("#ContentPlaceHolder1_xtxtToDate").val();
            var select = [];
            select = getCheckedVendorParam();
            var dataToPass = { arr: select };
            var jsonTxt = JSON.stringify(dataToPass);
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/BuyerSpendReport.aspx/DownloadVendorFile',
                type: 'POST',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',                
                data: "{ 'arr' : '" + select + "','fromDate' : '" + fromdate + "','todate' : '" + todate + "'}",
                cache: false,
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det=0/" + newData);
                        }
                        else {
                            ShowMessageBox("Invalid file parameter");
                        }
                        HideProgress(true);

                    }
                    catch (e) {
                        HideProgress(true);
                        ShowModalMsgBox("Error", e.message);

                    }
                },
                error: function (data) {
                    ShowModalMsgBox("Error", data);
                }
            });
            return true;
        }

    </script>
    <asp:UpdatePanel ID="xupnlReport" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="main supplier">
                <div class="topBlk">
                    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="Build Your Report"></asp:Literal>
                    </div>
                    <ul class="rightBtn">
                        <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk fR" OnClientClick="javascript:ShowProgress(true);link_click('D')">Close</asp:LinkButton>
                    </ul>

                    <br class="cl">
                </div>       
                
                <div class="clmn1">
                <div class="row1">                     

                <div class="whiteBox">
                    <h5>View your spend History</h5>
                    <table style="width:100%;"><tr>
                        <td style="width:33%;"><div class="imw100p fl">
                            <label>From Date</label>
                            <asp:TextBox ID="xtxtFromDate" CssClass="icnCal" runat="server" autocomplete="off" ReadOnly="false"></asp:TextBox>
                        </div></td>
                        <td style="width:33%;"><div class="imw100p fl">
                            <label>To Date</label>
                            <asp:TextBox ID="xtxtToDate" CssClass="icnCal" runat="server" ReadOnly="false"></asp:TextBox>
                        </div></td>                       
                    </tr></table>
                    <br class="cl" />

                </div>
                <br class="cl" />

                <div id="DivSearch" class="whiteBox supplier reports" runat="server">
                    <h5>Build your reports</h5>
                     <div class="leftClmn">
                    <ul>
                        <li>                            
                            <input type="checkbox" value="RFP No" id="xchkRFP" class="fL chkBx" /><label for="xchkRFP">RFP N0</label></li>
                        <li>                            
                            <input type="checkbox" value="RFP Close Date" id="xchkEndDate" class="fL chkBx" /><label for="xchkEndDate">RFP CLOSE DATE</label></li>
                        <li>                            
                            <input type="checkbox" value="Product Description" id="xcheckProduct" class="fL chkBx" /><label for="xcheckProduct">PRODUCT DESCRIPTION</label></li>
                        <li>                            
                            <input type="checkbox" value="Qty" id="xchkQty" class="fL chkBx" /><label for="xchkQty">QTY</label></li>
                        <li>                            
                            <input type="checkbox" value="Category" id="xchkCategory" class="fL chkBx" /><label for="xchkCategory">CATEGORY</label></li>
                        <li>                            
                            <input type="checkbox" value="Highest Quote" id="xchkHighQuote" class="fL chkBx" /><label for="xchkHighQuote">HIGHEST QUOTE RECEIVED</label></li>
                        <li>                            
                            <input type="checkbox" value="RFP Status" id="xchkRFPStatus" class="fL chkBx" /><label for="xchkRFPStatus">RFP STATUS</label></li>
                        <li>                            
                            <input type="checkbox" value="Lowest Quote" id="xChkLowestQuote" class="fL chkBx" /><label for="xChkLowestQuote">LOWEST QUOTE RECEIVED</label></li>
                        </ul>
                         </div>
                     <div class="rightClmn">
                    <ul>
                        <li>                            
                            <input type="checkbox" value="Winning Supplier" id="xchkWinningSupp" class="fL chkBx" /><label for="xchkWinningSupp">WINNING SUPPLIER</label></li>
                        <li>
                            <input type="checkbox" value="PO Date" id="xchkPODate" class="fL chkBx" /><label for="xchkPODate">PO DATE</label></li>                            
                        <li>
                            <input type="checkbox" value="PO No" id="xchkPOId" class="fL chkBx" /><label for="xchkPOId">PO NO</label></li>                            
                        <li>
                            <input type="checkbox" value="PO Amt" id="xchkPOAmt" class="fL chkBx" /><label for="xchkPOAmt">PO AMOUNT</label></li>                            
                        <li>
                            <input type="checkbox" value="Invoice No" id="xchkInvoiceNo" class="fL chkBx" /><label for="xchkInvoiceNo">INVOICE NO</label></li>                                                        
                        <li>
                            <input type="checkbox" value="Invoice Amt" id="xchkInvoiceAmt" class="fL chkBx" /><label for="xchkInvoiceAmt">INVOICE AMOUNT</label></li>                                                        
                        <li>
                            <input type="checkbox" value="Payment Type" id="xchkkPayType" class="fL chkBx" /><label for="xchkkPayType">PAYMENT TYPE</label></li>                                                                                    
                        <li>
                            <input type="checkbox" value="Payment Date" id="xchkPayDate" class="fL chkBx" /><label for="xchkPayDate">PAYMENT DATE</label></li>                                                                                                                
                    </ul>                            
                      </div>                 
                     <%--<br class="cl" />--%>
                    <asp:LinkButton ID="xlbtnDownload" runat="server" CssClass="btnBlk" OnClientClick="javascript:if(!(ValidateSearch())){return false;}">Download</asp:LinkButton>                  
                </div>

                <div id="DivSearchVendor" class="whiteBox supplier reports" runat="server">
                    <h5>Build your reports</h5>
                    <div class="leftClmn">
                    <ul>
                        <li>                            
                            <input type="checkbox" value="RFP No" id="xchkRFPv" class="fL chkBx" /><label for="xchkRFPv">RFP NO</label></li>
                        <li>                            
                            <input type="checkbox" value="RFP Close Date" id="xchkEndDatev" class="fL chkBx" /><label for="xchkEndDatev">RFP CLOSE DATE</label></li>
                        <li>                            
                            <input type="checkbox" value="Product Description" id="xcheckProductv" class="fL chkBx" /><label for="xcheckProductv">PRODUCT DESCRIPTION</label></li>
                        <li>                            
                            <input type="checkbox" value="Qty" id="xchkQtyv" class="fL chkBx" /><label for="xchkQtyv">QTY</label></li>
                        <li>                            
                            <input type="checkbox" value="Category" id="xchkCategoryv" class="fL chkBx" /><label for="xchkCategoryv">CATEGORY</label></li>
                        <li>                            
                            <input type="checkbox" value="State" id="xchkSatev" class="fL chkBx" /><label for="xchkSatev">STATE</label></li>
                        <li>                            
                            <input type="checkbox" value="YourQuote" id="xchkYourQuote" class="fL chkBx" /><label for="xchkYourQuote">YOUR QUOTE</label></li>
                        <li>                            
                            <input type="checkbox" value="RFP Status" id="xchkRFPStatusv" class="fL chkBx" /><label for="xchkRFPStatusv">RFP STATUS</label></li>
                        </ul>
                    </div>
                    <div class="rightClmn">
                    <ul>
                        <li>                            
                            <input type="checkbox" value="Highest Quote" id="xchkHighQuotev" class="fL chkBx" /><label for="xchkHighQuotev">HIGHEST QUOTE RECEIVED</label></li>
                        <li>                            
                            <input type="checkbox" value="Lowest Quote" id="xChkLowestQuotev" class="fL chkBx" /><label for="xChkLowestQuotev">LOWEST QUOTE RECEIVED</label></li>
                        <li>                            
                            <input type="checkbox" value="PO Date" id="xchkPODatev" class="fL chkBx" /><label for="xchkPODatev">PO DATE</label></li>
                        <li>                            
                            <input type="checkbox" value="PO No" id="xchkPOIdv" class="fL chkBx" /><label for="xchkPOIdv">PO NO</label></li>
                        <li>                            
                            <input type="checkbox" value="PO Amt" id="xchkPOAmtv" class="fL chkBx" /><label for="xchkPOAmtv">PO AMOUNT</label></li>
                        <li>                            
                            <input type="checkbox" value="Invoice No" id="xchkInvoiceNov" class="fL chkBx" /><label for="xchkInvoiceNov">INVOICE NO</label></li>
                        <li>                            
                            <input type="checkbox" value="Invoice Amt" id="xchkInvoiceAmtv" class="fL chkBx" /><label for="xchkInvoiceAmtv">INVOICE AMOUNT</label></li>
                        <li>                            
                            <input type="checkbox" value="Payment Mode" id="xchkkPayTypev" class="fL chkBx" /><label for="xchkkPayTypev">PAYMENT TYPE</label></li>
                        <li>                            
                            <input type="checkbox" value="Payment Date" id="xchkPayDatev" class="fL chkBx" /><label for="xchkPayDatev">PAYMENT DATE</label></li>
                    </ul>    
                    </div>                    
                    <asp:LinkButton ID="xlbtnVendorDwnload" runat="server" CssClass="btnBlk" OnClientClick="javascript:if(!(ValidateVendorSearch())){return false;}">Download</asp:LinkButton>
                </div>

                </div>
              </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
