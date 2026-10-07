<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Admin_RecurringPO, App_Web_recurringpo.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            BindDatePicker();
            SetDataTablePaging("#tblList");
        });
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            BindDatePicker();
            SetDataTablePaging("#tblList");
        });
        //var prm = Sys.WebForms.PageRequestManager.getInstance();
        //prm.add_endRequest(function () {
        //    SetDataTablePaging("#tblList");
        //});

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
                ShowProgress(true);
                return true;
            }
            return false;
        }
    </script>
    <asp:UpdatePanel ID="xupnlReport" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="main supplier">
                <div class="topBlk">
                    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="Recurring PO Details"></asp:Literal>
                    </div>
                    <ul class="rightBtn">
                        <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk fR" OnClientClick="javascript:ShowProgress(true);link_click('D')">Close</asp:LinkButton>
                    </ul>
                    <br class="cl">
                </div>
                <div class="clmn1">
                    <div>
                        <div id="DivSearch" runat="server">
                            <div class="row1">
                                <div class="whiteBox">
                                    <div class="leftClmn">
                                        <label>From Date</label>
                                        <asp:TextBox ID="xtxtFromDate" CssClass="icnCal" runat="server" autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="rightClmn">
                                        <div class="imw100p fl">
                                            <label>To Date</label>
                                            <asp:TextBox ID="xtxtToDate" CssClass="icnCal" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                    <br class="cl" />
                                    <div class="immrt20">
                                        <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnBlk" OnClick="btnSearch_click" OnClientClick="javascript:if(!(ValidateSearch())){return false;}">Search</asp:LinkButton>
                                        <asp:LinkButton ID="xlbtnAllReport" runat="server" CssClass="btnBlk" OnClick="btnAllReport_click" OnClientClick="javascript:ShowProgress(true);">All</asp:LinkButton>
                                        <%--<asp:LinkButton ID="xlbtnLive" runat="server" CssClass="btnBlk" OnClick="btnLiveRFP_click" Visible="false" OnClientClick="javascript:ShowProgress(true);">LIVE</asp:LinkButton>--%>
                                    </div>
                                    <br class="cl" />
                                </div>
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

                <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

