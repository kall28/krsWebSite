<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_RegistrationPackages, App_Web_registrationpackages.aspx.fdf7a39c" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="xupnlPackage" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <script>
                function validatepackage() {
                    var ctrl = $("#ContentPlaceHolder1_xddlPackage option:selected");
                    if (ctrl.index() <= 0) {
                        ShowToolTip($("#ContentPlaceHolder1_xddlPackage"), "Please select a payment plan.", "bottom");
                        return false;
                    }
                    ShowProgress();
                    return true;
                }
            </script>
            <div class="main supplier">
                <div class="topBlk">
                    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="<span id='spnCap'>SELECT A PAYMENT PLAN</span>"></asp:Literal>
                    </div>
                </div>
                <br class="cl">
                <div class="clmn1">
                    <div class="row1">
                        <div class="whiteBox">
                            <%--<h2>Contact Details</h2>
                            <br class="cl">--%>
                            <div class="leftClmn">
                                <label>PAYMENT PLAN</label>
                                <div class="styled-select fl selOrganization">
                                    <asp:DropDownList ID="xddlPackage" runat="server" AutoPostBack="true"
                                         OnSelectedIndexChanged="xddlPackage_SelectedIndexChanged">
                                        <asp:ListItem Text="Organization Type" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <label id="lblPayAmttext" runat="server">
                                           MONTHLY PAYMENT AMOUNT </label>
                                <asp:TextBox ID="xtxtAmount" runat="server" CssClass="imw97p" ReadOnly="true"></asp:TextBox>                                
                            </div>
                            <div class="rightClmn">
                                <label>PAYMENT PLAN DESCRIPTION </label>
                                <asp:TextBox ID="xtxtDescription" runat="server" TextMode="MultiLine" CssClass="imw97p" ReadOnly="true"></asp:TextBox>
                            </div>
                            <br class="cl">
                        </div>
                        <asp:LinkButton ID="xlnkbtnSubmit" runat="server" CssClass="btnBlk" OnClientClick="javascript: return validatepackage();" 
                            OnClick="xlnkbtnSubmit_Click">CONTINUE</asp:LinkButton>
                        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

