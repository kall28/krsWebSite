<%@ page language="C#" autoeventwireup="true" masterpagefile="~/SiteMaster.master" inherits="New_SalesCenter_RMList, App_Web_rmlist.aspx.8fa951ba" %>
<%@ MasterType virtualpath="~/SiteMaster.master" %>

<asp:content ID="Content1" ContentPlaceHolderID="head" runat="server"> </asp:content>

<asp:Content ID="Content2" ContentPlaceHolderID ="ContentPlaceHolder1" runat ="server">
    <script>
        function HideProgress() {
            $("#divProgressBox").modal('hide');
        }

        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });

        function CheckedAll() {
            $("#chkAll").change(function () {
                $("input:checkbox").prop('checked', $(this).prop("checked"));
            });
        }

        function UpdateExistEntityCustomerMapping(id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'RMList.aspx/UpdateExistEntityCustomerMapping',
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
        function GetCheckedRM() {
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

        function deleteRM() {
            var select = [];
            select = GetCheckedRM();
            var dataToPass = { arr: select };
            var jsonTxt = JSON.stringify(dataToPass);
            if (select.length > 0) {
                var r = confirm("Do you want to delete selected RM");
                if (r == true) {
                    ShowProgress(true);
                    $.ajax({
                        type: 'POST',
                        url: 'RMList.aspx/DeleteEntityCustomerMapping',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: jsonTxt,
                        cache: false,
                        success: function (msg) {
                            if (msg.d > 0) {
                                ShowModalMsgBox("Renepay", "RM deleted successfully.");
                            }
                            else { ShowModalMsgBox("Error", "Error while deleting RM."); }
                            HideProgress();
                            location.href = 'RMList.aspx'
                        },
                        error: ShowError
                    });
                }
            }
            else {                
                ShowModalMsgBox("Error", "Please select atleast one record.");
            }
        }

        function MapCustomerVendor(Id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'RMList.aspx/MapCustomerVendor',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id':'" + Id.toString() + "'}",
                cache: false,
                success: function (msg) {
                    window.location.href = msg.d;                    
                    HideProgress();
                },
                error: ShowError
            });
        }
        function MapCustomerCompany(Id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'RMList.aspx/MapCustomerCompany',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id':'" + Id.toString() + "'}",
                cache: false,
                success: function (msg) {
                    window.location.href = msg.d;
                    HideProgress();
                },
                error: ShowError
            });
        }

    </script>

    <div class="main purchaseOrder">
         <div class="topBlk">
             <div class="mainHead f1">
                 <asp:Literal ID="xlitcap" runat="server" Text="RM List"></asp:Literal>
             </div>
             <ul class="rightBtn">
               <li>
                   <asp:LinkButton ID="xlbtnAdd" runat="server" CssClass="btnBlk"  onclick="xlbtnAdd_Click"  OnClientClick="javascript:ShowProgress(true)" Visible="false">Add</asp:LinkButton>                                                       
                </li>
                 <li>
                     <asp:LinkButton ID="xlbtnDelete" runat="server" CssClass="btnBlk" OnClientClick="javascript:if(!(deleteRM())){return false;}" Visible="false">Delete</asp:LinkButton>   
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
             </div>

          </div>
    </div>

</asp:Content>
