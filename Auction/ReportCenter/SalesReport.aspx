<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_ReportCenter_SalesReport, App_Web_salesreport.aspx.51bd485d" %>

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

        function ClearText() {
            $("#ContentPlaceHolder1_xtxtEntityName").val('');
        }

        function BindData() {
            $("#ContentPlaceHolder1_xtxtEntityName").autocomplete({
                source: function (request, response) {
                    var SearchType = $("#ContentPlaceHolder1_xddlLoggedType").val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "SalesReport.aspx/GetAutoCompleteData",
                        data: "{'UserName':'" + request.term + "','SearchType':'" + SearchType + "'}",
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
            if ($("#ContentPlaceHolder1_xddlLoggedType option:selected").index() <= 0) {
                msg = "Please select search type..";
                ShowToolTip("#ContentPlaceHolder1_xddlLoggedType", msg, "top");
                return false;
            }
            else {
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
                url: strUrl + 'ReportCenter/SalesReport.aspx/DownloadFile',
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
                            //ShowMessageBox("Invalid file parameter");
                            ShowModalMsgBox("Error", "Invalid file parameter");
                        }
                        //ShowProgress(false);
                        HideProgress(true);
                    }
                    catch (e) {
                        //ShowProgress(false);
                        //ShowMessageBox(e.Message);
                        ShowModalMsgBox("Error", e.Message);
                    }
                },
                error: function (data) {
                    ShowProgress(false);
                    //ShowMessageBox(data);
                    ShowModalMsgBox("Error", data);
                }
            });
            return true;
        }
    </script>

    <%--<asp:UpdatePanel ID="xupnlReport" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>
    <%--<div class="main purchaseOrder">--%>
    <div class="main supplier">      
        <div class="clmn1">
            <div id="divSearchName" runat="server">
                <div class="row1">
                    <div class="whiteBox brdPink">
                            <div class="leftClmn">
                                <div id="divSearchType" class="imw48p fl" runat="server" visible="false">
                                    <label class="fL">Search By Type</label>
                                    <div class="formRow1">
                                    <div class="bgGrey imw100p fl">                            
                                    <div class="styled-select selOrganization"> <%--class="styled-select imw88p "--%>
                                        <asp:DropDownList ID="xddlLoggedType" runat="server" onchange="javascript:ClearText()">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            <asp:ListItem Value="C">Company</asp:ListItem>
                                            <asp:ListItem Value="V">Supplier</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                     </div>
                                     </div>
                                </div>
                                <div class="imw48p fr">
                                    <label class="fL">Search By Name</label>
                                    <asp:TextBox ID="xtxtEntityName" runat="server" MaxLength="50" CssClass="selDate imw85p"></asp:TextBox>
                                </div>
                                <br class="cl" />
                            </div>
                            <div class="rightClmn">
                                <div class="imw48p fl">
                                    <label>From Date</label>                                    
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
                                    <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnRed"  OnClick="btnSearch_click" OnClientClick="javascript:if(!(ValidateSearch())){return false;}">Search</asp:LinkButton>                                              
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

    </div>
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>

    <asp:HiddenField ID="xhdnReportType" runat="server" />

</asp:Content>

