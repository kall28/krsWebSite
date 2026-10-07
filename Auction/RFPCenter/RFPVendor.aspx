<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_RFPCenter_RFPVendor, App_Web_rfpvendor.aspx.f5f1fac" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        $(document).ready(function () {
            BindPaging('tblList');
        });
        $(document).ready(function () {
            //BindPaging('tblListnew');
            BindPaging('tblListSup');
        });
    </script>
    <asp:UpdatePanel ID="xupnlRFPVendor" runat="server">
        <ContentTemplate>
            <div class="topBlk topBlkInn">
                <ul class="rightBtn">
                    <asp:LinkButton ID="xnlkbtnAdd" runat="server" class="btnBlk"
                        OnClientClick="javascript:ShowProgress();" Visible="false"
                        OnClick="xnlkbtnAdd_Click">ADD</asp:LinkButton>
                </ul>
                <br class="cl">
            </div>
            <div class="clmn1">
                <div class="row1">
                    <div class="immrt30">
                        <ctrl:VendorDetails ID='xctrlVendorDet' runat='server' Caption='View' />
                        <asp:Literal ID="xlitRFPExistingVendor" runat="server"></asp:Literal>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Literal ID="xlitRFPRemainVendor" runat="server"></asp:Literal>
                        <br class="cl">
                    </div>
                </div>
            </div>
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
