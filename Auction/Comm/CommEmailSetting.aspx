<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Comm_CommEmailSetting, App_Web_commemailsetting.aspx.c93392d6" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="xupnlSupplier" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="main supplier">
                <div class="topBlk">
                    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="<span id='spnCap'>Add Additional Email Address For Notifications</span>"></asp:Literal>
                    </div>
                </div>
                <br class="cl">
                <div class="clmn1">
                    <div class="row1">
                        <div class="whiteBox">
                            <%--<h2>Contact Details</h2>--%>
                            <br class="cl">
                            <div class="leftClmn">
                                <label>PRIMARY EMAIL ADDRESS</label>
                                <asp:TextBox ID ="xtxtPrimaryEmail" CssClass="imw97p" runat="server" autocomplete="off"></asp:TextBox>
                               <label>CC</label>
                                <asp:TextBox ID ="xtxtCC1" CssClass="imw97p" runat="server" autocomplete="off"></asp:TextBox>
                                
                                <br />
                                  <label>BCC</label>
                                <asp:TextBox ID ="xtxtBCC1" CssClass="imw97p" runat="server"></asp:TextBox>
                                <br />
                                <br class="cl" />
                            </div>
                            <div class="rightClmn">
                                <br /><br /><br /><br />
                                <label>CC</label>
                                <asp:TextBox ID ="xtxtCC2" runat="server" CssClass="imw97p"></asp:TextBox>
                                <label>BCC</label>
                                <asp:TextBox ID ="xtxtBCC2" runat="server" CssClass="imw97p"></asp:TextBox>
                            </div>
                            <br class="cl"><br class="cl">
                             <asp:Button ID="xlnkBtnUpdate" runat="server" CssClass="btnBlk" Text="Update" OnClick="xlnkBtnUpdate_Click"/>
                            <asp:Button ID="xlnkBtnCancel" runat="server" CssClass="btnBlk" OnClick="xlnkBtnCancel_Click" Text="Cancel"/>
                        </div>
                        
                        <br class="cl">
                        <br />
                          
                        
                        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

