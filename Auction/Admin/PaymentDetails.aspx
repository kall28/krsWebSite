<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Admin_PaymentDetails, App_Web_paymentdetails.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            GetDate();
        });

        function validatePay() {
            var ctrl = $("#ContentPlaceHolder1_ddlPaymentForm option:selected");
            if (ctrl.index() <= 0) {
                ShowToolTip("#ContentPlaceHolder1_ddlPaymentForm", "Please select Payment Type.");
                return false;
            }
            ctrl = $("#ContentPlaceHolder1_xddlPaymentMode option:selected");
            if (ctrl.index() <= 0) {
                ShowToolTip("#ContentPlaceHolder1_xddlPaymentMode", "Please select Payment Mode.");
                return false;
            }
            ShowProgress();
            //HideProgress();
            return true;
        }

        function validatePayOth() {
            var ctrl = $("#ContentPlaceHolder1_xtxtBank");
            if (ctrl.val() == "") {
                ShowToolTip("#ContentPlaceHolder1_xtxtBank", "Please enter bank name.");
                return false;
            }
            ctrl = $("#ContentPlaceHolder1_xtxtBankRefNo");
            if (ctrl.val() == "") {
                ShowToolTip("#ContentPlaceHolder1_xtxtBankRefNo", "Please enter Cheque No.");
                return false;
            }
            ShowProgress();
            return true;
        }

        function validatechqPay() {
            var ctrl = $("#ContentPlaceHolder1_xddlPaymentMode option:selected");
            if (ctrl.index() <= 0) {
                ShowToolTip("#ContentPlaceHolder1_xddlPaymentMode", "Please select Payment Mode.");
                return false;
            }
            ctrl = $("#ContentPlaceHolder1_ddlPaymentForm option:selected");
            if (ctrl.index() <= 0) {
                ShowToolTip("#ContentPlaceHolder1_ddlPaymentForm", "Please select Payment Type.");
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
            ShowProgress();
            return true;
        }

        function GetDate() {
            //$("#ContentPlaceHolder1_xtxtChquDate").datepicker({
            //    defaultDate: "+1d",
            //    numberOfMonths: 2,
            //    dateFormat: 'dd/mm/yy'
            //});
            $("#ContentPlaceHolder1_xtxtChquDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');
        }

    </script>
    <asp:UpdatePanel ID="xupnlPayment" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="main supplier">
                <div class="topBlk">
                    <div class="mainHead fl">Payment Summary</div>
                    <ul class="rightBtn">
                    </ul>
                    <br class="cl" />
                </div>
                <div class="row1">
                    <div class="whiteBox immrt20">
                        <div class="leftClmn">
                            <div class="pmntMode fl">
                                <label>Payable Amount</label>
                                <br class="cl" />
                                <div class="styled-select">
                                    <asp:TextBox ID="xtxtTransAmt" runat="server" CssClass="imw97p" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <br class="cl" />
                            <br class="cl" />
                            <div class="pmntMode fl" id="Div1" runat="server">
                                <%--<label>SELECTED PAYMENT FORM </label>--%>
                                <label>Select Payment Type </label>
                                <div class="styled-select">
                                    <asp:DropDownList ID="ddlPaymentForm" runat="server">
                                        <%--<asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Direct Payment" Value="DP"></asp:ListItem>
                                        <asp:ListItem Text="Offline Payment" Value="OP"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                </div>
                            </div>
                           <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>--%>
                                    <div class="pmntMode fl" id="xdivPayMode" runat="server">
                                        <%--<label>SELECTED PAYMENT MODE </label>--%>
                                        <label>Select Payment Mode </label>
                                        <div class="styled-select">
                                            <asp:DropDownList ID="xddlPaymentMode" runat="server" OnSelectedIndexChanged="ddlPayMode_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                               <%-- </ContentTemplate>
                            </asp:UpdatePanel>--%>
                        </div>
                        <div class="rightClmn">
                            <div>
                                <label>Payment Description</label>
                                <br />
                                <label id="xlblPayDesc" runat="server"></label>
                            </div>
                            <br class="cl" />
                            <br class="cl"/>
                            <asp:UpdatePanel ID="xupnPayChq" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="divPayChq" runat="server" visible="false">

                                        <div class="pmntMode fl">
                                            <label>Cheque No</label>
                                            <div class="styled-select">
                                                <asp:TextBox ID="xtxtChquNo" runat="server" CssClass="imw97p" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="pmntMode fl">
                                            <label>Cheque Date</label>
                                            <div class="styled-select">
                                                <asp:TextBox ID="xtxtChquDate" runat="server" CssClass="imw97p" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="pmntMode fl">
                                            <label>Bank Name</label>
                                            <div class="styled-select">
                                                <asp:DropDownList ID="xddlBank" runat="server" AutoPostBack="true">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="pmntMode fl">
                                            <label>Branch Name</label>
                                            <div class="styled-select">
                                                <asp:TextBox ID="xtxtBranch" runat="server" CssClass="imw97p" onkeydown="return RestrictText(event);" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="divPayOth" runat="server" visible="false">
                                        <div class="pmntMode fl">
                                            <label>Bank Name</label>
                                            <div class="styled-select">
                                                <asp:TextBox ID="xtxtBank" runat="server" CssClass="imw97p" onkeydown="return RestrictText(event);" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="pmntMode fl">
                                            <label>PG Bank ref no</label>
                                            <div class="styled-select">
                                                <asp:TextBox ID="xtxtBankRefNo" runat="server" CssClass="imw97p"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Literal ID="xlitScriptChq" runat="server"></asp:Literal>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br class="cl" />
                            <br class="cl" />
                            <br class="cl" />
                            <br class="cl" />
                            <br class="cl" />
                            <div id="xdivPackagePromobtn" runat="server">
                                <%--  <asp:LinkButton ID="xlnkbtnDiscount" runat="server" class="btnBlk" OnClick="xlnkbtnDiscount_click" OnClientClick="javascript:ShowProgress(true);">
                                CONTINUE</asp:LinkButton>
                        <asp:LinkButton ID="xlnkbtnDiscountSkip" runat="server" class="btnBlk" OnClick="xlnkbtnDiscountSkip_click" OnClientClick="javascript:ShowProgress(true);">
                                SKIP TO PAYMENT</asp:LinkButton>
                        <asp:LinkButton ID="xlnkbtnCancle" runat="server" class="btnBlk" OnClick="xlnkbtnCancle_click" OnClientClick="javascript:ShowProgress(true);">  
                                BACK</asp:LinkButton>--%>
                                <asp:LinkButton ID="btnPayProceed" runat="server" class="btnBlk" OnClick="btnPayProceed_click" > 
                                            PROCEED</asp:LinkButton>
                                <asp:LinkButton ID="btnBack" runat="server" class="btnBlk" OnClick="btnBack_Click" OnClientClick="javascript:ShowProgress(true);">
                                            BACK</asp:LinkButton>
                            </div>
                        </div>
                        <br class="cl" />
                        <br class="cl" />
                    </div>
                </div>
                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

