<%@ page title="" language="C#" masterpagefile="~/Settings/SettingMaster.master" autoeventwireup="true" inherits="New_Settings_Notifications, App_Web_notifications.aspx.f634c32f" %>

<%@ MasterType VirtualPath="~/Settings/SettingMaster.master" %>
<%@ Reference VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderButton" Runat="Server">

    <script type="text/javascript">

        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });
        
        function toggleSelection(element) {
            var checkBoxList = "";
            checkBoxList = $("#chkMessage input[type='checkbox']");
            for (var i = 0; i < checkBoxList.length; i++) {
                checkBoxList[i].checked = element.checked;
            }
        }
    </script>

    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="<span id='spnCap'>NOTIFICATIONS</span>"></asp:Literal>
                    </div>
    <ul class="rightBtn">
      <%--  style="display:none;"--%>
                    <li style="display:none"><a href="Notifications.aspx" class="btnBlk">REFRESH</a></li>
                    <li><a  class="btnBlk" onclick="return DeleteMessages();">DELETE</a></li>
                    <li style="display:none"><a href="../Dashboard.aspx" class="btnBlk">Close</a></li>
              	</ul>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">
<%--<asp:UpdatePanel ID="xupnlPackage" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>
            <script type="text/javascript">
                function ReadMail(Id) {
                    ShowProgress(true);
                    $.ajax({
                        type: 'POST',
                        url: 'Notifications.aspx/ReadMail',
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

              

                function validateCheckBox() {
                    if (!$("#chkMessage input[type='checkbox']").is(":checked")) {
                        return false;
                    }
                    return true;

                }
                function GetCheckedMessage() {
                    var CheckedMessage = [];
                    var checkBoxList = $("#chkMessage input[type='checkbox']");
                    if (validateCheckBox()) {
                        for (var i = 0; i < checkBoxList.length; i++) {
                            if (checkBoxList[i].checked) {
                                CheckedMessage.push(checkBoxList[i].value);
                            }
                        }
                    }
                    return CheckedMessage;
                }

                function ReadAll()
                {

                }
                function DeleteMessages() {
                    var select = [];
                    select = GetCheckedMessage();
                    var dataToPass = { arr: select };
                    var jsonTxt = JSON.stringify(dataToPass);
                    if (select.length > 0) {
                        var r = confirm("Do You Want to Delete Selected Messages");
                        if (r == true) {
                            ShowProgress();
                            $.ajax({
                                type: 'POST',
                                url: 'Notifications.aspx/DeleteMessages',
                                contentType: 'application/json; charset=utf-8',
                                dataType: 'json',
                                data: jsonTxt,
                                cache: false,
                                success: function (msg) {
                                    if (msg.d != null) {
                                        ShowModalMsgBox("Renepay", "Mail Deleted Successfully.");
                                        HideProgress();
                                        window.location.href = "Notifications.aspx";
                                       // link_click("Inbox");
                                    }
                                    else { ShowModalMsgBox("Error","Error while deleting Mail."); }
                                },
                                error: function (errmsg) {
                                }
                            });
                        }
                    }
                    else { ShowModalMsgBox("Renepay", "Please select atleast one Mail."); }
                }


            </script>

        <div class="table mT10">
                        
                            <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                        
                    </div>
            <asp:Literal ID="xlitmsg" runat="server"></asp:Literal>
   <%-- <a href="#" class="chatWidget"><img src="images/chat-widget.jpg"></a>--%>
<%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

