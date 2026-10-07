<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_AuctionCenter_Draft, App_Web_draft.aspx.aadda0d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            BindPaging('tblList');
        });

        function AUC_click(Id) {
            ShowProgress(true);
            $("#ContentPlaceHolder1_xhdnAUCId").val(Id);
            $("#ContentPlaceHolder1_xbtnView").click();
        }

    </script>
    <input type="hidden" id="xhdnAUCId" runat="server" />
    <button type="button" id="xbtnView" runat="server" onserverclick="xbtnView_Click" style="display: none;"></button>
    <div class="clmn1">
        <div class="row1">
            <div class="whiteBox">
                <asp:Literal ID="xlitList" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
</asp:Content>

