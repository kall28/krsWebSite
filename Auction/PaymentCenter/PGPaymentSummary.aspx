<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_PaymentCenter_PGPaymentSummary, App_Web_pgpaymentsummary.aspx.4a2dc9c1" %>

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
            $("#ContentPlaceHolder1_xtxtChquDate").datepicker({
                defaultDate: '+1d',
                numberOfMonths: 2,
                dateFormat: 'dd/mm/yy'
            });
        }

        function validatePay() {
            var ctrl = $("#ContentPlaceHolder1_xddlPaymentMode option:selected");
            if (ctrl.index() <= 0) {
                ShowToolTip("#ContentPlaceHolder1_xddlPaymentMode", "Please select Payment Mode.");
                return false;
            }
            ShowProgress(true);
            return true;
        }

        function validatechqPay() {
            var ctrl = $("#ContentPlaceHolder1_xddlPaymentMode option:selected");
            if (ctrl.index() <= 0) {

                ShowToolTip("#ContentPlaceHolder1_xddlPaymentMode", "Please select Payment Mode.");
                return false;
            }

            ctrl = $("#ContentPlaceHolder1_xtxtChquNo");
            if (ctrl.val() == "") {

                ShowToolTip("#ContentPlaceHolder1_xtxtChquNo", "Please enter Cheque No.");
                return false;
            }

            ctrl = $("#ContentPlaceHolder1_xtxtChquDate");
            if (ctrl.val() == "") {

                ShowToolTip("#ContentPlaceHolder1_xtxtChquDate", "Please enter Cheque Date.");
                return false;
            }

            ctrl = $("#ContentPlaceHolder1_xddlBank option:selected");
            if (ctrl.index() <= 0) {

                ShowToolTip("#ContentPlaceHolder1_xddlBank", "Please enter Bank Name.");
                return false;
            }

            ctrl = $("#ContentPlaceHolder1_xtxtBranch");
            if (ctrl.val() == "") {

                ShowToolTip("#ContentPlaceHolder1_xtxtBranch", "Please enter Branch Name.");
                return false;
            }
            ShowProgress(true);
            return true;
        }
       
        function GetDate() {
            $("#ContentPlaceHolder1_xtxtChquDate").datepicker({
                defaultDate: '+1d',
                numberOfMonths: 2,
                dateFormat: 'dd/mm/yy'
            });
        }
        </script>
    <asp:UpdatePanel ID="xupnlSupplier" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            
            <div>   <%--class="main supplier"--%>                              
                <div  class="clmn1 fl">    <%--class="clmn1 fl"--%>
                <div class="row1">
                    <div class="whiteBox brdPink">  
                        <div class="buyRegis">                       
                            <div class="formRow">  
                                <label>Payment for </label>                                
                                <div class="formRow1"> 
                                    <asp:TextBox ID="xtxtPayFor" runat="server" class="imw100p" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>

                            <div class="formRow">  
                                <label>Payment Description</label>
                                <div class="formRow1"> 
                                    <%--<label id="xlblPayDesc" class="imw100p" runat="server">Invoice Payment Invoice Payment Invoice Payment Invoice Payment Invoice Payment Invoice Payment Invoice Payment Invoice Payment Invoice Payment Invoice Payment </label>--%>
                                    <textarea id="xlblPayDesc" runat="server" class="imw100p" style="height: 101px;"></textarea>   <%--width: 522px; --%>                                 
                                </div>
                            </div>

                            <div class="formRow">  
                                <label>Payable Amount</label>
                                <div class="formRow1"> 
                                    <asp:TextBox ID="xtxtTransAmt" runat="server" CssClass="imw48p fl" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>

                            <div class="formRow" id="xdivPromo" runat="server">
                                <label>Promo Code(If any)</label>
                                <div class="formRow1"> 
                                    <asp:TextBox ID="xtxtPromo" runat="server" CssClass="imw48p fl" placeholder="Please enter promo code" ></asp:TextBox> <%--class="imw100p"--%>
                                </div>
                            </div>                            
                           
                            <div  runat="server" id="xdivPayPanel" visible="false">
                            <div class="formRow">
                                    <label>Discount Amount</label>
                                <div class="formRow1">                                      
                                    <asp:TextBox ID="xtxtDiscountAmt" runat="server" CssClass="imw48p fl" PlaceHolder="Discount Amount" ReadOnly="true"></asp:TextBox>                                    
                                    <%--<asp:TextBox ID="xtxtServiceTax" runat="server"  PlaceHolder="Service Tax" ReadOnly="true" ></asp:TextBox>                                   --%>
                                    
                                </div>
                            </div>

                            <div class="formRow" >
                                    <label>Service Tax</label>
                                <div class="formRow1">                                                                          
                                    <asp:TextBox ID="xtxtServiceTax" runat="server" CssClass="imw48p fl"  PlaceHolder="Service Tax" ReadOnly="true" ></asp:TextBox>                                   
                                    
                                </div>
                            </div>

                            <div class="formRow">
                                    <label>Net Amount</label>
                                <div class="formRow1">                                                                          
                                    <asp:TextBox ID="xtxtPaymentAmt" runat="server" CssClass="imw48p fl" PlaceHolder="Net Amount" ReadOnly="true"></asp:TextBox>
                                    
                                </div>
                            </div>
                               
                            </div>
                            <br class="cl">
                            <br class="cl">
                            <div id="xdivPackagePromobtn" runat="server">
                                <asp:LinkButton ID="xlnkbtnDiscount" runat="server" class="btnRed" OnClick="xlnkbtnDiscount_click" OnClientClick="javascript:ShowProgress(true);">
                                CONTINUE</asp:LinkButton>
                                <asp:LinkButton ID="xlnkbtnDiscountSkip" runat="server" class="btnRed" OnClick="xlnkbtnDiscountSkip_click" OnClientClick="javascript:ShowProgress(true);">
                                SKIP TO PAYMENT</asp:LinkButton>
                                <asp:LinkButton ID="xlnkbtnCancle" runat="server" class="btnRed" OnClick="xlnkbtnCancle_click" OnClientClick="javascript:ShowProgress(true);">  
                                BACK</asp:LinkButton>    
                            </div>
                            
                            <div id="xdivPayment" runat="server">                             
                                <div class="formRow" id="xdivPayMode" runat="server">
                                    <label>Selected Payment Mode </label>
                                    <div class="formRow1">
                                     <div class="imw48p fl bgGrey">
                                      <div class="styled-select selOrganization">                                    
                                        <asp:DropDownList ID="xddlPaymentMode" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPayMode_SelectedIndexChanged"></asp:DropDownList>                                       
                                         </div>
                                        </div>
                                       </div>
                                </div>                                

                                <div  id="xdivPayChq"  runat="server">     
                                  <div class="formRow">
                                      <label>Cheque No</label>
                                         <div class="formRow1">                                      
                                              <asp:TextBox ID="xtxtChquNo" runat="server"  CssClass="imw48p fl" PlaceHolder="Cheque No" onkeydown="return IsNumeric(event);" autocomplete="off"></asp:TextBox>                                        
                                             <asp:TextBox ID="xtxtChquDate" runat="server" CssClass="imw48p fr" PlaceHolder="Cheque Date" ></asp:TextBox>
                                         </div>
                                  </div>

                                  <div class="formRow" >
                                    <label>Bank Name</label>
                                    <div class="formRow1">
                                     <div class="imw48p fl bgGrey"> 
                                      <div class="styled-select selOrganization">                                    
                                        <asp:DropDownList ID="xddlBank" runat="server" PlaceHolder="Bank Name" AutoPostBack="true"></asp:DropDownList>                                            
                                         </div>
                                        </div>
                                        <asp:TextBox ID="xtxtBranch" CssClass="imw48p fr" runat="server"  PlaceHolder="Branch Name" onkeydown="return RestrictText(event);" autocomplete="off"></asp:TextBox>
                                       </div>
                                </div>     
                                    <asp:Literal ID="xlitScriptChq" runat="server"></asp:Literal>                           

                                 </div>                               

                                 <div class="formRow">  
                                     <div id="divPayMsg" runat="server" visible="false">                                    
                                        <div>
                                        <asp:Literal ID="xlitPayMsg" runat="server"></asp:Literal>
                                        <div class="cl">
                                        </div>
                                    </div>
                                    </div>

                                     <div>
                                    <asp:LinkButton ID="btnPayProceed" runat="server" class="btnRed immrt10" OnClick="btnPayProceed_click" OnClientClick="javascript:if(!(validatePay())){return false;}">
                                            PROCEED</asp:LinkButton>
                                    <asp:LinkButton ID="btnBack" runat="server" class="btnRed immrt10" Visible="true" OnClick="btnBack_Click" OnClientClick="javascript:ShowProgress(true);">
                                            BACK</asp:LinkButton>
                                </div>
                                </div>

                                </div>                                
                        
                        </div>
                    <br class="cl">
                    </div>
                        <br class="cl">
                    </div>
                </div>
                <br class="cl" />
                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
             </div>                
            <%--</div>--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

