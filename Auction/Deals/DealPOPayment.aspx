<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Deals_DealPOPayment, App_Web_dealpopayment.aspx.1c5f8e60" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">

        function ShowTotal() {

            var uPrice = 0;
            var qty = 0;
            var total = 0;

            if (document.getElementById('ContentPlaceHolder1_txtUnitPrice').value != "") {
                uPrice = parseFloat(document.getElementById('ContentPlaceHolder1_txtUnitPrice').value);
            }

            if (document.getElementById('ContentPlaceHolder1_txtQty').value != "") {
                qty = parseFloat(document.getElementById('ContentPlaceHolder1_txtQty').value);
            }

            total = qty * uPrice;
            //$("#ContentPlaceHolder1_txtTotalAmount").val(total);
            document.getElementById('ContentPlaceHolder1_txtTotalAmount').value = total;

        }

        function lnkbtnSubmit_Click() {

            if (document.getElementById('ContentPlaceHolder1_txtQty').value == "") {
                document.getElementById('ContentPlaceHolder1_txtQty').focus();
                ShowToolTip(document.getElementById('ContentPlaceHolder1_txtQty'), "Please enter quantity.", "bottom");
                return false;
            }
            ShowProgress(true);
            return true;
        }

    </script>

    <div class="main supplier">
        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="<span id='spnCap'> PURCHASE ORDER </span>"></asp:Literal>
            </div>
            <br class="cl"/>
        </div>
        <div class="row1">

            <div class="whiteBox" id="confirm" runat="server">
                        <label id="lblid" runat="server" visible="false"></label>
                        <label id="lblDealId" runat="server" visible="false">></label>
                        <div style="border-top: 2px solid black; padding-top: 5px;">
                            <table id="det" style="width: 100%;">
                                <tr>
                                    <td>
                                        <label>DATE:</label></td>
                                    <td>
                                        <label id="lbldate" runat="server"></label>
                                    </td>
                                    <td>
                                        <label>SUPPLIER NAME:</label></td>
                                    <td>
                                        <label id="lblSupName" runat="server"></label>
                                    </td>
                                    <td>
                                        <label></label>
                                    </td>
                                    <td>
                                        <label id="lblMob" runat="server"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>PO NO:</label></td>
                                    <td>
                                        <label id="lblPONo" runat="server"></label>
                                    </td>
                                    <td>
                                        <label>SUPPLIER ADDRESS:</label></td>
                                    <td>
                                        <label id="lblSupAdd" runat="server"></label>
                                    </td>
                                    <td>
                                        <label>DELIVERY ADDRESS:</label></td>
                                    <td>
                                        <label id="lblDevAdd" runat="server"></label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="border-top: 2px solid black; padding-top: 5px;">
                            <table class="List" style="width: 100%;">
                                <tr>
                                    <td>
                                        <label>BRAND</label></td>
                                    <td>
                                        <label>PRODUCT</label></td>
                                    <td>
                                        <label>QTY</label></td>
                                    <td>
                                        <label id="lblUnitPrice" runat="server">UNIT PRICE</label></td>
                                    <td>
                                        <label id="lblAmt" runat="server">AMOUNT</label></td>
                                </tr>
                            </table>
                        </div>
                        <div style="border-top: 2px solid black; border-bottom: 2px solid black; padding-top: 5px;">
                            <table class="List" style="width: 100%;">
                                <tr>
                                    <td>
                                        <label id="lblBrand" runat="server"></label>
                                    </td>
                                    <td>
                                        <label id="lblProduct" runat="server"></label>
                                    </td>
                                    <td>
                                        <input type="text" id="txtQty" autocomplete="off" runat="server" onkeyup="javascript:ShowTotal();"  onkeydown="return IsNumeric(event);" /><span id="QtyLimit" style="color: red;" runat="server"></span></td>
                                    <td>
                                        <input type="text" id="txtUnitPrice" runat="server" class="noBg" readonly="readonly" /></td>
                                    <td>
                                        <input type="text" id="txtTotalAmount" runat="server" class="noBg" readonly="readonly" /></td>
                                </tr>
                            </table>
                        </div>
                        <%--<asp:Button ID="btnConfirm" runat="server" Text="Payment" OnClientClick="javascript:ShowProgress(true);" OnClick="btnConfirm_Click" />--%>
                        <%--<asp:Button ID="btnConfirm" runat="server" Text="Payment" OnClientClick="javascript: return lnkbtnSubmit_Click();" OnClick="btnConfirm_Click" />--%>
                        <asp:LinkButton ID="btnConfirm" runat="server" class="btnBlk immrt30"   OnClientClick="javascript: return lnkbtnSubmit_Click();" OnClick="btnConfirm_Click">Payment</asp:LinkButton>
                        <br class="cl" />
                        <br class="cl" />
                        <label id="lblPaymentMsg" runat="server">
                            Note: On clicking submit your order will be recorded. Your order will only be processed once we reach the minimum bulk order quantity.
                        </label>
                    </div>
                    
        </div>
    </div>

</asp:Content>