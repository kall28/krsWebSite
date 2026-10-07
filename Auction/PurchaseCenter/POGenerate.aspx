<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_PurchaseCenter_POGenerate, App_Web_pogenerate.aspx.750f10e" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function RaisePO(Id) {
            var strId = Id.split('|');
            var strkey = strId[1];
            var val = $("#ddlVendorlist" + strId[0]).val().split('|');
            //newly Added 
            ShowProgress();
            $("#ContentPlaceHolder1_xhdnId").val(Id);
            $("#ContentPlaceHolder1_xhdnSuppId").val(val[0]);
            $("#ContentPlaceHolder1_btnShow").click();
            //    // ShowProgress(true);
            //    $.ajax({
            //        type: 'POST',
            //        url: 'POGenerate.aspx/RaisePO',
            //        contentType: 'application/json; charset=utf-8',
            //        dataType: 'json',
            //        data: "{'Id':'" + strId[0].toString() + "', 'VId' : '" + val[0] + "', 'strkey' : '" + strkey + "'}",
            //        cache: false,
            //        success: function (msg) {
            //            var newData = msg.d;
            //            if (newData == "0") {
            //                GetDetails();
            //            }
            //            else {
            //                ShowModalMsgBox("Error", newData);
            //            }
            //            // alert('Raise PO');
            //            //window.location.href = msg.d;
            //        },
            //        error: function (errmsg) {
            //        }
            //    });
        }

        function totalAmount() {
            var uUnitPrice = 0;
            var utotalAmt = 0;
            var uQty = 0;
            if ($("#ContentPlaceHolder1_xtxtUnitPrice").val() != "") {
                uUnitPrice = parseFloat($("#ContentPlaceHolder1_xtxtUnitPrice").val());
            }
            //if ($("#ContentPlaceHolder1_lblUnitPrice").text() != "") {
            //    uUnitPrice = parseFloat($("#ContentPlaceHolder1_lblUnitPrice").text());
            //}
            if ($("#ContentPlaceHolder1_xtxtQuantity").val() != "") {
                uQty = parseFloat($("#ContentPlaceHolder1_xtxtQuantity").val());
            }
            utotalAmt = (uUnitPrice * uQty);
            $("#ContentPlaceHolder1_lblAmt").text(utotalAmt.toFixed(2));
        }

        function ValidatePO() {
            if ($("#ContentPlaceHolder1_xtxtPONo").val() == "") {
                $("#ContentPlaceHolder1_xtxtPONo").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtPONo"), "Please Enter Po No.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtQuantity").val() == "") {
                $("#ContentPlaceHolder1_xtxtQuantity").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtQuantity"), "Please Enter Quantity.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtQuantity").val() != "") {
                if ($("#ContentPlaceHolder1_xtxtQuantity").val() <= 0) {
                    $("#ContentPlaceHolder1_xtxtQuantity").focus();
                    ShowToolTip($("#ContentPlaceHolder1_xtxtQuantity"), "Please enter atleast 1 quantity.", "bottom");
                    return false;
                }
            }
            else if ($("#ContentPlaceHolder1_xtxtUnitPrice").val() == "") {
                $("#ContentPlaceHolder1_xtxtUnitPrice").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtUnitPrice"), "Please Enter Unit Price.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtExpectedDays").val() == "") {
                $("#ContentPlaceHolder1_xtxtExpectedDays").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtExpectedDays"), "Please Enter Days.", "top");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtDeliveryAddress").val() == "") {
                $("#ContentPlaceHolder1_xtxtDeliveryAddress").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtDeliveryAddress"), "Please Enter Delivery Address.", "top");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtContactPerson").val() == "") {
                $("#ContentPlaceHolder1_xtxtContactPerson").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtContactPerson"), "Please Enter Contact Person.", "top");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtContactNumber").val() == "") {
                $("#ContentPlaceHolder1_xtxtContactNumber").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtContactNumber"), "Please Enter Days.", "top");
                return false;
            }
            ShowProgress();
            return true;
        }

        function RFP_Click() {
            $("#ContentPlaceHolder1_xlnkbtnAUC").css('class', 'btnBlk');
        }
        function AUC_Click() {
            $("#ContentPlaceHolder1_xlnkbtnRFP").css('class', 'btnBlk');
            $("#ContentPlaceHolder1_xlnkbtnAUC").css('class', 'btnBlk active');
        }

        function ShowDetails(Id) {
            $.ajax({
                type: 'POST',
                url: strUrl + 'PurchaseCenter/POGenerate.aspx/ShowDetails',
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
     
    <asp:UpdatePanel ID="xupnlPurchase" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="topBlk topBlkInn">
                <ul class="rightBtn">
                    <li>
                        <asp:LinkButton ID="xlnkbtnPreview" runat="server" Visible="false" class="btnBlk">Preview
                        </asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="xlnkbtnSubmit" runat="server" Visible="false" class="btnBlk" OnClick="btnConformSubmit_Click" OnClientClick="javascript: return ValidatePO();">Submit
                        </asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="xlnkbtnDraft" runat="server" Visible="false" class="btnBlk" OnClick="btnSaveAs_click" OnClientClick="javascript: return ValidatePO();">Draft
                        </asp:LinkButton>
                    </li>
                </ul>
                <br class="cl" />
            </div>

            <div id="divRFP" runat="server">
                <div class="clmn1 imw72p fl">
                    <div class="row1">
                        <div id="divHeader" class="innerBxhead bgRed" runat="server">Preview purchase order summary from your RFP</div>

                        <%--<div class="whiteBox brdPink" id="DivPoDetails" runat="server">
                            <div class="buyRegis">

                                <div class="formRow" id="div1" runat="server">                                    
                                    <div class="formRow1">
                                        <asp:Literal ID="xlitLogo" runat="server"></asp:Literal>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Product</label>
                                    <div class="formRow1">
                                        <label id="lblProduct" runat="server" class="imw100p"></label>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Category</label>
                                    <div class="formRow1">
                                        <label id="lblCategory" runat="server" style="text-wrap: normal" class="imw100p"></label>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Date</label>
                                    <div class="formRow1">
                                        <div class="iconCal">
                                            <label id="lblDate" runat="server"></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Purchase order number</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtPONo" runat="server" placeholder="PO NO" CssClass="imw100p"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Supplier Name</label>
                                    <div class="formRow1">
                                        <label id="lblSupplierName" runat="server" class="imw100p"></label>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Address</label>
                                    <div class="formRow1">
                                        <label id="lblSupplierAddress" runat="server" class="imw100p"></label>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Quantity</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtQuantity" runat="server" placeholder="Quantity" CssClass="imw100p" onkeyup="javascript:totalAmount();"></asp:TextBox></td>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label id="lblUnitPrice" runat="server">Unit Price</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtUnitPrice" runat="server" placeholder="Unit Price" CssClass="imw100p" onkeyup="javascript:totalAmount();"></asp:TextBox></td>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label id="lblAmount" runat="server">Amount </label>
                                    <div class="formRow1">
                                        <label id="lblAmt" runat="server" class="imw100p"></label>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Expected Delivery in days</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtExpectedDays" runat="server" placeholder="Days" CssClass="imw100p"></asp:TextBox></td>
                                    </div>
                                </div>

                                <div class="formRow" style="display: none">
                                    <label>Brand</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtBrand" runat="server" placeholder="Days" CssClass="imw100p"></asp:TextBox></td>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Mode of payment</label>
                                    <div class="formRow1 rdpType">
                                        <asp:RadioButtonList ID="rdbPaymentMode" name="rdbPaymentMode" RepeatDirection="Horizontal"
                                            RepeatColumns="2" runat="server" CellPadding="20" CellSpacing="20" Width="100%">                                            
                                        </asp:RadioButtonList>
                                    </div>
                                </div>

                                <div class="formRow" style="display: none">
                                    <label>Payment Terms</label>
                                    <div class="formRow1 rdpType">
                                        <asp:RadioButtonList ID="rdbPaymentTerms" name="rdbPaymentType" RepeatDirection="Horizontal"
                                            RepeatColumns="1" runat="server" CellPadding="20" CellSpacing="20" Width="100%">
                                        </asp:RadioButtonList>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Delivery address for goods</label>
                                    <div class="formRow1 rdpType">
                                        <asp:RadioButton ID="xrdbRegistered" GroupName="AddType" runat="server" Checked="true" Text="Registered Address" OnCheckedChanged="RegAdd_OnChange" AutoPostBack="true"></asp:RadioButton>
                                        <asp:RadioButton ID="xrdbAddress1" GroupName="AddType" runat="server" Text="Address1" OnCheckedChanged="Add1_OnChange" AutoPostBack="true"></asp:RadioButton>
                                        <asp:RadioButton ID="xrdbAddress2" GroupName="AddType" runat="server" Text="Address2" OnCheckedChanged="Add2_OnChange" AutoPostBack="true"></asp:RadioButton>
                                    </div>
                                    <br />
                                    <div class="formRow1">
                                        <textarea id="xtxtDeliveryAddress" runat="server" placeholder="Shipping Address" class="imw100p"></textarea>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Contact Person</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtContactPerson" runat="server" placeholder="Contact Person" CssClass="imw100p"></asp:TextBox></td>

                                    </div>
                                </div>

                                <div class="formRow">
                                    <label>Contact Number </label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtContactNumber" runat="server" placeholder="Contact Number" CssClass="imw100p"></asp:TextBox></td>
                                    </div>
                                </div>
                                <div id="DivCreditPeriodDet" runat="server">
                                    <div class="formRow">
                                        <label>Credit Period (Days)</label>
                                        <div class="formRow1">                                            
                                            <label id="lblCreditPeriod" runat="server" class="imw100p"></label>
                                        </div>
                                    </div>

                                    <div class="formRow">
                                        <label>Payment Due Date</label>
                                        <div class="formRow1">                                            
                                            <label id="lblDueDate" runat="server" class="imw100p"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Remarks</label>
                                    <div class="formRow1">
                                        <textarea id="xtxtRemark" runat="server" placeholder="Remarks" class="imw100p"></textarea>
                                    </div>
                                </div>

                                <div class="formRow" id="divPODoc" runat="server">
                                    <label>PO Documents</label>
                                    <div class="formRow1">
                                        <ctrl:UploadFile ID="xctrlPO" runat="server" UserType="Company" UploadDocType="PurchaseOrderDoc"
                                            UploadFileType="Doc" Caption="Upload Purchase Order" />
                                    </div>
                                </div>
                            </div>
                            <br class="cl" />
                        </div>--%>

                        <div class="whiteBox brdPink" id="DivPoDetails" runat="server">
                            <%--<div class="billLogo">
                                <img id="imgLogo" src="/images/logo-infiauction.jpg">
                                <asp:Literal ID="xlitLogo" runat="server"></asp:Literal>
                            </div>
                            <br/>--%>
                            <table align="center" class="invoicetable" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                          <td colspan="2">
                                              <table width='100%' border='0' cellspacing='0' cellpadding='0'>
                                                 <tbody>                                                
                                                  <div class="billLogo">
                                                         <%-- <caption>--%>
                                                              <img id="img1" src="/images/renepay-bill-logo.png">
                                                              <asp:Literal ID="xlitLogo" runat="server"></asp:Literal>
                                                              </img>
                                                      <%--</caption>--%>
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
                                                        <td valign="top" width="39%">
                                                            <p class="colBlue fontMed">Payment To</p>
                                                            <label id="lblSupplierName" runat="server" class="imw100p"></label>
                                                            <label id="lblSupplierAddress" runat="server" class="imw100p"></label>
                                                             <label class="fl">Mobile:&nbsp;</label>
                                                            <label id="lblSupplierMobile" runat="server"></label>
                                                            <label id="lblSupplierContactNo" runat="server" visible="false"></label>
                                                            <label class="fl">Email:&nbsp;</label>
                                                            <label id="lblSupplierEmail" runat="server"></label>    
                                                            <label id="lblSupplierEmailAdd" runat="server" visible="false"></label>

                                                             
                                                        </td>
                                                        <td valign="top" width="39%" >
                                                            <p class="colBlue fontMed">Payment From</p>
                                                            <label id="lblBuyerName" runat="server" class="imw100p"></label>
                                                            <label id="lblBuyerAddress" runat="server" class="imw100p"></label>
                                                            <label class="fl">Mobile:&nbsp;</label>
                                                            <label id="lblBuyerMobile" runat="server"></label>
                                                            <label id="lblContactNumber" runat="server" visible="false"></label>    
                                                            <label id="lblEMailAdd" runat="server" visible="false"></label>
                                                            <label class="fl">Email:&nbsp;</label>
                                                            <label id="lblBuyerEmail" runat="server"></label>  
                                                              
                                                                                                                                                                                
                                                        </td>
                                                        <td width="22%" class="colBlue fontBig txtCenter" valign="top">purchase <br>order</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr class="brttop">
                                        <td width="49%" valign="top" rowspan="2">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tbody>
                                                    <tr id="xtrPOTypeDet" runat="server" visible="false">
                                                        <td width="40%">
                                                            <label id="lblPOType" runat="server" class="colBlue"></label>
                                                        </td>
                                                        <td width="60%">
                                                            <label id="lblPOTypeId" runat="server"></label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="40%" class="colBlue">PO No.<br>
                                                        </td>
                                                        <td width="60%">
                                                            <asp:TextBox ID="xtxtPONo" runat="server" placeholder="PO NO" CssClass="imw100p"></asp:TextBox>
                                                            <br>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="40%" class="colBlue">PO Date<br>
                                                        </td>
                                                        <td width="60%">
                                                            <label id="lblDate" runat="server"></label>
                                                           </td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td width="40%" class="colBlue">Expected Delivery (Days)</td>
                                                        <td width="60%">
                                                            <asp:TextBox ID="xtxtExpectedDays" runat="server" placeholder="Days" CssClass="imw100p"></asp:TextBox></td>
                                                    </tr>

                                                     <div id="DivCreditPeriodDet" runat="server">
                                                        <tr id="xtrCreditPeriodDet" runat="server">
                                                            <td width="40%" class="colBlue">Credit Period (Days)</td>
                                                            <td width="60%">
                                                                <label id="lblCreditPeriod" runat="server" class="imw100p"></label>
                                                            </td>
                                                        </tr>
                                                       
                                                    </div>

                                                      <tr>
                                                            <td width="40%" class="colBlue">Payment Due Date</td>
                                                            <td width="60%">
                                                                <label id="lblDueDate" runat="server" class="imw100p"></label>
                                                            </td>
                                                     </tr>                                                                                 

                                                    <div  id="divPODoc" runat="server">
                                                    <tr>  
                                                        <td id="xtrPODoc" width="30%" class="colBlue">P.O. Document</td>
                                                        <td width="70%">
                                                            <ctrl:UploadFile ID="xctrlPO" runat="server" UserType="CMP" UploadDocType="PurchaseOrderDoc"
                                                                UploadFileType="Doc" Caption="Upload" />
                                                        </td>
                                                      </tr>
                                                      </div>                                                    
                                                </tbody>
                                            </table>
                                        </td>
                                        <td height="20" class="brtleft fontMed"><span class="colBlue">Delivery To</span></td>                                              
                                    </tr>                                            
                                     <tr class="brttop">
                                        <td width="51%" class="brtleft">
                                            <asp:Label ID="xlblContactPerson" class="colBlue spacebtm" runat="server">Contact Person</asp:Label>
                                            <asp:TextBox ID="xtxtContactPerson" runat="server" placeholder="Contact Person" CssClass="imw100p"></asp:TextBox><br />                                            
                                            <asp:Label ID="Label1" class="colBlue spacebtm" runat="server">Delivery Address</asp:Label>
                                            <div class="formRow1 rdpType" style="display:none">
                                                <asp:RadioButton ID="xrdbRegistered" GroupName="AddType" runat="server" Checked="true" Text="Registered Address" OnCheckedChanged="RegAdd_OnChange" AutoPostBack="true"></asp:RadioButton>
                                                <asp:RadioButton ID="xrdbAddress1" GroupName="AddType" runat="server" Text="Address1" OnCheckedChanged="Add1_OnChange" AutoPostBack="true"></asp:RadioButton>
                                                <asp:RadioButton ID="xrdbAddress2" GroupName="AddType" runat="server" Text="Address2" OnCheckedChanged="Add2_OnChange" AutoPostBack="true"></asp:RadioButton>
                                            </div>                                           
                                            <%--<br class="cl" />--%>
                                            <textarea id="xtxtDeliveryAddress" runat="server" placeholder="Shipping Address" class="imw100p"></textarea><br />
                                            <asp:Label ID="xlblConatctNo" class="colBlue spacebtm" runat="server">Contact No.</asp:Label>                                   
                                            <asp:TextBox ID="xtxtContactNumber" runat="server" placeholder="Contact Number" CssClass="imw100p"></asp:TextBox>
                                        </td> 
                                    </tr>
                                    <%--<tr class="brttop" >
                                        <td width="51%" class="brtleft">&nbsp;</td>--%>
                                    </tr>
                                    <tr class="brttop">
                                        <td  colspan="2"> <%--style="background: #eee;"--%>
                                            <table width="100%" class="billInfo" border="0" cellspacing="0" cellpadding="0">
                                                <tbody>
                                                    <tr>
                                                        <th style="width: 25%;">Product </th>
                                                        <th style="width: 15%">Category </th>
                                                        <th style="display: none">Brand </th>
                                                        <th style="width: 15%">Quantity</th>
                                                        <th style="width: 15%">Units</th>
                                                        <th style="width: 15%">
                                                            <label id="lblUnitPrice" runat="server">Unit Price</label></th>
                                                        <th style="width: 15%">
                                                            <label id="lblAmount" runat="server">Amount </label>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <td style="width: 25%">
                                                            <label id="lblProduct" runat="server" class="imw100p"></label>
                                                        </td>
                                                        <td align="left" style="width: 15%">
                                                            <label id="lblCategory" runat="server" style="text-wrap: normal" class="imw100p"></label>
                                                        </td>
                                                        <td align="left" style="display: none">
                                                            <asp:TextBox ID="xtxtBrand" runat="server" placeholder="Days" CssClass="imw100p"></asp:TextBox>
                                                        </td>
                                                        <td style="width: 15%">
                                                            <asp:TextBox ID="xtxtQuantity"  runat="server" placeholder="Quantity" CssClass="imw100p" onkeyup="javascript:totalAmount();"></asp:TextBox>
                                                        </td>
                                                        <td style="width: 15%">
                                                            <label id="lblUOM" runat="server" class="imw100p"></label>
                                                        </td>
                                                        <td style="width: 15%">
                                                            <asp:TextBox ID="xtxtUnitPrice" runat="server" placeholder="Unit Price" CssClass="imw100p" onkeyup="javascript:totalAmount();"></asp:TextBox>
                                                        </td>
                                                        <td  style="width: 15%">
                                                            <label id="lblAmt" runat="server" class="imw100p"></label>
                                                        </td>
                                                    </tr>
                                                 </tbody>
                                                </table>
                                          </td>
                                     </tr>                                  

                                     <tr class="brttop" style="display:none;">                                        
                                         <td class="colBlue" align="left">Mode of payment</td>
                                              <td >
                                                        <div class="formRow1 rdpType">
                                                            <asp:RadioButtonList ID="rdbPaymentMode" name="rdbPaymentMode" RepeatDirection="Horizontal"
                                                                RepeatColumns="2" runat="server" CellPadding="20" CellSpacing="20" Width="100%" >
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </td>
                                        </tr>

                                    <tr  style="display: none">
                                    <td class="colBlue">Payment Terms</td>
                                         <td>
                                                        <div class="formRow1 rdpType">
                                                            <asp:RadioButtonList ID="rdbPaymentTerms" name="rdbPaymentType" RepeatDirection="Horizontal"
                                                                RepeatColumns="1" runat="server" CellPadding="20" CellSpacing="20" Width="100%">
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </td>
                                    </tr>

                                    <tr style="display: none">
                                        <td valign="top"><span style="width: 40%"><span id="ContentPlaceHolder1_xlblProduct2">Thanks for your business.</span></span></td>
                                    </tr>
                                    <tr class="brttop">
                                        <td colspan="2"><a class="colBlue" href="#">Terms &amp; Conditions</a></td>
                                    </tr>
                                    <tr class="brttop">
                                        <td colspan="2" width="100%"><em class="markRed fl">*</em><label>Note: Delivery charges, taxes and other charges will be confirmed by supplier when they issue the invoice.</label></td>
                                    </tr>
                                    <tr class="brttop">
                                         <td colspan="2">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tbody>
                                            <tr>
                                               <%--<td width="88%"><p> <span id="ContentPlaceHolder1_xlblComments">Please pay within a week</span></p></td>--%>
                                                <td colspan="2" width="100%">
                                                    <textarea id="xtxtRemark" runat="server" placeholder="Remarks" class="imw100p"></textarea></td>
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
            </div>
           </div>

            <%--<asp:TextBox ID="xtxtCreditPeriod"  runat="server" placeholder="Days" CssClass="imw100p" readonly="true"></asp:TextBox></td>--%>
            <%--<asp:TextBox ID="xtxtDueDate"  runat="server" placeholder="Days" CssClass="imw100p" ReadOnly="true"></asp:TextBox></td>--%>

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
            <asp:HiddenField ID="xhdnId" runat="server" />
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

