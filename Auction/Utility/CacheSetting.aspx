<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Utility_CacheSetting, App_Web_cachesetting.aspx.53608270" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="xupdSupDet" runat="server">
        <ContentTemplate>
            <div class="main purchaseOrder">
                <div class="topBlk">
                    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="Refresh Cache Details"></asp:Literal>
                    </div>
                    <ul class="rightBtn">
                        <li>
                            <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk"
                                OnClientClick="javascript:ShowProgress(true);" OnClick="xlbtnBack_Click">Close</asp:LinkButton></li>
                    </ul>
                    <br class="cl">
                </div>
                <div class="clmn1">
                    <div class="row1">
                        <div class="whiteBox">
                            <table style="width: 100%">
                                <tr>
                                    <td class="imw33p">
                                        <label> SELECT TYPE :</label>
                                        <div class="styled-select fl selOrganization">
                                            <asp:DropDownList ID="ddlSelectType" runat="server" >
                                                <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                                <asp:ListItem Text=" Company Category " Value="COC"></asp:ListItem>
                                                <%--<asp:ListItem Text=" Brand " Value="BRN"></asp:ListItem>--%>
                                                <asp:ListItem Text=" Category " Value="CAT"></asp:ListItem>
                                                <%--<asp:ListItem Text=" Product " Value="PRO"></asp:ListItem>--%>
                                                <asp:ListItem Text=" Package " Value="PKG"></asp:ListItem>
                                                <asp:ListItem Text=" Country " Value="COU"></asp:ListItem>
                                                <asp:ListItem Text=" State " Value="STA"></asp:ListItem>
                                                <asp:ListItem Text=" City " Value="CTY"></asp:ListItem>
                                                <asp:ListItem Text=" Supplier " Value="SUP"></asp:ListItem>
                                                <asp:ListItem Text=" Buyer " Value="COM"></asp:ListItem>
                                                <asp:ListItem Text=" Content " Value="CON"></asp:ListItem>
                                                <asp:ListItem Text=" Bank " Value="BNK"></asp:ListItem>
                                                <asp:ListItem Text=" Payment Type " Value="PYT"></asp:ListItem>
                                                <asp:ListItem Text=" Payment Mode " Value="PYM"></asp:ListItem>
                                                <asp:ListItem Text=" Comm Activity " Value="COA"></asp:ListItem>
                                                <asp:ListItem Text=" Comm Theame " Value="COTH"></asp:ListItem>
                                                <asp:ListItem Text=" Comm Template " Value="COT"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                    <td class="imw33p">
                                        <asp:LinkButton ID="xlbtnSubmit" runat="server" CssClass="btnBlk"
                                            OnClick="btnSubmit_click" OnClientClick="javascript:ShowProgress(true);">Refresh</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <br class="cl">
                    <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                </div>
                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

