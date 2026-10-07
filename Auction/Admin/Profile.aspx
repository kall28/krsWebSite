<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_Profile, App_Web_profile.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Styles/morris.css" rel="stylesheet" />
    <script src="../Scripts/morris.min.js"></script>
    <script src="../Scripts/raphael-min.js"></script>
    <script src="../Scripts/jQuery.circleProgressBar.min.js"></script>
    <script>

        $(function Process() {
            $('.percent').percentageLoader({
                valElement: 'p',
                strokeWidth: 30,
                bgColor: '#d9d9d9',
                ringColor: '#d53f3f',
                textColor: '#2C3E50',
                fontSize: '14px',
                fontWeight: 'bold'
            });
        });

    </script>
    <div id="divSupplierPRO" runat="server" class="main supplier">
        <div class="topBlk">
            <div class="mainHead fl">Supplier Profile </div>
            <ul class="rightBtn">
                <asp:LinkButton ID="xlnkbtnEdit" runat="server" class="btnBlk" OnClientClick="javascript:ShowProgress(true);"
                    OnClick="xlnkbtnEdit_Click">Edit</asp:LinkButton>
                <asp:LinkButton ID="xlnkbtnClose" runat="server" class="btnBlk" OnClientClick="javascript:ShowProgress(true);"
                    OnClick="xlnkbtnClose_Click">Close</asp:LinkButton>
            </ul>
            <br class="cl" />
        </div>
        <div class="clmn1">
            <div class="row1">
                <div class="whiteBox">
                    <asp:Literal ID="xlitSupplierPRO" runat="server"></asp:Literal>
                    <div class="rightClmn">
                    </div>
                    <br class="cl" />
                </div>
                <div class="immrt30">
                    <asp:Literal ID="xlitCategoryList" runat="server"></asp:Literal>
                </div>
                <div class="immrt30 whiteBox">
                    <asp:Literal ID="xlitPRO" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>
    <div class="main supplier" id="divBuyerPRO" runat="server">
        <div class="topBlk">
            <div class="mainHead fl">Manage your account</div>
            <ul class="rightBtn">
                <asp:LinkButton ID="xlnkbtnEditCompany" runat="server" class="btnBlk"
                    OnClick="xlnkbtnEditCompany_Click">Edit</asp:LinkButton>
                <asp:LinkButton ID="xlnkbtnCancel" runat="server" class="btnBlk"
                    OnClick="xlnkbtnCancel_Click">Close</asp:LinkButton>
            </ul>
            <br class="cl" />
        </div>
        <div class="clmn1">
            <div class="row1">
                <div class='whiteBox'>
                    <asp:Literal ID="xlitBuyerPRO" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
    </div>
</asp:Content>

