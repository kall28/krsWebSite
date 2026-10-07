<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Admin_PaymentConfirmation, App_Web_paymentconfirmation.aspx.fdf7a39c" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main supplier">
        <div class="topBlk">
            <div class="mainHead fl">Payment Summary</div>
            <ul class="rightBtn">
            </ul>
        </div>
        <div class="row1">
            <div class="whiteBox immrt20">
                <table>
                    <tr>
                        <td colspan="2" class="txtCenter">
                            <asp:Literal ID="xlitImg" runat="server"><img src="../images/red-cross-tick.png" width="94" height="94"/></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="txtCenter">
                            <h1>
                                <asp:Literal ID="xlitMsg" runat="server"></asp:Literal></h1>
                        </td>
                    </tr>
                    <tr>
                        <td width="40%">Reference Id :</td>
                        <td>
                            <label id="lblRefId" runat="server"></label>
                        </td>
                    </tr>
                    <tr>
                        <td width="40%">Payment Amount :</td>
                        <td>
                            <label id="lblPayAmt" runat="server"></label>
                        </td>
                    </tr>
                    <tr>
                        <td width="40%">Payment Description:</td>
                        <td>
                            <label id="lblPayDesc" runat="server"></label>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:LinkButton ID="btnNext" runat="server" class="btnBlk" OnClientClick="javascript:ShowProgress(true);"
                            OnClick="btnNext_click" visible="false">
                            CONTINUE</asp:LinkButton>
                        <asp:LinkButton ID="btnClose" runat="server" class="btnBlk" OnClientClick="javascript:ShowProgress(true);"
                            OnClick="btnClose_click">
                            CLOSE</asp:LinkButton>
                        <asp:LinkButton ID="btnDownload" runat="server" class="btnBlk" OnClientClick="javascript:DownloadInvoice();return false;" visible="false">
                            DOWNLOAD </asp:LinkButton>
                <asp:Literal ID="xlitScriptPopup" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
</asp:Content>

