<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_PurchaseCenter_InvoiceDrafted, App_Web_invoicedrafted.aspx.750f10e" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });
        function Show(Id) {
            $("#ContentPlaceHolder1_xhdnInvoice").val(Id);
            $("#ContentPlaceHolder1_btnShow").click();
        }
        function ShowTotal() {
            var uAmt = 0;
            var Unitprice = 0;
            var udelvry = 0;
            var uTDS = 0;
            var unetAmt = 0;
            var uNewTax = 0;
            var Qty = 0
            var taxType = $('[name=hdnType]');
            var taxVal = $('[name=spnVal]');
            if ($("#ContentPlaceHolder1_xlblUnitPrice").text() != "") {
                Unitprice = parseFloat($("#ContentPlaceHolder1_xlblUnitPrice").text());
            }

            if ($("#ContentPlaceHolder1_xlblQty").text() != "") {
                Qty = parseFloat($("#ContentPlaceHolder1_xlblQty").text());
            }
            uAmt = Unitprice * Qty;

            if (parseInt($("#ContentPlaceHolder1_xtxtDeliveryCharges").val()) > 0) {
                udelvry = parseFloat($("#ContentPlaceHolder1_xtxtDeliveryCharges").val());
            }
            //            for (var i = 0; i < taxType.length; i++) {
            //                if (parseInt($(taxVal[i]).val()) > 0) {
            //                    switch ($(taxType[i]).val()) {
            //                        case "P":
            //                            uNewTax += (uAmt * parseInt($(taxVal[i]).val())) / 100;
            //                            break;
            //                        case "A":
            //                            uNewTax += parseInt($(taxVal[i]).val());
            //                            break;
            //                    }
            //                }
            // }
            //            if (taxVal!=null)
            //            {
            for (var i = 0; i < taxVal.length; i++) {
                uNewTax += parseInt($(taxVal[i]).val());
            }
            //  }
            unetAmt = uAmt + udelvry + uNewTax;
            $("#ContentPlaceHolder1_xlblNetAmt").text(unetAmt);
        }
    </script>
    <div class="topBlk topBlkInn">
        <div class="fr">
            <asp:LinkButton ID="xlnkbtnSubmit" runat="server" Visible="false" class="btnBlk" OnClick="xlnkbtnSubmit_Click">Save</asp:LinkButton>
            <asp:LinkButton ID="xlnkbtnDraft" runat="server" Visible="false" class="btnBlk" OnClick="xlnkbtnDraft_Click">Draft</asp:LinkButton>
        </div>
        <br class="cl" />
    </div>
    <div class="clmn1">
        <div class="row1">
            <div class="whiteBox immrt10" id="xdivInvoicelist" runat="server">
                <asp:Literal ID="xlitInvoiceList" runat="server"></asp:Literal>
                <%--<a href="#" class="btnBlk immrt20">Raise Invoice</a>--%>
            </div>
            <div id="xdivInvoice" runat="server" visible="false">
                <div class="whiteBox">
                    <div class="compLogo">LOGO</div>
                    <ul class="compDetails">
                        <li>Your Company Name</li>
                        <li>Name of the company: XYZ</li>
                        <li>Address: XYZ</li>
                        <li>Website: www.xyz.com</li>
                    </ul>
                    <br class="cl">
                </div>
                <div class="greyBox">
                    <table border="0" cellpadding="0" cellspacing="0" class="deliveryInfo">
                        <tbody>
                            <tr>
                                <th width="40%">Bill To</th>
                                <th width="40%">Delivery To</th>
                                <th width="20%">&nbsp;</th>
                            </tr>
                            <tr>
                                <td width="40%"><b>Buyer Name</b></td>
                                <td width="40%"><b>Deliver To Name</b></td>
                                <td width="20%"><b>Buyer Name</b></td>
                            </tr>
                            <tr>
                                <td width="40%">Address:<br />
                                    <asp:Label ID="xlblCompAddress" runat="server">Street Address, City, State Postcode, Country</asp:Label>
                                    <br />
                                    Tel :<asp:Label ID="xlblCompMobile" runat="server"> (456) 3456-1234</asp:Label>, Fax : - ,
                                    <br />
                                    Email :<asp:Label ID="xlblCompEmail" runat="server"> - </asp:Label>
                                    <br />
                                    Website : - </td>
                                <td width="40%">Address:<br />
                                    <asp:Label ID="xlblSuppAddress" runat="server">Street Address, City, State Postcode, Country</asp:Label>
                                    <br />
                                    Tel :
                                    <asp:Label ID="xlblSuppMobile" runat="server">(456) 3456-1234, Fax</asp:Label>
                                    : (456) 3456-1235,
                                    <br />
                                    Email :
                                    <asp:Label ID="xlblSuppEmail" runat="server">-</asp:Label>
                                    <br />
                                    Website : - </td>
                                <td width="20%">PONo:
                                    <asp:Label ID="xlblPoNo" runat="server">10001</asp:Label><br />
                                    Date
                                    <asp:Label ID="xlblDate" runat="server">10/17/2015</asp:Label><br />
                                    Invoice No:
                                    <asp:TextBox ID="xtxtInvoiceNo" runat="server">10001</asp:TextBox><br />
                                    Your Ref#<br />
                                    Our Ref#<br />
                                    Credit Terms	Cash<br />
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
                                <%--<th style="width:12%">UM</th>--%>
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
                                <%--<td style="width:12%">Sets</td>--%>
                                <td style="width: 12%">
                                    <asp:Label ID="xlblUnitPrice" runat="server"></asp:Label></td>
                                <td style="width: 12%">
                                    <asp:Label ID="xlblTotalAmt" runat="server"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
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
                                    <asp:TextBox ID="xtxtDeliveryCharges" runat="server" onkeydown="return IsNumeric(event);"
                                        autocomplete="off" onkeyup="javascript:ShowTotal();"></asp:TextBox></th>

                            </tr>
                            <%--<tr>
                                <th width="80%">Freight</th>
                                <th width="12%">Rs. 0.00</th>
                            </tr>--%>
                            <asp:Literal ID="xlitTaxPanel" runat="server"></asp:Literal>
                            <tr>
                                <th width="80%">Invoice Total</th>
                                <th width="12%">
                                    <p>
                                        <asp:Label ID="xlblNetAmt" runat="server"></asp:Label>
                                    </p>
                                </th>
                            </tr>
                            <%--<tr>
                                <th width="80%">Amount Paid</th>
                                <th width="12%">Rs. 0.00</th>
                            </tr>
                            <tr>
                                <th width="80%">Balance Due<br>
                                </th>
                                <th width="12%">Rs. 3,600.00</th>
                            </tr>--%>
                            <tr id="xtrDeliveryDate" runat="server" visible="false">
                                <th width="80%">
                                    <p>Delivery Date</p>
                                </th>
                                <th width="12%">
                                    <asp:TextBox ID="xtxtDeliveryDate" runat="server">05/01/2016</asp:TextBox></th>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="immrt30">
                    <table border="0" cellpadding="0" cellspacing="0" class="subTotal">
                        <tbody>
                            <h3>Bank Details</h3>
                            <tr>
                                <th width="80%">
                                    <p>Bank Name</p>
                                </th>
                                <th width="12%">
                                    <%--<asp:TextBox ID="xtxtBankName" runat="server"></asp:TextBox>--%>
                                    <asp:DropDownList ID="xddlBank" runat="server" Style="width: 95%">
                                    </asp:DropDownList>
                                </th>
                            </tr>
                            <tr>
                                <th width="80%">
                                    <p>Branch</p>
                                </th>
                                <th width="12%">
                                    <asp:TextBox ID="xtxtBranch" runat="server"></asp:TextBox></th>
                            </tr>
                            <tr>
                                <th width="80%">
                                    <p>IFSC Code</p>
                                </th>
                                <th width="12%">
                                    <asp:TextBox ID="xtxtIFSCCode" runat="server">AC12345</asp:TextBox></th>
                            </tr>
                            <tr>
                                <th width="80%">
                                    <p>Account Holder's Name</p>
                                </th>
                                <th width="12%">
                                    <asp:TextBox ID="xtxACHolderName" runat="server">Akash</asp:TextBox></th>
                            </tr>
                            <tr>
                                <th width="80%">
                                    <p>Account NO</p>
                                </th>
                                <th width="12%">
                                    <asp:TextBox ID="xtxtAccountNo" runat="server">1234567890</asp:TextBox></th>
                            </tr>
                            <tr>
                                <th width="80%">
                                    <p>Account Type</p>
                                </th>
                                <th width="12%">
                                    <%--<asp:TextBox ID="xtxtAccType" runat="server">Current A/C</asp:TextBox>--%>
                                    <asp:DropDownList ID="xddlAccountType" runat="server">
                                        <asp:ListItem Value="0" Text="  Select  "></asp:ListItem>
                                        <asp:ListItem Value="Saving A/c" Text="Saving A/c"></asp:ListItem>
                                        <asp:ListItem Value="Current A/c" Text="Current A/c"></asp:ListItem>
                                    </asp:DropDownList>

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
        <asp:HiddenField ID="xhdnTotalTax" runat="server" />
        <asp:HiddenField ID="xhdnInvoice" runat="server" />
        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
    </div>
</asp:Content>

