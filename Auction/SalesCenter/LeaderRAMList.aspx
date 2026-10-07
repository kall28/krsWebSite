<%@ page language="C#" autoeventwireup="true" masterpagefile="~/SiteMaster.master" inherits="New_SalesCenter_LeaderRAMList, App_Web_leaderramlist.aspx.8fa951ba" %>
<%@ MasterType virtualpath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script>
        function HideProgress() {
            $("#divProgressBox").modal('hide');
        }

        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });

        //$(document).ready(function () {
        //    $('#tblListNew').DataTable({
        //        responsive: true
        //    });
        //});

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            SetDataTablePaging("#tblListNew");
        });
        
        function CheckedAll() {
             $("#chkAll").change(function () {            
                $("input:checkbox").prop('checked', $(this).prop("checked"));                
            });
        }   

        function deleteRAM(Id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'LeaderRAMList.aspx/DeleteRAM',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                //data: jsonTxt,
                data: "{'Id':'" + Id + "'}",
                cache: false,
                success: function (msg) {
                    if (msg.d <= 0) {
                        ShowMessageBox("Error while deleting RM.");
                    }
                    else {
                        window.location.assign("LeaderRAMList.aspx");

                    }
                    //$("#ContentPlaceHolderMaster_btnSearch").click();
                    HideProgress();
                },
                error: ShowError
            });
            //}
            //}
            //else {
            //    ShowMessageBox("Please select atleast one record.");
            //}
        }
    </script>
     <asp:UpdatePanel ID="xupnlSupplier" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <div class="main purchaseOrder">
         <div class="topBlk">
             <div class="mainHead f1">
                 <asp:Literal ID="xlitcap" runat="server" Text=" Leader - RAM Mapping"></asp:Literal>
             </div>

             <ul class="rightBtn">
               <li>
                   <asp:LinkButton ID="btnMap" runat="server" CssClass="btnBlk"  OnClick="btnMap_Click" >ADD</asp:LinkButton>                            
               </li>
                 <li>
                     <asp:LinkButton ID="btnMapRAM" runat="server" CssClass="btnBlk"  OnClick="btnMapRAM_Click" >NEXT</asp:LinkButton>
               </li>
                 <li>
                     <asp:LinkButton ID="btnCancel" runat="server" CssClass="btnBlk" OnClick="btnCancel_Click" >BACK</asp:LinkButton>
               </li>
                 <li>
                     <asp:LinkButton ID="btnBack" runat="server" CssClass="btnBlk" visible="false" OnClick="btnBack_Click" >BACK</asp:LinkButton>
               </li>
             </ul>
             <br class="cl"/>
         </div>

         <div class="clmn1">           
             <div class="row1 immrb20">
                 <div class="whiteBox">

                 <div id="divSelRAMList" class="tablemT10" runat="server">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <h4><span> RAM Mapped List </span></h4>
                       <asp:Literal ID="xlitSelRMList" runat="server"></asp:Literal>
                    </table>
                 </div>

                 <div id="divRAMlst"  class="tablemT10" style="display:none" runat="server">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <h4><span>Select RAM For Mapping</span></h4>
                       <asp:Literal ID="xlitRMList" runat="server"></asp:Literal>
                    </table>
                 </div>

             </div>
             </div>
             <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
          </div>
    </div>
            </ContentTemplate>
         </asp:UpdatePanel>

</asp:Content>