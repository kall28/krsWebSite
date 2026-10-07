<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Admin_InvoiceList, App_Web_purchaseinvoicelist.aspx.fdf7a39c" %>

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
            $("#ContentPlaceHolder1_xhdnInvoice").val(Id);
            $("#ContentPlaceHolder1_btnShow").click();
        }

        function ShowTotal() {
            if ($("#ContentPlaceHolder1_xtxtTds").val() != "" && $("#ContentPlaceHolder1_xtxtTds").val().length != 0) {
                var uAmt = 0;
                var Unitprice = 0;
                var udelvry = 0;
                var uTDS = 0;
                var unetAmt = 0;
                var uNewTax = 0;
                var Qty = 0;
                var taxVal = 0;
                var taxType = $('[name=hdnType]');
                taxVal = $('[name=spnVal]');
                if ($("#ContentPlaceHolder1_xlblUnitPrice").text() != "") {
                    Unitprice = parseFloat($("#ContentPlaceHolder1_xlblUnitPrice").text());
                }

                if ($("#ContentPlaceHolder1_xlblQty").text() != "") {
                    Qty = parseFloat($("#ContentPlaceHolder1_xlblQty").text());
                }
                uAmt = parseFloat(Unitprice * Qty);

                if (parseInt($("#ContentPlaceHolder1_xlblDeliveryCharges").text()) > 0) {
                    udelvry = parseFloat($("#ContentPlaceHolder1_xlblDeliveryCharges").text());
                }

                for (var i = 0; i < taxVal.length; i++) {
                    uNewTax = parseFloat(uNewTax) + parseFloat(taxVal[i].innerHTML);
                }

                if ($("#ContentPlaceHolder1_xtxtTds").val() != "") {
                    uTDS = parseFloat($("#ContentPlaceHolder1_xtxtTds").val());
                }
                unetAmt = uAmt + udelvry + uNewTax;
                $("#ContentPlaceHolder1_xlblNetAmt").text(unetAmt.toFixed(2));

                uTDS = (((uAmt + udelvry) * uTDS) / 100);
                $("#ContentPlaceHolder1_xlblTds").text(uTDS.toFixed(2));

                unetAmt = unetAmt - uTDS.toFixed(2);
                $("#ContentPlaceHolder1_xlblPayAmt").text(unetAmt.toFixed(2));
            }
            else {
                $("#ContentPlaceHolder1_xtxtTds").val("0.00");
            }
        }
        function DownloadInvoice() {
            var Id = $("#ContentPlaceHolder1_xhdnInvoice").val();
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'Admin/PurchaseInvoiceList.aspx/DownloadInvoice',
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
    <div class="main invoice">
        <div class="topBlk">
            <%--<div class="mainHead fl" id="xdivHeader" runat="server">Invoice List</div>--%>
            <div class="fr">
              <%--  <asp:LinkButton ID="xlnkbtnClose" runat="server" class="btnBlk" OnClick="xlnkbtnClose_Click" OnClientClick="javascript:ShowProgress(true);">Close</asp:LinkButton>
                <asp:LinkButton ID="xlnkbtnBack" runat="server" class="btnBlk" OnClick="xlnkbtnBack_Click" OnClientClick="javascript:ShowProgress(true);">Back</asp:LinkButton>--%>
                <asp:LinkButton ID="xlnkbtnPay" runat="server" Visible="false" class="btnBlk" OnClick="xlnkbtnPay_Click" OnClientClick="javascript:ShowProgress(true);">Pay</asp:LinkButton>
                <asp:LinkButton ID="xlnkbtnPrint" runat="server" Visible="false" OnClientClick="DownloadInvoice()" class="btnBlk">Download</asp:LinkButton>
            </div>
            <br class="cl" />
        </div>
        <div class="clmn1">
            <div class="row1">
                <div class="whiteBox" id="xdivInvoicelist" runat="server">
                    <asp:Literal ID="xlitPOList" runat="server"></asp:Literal>
                    <%--<a href="#" class="btnBlk immrt20">Raise Invoice</a>--%>
                </div>
                <div id="xdivInvoice" runat="server" visible="false">
                    <div class="whiteBox">
                        <%--<div class="compLogo">LOGO</div>--%>
                        <ul class="compDetails">
                            <li>Your Company Name</li>
                            <li>Name of the company:
                                <asp:Label ID="xlblSupplierName" runat="server"></asp:Label></li>
                            <li>Address:
                                <asp:Label ID="xlblSupplierAddress" runat="server"></asp:Label></li>
                            <%--<li>Email: <asp:Label ID="xlblSupplierEmail" runat="server"></asp:Label></li>--%>
                            <li style="width: 50%; float: left;">Pan:
                                <asp:Label ID="xlblSupplierPan" runat="server">-</asp:Label></li>
                            <li style="width: 50%; float: left;">Tin:
                                <asp:Label ID="xlblSupplierTin" runat="server">-</asp:Label></li>
                        </ul>
                        <br class="cl" />
                    </div>
                    <div class="greyBox">
                        <table border="0" cellpadding="0" cellspacing="0" class="deliveryInfo">
                            <tbody>
                                <tr>
                                    <th width="35%">Bill To</th>
                                    <th width="35%">Delivery To</th>
                                    <th width="30%">&nbsp;</th>
                                </tr>
                                <tr>
                                    <td width="35%"><b>Buyer Name</b><br />
                                        <asp:Label ID="xlblBuyerName" runat="server"></asp:Label></li>
                                    </td>
                                    <td width="35%"><b>Deliver To Name</b></td>
                                    <td width="30%"><b>Invoice Details</b></td>
                                </tr>
                                <tr>
                                    <td width="35%">Address:<br />
                                        <asp:Label ID="xlblCompAddress" runat="server"></asp:Label>
                                        <br />
                                        Tel :<asp:Label ID="xlblCompMobile" runat="server"> </asp:Label><%--, Fax : (456) 3456-1235,--%>
                                        <br />
                                        Email :<asp:Label ID="xlblCompEmail" runat="server"> </asp:Label>
                                        <br />
                                        <%--Website : www.yoursite.com--%></td>
                                    <td width="35%">Address:<br />
                                        <asp:Label ID="xlblShippingAddress" runat="server"></asp:Label>
                                        <br />
                                        Tel :
                                    <asp:Label ID="xlblDeliveryNo" runat="server"></asp:Label>
                                        <br />
                                        Email :
                                    <asp:Label ID="xlblDeliveryEmail" runat="server"></asp:Label>
                                        <br />
                                        <%--Website : www.yoursite.com--%></td>
                                    <td width="30%">Date
                                    <asp:Label ID="xlblDate" runat="server"></asp:Label><br />
                                        PO No:
                                    <asp:Label ID="xlblPoNo" runat="server"></asp:Label><br />
                                        Invoice No:
                                        <asp:Label ID="xlblInvoiceNo" runat="server"></asp:Label>
                                        <br />
                                        <%-- Your Ref#<br />
                                        Our Ref#<br />
                                        Credit Terms	Cash<br />--%>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                    <div class="immrt30">
                        <table border="0" cellpadding="0" cellspacing="0" class="billInfo">
                            <tbody>
                                <tr>
                                    <th style="width: 12%;">Product ID   </th>
                                    <th style="width: 40%">Description </th>
                                    <th style="width: 12%">Quantity</th>
                                    <th style="width: 12%">Units</th>
                                    <th style="width: 12%">Unit Price</th>
                                    <th style="width: 12%">Amount</th>
                                </tr>
                                <tr>
                                    <td style="width: 12%">
                                        <asp:Label ID="xlblCategory" runat="server"></asp:Label></td>
                                    <td style="width: 40%">
                                        <asp:Label ID="xlblProduct" runat="server"></asp:Label></td>
                                    <td style="width: 12%">
                                        <asp:Label ID="xlblQty" runat="server"></asp:Label></td>
                                    <td style="width: 12%">
                                        <asp:Label ID="xlblUOM" runat="server"></asp:Label></td>
                                    <td style="width: 12%">
                                        <asp:Label ID="xlblUnitPrice" runat="server"></asp:Label></td>
                                    <td style="width: 12%">
                                        <asp:Label ID="xlblTotalAmt" runat="server"></asp:Label></td>
                                </tr>
                                <tr id="xtrDeliveryImg" runat="server" visible="false">
                                    <td style="width: 12%;"></td>
                                    <td style="width: 40%">
                                        <asp:Label ID="Label1" runat="server"><img src="../images/stmp-deliver.jpg" /></asp:Label></td>
                                    <td style="width: 12%"></td>
                                    <td style="width: 12%"></td>
                                    <td style="width: 12%"></td>
                                    <td style="width: 12%"></td>
                                </tr>
                            </tbody>
                        </table>
                        <asp:Literal ID="xlitProductDet" runat="server"></asp:Literal>
                    </div>
                    <div class="immrt30">
                        <table border="0" cellpadding="0" cellspacing="0" class="subTotal">
                            <tbody>
                                <tr>
                                    <th width="80%">
                                        <p>Sub Total</p>
                                    </th>
                                    <th width="12%">
                                        <asp:Label ID="xlblSubtotal" runat="server"></asp:Label></th>
                                </tr>
                                <tr>
                                    <th width="80%">
                                        <p>Delivery Charges</p>
                                    </th>
                                    <th width="12%">
                                        <asp:Label ID="xlblDeliveryCharges" runat="server"></asp:Label>
                                    </th>
                                </tr>
                                <asp:Literal ID="xlitTaxPanel" runat="server"></asp:Literal>
                                <tr>
                                    <th width="80%">Total</th>
                                    <th width="12%">
                                        <p>
                                            <asp:Label ID="xlblNetAmt" runat="server"></asp:Label>
                                        </p>
                                    </th>
                                </tr>
                                <tr id="xtrTds" runat="server" visible="false">
                                    <th width="80%">TDS</th>
                                    <th width="12%">
                                        <p>
                                            <asp:TextBox ID="xtxtTds" runat="server" Style="width: 80%;" onkeydown="return IsDecimal(this);"
                                                autocomplete="off" onkeyup="javascript:ShowTotal();">0.00</asp:TextBox>
                                            <label id="xlblTds" runat="server" style="width: 80%;">0</label>
                                        </p>
                                    </th>
                                </tr>
                                <tr id="xtrPayAmt" runat="server" visible="false">
                                    <th width="80%">Invoice Total</th>
                                    <th width="12%">
                                        <p>
                                            <asp:Label ID="xlblPayAmt" runat="server"></asp:Label>
                                        </p>
                                    </th>
                                </tr>
                                <tr id="xtrDeliveryDate" runat="server" visible="false">
                                    <th width="80%">Delivery Date</th>
                                    <th width="12%">
                                        <p>
                                            <asp:Label ID="xlblDeliveryDate" runat="server"></asp:Label>
                                        </p>
                                    </th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="commentBlk">
                        Comments
                    <ul>
                        <li>Total Payment Due in 30 days</li>
                        <li>Please Include the invoice no. on your cheque.</li>
                    </ul>
                    </div>
                </div>
            </div>
            <asp:Button ID="btnShow" runat="server" class="btnBlk immrt20" OnClick="btnShow_Click" Style="display: none;" Value="show" />
            <asp:HiddenField ID="xhdnInvoice" runat="server" />
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
        </div>
    </div>
</asp:Content>

