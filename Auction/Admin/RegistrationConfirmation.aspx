<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_RegistrationConfirmation, App_Web_registrationconfirmation.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main supplier">
        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="<span id='spnCap'> CONFIRMATION OF COMPANY SET UP</span>"></asp:Literal>
            </div>
        </div>
        <div class="row1">
            <div class="whiteBox immrt20">
                <h2>Congratulations! Your company has been set up.
                    <br />
                    Your User id and Password has been sent to your registered email id. Please use that to log on to Renepay.</h2>
                <br class="cl" />
                <label>
                    NAME OF THE COMPANY</label>
                <input type="text" id="txtCompanyName" readonly="readonly" runat="server" />
                <br class="cl" />
                <label>
                    USERS</label>
                <table>
                    <asp:Literal ID="xlitUsers" runat="server" />
                </table>
                <br class="cl" />
                <label>
                    <div style="display: none">
                    PURCHASE AUTHORITY</label>
                <asp:Literal ID="xlitAuth" runat="server" />
            </div>

            <div id="divPayCap" runat="server" visible="false">
                <label>
                    PAYMENT DETAILS</label>
            </div>
            <div id="divPay" runat="server" visible="false">
                <input type="text" id="txtPayDetails" style="width: 100px" readonly="readonly" runat="server" />
            </div>
            <asp:LinkButton ID="btnclose" CssClass="btnBlk" runat="server" OnClick="btnClose_Click" OnClientClick="javascript:ShowProgress(true);">Close</asp:LinkButton>
            <%-- <button class="Blk" id="btnclose" runat="server" onclick="javascript:ShowProgress(true);" onserverclick="btnClose_Click">
                            Close</button>--%>
        </div>
    </div>

    <%--<div class="wrap">
        <h4>
            CONFIRMATION OF COMPANY SET UP</h4>
        <div class="sub-heading">
            Congratulations! Your company has been set up.
            <br />
            Your User id and Password has been sent to your registered email id. Please use
            that to log on to InfiAuction.
        </div>
        <div class="insidepages cocsp">
            <div class="forms">
                <div class="CompName1">
                    <div>
                        <label>
                            NAME OF THE COMPANY</label></div>
                    <div>
                        <input type="text" id="txtCompanyName" readonly="readonly" runat="server" /></div>
                </div>
                <div class="user-pur-auth">
                    <div class="col-1">
                        <div>
                            <label>
                                USERS</label></div>
                        <asp:Literal ID="xlitUsers" runat="server" />
                    </div>
                    <div class="col-2" style="display:none">
                        <div>
                            <label>
                                PURCHASE AUTHORITY</label></div>
                        <asp:Literal ID="xlitAuth" runat="server" />
                    </div>
                </div>
                <div class="clr">
                </div>
                <div class="payment CompName1">
                    <div id="divPayCap" runat="server" visible="false">
                        <label>
                            PAYMENT DETAILS</label></div>
                    <div id="divPay" runat="server" visible="false">
                        <input type="text" id="txtPayDetails" style="width: 100px" readonly="readonly" runat="server" /></div>
                    <button id="btnclose" runat="server" onclick="javascript:ShowProgress(true);" onserverclick="btnClose_Click">
                        Close</button>
                </div>
                <div class="clr">
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>

