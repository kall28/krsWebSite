<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_Users, App_Web_users.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script>
        $(document).ready(function () {
            BindPaging('tblList');
        });
        function UpdateExistUser(Id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'Users.aspx/UpdateExistUser',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id':'" + Id.toString() + "'}",
                cache: false,
                success: function (msg) {
                    window.location.href = msg.d;
                    //ShowProgress(false);
                },
                error: ShowError
            });
        }

        function validatesearch() {
            var ctrl = $("#ContentPlaceHolderMaster_ddlSearch option:selected");
            if (ctrl.index() <= 0) {
                ShowToolTip("#ContentPlaceHolderMaster_ddlSearch", "Please select Field.");
                return false;
            }
            ShowProgress(true);
            return true;
        }

        function validateCheckBox() {
            if (!$("#chkUser input[type='checkbox']").is(":checked")) {
                return false;
            }
            return true;
        }

        function GetCheckedUser() {
            var checkedUser = [];
            var checkBoxList = $("#chkUser input[type='checkbox']");
            if (validateCheckBox()) {
                for (var i = 0; i < checkBoxList.length; i++) {
                    if (checkBoxList[i].checked) {
                        checkedUser.push(checkBoxList[i].value);
                    }
                }
            }
            return checkedUser;
        }

        function deleteUser() {
            var select = [];
            select = GetCheckedUser();
            var dataToPass = { arr: select };
            var jsonTxt = JSON.stringify(dataToPass);
            if (select.length > 0) {
                var r = confirm("Do you want to delete selected user");
                if (r == true) {
                    ShowProgress(true);
                    $.ajax({
                        type: 'POST',
                        url: 'Users.aspx/DeleteUser',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: jsonTxt,
                        cache: false,
                        success: function (msg) {
                            if (msg.d > 0) {
                                ShowModalMsgBox("Renepay", "User deleted successfully");
                                window.location.reload();
                            }
                            else {
                                ShowModalMsgBox("Error", "Error while deleting user.");
                            }
                            HideProgress();
                        },
                        error: ShowError
                    });
                }
            }
            else {
                ShowModalMsgBox("Renepay", "Please select atleast one user.");
            }
        }
    </script>
    <div class="topBlk topBlkInn">
        <ul class="rightBtn">
            <li>
                <asp:LinkButton ID="xlbtnAdd" runat="server" CssClass="btnBlk"
                    OnClick="btnAdd_click" OnClientClick="javascript:ShowProgress(true);">Add</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="xlbtnDeleteUser" runat="server" CssClass="btnBlk"
                    OnClientClick="javascript:if(!(deleteUser())){return false;}">Delete</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk"
                    OnClick="xlbtnback_Click" Visible="false">Back</asp:LinkButton>
            </li>
        </ul>
        <br class="cl" />
    </div>
    <div class="clmn1">
        <div class="row1">
            <div class='whiteBox'>
                <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            </div>
        </div>
    </div>

</asp:Content>

