<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_Buyers, App_Web_buyers.aspx.fdf7a39c" %>

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

        function UpdateCompany(Id) {
            //window.location = "Registration.aspx?Id=" + Id;
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'Buyers.aspx/UpdateCompany',
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

        function validateSearch() {
            var ctrl = $("#ContentPlaceHolderMaster_ddlSearch option:selected");
            if (ctrl.index() < 0) {
                ShowToolTip("#ContentPlaceHolderMaster_ddlSearch", "Please select Field.");
                return false;
            }
            ShowProgress(true);
            return true;
        }
        function validateCheckBox() {
            if (!$("#chkCompany input[type='checkbox']").is(":checked")) {
                //ShowToolTip("#chkCompany", "Please Select Company.");
                return false;
            }
            //ShowProgress(true);
            return true;
        }

        function GetCheckedCompany() {
            var checkedCompany = [];
            var checkBoxList = $("#chkCompany input[type='checkbox']");
            if (validateCheckBox()) {
                for (var i = 0; i < checkBoxList.length; i++) {
                    if (checkBoxList[i].checked) {
                        checkedCompany.push(checkBoxList[i].value);
                    }
                }
            }
            return checkedCompany;
        }

        function deleteCompany() {
            var select = [];
            select = GetCheckedCompany();
            var dataToPass = { arr: select };
            var jsonTxt = JSON.stringify(dataToPass);
            if (select.length > 0) {
                var r = confirm("Do You Want to Delete Selected Company");
                if (r == true) {
                    ShowProgress(true);
                    $.ajax({
                        type: 'POST',
                        url: 'Buyers.aspx/DeleteCompany',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: jsonTxt,
                        cache: false,
                        success: function (msg) {
                            if (msg.d <= 0) {
                                ShowModalMsgBox("Error", "Error while deleting buyer.");
                                //$("#ContentPlaceHolderMaster_btnSearch").click();
                            }
                            else {
                                ShowModalMsgBox("ReNePay", "Buyer deleted successfully");
                            }
                            HideProgress();
                            location.href = 'Buyers.aspx'
                        },
                        error: function (errmsg) {
                        }
                    });
                }
            }
            else {
                ShowModalMsgBox("Error", "Please select atleast one company.");
            }
        }
    </script>
    <div class="main purchaseOrder">
        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="Buyer Details"></asp:Literal>
            </div>
            <ul class="rightBtn">
                <asp:LinkButton ID="xlbtnAdd" runat="server" CssClass="btnBlk"
                    OnClick="xlbtnAdd_click" OnClientClick="javascript:ShowProgress(true);">Add</asp:LinkButton>
                <asp:LinkButton ID="xlbtnDeleteCompany" runat="server" CssClass="btnBlk"
                    OnClientClick="javascript:if(!(deleteCompany())){return false;}">Delete</asp:LinkButton>
                <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk"
                    OnClientClick="javascript:ShowProgress(true);" OnClick="xlbtnBack_Click">Back</asp:LinkButton>
            </ul>
            <br class="cl" />
        </div>
        <div class="clmn1">
            <br class="cl" />
            <div class="whiteBox">
                <asp:Literal ID="xlitList" runat="server"></asp:Literal>
            </div>
        </div>
        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
    </div>
</asp:Content>

