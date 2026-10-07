<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_RFPCenter_Draft, App_Web_draft.aspx.f5f1fac" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            BindPaging('data-table');
        });

        function RFP_click(Id) {
            ShowProgress(true);
            $("#ContentPlaceHolder1_xhdnRFPId").val(Id);
            $("#ContentPlaceHolder1_xbtnView").click();
        }
        function RFPVendorDetails(Id, mode) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: strUrl + 'RFPCenter/Draft.aspx/ShowRFPVendorDetails',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id': '" + Id + "','mode': '" + mode + "'}",
                cache: false,
                success: function (msg) {
                    ShowModalReportBox("RFP Vendor Details", msg.d);
                    SetDataTablePaging('#tblRFPVendors');
                    HideProgress();
                },
                error: ShowError
            });
        }

    </script>
    <asp:Button ID="xbtnView" OnClick="xbtnView_Click" runat="server" Style="display: none;" />
    <input type="hidden" id="xhdnRFPId" runat="server" />
    <div class="clmn1">
        <div class="row1">
            <div class="whiteBox">
                <asp:Literal ID="xlitRFPDetails" runat="server"></asp:Literal>
                <br class="cl">
            </div>
        </div>
    </div>
</asp:Content>

