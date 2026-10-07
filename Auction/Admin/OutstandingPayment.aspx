<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_OutstandingPayment, App_Web_outstandingpayment.aspx.fdf7a39c" %>

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
            BindDatePicker();
        });

        function View_click(Id) {
            ShowProgress(true);
            $("#ContentPlaceHolder1_xhdnReportId").val(Id);
            $("#ContentPlaceHolder1_xbtnView").click();
        }

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            BindDatePicker();
        });

        function BindDatePicker() {
            $("#ContentPlaceHolder1_txtFromDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_txtToDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');
        }
    </script>

    <div class="main supplier">

        <div class="clmn1">
            <div id="ListData">
                <div id="SerachGroup" runat="server">
                    <div class="row1">
                        <div class="whiteBox supplier">
                            <div class="leftClmn">
                                <div class="imw100p fl">
                                    <label>Search By Supplier </label>
                                    <asp:TextBox ID="txtEntityName" runat="server" MaxLength="10" CssClass="selDate imw85p" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                </div>
                                <div class="imw100p fl">
                                    <label>Start Date</label>
                                    <asp:TextBox ID="txtFromDate" runat="server" CssClass="selDate imw85p" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                </div>
                            </div>
                            <div class="rightClmn">
                                <div class="imw100p fl">
                                    <label>Search By Type </label>
                                    <div class="styled-select fl selOrganization">
                                        <asp:DropDownList ID="ddlPaymentType" runat="server">
                                            <asp:ListItem>All</asp:ListItem>
                                            <asp:ListItem Value="0">Pending</asp:ListItem>
                                            <asp:ListItem Value="1">Paid</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="imw100p fl">
                                    <label>End Date</label>
                                    <asp:TextBox ID="txtToDate" runat="server" CssClass="selDate imw85p" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                </div>
                            </div>
                            <br class="cl" />
                            <asp:LinkButton ID="btnSearch" runat="server" CssClass="btnBlk immrt20" OnClick="btnSearch_Click" OnClientClick="javascript:ShowProgress(true);">SEARCH</asp:LinkButton>
                            <br class="cl" />
                        </div>
                    </div>
                </div>
                <br class="cl" />

                <div class="whiteBox" id="PaymentList" runat="server">
                    <asp:Literal ID="xlitReport" runat="server"></asp:Literal>
                </div>

                <asp:Button ID="xbtnView" OnClick="xbtnView_Click" runat="server" Style="display: none;" />
                <input type="hidden" id="xhdnReportId" runat="server" />

            </div>

            <div class="row1" id="xdivPaymentDet" runat="server" visible="false">
                <div class="whiteBox">
                    <h2>Payment Details</h2>
                    <asp:Literal ID="xlitPayDetails" runat="server"></asp:Literal>

                    <h2>Bank Details</h2>
                    <asp:Literal ID="xlitBankDetails" runat="server"></asp:Literal>

                    <h2>Payment Status</h2>
                    <asp:CheckBox ID="xchckStatus" runat="server" />

                    <h2>Comment </h2>
                    <textarea id="textarea" name="content" runat="server" style="width: 300px"></textarea>

                </div>
                <asp:LinkButton ID="btnEdit" runat="server" CssClass="btnBlk" OnClick="btnEdit_Click" OnClientClick="javascript:ShowProgress(true);">Submit</asp:LinkButton>
                <asp:LinkButton ID="btnCancel" runat="server" CssClass="btnBlk" OnClick="btnCancel_Click">Back</asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>



