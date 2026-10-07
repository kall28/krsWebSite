<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_ReportCenter_OutStandingReport, App_Web_outstandingreport.aspx.51bd485d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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

        function ShowToolTip(ctrl, content, position) {
            //$(ctrl).tooltip({ title: content, animation: true });
            $(ctrl).tooltip({ title: content, animation: true, placement: position });
            $(ctrl).tooltip("show");
            $(ctrl).blur(function () { $(ctrl).tooltip("destroy"); });
        }

        $(document).ready(function () {
            //BindPaging('tblList');
            BindDatePicker();
            //BindData();
        });

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            BindDatePicker();
            //BindData();
        });

        function BindDatePicker() {
            $("#ContentPlaceHolder1_xtxtFromDate").datepicker({
                dateFormat: 'dd/mm/yy'
            });
            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                dateFormat: 'dd/mm/yy'
            });
        }

        function BindData() {
            $("#ContentPlaceHolder1_xtxtEntityName").autocomplete({
                source: function (request, response) {
                    // var SearchType = $("#ContentPlaceHolder1_xddlLoggedType").val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "OutStandingReport.aspx/GetAutoCompleteData",
                        data: "{'username':'" + request.term + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                },
                focus: function () {
                    // prevent value inserted on focus
                    return false;
                }
            });
            $("#ContentPlaceHolder1_xtxtEntityName").bind("keydown", function (event) {
                if (event.keyCode === $.ui.keyCode.TAB &&
						$(this).data("autocomplete").menu.active) {
                    event.preventDefault();
                }
            })
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

        function GetReportDetails(Id) {
            $.ajax({
                url: strUrl + 'ReportCenter/OutStandingReport.aspx/GetReportDetails',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'Id':'" + Id + "'}",
                dataType: 'json',
                success: function (data) {
                    var newData = data.d;
                    if (newData != null) {
                        BindDetails(newData);
                    }
                    else {
                        //alert(newData.ErrDesc);
                    }
                },
                error: function (data) {

                }
            });
        }

        function DownloadReport() {
            //  $("#ContentPlaceHolder1_xhdnInvoiceId").val(Id);
            //ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/OutStandingReport.aspx/DownloadFile',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                // data: "{'InvoiceId':'" + Id + "'}",
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
                        HideProgress(true);
                    }
                    catch (e) {
                        HideProgress(true);
                        //ShowMessageBox(e.Message);
                        ShowModalMsgBox("Error", e.Message);
                    }
                },
                error: function (data) {
                    //ShowProgress(false);
                    //ShowMessageBox(data);
                    ShowModalMsgBox("Error", data);
                }
            });
            return true;
        }

        function DownloadInvoice(Id) {
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/OutStandingReport.aspx/DownloadInvoice',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'InvoiceId':'" + Id + "'}",
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det=2/" + newData);
                        }
                        else {
                            ShowModalMsgBox("Error", "Invalid file parameter");
                        }
                        HideProgress();
                    }
                    catch (e) {
                        ShowProgress(false);
                        ShowModalMsgBox("Error", e.Message);
                    }
                },
                error: function (data) {
                    ShowProgress(false);
                    ShowModalMsgBox("", data);
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
                        <div id="DivVendorlist" runat="server" class="imw48p fl">
                            <label>Search By Supplier</label>
                            <asp:TextBox ID="txtEntityName" runat="server" MaxLength="100" CssClass="selDate imw85p"></asp:TextBox>
                            <div class="input-bg" style="display: none;">
                                <asp:DropDownList ID="xddlVendorList" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="imw48p fr">
                            <label>Search By Type</label>
                            <div class="formRow1">
                            <div class="bgGrey imw100p fl">
                            <div class="styled-select imw100p ">
                                <asp:DropDownList ID="xddlPaymentType" runat="server">
                                    <asp:ListItem>All</asp:ListItem>
                                    <asp:ListItem Value="0">Pending</asp:ListItem>
                                    <asp:ListItem Value="1">Paid</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            </div>
                            </div>
                        </div>
                        <br class="cl" />
                    </div>
                    <div class="rightClmn">
                        <div class="imw48p fl">
                            <label>From Date</label>
                            <%--<input type="text" id="txtFromDate" class="selDate imw85p" runat="server" maxlength="10" autocomplete="off" ondrop="return false;" onpaste="return false;" />--%>                            
                             <div class="formRow1">
                                        <div class="bgGrey fl">                                            
                                            <div  class="iconCal">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtFromDate" runat="server" CssClass="selDate icnCal" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                         </div></div>
                                            </div>
                        </div>
                        <div class="imw48p fr">
                            <label>To Date</label>
                            <%--<input type="text" id="txtToDate" class="selDate imw85p" runat="server" maxlength="10" autocomplete="off" ondrop="return false;" onpaste="return false;" />--%>                            
                             <div class="formRow1">
                                        <div class="bgGrey fl">                                            
                                            <div  class="iconCal">
                                                <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtToDate" runat="server" CssClass="selDate icnCal" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                             </div></div>
                                            </div>
                        </div>
                        <br class="cl" />
                    </div>
                    <br class="cl" />
                    <div class="immrt10">
                         <div class="imw48p fl">
                            <label>Invoice Type</label>
                             <div class="formRow1">
                            <div class="bgGrey imw100p fl">
                            <div class="styled-select imw100p ">                            
                                <asp:DropDownList ID="xddlInvoiceType" runat="server">
                                    <asp:ListItem Value="A">All</asp:ListItem>
                                    <asp:ListItem Value="O" Selected="True">Outstanding Invoice</asp:ListItem>
                                    <asp:ListItem Value="DP">Direct Pay Invoice</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                             </div>                                
                            </div>
                        </div>
                    </div>
                    <br class="cl" />
                    <div class="immrt10">
                        <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnRed"
                            OnClick="btnSearch_click" OnClientClick="javascript:if(!(ValidateSearch())){return false;}" >Search</asp:LinkButton>
                        <asp:LinkButton ID="xlbtnDownload" runat="server" CssClass="btnRed" Visible="false"
                            OnClientClick="javascript:DownloadReport();return false;">Export to Excel</asp:LinkButton>
                        <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>
                    </div>
                    <br class="cl" />
                </div>
            </div>
            <br class="cl" />
            <div class="whiteBox">
                <div class="row1 immrb20 OutStandReport">
                    <%--class="table mT10"--%>
                    <asp:Literal ID="xlitReport" runat="server"></asp:Literal>
                </div>
            </div>
            <br />
            <br />
        </div>
        <asp:HiddenField ID="xhdnInvoiceId" runat="server" />
    </div>
    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
</asp:Content>

