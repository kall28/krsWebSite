<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Deals_DealPO, App_Web_dealpo.aspx.1c5f8e60" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">

        function ShowTotal() {
            
            (document.getElementById('ContentPlaceHolder1_txtTotalAmount')).value = '';

            var uPrice = 0;
            var qty = 0;
            var total = 0;
            var minqty = 0;

            if ((document.getElementById('ContentPlaceHolder1_HiddenFieldMinQty')).value != "") {
                minqty = parseFloat((document.getElementById('ContentPlaceHolder1_HiddenFieldMinQty')).value);

                if ((document.getElementById('ContentPlaceHolder1_txtQty')).value != "") {
                    qty = parseFloat((document.getElementById('ContentPlaceHolder1_txtQty')).value);
                }
                if (qty < minqty) {
                    ShowToolTip((document.getElementById('ContentPlaceHolder1_txtQty')), "Please enter minimum quantity " + minqty, "bottom");
                }
                else {

                    if ((document.getElementById('ContentPlaceHolder1_txtUnitPrice')).value != "") {
                        uPrice = parseFloat((document.getElementById('ContentPlaceHolder1_txtUnitPrice')).value);
                    }

                    if ((document.getElementById('ContentPlaceHolder1_txtQty')).value != "") {
                        qty = parseFloat((document.getElementById('ContentPlaceHolder1_txtQty')).value);
                    }

                    total = qty * uPrice;

                    if (!isNaN(total)) {
                        document.getElementById('ContentPlaceHolder1_txtTotalAmount').value = total;
                    }


                }
            }

        }

        function lnkbtnSubmit_Click() {
            var qty = 0;
            var minqty = 0;

            //alert((document.getElementById('ContentPlaceHolder1_txtQty')).value);

            //alert($("#ContentPlaceHolder1_txtQty").val());

            if ((document.getElementById('ContentPlaceHolder1_txtQty')).value == "") {
                (document.getElementById('ContentPlaceHolder1_txtQty')).focus();
                ShowToolTip((document.getElementById('ContentPlaceHolder1_txtQty')), "Please enter quantity.", "bottom");
                return false;
            }
            else if ((document.getElementById('ContentPlaceHolder1_HiddenFieldMinQty')).value != "") {
                minqty = parseFloat((document.getElementById('ContentPlaceHolder1_HiddenFieldMinQty')).value);

                qty = parseFloat((document.getElementById('ContentPlaceHolder1_txtQty')).value);

                if (isNaN(qty)) {
                    qty = 0;
                }

                if (qty < minqty) {
                    ShowToolTip((document.getElementById('ContentPlaceHolder1_txtQty')), "Please enter minimum quantity " + minqty, "bottom");
                    return false;
                }
            }
            else {
            }

            if ((document.getElementById('ContentPlaceHolder1_xtxtFirstName')).value == "") {
                (document.getElementById('ContentPlaceHolder1_xtxtFirstName')).focus();
                ShowToolTip((document.getElementById('ContentPlaceHolder1_xtxtFirstName')), "Please enter your first name.", "bottom");
                return false;
            }
            else if ((document.getElementById('ContentPlaceHolder1_xtxtLastName')).value == "") {
                (document.getElementById('ContentPlaceHolder1_xtxtLastName')).focus();
                ShowToolTip((document.getElementById('ContentPlaceHolder1_xtxtLastName')), "Please enter your last name.", "bottom");
                return false;
            }
            else if ((document.getElementById('ContentPlaceHolder1_xtxtMobileNo')).value == "") {
                (document.getElementById('ContentPlaceHolder1_xtxtMobileNo')).focus();
                ShowToolTip((document.getElementById('ContentPlaceHolder1_xtxtMobileNo')), "Please enter mobile number.", "bottom");
                return false;
            }
            else if ((document.getElementById('ContentPlaceHolder1_xtxtEmail')).value == "") {
                (document.getElementById('ContentPlaceHolder1_xtxtEmail')).focus();
                ShowToolTip((document.getElementById('ContentPlaceHolder1_xtxtEmail')), "Please enter email address.", "bottom");
                return false;
            }
            else if (!validateEmail((document.getElementById('ContentPlaceHolder1_xtxtEmail')).value)) {
                (document.getElementById('ContentPlaceHolder1_xtxtEmail')).focus();
                ShowToolTip((document.getElementById('ContentPlaceHolder1_xtxtEmail')), "Please enter correct email address", "bottom");
                return false;
            }
            else if ((document.getElementById('ContentPlaceHolder1_xtxtDeliveryAdd')).value == "") {
                (document.getElementById('ContentPlaceHolder1_xtxtDeliveryAdd')).focus();
                ShowToolTip((document.getElementById('ContentPlaceHolder1_xtxtDeliveryAdd')), "Please enter delivery address.", "bottom");
                return false;
            }

            ShowProgress(true);
            return true;
        }

    </script>

    <div class="main supplier">
        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="<span id='spnCap'> Please Enter Your Details </span>"></asp:Literal>
            </div>
            <br class="cl"/>
        </div>
        <div class="row1">
            <div class="whiteBox" id="confirm" runat="server">

                        <div class="leftClmn">
                            <label>Date</label>
                            <asp:TextBox ID="xtxtDate" runat="server" CssClass="imw97p" ReadOnly="true" ></asp:TextBox>
                            <label>Order Number</label>
                            <asp:TextBox ID="xtxtOrderNumber" runat="server" CssClass="imw97p" ReadOnly="true"></asp:TextBox>
                            <label>Product Details</label>
                            <asp:TextBox ID="xtxtProductDetail" runat="server" CssClass="imw97p" ReadOnly="true"></asp:TextBox>
                            <label>Brand</label>
                            <asp:TextBox ID="xtxtBrand" runat="server" CssClass="imw97p" ReadOnly="true"></asp:TextBox>
                            <label>Supplier Name</label>
                            <asp:TextBox ID="xtxtSupplierName" runat="server" CssClass="imw97p" ReadOnly="true"></asp:TextBox>
                            <label>Supplier Address</label>
                            <asp:TextBox ID="xtxtSupplierAdd" runat="server" TextMode="MultiLine" CssClass="imw97p" ReadOnly="true"></asp:TextBox>
                            <asp:HiddenField ID="HiddenFieldMinQty" runat="server" />
                            <asp:HiddenField ID="HiddenFieldConfigId" runat="server" />
                            <%--<asp:LinkButton ID="xbtnPreview" runat="server" class="btnBlk immrt30" OnClick="btnPreview_Click" OnClientClick="javascript: return lnkbtnSubmit_Click();">SUBMIT</asp:LinkButton>--%>
                            <asp:LinkButton ID="xbtnPreview" runat="server" class="btnBlk immrt30" OnClick="btnPreview_Click" OnClientClick="javascript: return lnkbtnSubmit_Click();" >SUBMIT</asp:LinkButton>
                        </div>

                        <div class="rightClmn">
                            <table class="imw97p">
                                <tr>
                                <td>
                                    <label>Quantity</label>
                                    <input type="text" autocomplete="off" id="txtQty" runat="server" class="imw95p" onkeyup="javascript:ShowTotal();" maxlength="4" onkeydown="return IsNumeric(event);" />
                                </td>
                                <td>
                                    <label>Unit Price</label>
                                    <input type="text" autocomplete="off" id="txtUnitPrice" class="imw95p" runat="server"  readonly="readonly" />
                                </td>
                                <td>
                                    <label>Total Amount</label>
                                    <input type="text" autocomplete="off" id="txtTotalAmount" class="imw95p" runat="server" readonly="readonly" />
                                </td>
                                </tr>
                            </table>
                            <label>First Name</label>
                            <asp:TextBox ID="xtxtFirstName" runat="server" CssClass="imw97p" onkeypress="return RestrictText(event);" MaxLength="50" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Last Name</label>
                            <asp:TextBox ID="xtxtLastName" runat="server" CssClass="imw97p" onkeypress="return RestrictText(event);" MaxLength="50" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Contact Number</label>
                            <asp:TextBox ID="xtxtMobileNo" runat="server" CssClass="imw97p" onkeydown="return IsNumeric(event);" maxlength="10" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Email Address</label>
                            <asp:TextBox ID="xtxtEmail" runat="server" CssClass="imw97p" maxlength="30" ondrop="return false;" autocomplete="off"></asp:TextBox>
                            <label>Delivery Address</label>
                            <asp:TextBox ID="xtxtDeliveryAdd" runat="server" CssClass="imw97p" onkeypress="return RestrictText(event);" MaxLength="100" TextMode="MultiLine" ondrop="return false;" autocomplete="off"></asp:TextBox>
                        </div>
                        
                <br class="cl">
            </div>

            <div class="whiteBox" id="successDiv" runat="server" visible="false">
                Thank you for placing your order! We will process it as soon as we reach the target order for this deal. We will keep you informed on your order progress.
                <br class="cl" />
                <asp:LinkButton ID="xbtnOk" runat="server" class="btnBlk immrt30" OnClick="btnOK_Click" >OK</asp:LinkButton>
            </div>

            <div class="whiteBox" id="FailDiv" runat="server" visible="false">
                    Purchase order not created.
                    <br class="cl" />
                <asp:LinkButton ID="xbtnFOk" runat="server" class="btnBlk immrt30" OnClick="btnFOk_Click" >OK</asp:LinkButton>
            </div>
                    
        </div>
    </div>

</asp:Content>