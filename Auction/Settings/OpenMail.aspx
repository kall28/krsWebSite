<%@ page title="" language="C#" masterpagefile="~/Settings/SettingMaster.master" autoeventwireup="true" inherits="New_Settings_OpenMail, App_Web_openmail.aspx.f634c32f" %>

<%@ MasterType VirtualPath="~/Settings/SettingMaster.master" %>
<%@ Reference VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderButton" Runat="Server">
    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="<span id='spnCap'>OPEN MAIL</span>"></asp:Literal>
                    </div>
    <ul class="rightBtn">
                    <li><asp:LinkButton ID="xlnkbtnReply" runat="server" CssClass="btnBlk"
                                    OnClick="xlnkbtnReply_Click">REPLY</asp:LinkButton></li>
                    <li><asp:LinkButton ID="xlnkbtnForward" runat="server" CssClass="btnBlk"
                                    OnClick="xlnkbtnForward_Click">FORWARD</asp:LinkButton></li>
                    <li><asp:LinkButton ID="xlnkbtnBack" runat="server" CssClass="btnBlk"
                                    OnClick="xlnkbtnBack_Click">BACK</asp:LinkButton></li>
              	</ul>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">
    <asp:UpdatePanel ID="xupnlPackage" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <label>From</label>
            <asp:TextBox ID="lblfrom" runat="server" CssClass="imw97p" ReadOnly="true" ></asp:TextBox>

            <label>To</label>
            <asp:TextBox ID="lblTO" runat="server" CssClass="imw97p" ReadOnly="true" ></asp:TextBox>

            <label>Subject</label>
            <asp:TextBox ID="lblSub" runat="server" CssClass="imw97p" ReadOnly="true" ></asp:TextBox>

            <label>Body</label>
            <asp:Label  CssClass="txtbox" id="lblBody" runat="server"></asp:Label>

            <asp:Literal ID="xlitmsg" runat="server"></asp:Literal>
            <a href="#" class="chatWidget"><img src="images/chat-widget.jpg"></a>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="xhdnHideNotify" runat="server" />
</asp:Content>

