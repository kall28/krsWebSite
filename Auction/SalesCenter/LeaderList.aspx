<%@ page language="C#" autoeventwireup="true" masterpagefile="~/SiteMaster.master" inherits="New_SalesCenter_LeaderList, App_Web_leaderlist.aspx.8fa951ba" %>
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
                url: 'LeaderList.aspx/UpdateExistEntityCustomerMapping',
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

        function deleteLeader() {
            var select = [];
            select = GetCheckedRM();
            var dataToPass = { arr: select };
            var jsonTxt = JSON.stringify(dataToPass);
            if (select.length > 0) {
                var r = confirm("Do you want to delete selected Leader");
                if (r == true) {
                    ShowProgress(true);
                    $.ajax({
                        type: 'POST',
                        url: 'LeaderList.aspx/DeleteEntityCustomerMapping',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: jsonTxt,
                        cache: false,
                        success: function (msg) {
                            if (msg.d > 0) {
                                ShowModalMsgBox("Renepay", "Leader deleted successfully.");
                                location.href = 'LeaderList.aspx'
                            }
                            else { ShowModalMsgBox("Error", "Leader-RM/SM mapping exist.Remove mapping to delete Leader."); }                            
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

        function MapCustomerRM(Id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'LeaderList.aspx/MapCustomerRM',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id':'" + Id.toString() + "'}",
                cache: false,
                success: function (msg) {
                    window.location.href = msg.d;
                },
                error: ShowError
            });

        }
        function MapCustomerRAM(Id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'LeaderList.aspx/MapCustomerRAM',
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
        function MapCustomerSM(Id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'LeaderList.aspx/MapCustomerSM',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id':'" + Id.toString() + "'}",
                cache: false,
                success: function (msg) {
                    window.location.href = msg.d;
                   // HideProgress();                    
                },
                error: ShowError
            });
        }

    </script>

    <div class="main purchaseOrder">
         <div class="topBlk">
             <div class="mainHead f1">
                 <asp:Literal ID="xlitcap" runat="server" Text="Leader List"></asp:Literal>
             </div>

             <ul class="rightBtn">
               <li>
                   <asp:LinkButton ID="xlbtnAdd" runat="server" CssClass="btnBlk"  OnClick="xlbtnAdd_Click" OnClientClick="javascript:ShowProgress(true)">Add</asp:LinkButton>
                </li>
                 <li>
                    <asp:LinkButton ID="xlbtnDelete" runat="server" CssClass="btnBlk" OnClientClick="javascript:if(!(deleteLeader())){return false;}" >Delete</asp:LinkButton>   
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