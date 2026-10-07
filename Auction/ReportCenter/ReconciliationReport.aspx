<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_ReportCenter_ReconciliationReport, App_Web_reconciliationreport.aspx.51bd485d" %>
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
            $('#tbllist').empty();
            if ($("#ContentPlaceHolder1_xddlPayType option:selected").index() <= 0) {
                msg = "please select search type.";
                ShowToolTip("#ContentPlaceHolder1_xddlPayType", msg);
                return false;
            }
            else {
                if (($("#ContentPlaceHolder1_xtxtFromDate").val() == '') && ($("#ContentPlaceHolder1_xtxtToDate").val() == '')) {
                    msg = "Please select From Date and To Date.";
                    ShowMessageBox(msg);
                    return false;
                }
                else {
                    if ($("#ContentPlaceHolder1_xtxtFromDate").val() == '') {
                        msg = "Please select From Date.";
                        ShowToolTip("#ContentPlaceHolder1_xtxtFromDate", msg);
                        return false;
                    }
                    if ($("#ContentPlaceHolder1_xtxtToDate").val() == '') {
                        msg = "Please select To Date.";
                        ShowToolTip("#ContentPlaceHolder1_xtxtToDate", msg);
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
                url: strUrl + 'ReportCenter/ReconciliationReport.aspx/DownloadFile',
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
                        HideProgress(true);
                    }
                    catch (e) {
                        HideProgress(true);
                        //ShowProgress(false);
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
    </script>

    <div class="main supplier">              
         <div class="clmn1">
              <div class="row1">
                    <div class="whiteBox brdPink">
                                <div class="leftClmn">
                                   <label class="fL">Search By Payment Status</label>
                                    <div class="formRow1">
                                    <div class="bgGrey imw100p fl">
                                        <div class="styled-select fl selOrganization">
                                    <asp:DropDownList ID="xddlPayType" runat="server" >
                                        <asp:ListItem >--Select--</asp:ListItem>
                                        <asp:ListItem Value="0">All</asp:ListItem>
                                        <asp:ListItem Value="1">Successful</asp:ListItem>
                                        <asp:ListItem Value="-1">Failed</asp:ListItem>
                                        <asp:ListItem Value="2">Pending</asp:ListItem>
                                    </asp:DropDownList>
                                   </div>
                                    </div>
                                    </div>
                                </div>

                                <div class="rightClmn">
                                    <div class="imw48p fl immr15">
                                        <label >From Date</label>                                        
                                         <div class="formRow1">
                                        <div class="bgGrey fl">                                            
                                            <div  class="iconCal">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtFromDate" runat="server" CssClass="selDate icnCal" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                         </div></div>
                                            </div>
                                    </div>
                                    <div class="imw48p fl">
                                        <label >To Date</label>                                        
                                         <div class="formRow1">
                                        <div class="bgGrey fl">                                            
                                            <div  class="iconCal">
                                                <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtToDate" runat="server" CssClass="selDate icnCal" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                             </div></div>
                                            </div>
                                    </div>
                                </div>
                                <br class="cl" />
                                    <div class="immrt20">
                                        <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnRed"
                                        OnClick="btnSearch_click" OnClientClick="javascript:if(!(ValidateSearch())){return false;}">Search</asp:LinkButton>
                                        <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>
                                        
                                        <asp:LinkButton ID="xlbtnDownload" runat="server" CssClass="btnRed" 
                                        OnClientClick="javascript:DownloadReport();return false;">Export to Excel</asp:LinkButton>

                                    </div>
                                <br class="cl" />

                                </div>

                   <div class="row1">
                            <div class="whiteBox">
                                <asp:Literal ID="xlitList" runat="server"></asp:Literal> 
                            </div> 
                        </div>

                </div>                    
        </div>
     </div>

</asp:Content>

