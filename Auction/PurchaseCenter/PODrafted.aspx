<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_PurchaseCenter_PODrafted, App_Web_podrafted.aspx.750f10e" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        $(document).ready(function () {
            BindPaging('tblList');
        });

        function Show(Id) {
            ShowProgress();
            $("#ContentPlaceHolder1_xhdnPoId").val(Id);
            $("#ContentPlaceHolder1_btnShow").click();
        }
        function totalAmount() {
            var uUnitPrice = 0;
            var utotalAmt = 0;
            var uQty = 0;
            if ($("#ContentPlaceHolder1_lblUnitPrice").text() != "") {
                uUnitPrice = parseFloat($("#ContentPlaceHolder1_lblUnitPrice").text());
            }
            if ($("#ContentPlaceHolder1_xtxtQuantity").val() != "") {
                uQty = parseFloat($("#ContentPlaceHolder1_xtxtQuantity").val());
            }
            utotalAmt = (uUnitPrice * uQty);
            $("#ContentPlaceHolder1_lblAmt").text(utotalAmt);
        }
    </script>
    <div class="clmn1">
        <div class="row1">
            <asp:UpdatePanel ID="xupnlPoList" runat="server" UpdateMode="Conditional">
                <ContentTemplate>                    
                    <div class="whiteBox immrt10">
                        <asp:Literal ID="xlitPOList" runat="server"></asp:Literal>
                        <%--<a href="#" class="btnBlk immrt20">Issue PO</a>--%>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            
        </div>
    </div>
    <asp:HiddenField ID="xhdnPoId" runat="server" />
    <asp:Button ID="btnShow" runat="server" class="btnBlk immrt20" OnClick="btnShow_Click" Style="display: none;" Value="show" />
    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
</asp:Content>

