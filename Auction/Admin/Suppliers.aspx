<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_Suppliers, App_Web_suppliers.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        //$(document).ready(function () {
        //    SetDataTablePaging("#tblList");
        //});
        //$(document).ready(function () {
        //    $('#tblList').DataTable({
        //        responsive: true
        //    });
        //});

        function HideProgress() {
            $("#divProgressBox").modal('hide');
        }

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            SetDataTablePaging("#tblList");
            // BindPaging('tblList');
        });

        var catId = 0;
        var categoryId = 0;
        function UpdateSupplier(Id) {
            //window.location = "Registration.aspx?Id=" + Id;
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'Suppliers.aspx/UpdateExistSupplier',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id':'" + Id.toString() + "'}",
                cache: false,
                success: function (msg) {
                    window.location.href = msg.d;
                    //HideProgress();

                },
                error: ShowError
            });
        }

        function GetCheckedVendor() {
            var checkedVendor = [];
            var checkBoxList = $("#chkVendor input[type='checkbox']");
            if (validateCheckBox()) {
                for (var i = 0; i < checkBoxList.length; i++) {
                    if (checkBoxList[i].checked) {
                        checkedVendor.push(checkBoxList[i].value);
                    }
                }
            }
            return checkedVendor;
        }

        function deleteVendor() {
            var select = [];
            select = GetCheckedVendor();
            var dataToPass = { arr: select };
            var jsonTxt = JSON.stringify(dataToPass);
            if (select.length > 0) {
                var r = confirm("Do You Want to Delete Selected Supplier");
                if (r == true) {
                    ShowProgress(true);
                    $.ajax({
                        type: 'POST',
                        url: 'Suppliers.aspx/DeleteVendor',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: jsonTxt,
                        cache: false,
                        success: function (msg) {
                            if (msg.d <= 0) {
                                ShowModalMsgBox("Error", "Error while deleting supplier.");
                            }
                            else {
                                ShowModalMsgBox("ReNePay", "Supplier deleted successfully.");
                                window.location.reload();
                            }
                            $("#ContentPlaceHolderMaster_xlbtnSearch").click();
                            HideProgress();
                        },
                        error: ShowError
                    });
                }
            }
            else {
                ShowModalMsgBox("Error", "Please select atleast one supplier.");
            }
        }

        function validateCheckBox() {
            if (!$("#chkVendor input[type='checkbox']").is(":checked")) {
                return false;
            }
            return true;
        }

        function validateSearch() {
            //var ctrl = $("#ContentPlaceHolderMaster_ddlCategory option:selected");
            //                    if (ctrl.index() <= 0) {
            //                        ShowToolTip("#ContentPlaceHolderMaster_ddlCategory", "Please Select Category");
            //                        return false;
            //                    }
            ShowProgress(true);
            return true;
        }

    </script>
    <asp:UpdatePanel ID="xupdSupDet" runat="server">
        <ContentTemplate>
            <div class="main purchaseOrder">
                <div class="topBlk">
                    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="Supplier Details"></asp:Literal>
                    </div>
                    <ul class="rightBtn">
                        <li>
                            <asp:LinkButton ID="xlbtnAdd" runat="server" CssClass="btnBlk"
                                OnClick="btnAdd_click" OnClientClick="javascript:ShowProgress(true);">Add</asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton ID="xlbtnDeleteCategory" runat="server" CssClass="btnBlk"
                                OnClientClick="javascript:if(!(deleteVendor())){return false;}">Delete</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk"
                                OnClientClick="javascript:ShowProgress(true);" OnClick="xlbtnBack_Click">Back</asp:LinkButton></li>
                    </ul>
                    <br class="cl">
                </div>
                <div class="clmn1 supplier">
                    <div class="row1">
                        <div class="whiteBox">
                            <div class="leftClmn">
                                <div class="imw100p fl">
                                    <label>Product Category</label>
                                    <div class="styled-select fl selOrganization">
                                        <asp:DropDownList ID="xddlCat" runat="server" OnSelectedIndexChanged="xddlCat_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="rightClmn">
                                <div class="imw100p fl">
                                    <label>Product Subcategory</label>
                                    <div class="styled-select fl selOrganization">
                                        <asp:DropDownList ID="xddlCatSub" runat="server">
                                            <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <br class="cl" />
                            <br class="cl" />
                            <div id="divVMR" style="width: 100%;" visible="true" runat="server">
                                <div class="leftClmn">
                                    <div class="imw100p fl">
                                        <label>Email</label>
                                        <asp:TextBox ID="xtxtEmail" runat="server" placeholder="Email" autocomplete="off" CssClass="imw100p" MaxLength="50"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="rightClmn">
                                    <div class="imw100p fl">
                                        <label>Company Name</label>
                                        <asp:TextBox ID="xtxtCompanyName" runat="server" placeholder="Company Name" autocomplete="off" CssClass="imw100p" MaxLength="50"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br class="cl" />
                            <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnBlk immrt20"
                                OnClick="btnSearch_click" OnClientClick="javascript:ShowProgress(true);">Submit</asp:LinkButton>
                        </div>
                    </div>
                    <br class="cl">
                    <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                </div>
                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

