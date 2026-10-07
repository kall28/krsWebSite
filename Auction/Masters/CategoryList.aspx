<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Masters_CategoryList, App_Web_categorylist.aspx.6044e34" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">

        $(document).ready(function () {
            SetDataTablePaging("#tblList");
            responsive: true
        });
        //var prm = Sys.WebForms.PageRequestManager.getInstance();
        //prm.add_endRequest(function () {
        //    $('#tblList').dataTable({
        //        // "iDisplayLength": 10,
        //        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
        //    });
        //});


        function UpdateCategoryDetails(Id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'CategoryList.aspx/UpdateCategoryDetails',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id':'" + Id.toString() + "'}",
                cache: false,
                success: function (msg) {
                    window.location.href = msg.d;
                    ShowProgress(false);
                },
                error: function (errmsg) {
                    ShowProgress(false);
                    ShowModalMsgBox("Error", errmsg);
                    //ShowMessageBox(errmsg);
                }
            });
        }


        function validateCheckBox() {
            if (!$("#chkCategory input[type='checkbox']").is(":checked")) {
                return false;
            }

            return true;
        }

        function GetCheckedCategory() {
            var checkedCat = [];
            var checkBoxList = $("#chkCategory input[type='checkbox']");
            if (validateCheckBox()) {

                for (var i = 0; i < checkBoxList.length; i++) {
                    if (checkBoxList[i].checked) {
                        checkedCat.push(checkBoxList[i].value);
                    }
                }

            }
            return checkedCat;
        }

        function deleteCategory() {
            var select = [];
            select = GetCheckedCategory();
            var dataToPass = { arr: select };
            var jsonTxt = JSON.stringify(dataToPass);
            if (select.length > 0) {
                var r = confirm("Do you want to delete selected category..");
                if (r == true) {
                    ShowProgress(true);
                    $.ajax({
                        type: 'POST',
                        url: 'CategoryList.aspx/DelCategory',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: jsonTxt,
                        cache: false,
                        success: function (msg) {
                            if (msg.d <= 0) {
                                //ShowMessageBox("Error while deleting Category.");
                                ShowModalMsgBox("Error", "Error while deleting category.");
                            }
                            else {
                                //ShowMessageBox("Category deleted successfully.");
                                ShowModalMsgBox("Error", "Category deleted successfully.");
                            }
                            ShowProgress(false);
                            location.href = 'CategoryList.aspx'
                            $("#ContentPlaceHolderMaster_btnSearch").click();
                            //ShowProgress(false);
                        },
                        error: function (errmsg) {
                        }
                    });

                }
            }
            else { ShowModalMsgBox("Error", "Please select atleast one category"); return false; }
            //else { ShowMessageBox("Please select atleast one category"); }
        }
    </script>

    <div class="main purchaseOrder">

        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="Category Details"></asp:Literal>
            </div>

            <ul class="rightBtn">
                <li>
                    <asp:LinkButton ID="xlbtnAdd" runat="server" CssClass="btnBlk"
                        OnClick="btnAdd_click" OnClientClick="javascript:ShowProgress(true);">Add</asp:LinkButton>
                </li>
                <li>
                    <asp:LinkButton ID="xlbtnDeleteCategory" runat="server" CssClass="btnBlk"
                        OnClientClick="javascript:if(!(deleteCategory())){return false;}">Delete</asp:LinkButton>
                </li>
                <li>
                    <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk" OnClick="xlbtnback_Click">Back</asp:LinkButton>
                    <%--MastersPag.aspx--%>
                </li>
            </ul>
            <br class="cl">
        </div>

        <div class="clmn1 supplier">
            <div class="row1">

                <div class="whiteBox">
                    <div class="leftClmn">
                        <div class="imw100p fl">
                            <label>Search By Parent Category</label>
                            <div class="styled-select fl selOrganization">
                                <asp:DropDownList ID="xddlSearch" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="rightClmn">
                        <div class="imw100p fl">
                           
                        </div>
                    </div>
                    <br class="cl" />
                     <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnBlk immrt20"
                                OnClick="btnSearch_click" OnClientClick="javascript:ShowProgress(true);">Submit</asp:LinkButton>
                    <br class="cl" />
                </div>

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

