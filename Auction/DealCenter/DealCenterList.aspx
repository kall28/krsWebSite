<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_DealCenter_DealCenterList, App_Web_dealcenterlist.aspx.3dacc91e" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">

        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });

        function validateCheckBox() {
            if (!$("#ChkId input[type='checkbox']").is(":checked")) {
                ShowModalMsgBox("Error", "Please select deal.");
                return false;
            }
            return true;
        }

        function GetCheckedDEAL() {
            var checkedCat = [];
            var checkBoxList = $("#ChkId input[type='checkbox']");
            if (validateCheckBox()) {
                for (var i = 0; i < checkBoxList.length; i++) {
                    if (checkBoxList[i].checked) {
                        checkedCat.push(checkBoxList[i].value);
                    }
                }
            }

            return checkedCat;
        }

        function deleteDEAL() {
            var select = [];
            select = GetCheckedDEAL();
            var dataToPass = { arr: select };
            var jsonTxt = JSON.stringify(dataToPass);
            if (select.length > 0) {
                var r = confirm("Do you want to delete selected deal.");
                if (r == true) {
                    ShowProgress(true);
                    $.ajax({
                        type: 'POST',
                        url: 'DealCenterList.aspx/deleteDeal',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: jsonTxt,
                        cache: false,
                        success: function (msg) {
                            if (msg.d <= 0) {
                                ShowModalMsgBox('Error','Error while deleting deal.');
                            }
                            else {
                                ShowModalMsgBox('Message', 'deal Deleted succesfully');
                            }
                                ShowProgress(false);
                                location.href = 'DealCenterList.aspx'
                        },
                        error: ShowError
                    });
                }
            }
            else {
                ShowModalMsgBox("Error", "Please select atleast one record.")
            }
        }

        function RFP_click(url) {
            ShowProgress(true);
            window.location = url;
        }

    </script>

    <div class="main purchaseOrder">
                <div class="topBlk">
                    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="Offer List"></asp:Literal>
                    </div>
                    <ul class="rightBtn"><li>
                            <asp:LinkButton ID="xlbtnDelete" runat="server" CssClass="btnBlk"
                                    OnClientClick="javascript: return deleteDEAL();" Visible="true">DELETE</asp:LinkButton>
                                <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk" 
                                    OnClick="xlbtnback_Click">BACK</asp:LinkButton>
                    </li></ul>
                    <br class="cl">
                </div>
                <div class="clmn1">
                    <div class="row1">
                        <div class="whiteBox">
                            <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                        </div>
                    </div>
                </div>
                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            </div>

</asp:Content>