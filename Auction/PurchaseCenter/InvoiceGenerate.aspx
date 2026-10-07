<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_PurchaseCenter_InvoiceGenerate, App_Web_invoicegenerate.aspx.750f10e" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <link href="../Styles/clockpicker.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            BindDatePicker();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            BindDatePicker();
        });
        function BindDatePicker() {
            $("#ContentPlaceHolder1_xtxtDeliveryDate").datepicker({
                defaultDate: '+1d',
                numberOfMonths: 2,
                dateFormat: 'dd/mm/yy'
            });
            $("#ContentPlaceHolder1_xtxtPayExpectedDate").datepicker({
                defaultDate: '+1d',
                numberOfMonths: 2,
                dateFormat: 'dd/mm/yy'
            });
        }

        function Setfocus(ctrl) {
            var val = $("#" + ctrl + "").val();
            if (val != undefined && (val == "" || val == "0.00")) {
                $("#" + ctrl + "").val('');
            }
        }

        function Hidefocus(ctrl) {
            var text = $("#" + ctrl + "").val();
            if (text != undefined && text == "") {
                $("#" + ctrl + "").val('0.00');
            }
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
                uNewTax += parseFloat($(taxVal[i]).val());
            }
            //  }
            unetAmt = uAmt + udelvry + uNewTax;
            $("#ContentPlaceHolder1_xlblNetAmt").text(unetAmt.toFixed(2));
        }

        function ValidateInvoice() {
            if ($("#ContentPlaceHolder1_xtxtInvoiceNo").val() == "") {
                $("#ContentPlaceHolder1_xtxtInvoiceNo").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtInvoiceNo"), "Please Enter Invoice No.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtDeliveryCharges").val() == "") {
                $("#ContentPlaceHolder1_xtxtDeliveryCharges").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtDeliveryCharges"), "Please Enter Delivery Charges.", "top");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtDeliveryDate").val() == "") {
                $("#ContentPlaceHolder1_xtxtDeliveryDate").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtDeliveryDate"), "Please Enter Delivery Date.", "top");
                return false;
            }
            ShowProgress();
            return true;
        }

        function validateBankDetails() {
            if ($("#ContentPlaceHolder1_xddlBank option:selected").index() <= "0") {
                $("#ContentPlaceHolder1_xddlBank").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlBank", "Please select Bank.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlBank").val() == "0") {
                if ($.trim($("#ContentPlaceHolder1_txtOtherBank").val()) == "") {
                    ShowToolTip($("#ContentPlaceHolder1_txtOtherBank"), "Please Enter Bank Name.", "top");
                    return false;
                }
            }
            else if ($("#ContentPlaceHolder1_xtxtBranch").val() == "") {
                $("#ContentPlaceHolder1_xtxtBranch").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtBranch"), "Please Enter Branch Name.", "top");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtIFSCCode").val() == "") {
                $("#ContentPlaceHolder1_xtxtIFSCCode").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtIFSCCode"), "Please Enter IFSC Code.", "top");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxACHolderName").val() == "") {
                $("#ContentPlaceHolder1_xtxACHolderName").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxACHolderName"), "Please Enter Account Holder Name.", "top");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlAccountType option:selected").index() <= "0") {
                $("#ContentPlaceHolder1_xddlAccountType").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlAccountType", "Please select Account Type.", "top");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtAccountNo").val() == "") {
                $("#ContentPlaceHolder1_xtxtAccountNo").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtAccountNo"), "Please Enter Account No.", "top");
                return false;
            }
            //ShowProgress();
            return true;
        }

        function ddlBank_change() {
            if ($("#ContentPlaceHolder1_xddlBank").val() == "0") {
                $('#ContentPlaceHolder1_DivOtherBank').attr("style", "display:block;");
            }
            else {
                $('#ContentPlaceHolder1_DivOtherBank').attr("style", "display:none;");
            }
        }

        function ShowDetails(Id) {
            $.ajax({
                type: 'POST',
                url: strUrl + 'PurchaseCenter/InvoiceGenerate.aspx/ShowDetails',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                success: function (msg) {
                    if (msg.d != null) {
                        window.location.href = msg.d;
                    }
                },
                error: ShowError
            });
        }
    </script>
    <asp:UpdatePanel ID="xupnlPurchaseInvoice" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="topBlk topBlkInn">
                <div class="fr">
                    <asp:LinkButton ID="xlnkbtnSubmit" runat="server" class="btnBlk" OnClick="xlnkbtnSubmit_Click" OnClientClick="javascript: return ValidateInvoice();">Submit</asp:LinkButton>
                    <asp:LinkButton ID="xlnkbtnDraft" runat="server" class="btnBlk" OnClick="xlnkbtnDraft_Click" OnClientClick="javascript: return ValidateInvoice();">Save Draft</asp:LinkButton>
                    <%--<a href="#" class="btnBlk">Print</a>--%>
                    <%--<asp:LinkButton ID="xlnkbtnClose" runat="server" class="btnBlk" OnClientClick="javascript:ShowProgress(true);" OnClick="xlnkbtnClose_Click">Back</asp:LinkButton>--%>
                </div>
                <br class="cl">
            </div>
            <div class="Newclmn1">
                <div class="row1">
                    <%-- <div class="whiteBox">
                        <div>
                        <asp:literal ID="xlitLogo" runat="server"></asp:literal>
                         </div>
                        <div class="leftClmn">
                            <label>Date</label>
                            <lable id="xlblDate" class="imw97p fontStyle" runat="server"></lable>
                            <label>Inovice no.</label>
                            <asp:TextBox ID="xtxtInvoiceNo" class="imw97p" runat="server"></asp:TextBox>
                            <label>Company name</label>
                            <asp:Label ID="xlblCompName" class="imw97p fontStyle" runat="server"></asp:Label>
                            <label>Product</label>
                            <asp:Label ID="xlblProduct" runat="server" class="imw97p fontStyle"></asp:Label>
                            <label>Quantity</label>
                            <asp:Label ID="xlblQty" runat="server" class="imw97p fontStyle"></asp:Label>
                            <label>Unit Price</label>
                            <asp:Label ID="xlblUnitPrice" runat="server" class="imw97p fontStyle"></asp:Label>
                            <label id="lblAmt" runat="server">Amount </label>
                            <asp:Label ID="xlblTotalAmt" runat="server" class="imw97p fontStyle"></asp:Label>
                            <label id="lblDelivery" runat="server">Delivery charges </label>
                            <asp:TextBox ID="xtxtDeliveryCharges" class="imw97p" runat="server" onkeydown="return IsDecimal(this);"
                                autocomplete="off" onkeyup="javascript:ShowTotal();">0.00</asp:TextBox>
                            <asp:Literal ID="xlitTaxPanel" runat="server"></asp:Literal>
                            <label id="lblNetAmt" runat="server">Net amount </label>
                            <asp:Label ID="xlblNetAmt" runat="server" class="imw97p fontStyle"></asp:Label>
                            <label>Comments</label>
                            <textarea id="xtxtComments" runat="server" placeholder="Comments" class="imw97p fontStyle" ></textarea> 
                        </div>
                        <div class="rightClmn">
                            <label>Invoice Document</label>
                            <ctrl:UploadFile ID="xctrlInvoice" runat="server" UserType="Vendor" UploadDocType="PurchaseInvoiceDoc"
                                UploadFileType="Doc" Caption="Upload Invoice Document" />
                            <div id="xdivDelivered" runat="server" visible="false">
                                <label>Delivered on</label>
                                <asp:TextBox ID="xtxtDeliveryDate" runat="server" class="imw97p"></asp:TextBox>
                            </div>
                            <label>Select Bank</label>
                            <div class="styled-select fl selOrganization">
                                <asp:DropDownList ID="xddlBank" runat="server" onchange="ddlBank_change();">
                                </asp:DropDownList>
                            </div>                            
                            <div id="DivOtherBank" runat="server" style="display: none;">
                                <label>Other Bank</label>
                                <asp:TextBox ID="txtOtherBank" runat="server" class="imw97p" autocomplete="off"></asp:TextBox>
                            </div>                            
                            <label>Branch</label>
                            <asp:TextBox ID="xtxtBranch" runat="server" class="imw97p"></asp:TextBox>
                            <label>IFSC Code</label>
                            <asp:TextBox ID="xtxtIFSCCode" runat="server" class="imw97p"></asp:TextBox>
                            <label>Account holder's name</label>
                            <asp:TextBox ID="xtxACHolderName" runat="server" onkeydown="return IsCharacter(event);" class="imw97p"></asp:TextBox>
                            <label>Account number</label>
                            <asp:TextBox ID="xtxtAccountNo" runat="server" onkeydown="return IsNumeric(event);" class="imw97p"></asp:TextBox>
                            <label>Account type</label>
                            <div class="styled-select fl selOrganization">
                                <asp:DropDownList ID="xddlAccountType" runat="server">
                                    <asp:ListItem Value="0" Text="  Select  "></asp:ListItem>
                                    <asp:ListItem Value="Saving A/c" Text="Saving A/c"></asp:ListItem>
                                    <asp:ListItem Value="Current A/c" Text="Current A/c"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <br class="cl" />
                    </div>--%>

                    <%-- <asp:UpdatePanel ID="xupnlBank" runat="server">
                                <ContentTemplate>--%>
                    <%-- </ContentTemplate>
                            </asp:UpdatePanel>--%>
                    <%-- <div class="greyBox">
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
                                        <td width="20%">P. O. No:
                                    <asp:Label ID="xlblPoNo" runat="server">10001</asp:Label><br />
                                            Date
                                    <%--<asp:Label ID="xlblDate" runat="server">10/17/2015</asp:Label><br />--%
                                            Invoice No:
                                    <%--<asp:TextBox ID="xtxtInvoiceNo" runat="server">10001</asp:TextBox><br />--%
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
                                        <th style="width: 12%">Unit Price</th>
                                        <th style="width: 12%">Amount</th>
                                    </tr>
                                    <tr>
                                        <td style="width: 12%">
                                            <asp:Label ID="xlblCategory" runat="server"></asp:Label></td>
                                        <td style="width: 40%">
                                            <%--<asp:Label ID="xlblProduct" runat="server"></asp:Label>--%</td>
                                        <td style="width: 12%">
                                            <%--<asp:Label ID="xlblQty" runat="server"></asp:Label>--%</td>
                                        <%--<td style="width:12%">Sets</td>--%
                                        <td style="width: 12%">
                                            <%--<asp:Label ID="xlblUnitPrice" runat="server"></asp:Label>--%</td>
                                        <td style="width: 12%">
                                            <%--<asp:Label ID="xlblTotalAmt" runat="server"></asp:Label>--%</td>
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
                                            <%--<asp:TextBox ID="xtxtDeliveryCharges" runat="server" onkeydown="return IsNumeric(event);"
                                                autocomplete="off" onkeyup="javascript:ShowTotal();">0</asp:TextBox>--%</th>
                                    </tr>
                                    <%--<tr>
                                <th width="80%">Freight</th>
                                <th width="12%">Rs. 0.00</th>
                            </tr>--%>
                    <%-- <asp:Literal ID="xlitTaxPanel" runat="server"></asp:Literal>--%
                                    <tr>
                                        <th width="80%">Invoice Total</th>
                                        <th width="12%">
                                            <p>
                                                <%-- <asp:Label ID="xlblNetAmt" runat="server"></asp:Label>--%
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
                            </tr>--%
                                    <tr id="xtrDeliveryDate" runat="server" visible="false">
                                        <th width="80%">
                                            <p>Delivery Date</p>
                                        </th>
                                        <th width="12%">
                                            <%--  <asp:TextBox ID="xtxtDeliveryDate" runat="server">05/01/2016</asp:TextBox>--%</th>
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
                                            <%--<asp:DropDownList ID="xddlBank" runat="server" Style="width: 95%">
                                            </asp:DropDownList>--%
                                        </th>
                                    </tr>
                                    <tr>
                                        <th width="80%">
                                            <p>Branch</p>
                                        </th>
                                        <th width="12%">
                                            <%--<asp:TextBox ID="xtxtBranch" runat="server"></asp:TextBox>--%</th>
                                    </tr>
                                    <tr>
                                        <th width="80%">
                                            <p>IFSC Code</p>
                                        </th>
                                        <th width="12%">
                                            <%--<asp:TextBox ID="xtxtIFSCCode" runat="server"></asp:TextBox>--%</th>
                                    </tr>
                                    <tr>
                                        <th width="80%">
                                            <p>Account Holder's Name</p>
                                        </th>
                                        <th width="12%">
                                            <%--<asp:TextBox ID="xtxACHolderName" runat="server"></asp:TextBox>--%</th>
                                    </tr>
                                    <tr>
                                        <th width="80%">
                                            <p>Account NO</p>
                                        </th>
                                        <th width="12%">
                                            <%--<asp:TextBox ID="xtxtAccountNo" runat="server"></asp:TextBox>--%</th>
                                    </tr>
                                    <tr>
                                        <th width="80%">
                                            <p>Account Type</p>
                                        </th>
                                        <th width="12%">
                                            <%--<asp:DropDownList ID="xddlAccountType" runat="server">
                                                <asp:ListItem Value="0" Text="  Select  "></asp:ListItem>
                                                <asp:ListItem Value="Saving A/c" Text="Saving A/c"></asp:ListItem>
                                                <asp:ListItem Value="Current A/c" Text="Current A/c"></asp:ListItem>
                                            </asp:DropDownList>--%

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
                        </div>--%>

                    <div class="whiteBox brdPink" id="DivInvoiceDetails" runat="server">
                        <table align="center" class="invoicetable" border="0" cellspacing="0" cellpadding="0">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <table width='100%' border='0' cellspacing='0' cellpadding='0'>
                                            <tbody>
                                                <div class="billLogo">
                                                    <img id="img1" runat="server" src="~/images/renepay-bill-logo.png">
                                                    <asp:Literal ID="xlitLogo" runat="server"></asp:Literal>
                                                </div>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="brttop">
                                    <td colspan="2">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <td width="39%">
                                                        <p class="colBlue fontMed">Bill To</p>
                                                        <label id="xlblCompName" runat="server"></label>
                                                        <%--class="imw100p"--%>
                                                        <label id="xlblCompAddress" runat="server"></label>
                                                        <label class="fl">Mobile:&nbsp;</label>
                                                        <label id="xlblComMobile" runat="server"></label>
                                                        <label class="fl">Email:&nbsp;</label>
                                                        <label id="xlblCompEmail" runat="server"></label>
                                                    </td>
                                                    <td width="39%">
                                                        <p class="colBlue fontMed">Bill From</p>
                                                        <label id="xlblSupplierName" runat="server"></label>
                                                        <label id="xlblSuppAddress" runat="server"></label>
                                                        <label class="fl">Mobile:&nbsp;</label>
                                                        <label id="xlblSupplierMobile" runat="server"></label>
                                                        <label class="fl">Email:&nbsp;</label>
                                                        <label id="xlblSupplierEmail" runat="server"></label>
                                                    </td>
                                                    <td width="22%" align="right" class="colBlue fontBig txtCenter" valign="top">Invoice </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="brttop">
                                    <td width="49%" valign="top" rowspan="2">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                                <tr id="xtrPOTypeDet" runat="server">
                                                    <td width="40%">
                                                        <label id="lblPOType" runat="server" class="colBlue"></label>
                                                    </td>
                                                    <td width="60%">
                                                        <label id="lblPOTypeId" runat="server"></label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="40%" class="colBlue">Invoice No<br>
                                                    </td>
                                                    <td width="60%">
                                                        <asp:TextBox ID="xtxtInvoiceNo" class="imw100p" runat="server"></asp:TextBox>
                                                        <br>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="40%" class="colBlue">Invoice Date<br>
                                                    </td>
                                                    <td width="60%">
                                                        <lable id="xlblDate" runat="server" style="text-wrap: normal"></lable>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="40%" class="colBlue">P.O. No.
                                                    </td>
                                                    <td width="60%">
                                                        <lable id="xlblPONo" runat="server"></lable>
                                                    </td>
                                                </tr>
                                                <tr id="xdivDelivered" runat="server" visible="false">
                                                    <td width="40%" class="colBlue">Delivered on</td>
                                                    <td width="60%">
                                                        <div class="iconCal">
                                                            <i class="fa fa-calendar" aria-hidden="true"></i>
                                                            <asp:TextBox ID="xtxtDeliveryDate" runat="server" CssClass="selDate icnCal imw100p"></asp:TextBox>
                                                            <%--class="imw97p"--%>
                                                        </div>
                                                        <br>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="40%" class="colBlue">Credit Period (Days)</td>
                                                    <td width="60%">
                                                        <label id="xlblCreditPeriod" runat="server"></label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="40%" class="colBlue">Payment Due Date</td>
                                                    <td width="60%">
                                                        <div class="iconCal">
                                                            <i class="fa fa-calendar" aria-hidden="true"></i>
                                                            <asp:TextBox ID="xtxtPayExpectedDate" runat="server" CssClass="selDate icnCal imw100p"></asp:TextBox>
                                                        </div>
                                                        <br>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="40%" class="colBlue">TIN:</td>
                                                    <td width="60%">
                                                        <label id="xlblSupplierTin" runat="server"></label>
                                                    </td>
                                                </tr>
                                                <tr id="xtrInvoiceDoc" runat="server">
                                                    <td width="30%" class="colBlue">Invoice Document</td>
                                                    <td width="70%">
                                                        <ctrl:UploadFile ID="xctrlInvoice" runat="server" UserType="VND" UploadDocType="PurchaseInvoiceDoc"
                                                            UploadFileType="Doc" Caption="Upload" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="brttop">
                                    <%--<td width="51%" class="brtleft">&nbsp;</td>--%>
                                    <td width="51%" class="brtleft" valign="top">
                                        <%-- <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                                    <tr>
                                                        <td width="50%" class="colBlue">Select Bank</td>
                                                        <td>                                                
                                                         <div class="formRow1 imw100p">
                                                             <div class="imw100p bgGrey fl">
                                                                 <div  class="styled-select selOrganization" >  
                                                                    <asp:DropDownList ID="xddlBank" runat="server" onchange="ddlBank_change();"></asp:DropDownList>                                                                            
                                                                 </div>
                                                             </div>
                                                         </div>                                                                                            
                                                        </td>
                                                    </tr>
                                                    <tr id="DivOtherBank"  runat="server" style="display:none">
                                                      <td width="50%" class="colBlue">Other Bank<br></td>
                                                        <td width="50%">
                                                         <asp:TextBox ID="txtOtherBank" runat="server" class="imw97p" autocomplete="off"></asp:TextBox>
                                                       <br></td>
                                                    </tr>
                                                    <tr>
                                                      <td width="50%" class="colBlue">Branch<br></td>
                                                        <td width="50%">
                                                         <asp:TextBox ID="xtxtBranch" runat="server" class="imw100p"></asp:TextBox>
                                                       <br></td>
                                                    </tr>
                                                    <tr>
                                                      <td width="50%" class="colBlue">IFSC Code<br></td>
                                                        <td width="50%">
                                                         <asp:TextBox ID="xtxtIFSCCode" runat="server" class="imw100p"></asp:TextBox>
                                                       <br></td>
                                                    </tr>
                                                    <tr>
                                                      <td width="50%" class="colBlue">Account holder's name<br></td>
                                                        <td width="50%">
                                                           <asp:TextBox ID="xtxACHolderName" runat="server" MaxLength="50"
                                                                    onkeydown="return IsCharacter(event);" class="imw100p"></asp:TextBox>
                                                       <br></td>
                                                    </tr>                                                                               
                                                    <tr>
                                                      <td width="50%" class="colBlue"> Account number<br></td>
                                                       <td width="50%">
                                                           <asp:TextBox ID="xtxtAccountNo" runat="server"
                                                                    onkeydown="return IsNumeric(event);" class="imw100p"></asp:TextBox>

                                                       </td>
                                                    </tr>   
                                                    <tr>
                                                         <td width="50%" class="colBlue"> Account type</td>
                                                        <td>                                                
                                                         <div class="formRow1 imw100p">
                                                             <div class="imw100p bgGrey fl">
                                                                 <div  class="styled-select selOrganization" >    
                                                                    <asp:DropDownList ID="xddlAccountType" runat="server">
                                                                <asp:ListItem Value="0" Text="  Select  "></asp:ListItem>
                                                                <asp:ListItem Value="Saving A/c" Text="Saving A/c"></asp:ListItem>
                                                                <asp:ListItem Value="Current A/c" Text="Current A/c"></asp:ListItem>
                                                            </asp:DropDownList>
                                                                 </div>
                                                             </div>
                                                         </div>                                                                                            
                                                        </td>
                                                    </tr>
                                            </tbody>
                                        </table>--%>
                                    </td>

                                </tr>
                                <tr class="brttop">
                                    <td colspan="2"><%--style="background:#eee;"--%>
                                        <table width="100%" class="billInfo" border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <th style="width: 25%;">Product </th>
                                                    <th style="width: 25%">Category </th>
                                                    <th style="width: 12%">Quantity</th>
                                                    <th style="width: 12%">Units</th>
                                                    <th style="width: 12%">
                                                        <label id="lblUnitPrice" runat="server">Unit Price</label></th>
                                                    <th style="width: 12%">
                                                        <label id="lblAmt" runat="server">Amount </label>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <td style="width: 26%">
                                                        <asp:Label ID="xlblProduct" runat="server" Style="text-wrap: normal"></asp:Label></td>
                                                    <td style="width: 26%">
                                                        <asp:Label ID="xlblCategory" runat="server" class="imw100p"></asp:Label></td>
                                                    <td style="width: 12%">
                                                        <asp:Label ID="xlblQty" runat="server" class="imw100p"></asp:Label></td>
                                                    <td style="width: 12%">
                                                        <asp:Label ID="xlblUnits" runat="server" class="imw100p"></asp:Label></td>
                                                    <td style="width: 12%">
                                                        <asp:Label ID="xlblUnitPrice" runat="server" class="imw100p"></asp:Label></td>
                                                    <td style="width: 12%">
                                                        <asp:Label ID="xlblTotalAmt" runat="server" class="imw100p"></asp:Label></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="brttop">
                                    <td height="121" style="display: none">&nbsp;</td>
                                    <td>
                                        <td rowspan="2">
                                            <table width="100%" align="right" border="0" cellspacing="0" cellpadding="0">
                                                <tbody>
                                                    <tr>
                                                        <td width="49%" align="right" class="colBlue">
                                                            <label id="lblTotal" class="colBlue" runat="server">Total </label>
                                                        </td>
                                                        <td width="51%" align="right">
                                                            <asp:Label ID="xlblTotal" runat="server"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="49%" align="right" class="colBlue">
                                                            <label id="lblDelivery" class="colBlue" runat="server">Delivery charges </label>
                                                        </td>
                                                        <td width="51%" align="right">
                                                            <asp:TextBox ID="xtxtDeliveryCharges" class="imw100p" runat="server" Style="text-align: right" onkeydown="return IsDecimal(this);"
                                                                autocomplete="off" onkeyup="javascript:ShowTotal();">0.00</asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <asp:Literal ID="xlitTaxPanel" runat="server"></asp:Literal>
                                                    <tr id="xtrPayAmt" runat="server">
                                                        <td width="49%" height="30" align="right" class="bgBlue fontMed">
                                                            <label id="lblNetAmt" runat="server" class="bgBlue fontMed">Net Amount </label>
                                                        </td>
                                                        <td width="51%" height="30" align="right" class="bgBlue fontMed">
                                                            <asp:Label ID="xlblNetAmt" runat="server" class="bgBlue fontMed"></asp:Label>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </td>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="bottom"><span style="width: 40%"><span id="ContentPlaceHolder1_xlblProduct2">Thanks for your business.</span></span></td>
                                </tr>
                                <tr class="brttop">
                                    <td colspan="2"><a class="colBlue" href="#">Terms &amp; Conditions</a></td>
                                </tr>
                                <tr class="brttop">
                                    <td colspan="2">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <%--<td width="12%">Remarks:</td>--%>
                                                    <%--<td width="88%"><p> <span id="ContentPlaceHolder1_xlblComments">Please pay within a week</span></p></td>--%>
                                                    <td width="100%">
                                                        <textarea id="xtxtComments" runat="server" placeholder="Remarks" class="imw100p"></textarea>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <br class="cl" />
            </div>

            <!--help panel start here-->
            <div class="btn-help btnHelper">
                <img src="../images/icn-help.png" />
            </div>
            <div class="helpBlockAll"></div>
            <div class="fr helpBlk helpBlkInn srh-help helpSlide">
                <!-- faq start here -->
                <ctrl:FAQ ID="xFAQ" runat="server" />
                <!-- faq end here -->
                <!-- chat start here -->
                <div class="chatBlk">
                    <div class="panel-group" id="chataccordionRenepay">
                        <ctrl:Feedback ID="xFBK" runat="server" Data_Parent="chataccordionRenepay" />
                    </div>
                </div>
                <!-- chat end here -->
            </div>
            <!--help panel end here-->
            <div class="modal fade" id="divConfirm" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="btnClose" runat="server" class="close"
                                onclick="javascript:link_click('H');">
                                &times;</button>
                            <h4 class="modal-title" id="H1">Congratulations!</h4>
                        </div>
                        <div class="modal-body">
                            <p id="pRegMsg" runat="server">
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="divBankConfirm" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="btncl" class="close"
                                data-dismiss="modal">
                                &times;</button>
                            <h4 class="modal-title" id="H2">Bank details confirmation</h4>
                        </div>
                        <div class="modal-body">
                            <p id="p1" runat="server">
                                <%--confirm bank details else payment will be delayed by 4 days.--%>
                                <%--Please double check your bank account details.--%>
                                        Please confirm bank details so that we can process the payment.
                            </p>
                            <br class="cl">
                            <div class="buyRegis innerBxbody whiteBox">
                                <div class="formRow">
                                    <label>Select Bank</label>
                                    <div class="formRow1">
                                        <div class="imw48p fl bgGrey">
                                            <div class="styled-select selOrganization">
                                                <asp:DropDownList ID="xddlBank" runat="server" onchange="ddlBank_change();"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div id="DivOtherBank" runat="server" style="display: none">
                                            <asp:TextBox ID="txtOtherBank" runat="server" CssClass="imw48p" autocomplete="off"></asp:TextBox>
                                            <%--class="imw97p"--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>IFSC Code</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtIFSCCode" runat="server" CssClass="imw48p" placeholder="IFSC Code"></asp:TextBox>
                                        <asp:TextBox ID="xtxtBranch" runat="server" CssClass="imw48p fr" placeholder="Branch Name" MaxLength="50"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Account holder</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxACHolderName" runat="server" CssClass="imw100p" MaxLength="50" onkeydown="return IsCharacter(event);"
                                            placeholder="Account Holder"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Account type</label>
                                    <div class="formRow1">
                                        <div class="imw48p fl bgGrey">
                                            <div class="styled-select selOrganization">
                                                <asp:DropDownList ID="xddlAccountType" runat="server">
                                                    <asp:ListItem Value="0" Text="  Select  "></asp:ListItem>
                                                    <asp:ListItem Value="Saving A/c" Text="Saving A/c"></asp:ListItem>
                                                    <asp:ListItem Value="Current A/c" Text="Current A/c"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <asp:TextBox ID="xtxtAccountNo" runat="server" onkeydown="return IsNumeric(event);" CssClass="imw48p fr" MaxLength="30" placeholder="Account Number"></asp:TextBox>
                                    </div>
                                </div>
                                <br class="cl">
                                <asp:Literal ID="xlitBank" runat="server"></asp:Literal>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <a class="btnRed" href="#" id="lnkConfirmBank" runat="server"
                                onclick="if(validateBankDetails()){HideModalBox('#divBankConfirm'); ShowProgress();}else{return false}"
                                onserverclick="lnkConfirmBank_Click">CONFIRM</a>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="xhdnTotalTax" runat="server" />
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

