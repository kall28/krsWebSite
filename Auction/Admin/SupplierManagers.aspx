<%@ page language="C#" autoeventwireup="true" masterpagefile="~/SiteMaster.master" inherits="Admin_SupplierManagers, App_Web_suppliermanagers.aspx.fdf7a39c" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> </asp:content>

<asp:Content ID="Content2" ContentPlaceHolderID ="ContentPlaceHolder1" runat ="server">
    <script>
        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });

        function UpdateExistEntityCustomerMapping(id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'SupplierManagers.aspx/UpdateExistEntityCustomerMapping',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id':'" + id.toString() + "'}",
                cache: true,
                success: function (msg) {
                    window.location.href = msg.d;
                },
                error: function (errmsg) {
                }
            });
        }

        function validateCheckBox() {
            if (!$("#chkUser input[type='checkbox']").is(":checked")) {
                return false;
            }
            return true;
        }
        function GetCheckedSupplier() {
            var checkedRM = [];
            var checkBoxList = $("#chkUser input[type='checkbox']");
            if (validateCheckBox()) {
                for (var i = 0; i < checkBoxList.length; i++) {
                    if (checkBoxList[i].checked) {
                        checkedRM.push(checkBoxList[i].value);
                    }
                }

            }
            return checkedRM;
        }

        function deleteSupplierManager() {
            var select = [];
            select = GetCheckedSupplier();
            var dataToPass = { arr: select };
            var jsonTxt = JSON.stringify(dataToPass);
            if (select.length > 0) {
                var r = confirm("Do you want to delete selected Supplier Manager");
                if (r == true) {
                    ShowProgress(true);
                    $.ajax({
                        type: 'POST',
                        url: 'SupplierManagers.aspx/DeleteSupplierManager',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: jsonTxt,
                        cache: false,
                        success: function (msg) {
                            if (msg.d > 0) {
                                ShowModalMsgBox("Renepay", "Supplier Manager deleted successfully.");
                                location.href = 'SupplierManagers.aspx'
                            }
                            else { ShowModalMsgBox("Error", "Supplier Manager can not be deleted"); }
                            HideProgress();
                            //location.href = 'LeaderList.aspx'
                        },
                        error: ShowError


                    });
                }
            }
            else {
                ShowModalMsgBox("Error", "Please select atleast one record.");
            }

        }

    </script>

    <div class="main purchaseOrder">
         <div class="topBlk">
             <div class="mainHead f1">
                 <asp:Literal ID="xlitcap" runat="server" Text="Supplier Manager"></asp:Literal>
             </div>

             <ul class="rightBtn">
               <li>
                   <asp:LinkButton ID="xlbtnAdd" runat="server" CssClass="btnBlk"  OnClick="xlbtnAdd_Click" OnClientClick="javascript:ShowProgress(true)">Add</asp:LinkButton>
                </li>
                 <li>
                    <asp:LinkButton ID="xlbtnDelete" runat="server" CssClass="btnBlk" OnClientClick="javascript:if(!(deleteSupplierManager())){return false;}" >Delete</asp:LinkButton>   
                </li>
                 <li>
                    <asp:LinkButton ID="xlbtnBack" runat="server" CssClass="btnBlk" onclick="xlbtnBack_Click" >Back</asp:LinkButton>
                </li>
              </ul>
             <br class="cl"/>
         </div>

         <div class="clmn1">
             <div class="row1" >
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

 
