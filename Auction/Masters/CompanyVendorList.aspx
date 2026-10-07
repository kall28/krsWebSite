<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Masters_CompanyVendorList, App_Web_companyvendorlist.aspx.6044e34" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });

        function MapVendor(Id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'CompanyVendorList.aspx/MapVendor',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id':'" + Id + "'}",
                cache: false,
                success: function (msg) {
                    window.location.href = msg.d;
                },
                error: ShowError
            });

        }

    </script>
    <div class="main purchaseOrder">
        <div class="topBlk">
            <div class="mainHead f1">
                <asp:Literal ID="xlitcap" runat="server" Text="Company List"></asp:Literal>
            </div>

            <%--<ul class="rightBtn">
                <li>
                    <asp:LinkButton ID="xlbtnAdd" runat="server" CssClass="btnBlk"  OnClientClick="javascript:ShowProgress(true)">Add</asp:LinkButton> 
                </li>
                <li style="display:none;">
                    <asp:LinkButton ID="xlbtnDelete" runat="server" CssClass="btnBlk" OnClientClick="javascript:if(!(deleteLeader())){return false;}">Delete</asp:LinkButton>
                </li>
                <li>
                    <asp:LinkButton ID="xlbtnBack" runat="server" CssClass="btnBlk" >Back</asp:LinkButton>  
                </li>
            </ul>--%>
            <br class="cl" />
        </div>

        <div class="clmn1">
            <div class="row1">
                <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>
            </div>
            <br class="cl" />
            <div class="row1 immrb20">
                <div class="whiteBox">
                    <div class="tablemT10">
                        <table border="0" cellspacing="0" cellpadding="0">
                            <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                        </table>
                    </div>
                </div>
                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            </div>

        </div>
    </div>
</asp:Content>


