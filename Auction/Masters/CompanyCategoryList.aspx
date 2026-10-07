<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Masters_CompanyCategoryList, App_Web_companycategorylist.aspx.6044e34" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script>
        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });


        //$(document).ready(function () {
        //    BindPaging('tblList');
        //});

        function UpdateCompanyCategory(Id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'CompanyCategoryList.aspx/UpdateCompanyCategory',
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
            if (!$("#ChkId input[type='checkbox']").is(":checked")) {
                return false;
            }
            return true;
            // ShowProgress(true);
        }

        function GetCheckedProduct() {
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

        function deleteCompanyCategory() {
            var select = [];
            select = GetCheckedProduct();;
            var dataToPass = { arr: select };
            var jsonTxt = JSON.stringify(dataToPass);
            if (select.length > 0) {
                var r = confirm("Do you want to delete selected company category..");
                if (r == true) {
                    ShowProgress(true);
                    $.ajax({
                        type: 'POST',
                        url: 'CompanyCategoryList.aspx/deleteCompanyCategory',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: jsonTxt,
                        cache: false,
                        success: function (msg) {
                            if (msg.d <= 0) {
                                ShowModalMsgBox("Error", "Error while deleting company category.");
                            }
                            else { ShowModalMsgBox("Error", "Company category deleted successfully."); }
                            ShowProgress(false);
                            location.href = 'CompanyCategoryList.aspx'

                            //$("#ContentPlaceHolderMaster_BtnSearch").click();
                        },
                        error: function (errmsg) {
                        }
                    });
                }
            }
            else { ShowModalMsgBox("Error", "Please select atleast one company category."); }
        }

    </script>

    <div class="main purchaseOrder">

        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="Company Category Details"></asp:Literal>
            </div>
            <ul class="rightBtn">
               <li>
                <asp:LinkButton ID="xlbtnAdd" runat="server" CssClass="btnBlk"
                                     OnClick="btnAdd_click" OnClientClick="javascript:ShowProgress(true);">Add</asp:LinkButton>
               </li>
                <li>
                 <asp:LinkButton ID="xlbtnDeleteCategory" runat="server" CssClass="btnBlk"
                                     OnClientClick="javascript:if(!(deleteCompanyCategory())){return false;}">Delete</asp:LinkButton>
               </li>
                <li>
                 <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk" OnClick="xlbtnback_Click">Back</asp:LinkButton>
               </li>
             </ul>
            <br class="cl">
        </div>

        <div class="clmn1">           
            <div class="row1 immrb20">
                <div class="whiteBox">
                <div class="table mT10">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                    </table>
                </div>
                    </div>
            </div>
            <br /><asp:Literal ID="xlitmsg" runat="server"></asp:Literal>
        </div>
    </div>

</asp:Content>

