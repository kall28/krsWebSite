<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_PaymentTearmscreate, App_Web_paymenttearmscreate.aspx.6044e34" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">

    function validateTextBox() {
        var ctrl = $("#ContentPlaceHolder1_xtxtcode");
            if (ctrl.val() == "") {
                ShowToolTip("#ContentPlaceHolder1_xtxtcode", "Please enter payment tearm code.", "Top");
                return false;
            }
            ctrl = $("#ContentPlaceHolder1_xtxtname");
           if (ctrl.val() == "") {
               ShowToolTip("#ContentPlaceHolder1_xtxtname", "Please enter payment tearm name.", "Top");
                return false;
            }
            ShowProgress(true);
            return true;
    }
        </script>

    <asp:UpdatePanel ID="xupnlCategory" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Literal ID="xlitScriptVal" runat="server"></asp:Literal>
            <div class="main supplier">
                <div class="topBlk">
                    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="Payment Details" ></asp:Literal>
                    </div>
                </div>
                <br class="cl">

                <div class="clmn1">
                    <div class="row1">
                        <div class="whiteBox">
                            <div class="leftClmn">
                                    Please fill the details for Payment Terms.
                                    <br class="cl">
                                    <br class="cl">
                                    <asp:TextBox ID="xtxtcode" runat="server" CssClass="imw97p" placeholder="Code" ToolTip="Please enter Code" maxlength="30" autocomplete="off"></asp:TextBox>
                                    <asp:TextBox ID="xtxtname" runat="server" CssClass="imw97p" placeholder="Name" ToolTip="Please enter Name" maxlength="70" autocomplete="off"></asp:TextBox>
                                    <br /><br />
                                    <div id="divchckPublish" class="chk" runat="server" visible="true">
                                        <label>Published</label>
                                        <asp:CheckBox ID="xchckPublish" runat="server" />
                                    </div>
                                    <br />
                                    <div class="grey-box bord-grey" id="divmsg" runat="server" visible="false">
                                            <strong>NOTE: </strong>You will receive a confirmation call from our representative,
                                            once we add all your requested details in our system.
                                    </div>
                                    <br class="cl">
                                    <asp:LinkButton ID="xlbtnSubmit" runat="server" CssClass="btnBlk"
                                        OnClick="UpdatePaymentTerms" OnClientClick="javascript:if(!validateTextBox()){ return false; }">Submit</asp:LinkButton>
                                        <asp:LinkButton ID="xlbtnCancel" runat="server" CssClass="btnBlk"
                                        OnClick="btnBack_click" OnClientClick="javascript:ShowProgress(true);">CANCEL</asp:LinkButton>

                            </div>
                            <div class="rightClmn">
                            </div>
                            <br class="cl">
                        </div>
                    </div>
                </div>
            </div>
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

