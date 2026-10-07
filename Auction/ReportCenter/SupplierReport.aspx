<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_ReportCenter_SupplierReport, App_Web_supplierreport.aspx.51bd485d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <script type="text/javascript">

        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            SetDataTablePaging("#tblList");
        });

        $(document).ready(function () {
            BindDatePicker();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            BindDatePicker();
        });     

        function BindDatePicker() {
            $("#ContentPlaceHolder1_xtxtFromDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');
        }

        function ShowToolTip(ctrl, content, position) {
            //$(ctrl).tooltip({ title: content, animation: true });
            $(ctrl).tooltip({ title: content, animation: true, placement: position });
            $(ctrl).tooltip("show");
            $(ctrl).blur(function () { $(ctrl).tooltip("destroy"); });
        }

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            BindDatePicker();
        });

        function ShowActivityReportDet(Id, mode) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: strUrl + 'ReportCenter/SupplierReport.aspx/ShowActivityReportDet',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id': '" + Id + "','mode': '" + mode + "'}",
                cache: false,
                success: function (msg) {
                    ShowModalReportBox("Report Details", msg.d);
                    SetDataTablePaging('#tblCompanyList');
                    HideProgress();
                    //ShowGenPopup(msg.d);
                    //SetDataTablePaging("#tblCompanyList");
                    //ShowProgress(false);
                    //ResetGenPopup();
                },
                error: ShowError
            });
        }

        function ValidateSearch() {
            var msg = "";
            // $('#tblList').empty();
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
            if (msg.length <= 0) {
                ShowProgress(true);
                return true;
            }
            return false;
        }

        function DownloadReport() {
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/SupplierReport.aspx/DownloadFile',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                //data: "{'rfpId':'" + rfpId + "'}",
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det=0/" + newData);
                        }
                        else {
                            //ShowMessageBox("Invalid file parameter");
                            ShowModalMsgBox("Error", "Invalid file parameter");
                        }
                        HideProgress();
                    }
                    catch (e) {
                        HideProgress();
                        //ShowMessageBox(e.Message);
                        ShowModalMsgBox("Error", e.Message);
                    }
                },
                error: function (data) {
                    HideProgress();
                    //ShowMessageBox(data);
                    ShowModalMsgBox("Error", data);
                }
            });
            return true;
        }
    </script>

    <asp:UpdatePanel ID="xupnlReport" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <%--<div class="main purchaseOrder">--%>
            <div class="main supplier">            
                <div class="clmn1">
                    <div id="DivSearch" runat="server" visible="false">
                        <div class="row1">
                              <div class="whiteBox supplier brdPink" >
                                    <div class="leftClmn">
                                        <label>From Date</label>                                        
                                         <div class="formRow1">
                                        <div class="bgGrey imw48p fl">                                            
                                            <div  class="iconCal">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtFromDate" runat="server" CssClass="selDate icnCal imw85p" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                         </div></div>
                                            </div>
                                    </div>
                                    <div class="rightClmn">
                                        <label>To Date</label>                                            
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
                                            <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnRed" OnClick="btnSearch_click" OnClientClick="javascript:if(!(ValidateSearch())){return false;}">Search</asp:LinkButton>
                                            <asp:LinkButton ID="xlbtnAllReport" runat="server" CssClass="btnRed" OnClick="btnAllReport_click">All</asp:LinkButton>
                                         </div>  
                                    <br class="cl" />
                                                                                                     
                               </div>

                        </div>
                    </div>

                    <div class="row1" style="display: none;">
                        <div class="whiteBox">
                            <table style="width: 100%">
                                <tr>
                                    <td class="imw33p">
                                        <%--<asp:Button ID="xbtnback" runat="server" Text="Back" CssClass="btnBlk" OnClientClick="javascript:ShowProgress(true);link_click('CR')" />--%>


                                        <%--<asp:Button ID="xbtnDownload" runat="server" Text="Export to Excel" CssClass="btnBlk" OnClientClick="javascript:DownloadReport();return false;" />--%>
                                        <asp:LinkButton ID="xlbtnDownload" runat="server" CssClass="btnBlk" Visible="false"
                                            OnClientClick="javascript:DownloadReport();return false;">Export to Excel</asp:LinkButton>
                                        <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>
                                    </td>
                                    <td class="imw33p"></td>
                                    <td class="imw33p"></td>
                                </tr>
                            </table>
                        </div>
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
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="xhdnReportType" runat="server" />
</asp:Content>

