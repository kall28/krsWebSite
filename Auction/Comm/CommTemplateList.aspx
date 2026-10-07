<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Comm_CommTemplateList, App_Web_commtemplatelist.aspx.c93392d6" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">

        $(document).ready(function () {
            $('#tblList').dataTable({
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
            });
        });


        function ReadMail(Id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'CommTemplateList.aspx/ReadMail',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id':'" + Id.toString() + "'}",
                cache: false,
                success: function (msg) {
                    window.location.href = msg.d;
                },
                error: function (errmsg) {
                }
            });
        }


        function validateSearch() {
            var msg = "";
            if ($("#ContentPlaceHolder1_ddlsearch option:selected").index() <= 0) {
                msg = "Please Select Field";
                ShowToolTip("#ContentPlaceHolder1_ddlsearch", msg);
                return false;
            }
            else if ($("#ContentPlaceHolder1_txtSearch").val() == '') {
                msg = "Please Enter Text";
                ShowToolTip("#ContentPlaceHolder1_txtSearch", msg);
                return false;
            }
            if (msg.length <= 0) {
                ShowProgress(true);
                return true;
            }
            return false
        }

            </script>

    <div class="main purchaseOrder">

        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="Common Template"></asp:Literal>
            </div>

             <ul class="rightBtn">
               <li>
                    <asp:LinkButton ID="xlbtnAdd" runat="server" CssClass="btnBlk"
                                     OnClick="btnCompose_Click" OnClientClick="javascript:ShowProgress(true);">Add</asp:LinkButton>
                </li>
                 <li>
                     <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk"
                                     OnClientClick="javascript:ShowProgress(true);" OnClick="btnBack_Click" >Back</asp:LinkButton>
                 </li>
              </ul>

            <br class="cl">
        </div>

        <div class="clmn1">
            <div class="row1">
                <asp:Literal ID="xlitmsg" runat="server"></asp:Literal>
            </div>

            <br class="cl">
            <div class="row1 immrb20">
                <div class="whiteBox">
                <div class="table mT10">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                    </table>
                </div>
                </div>
             </div>

        </div>
    </div>

</asp:Content>

