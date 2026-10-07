<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Masters_CustomerLeadList, App_Web_customerleadlist.aspx.6044e34" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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

        function BindDatePicker() {
            $("#ContentPlaceHolder1_xtxtFromDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');
        }
    </script>
    <div class="main purchaseOrder">
        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="Customer Lead List"></asp:Literal>
            </div>
            <ul class="rightBtn">
                <%--<li>
                    <asp:LinkButton ID="xlbtnAdd" runat="server" CssClass="btnBlk"
                        OnClick="btnAdd_click" OnClientClick="javascript:ShowProgress(true);">Add</asp:LinkButton>
                </li>
                <li>
                    <asp:LinkButton ID="xlbtnDeleteCategory" runat="server" CssClass="btnBlk"
                        OnClientClick="javascript:if(!(deleteCategory())){return false;}">Delete</asp:LinkButton>
                </li>--%>
                <li>
                    <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk" OnClick="xlbtnback_Click">Back</asp:LinkButton>
                </li>
            </ul>
            <br class="cl"/>
        </div>
        <div class="clmn1 supplier">
            <div class="row1">
                <div class="whiteBox">
                    <div class="leftClmn">
                        <div class="imw100p fl">
                            <label>From Date</label>
                           <asp:TextBox ID="xtxtFromDate" runat="server" CssClass="icnCal imw97p" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                        </div>
                    </div>
                    <div class="rightClmn">
                        <div class="imw100p fl">
                            <label>To Date</label>
                             <asp:TextBox ID="xtxtToDate" runat="server" CssClass="icnCal imw97p" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                        </div>
                    </div>
                    <br class="cl" />
                     <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnBlk immrt20"
                                OnClick="btnSearch_click" OnClientClick="javascript:ShowProgress(true);">Submit</asp:LinkButton>
                    <br class="cl" />
                </div>
            </div>
            <br class="cl"/>
            <div class="row1 immrb20">
                <div class="whiteBox">
                    <div class="table mT10">
                            <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
        <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>
    </div>
</asp:Content>

 