<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="ReportCenter_BuyerCategoryReport, App_Web_buyercategoryreport.aspx.51bd485d" %>
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
                minDate: '01/01/' + y,
                maxDate: '31/12/' + y,
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                dateFormat: 'dd/mm/yy',
                minDate: '01/01/' + y,
                maxDate: '31/12/' + y,
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtFromDateNew").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtToDateNew").datepicker({
                dateFormat: 'dd/mm/yy',
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
            if (msg.length <= 0) {                
                return true;
            }
            return false;
        }

        function ValidateDownloadSearch() {
            var msg = "";
            if (($("#ContentPlaceHolder1_xtxtFromDateNew").val() == '') && ($("#ContentPlaceHolder1_xtxtToDateNew").val() == '')) {
                msg = "Please select From Date and To Date.";
                ShowModalMsgBox("Error", msg);
                return false;
            }
            else {
                if ($("#ContentPlaceHolder1_xtxtFromDateNew").val() == '') {
                    msg = "Please select From Date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtFromDateNew", msg, "top");
                    return false;
                }
                if ($("#ContentPlaceHolder1_xtxtToDateNew").val() == '') {
                    msg = "Please select To Date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtToDateNew", msg, "top");
                    return false;


                }
            }            
            if (msg.length <= 0) {
                DownloadCustomerReport();
                return true;
            }
            return false;
        }

        function DownloadCustomerReport() {
            var fromdate = $("#ContentPlaceHolder1_xtxtFromDateNew").val();
            var todate = $("#ContentPlaceHolder1_xtxtToDateNew").val();            
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/BuyerCategoryReport.aspx/DownloadCustomerFile',
                type: 'POST',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',                
                data: "{'fromDate' : '" + fromdate + "','todate' : '" + todate + "'}",
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
                        <asp:Literal ID="xlitCap" runat="server" Text="Top Suppliers"></asp:Literal>
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
                        <td style="width:33%; text-align:right;"><div class="imw100p fl">
                            <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnBlk" OnClick="xlbtnSearch_Click" OnClientClick="javascript:if(!(ValidateSearch())){return false;}">Search</asp:LinkButton>                        
                        </td>
                    </tr></table>
                    <br class="cl" />

                </div>
                <br class="cl">  

                 <div class="whiteBox" id="divData" runat="server" visible="false">                                                      
                                    <asp:Literal ID="xlitList" runat="server"></asp:Literal>                           
                            <br class="cl">                            
                         </div>
                 <br class="cl">                   
                 <asp:Literal ID="xlitScript" runat="server"></asp:Literal>                            
                <br class="cl">                 
  
                 <div class="whiteBox" >
                    <h5>To Download Previous Year's Data</h5>
                     <table style="width:100%;"><tr>
                        <td style="width:33%;"><div class="imw100p fl">
                            <label>From Date</label>
                            <asp:TextBox ID="xtxtFromDateNew" CssClass="icnCal" runat="server" autocomplete="off" ReadOnly="false"></asp:TextBox>                                         
                        </div></td>
                        <td style="width:33%;"><div class="imw100p fl">
                            <label>To Date</label>
                            <asp:TextBox ID="xtxtToDateNew" CssClass="icnCal" runat="server" ReadOnly="false"></asp:TextBox>                           
                        </div></td>
                        <td style="width:33%; text-align:right;"><div class="imw100p fl">
                            <asp:LinkButton ID="xlbtnDownload" runat="server" CssClass="btnBlk" OnClientClick="javascript:if(!(ValidateDownloadSearch())){return false;}">Download</asp:LinkButton>
                        </td>
                    </tr></table>
                    <br class="cl" />
                    
                </div>
                
                 </div>
                 </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>
