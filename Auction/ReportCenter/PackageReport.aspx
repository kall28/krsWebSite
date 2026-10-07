<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_ReportCenter_PackageReport, App_Web_packagereport.aspx.51bd485d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />

    <script type="text/javascript">

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
            $("#ContentPlaceHolder1_xtxtFromDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');
        }

        function ValidateSearch() {
            var msg = "";
            // $('#tblList').empty();

            if (($("#ContentPlaceHolderMaster_txtFromDate").val() == '') && ($("#ContentPlaceHolderMaster_txtToDate").val() == '')) {
                msg = "Please select From Date and To Date.";
                ShowMessageBox(msg);
                return false;
            }
            else {
                if ($("#ContentPlaceHolderMaster_txtFromDate").val() == '') {
                    msg = "Please select From Date.";
                    ShowToolTip("#ContentPlaceHolderMaster_txtFromDate", msg);
                    return false;
                }
                if ($("#ContentPlaceHolderMaster_txtToDate").val() == '') {
                    msg = "Please select To Date.";
                    ShowToolTip("#ContentPlaceHolderMaster_txtToDate", msg);
                    return false;
                }
            }
            if (msg.length <= 0) {
                ShowProgress(true);
                return true;
            }
            return false;
        }

        function DownloadReport() {
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/PackageReport.aspx/DownloadFile',
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
                            ShowMessageBox("Invalid file parameter");
                        }
                        ShowProgress(false);
                    }
                    catch (e) {
                        ShowProgress(false);
                        ShowMessageBox(e.Message);
                    }
                },
                error: function (data) {
                    ShowProgress(false);
                    ShowMessageBox(data);
                }
            });
            return true;
        }

        function ViewInvoice(Id) {
            var val = Id.split('|');
            var CompanyId = val[0];
            var PackageId = val[1];
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/PackageReport.aspx/DownloadInvoice',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'CompanyId':'" + CompanyId + "','PackageId':'" + PackageId + "'}",
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det=2/" + newData);
                        }
                        else {
                            ShowMessageBox("Invalid file parameter");
                        }
                        ShowProgress(false);
                    }
                    catch (e) {
                        ShowProgress(false);
                        ShowMessageBox(e.Message);
                    }
                },
                error: function (data) {
                    ShowProgress(false);
                    ShowMessageBox(data);
                }
            });
            return true;
        }

    </script>

    <div class="main supplier">                    
                <div class="clmn1">
                    <div class="row1">
                            <div class="whiteBox brdPink">
                                <div class="leftClmn">
                                   <label >From Date</label>                                    
                                        <div class="formRow1">
                                        <div class="bgGrey imw48p fl">                                            
                                            <div  class="iconCal">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtFromDate" runat="server" CssClass="selDate icnCal imw85p" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                         </div></div>
                                            </div>                                        
                                </div>
                                <div class="rightClmn">
                                    <label >To Date</label>                                    
                                        <div class="formRow1">
                                        <div class="bgGrey imw48p fl">                                            
                                            <div  class="iconCal">
                                                <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtToDate" runat="server" CssClass="selDate icnCal imw85p" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                             </div></div>
                                            </div>                                        
                                 </div>
                                <br class="cl" />
                                    <div class="immrt20">
                                        <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnRed"
                                        OnClick="btnSearch_click" OnClientClick="javascript:if(!(ValidateSearch())){return false;}">Search</asp:LinkButton>
                                    <asp:LinkButton ID="xlbtnDownload" runat="server" CssClass="btnRed" 
                                        OnClientClick="javascript:DownloadReport();return false;">Export to Excel</asp:LinkButton>
                                    </div>
                                <br class="cl" />




                               
                                <br class="cl">
                            </div> 

                        <div class="whiteBox">
                            <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>
                            <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                        </div>
                        </div>

                        
                </div>
                    
                </div>

</asp:Content>