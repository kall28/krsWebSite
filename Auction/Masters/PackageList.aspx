<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Masters_PackageList, App_Web_packagelist.aspx.6044e34" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" >
        $(document).ready(function () {
            $('#tblPkgList').DataTable({
                responsive: true
            });
        });

        //$(document).ready(function () {
        //    BindPaging('tblList');
        //});

        function UpdateExistPackage(Id) {
            //window.location = "Registration.aspx?Id=" + Id;
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'PackageList.aspx/UpdateExistPackage',
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
            if (!$("#chkPackage input[type='checkbox']").is(":checked")) {
                return false;
            }
            return true;
        }

        function GetCheckedPackage() {
            var checkedPackage = [];
            var checkBoxList = $("#chkPackage input[type='checkbox']");
            if (validateCheckBox()) {
                for (var i = 0; i < checkBoxList.length; i++) {
                    if (checkBoxList[i].checked) {
                        checkedPackage.push(checkBoxList[i].value);
                    }
                }
            }
            return checkedPackage;
        }

        function deletePackage() {
            var select = [];
            select = GetCheckedPackage();
            var dataToPass = { arr: select };
            var jsonTxt = JSON.stringify(dataToPass);
            if (select.length > 0) {
                var r = confirm("Do you want to delete selected package");
                if (r == true) {
                    ShowProgress(true);
                    $.ajax({
                        type: 'POST',
                        url: 'PackageList.aspx/DeletePackage',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: jsonTxt,
                        cache: false,
                        success: function (msg) {
                            if (msg.d > 0) {
                                //ShowModalMsgBox("Error", "Package deleted successfilly.")
                                window.location.href = 'packagelist.aspx';
                                $("#ContentPlaceHolderMaster_btnSearch").click();
                                ShowProgress(false);
                            }
                            else { ShowModalMsgBox("Error", "Error while deleting package") }
                        },
                        error: function (errmsg) {
                        }
                    });
                }
            }
            else { ShowModalMsgBox("Error", "Please select atleast one package."); }
        }

        function validatesearch() {
            var ctrl = $("#ContentPlaceHolder1_ddlSearch option:selected");
            if (ctrl.index() < 0) {
                ShowToolTip("#ContentPlaceHolder1_ddlSearch", "Please select field.");
                return false;
            }

            var ctrl1 = $("#ContentPlaceHolder1_ddlSearch option:selected");
            var ctrl = $("#ContentPlaceHolder1_txtSearch");
            if (ctrl.val() == "" && ctrl1.index() > 1) {
                ShowToolTip("#ContentPlaceHolder1_txtSearch", "Please fill textbox");
                return false;
            }
            ShowProgress(true);
            return true;
        }

            </script>

    <div class="main purchaseOrder">

        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="Package Details"></asp:Literal>
            </div>

            <ul class="rightBtn">
               <li>
                   <asp:LinkButton ID="xlbtnAdd" runat="server" CssClass="btnBlk"
                                     OnClick="btnAddPackage_click" OnClientClick="javascript:ShowProgress(true);">Add</asp:LinkButton>
                </li>
                <li>
                    <asp:LinkButton ID="xlbtnDeleteCategory" runat="server" CssClass="btnBlk"
                                     OnClientClick="javascript:if(!(deletePackage())){return false;}">Delete</asp:LinkButton>
                </li>
                <li>
                    <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk" OnClick="xlbtnback_Click">Back</asp:LinkButton>
                </li>

              </ul>
            <br class="cl">
        </div>

        <div class="clmn1">
           <asp:Literal ID="xlitmsg" runat="server"> </asp:Literal>                                                
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

