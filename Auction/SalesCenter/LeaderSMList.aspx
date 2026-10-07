<%@ page language="C#" autoeventwireup="true" masterpagefile="~/SiteMaster.master" inherits="New_SalesCenter_LeaderSMList, App_Web_leadersmlist.aspx.8fa951ba" %>
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

        function deleteSM(Id) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: 'LeaderSMList.aspx/DeleteSM',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                //data: jsonTxt,
                data: "{'Id':'" + Id + "'}",
                cache: false,
                success: function (msg) {
                    if (msg.d <= 0) {
                        //ShowMessageBox("Error while deleting SM.");
                        ShowModalMsgBox("Error while deleting SM.");
                    }
                    else {
                        window.location.assign("LeaderSMList.aspx");

                    }
                    HideProgress();
                },
                error: ShowError
            });
        }

    </script>
      <asp:UpdatePanel ID="xupnlSupplier" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <div class="main purchaseOrder">
         <div class="topBlk">
             <div class="mainHead f1">
                 <asp:Literal ID="xlitcap" runat="server" Text=" Leader - SM Mapping"></asp:Literal>
             </div>
             <ul class="rightBtn">
               <li>
                    <asp:LinkButton ID="btnMap" runat="server" value="Add" Text="Add" CssClass="btnBlk" OnClick="btnMap_Click" ></asp:LinkButton>
               </li>
                 <li>
                     <asp:LinkButton ID="btnMapSM" runat="server" value="Next"  Text="Next" CssClass="btnBlk" onclick="btnMapSM_Click" ></asp:LinkButton>
               </li>
                 <li>
                     <asp:LinkButton ID="btnCancel" runat="server" CssClass="btnBlk" OnClick="btnCancel_Click" >BACK</asp:LinkButton>                            
               </li>
               <li>
                      <asp:LinkButton ID="btnBack" runat="server" CssClass="btnBlk" onclick="btnBack_Click" visible="false">Back</asp:LinkButton>
               </li>
           </ul>
             <br class="cl"/>
         </div>

         <div class="clmn1">
             <div class="row1" >
                  <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>                            
             <br class="cl" />
           <div class="row1 immrb20">
               <div class="whiteBox">
                 <div id="divSelSMList" class="tablemT10" runat="server">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <h4><span> SM Mapped List </span></h4>
                       <asp:Literal ID="xlitSelSMList" runat="server"></asp:Literal>
                    </table>
                 </div>

                 <div id="divVendorlst"  class="tablemT10" style="display:none" runat="server">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <h4><span>Select SM For Mapping</span></h4>
                       <asp:Literal ID="xlitSMList" runat="server"></asp:Literal>
                    </table>
                 </div>

               </div>
             </div>

            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>             

          </div>
        </div>
        </div>
            </ContentTemplate>
          </asp:UpdatePanel>

</asp:Content>
