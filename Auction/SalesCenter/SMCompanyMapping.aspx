<%@ page language="C#" autoeventwireup="true" masterpagefile="~/SiteMaster.master" inherits="New_SalesCenter_SMCompanyMapping, App_Web_smcompanymapping.aspx.8fa951ba" %>
<%@ MasterType virtualpath="~/SiteMaster.master" %>

<asp:content ID="Content1" ContentPlaceHolderID="head" runat="server"> </asp:content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

<script>
    function HideProgress() {
        $("#divProgressBox").modal('hide');
    }

    $(document).ready(function () {
        $('#tblList').DataTable({
            responsive: true
        });
    });

    $(document).ready(function () {
        $('#tblListNew').DataTable({
            responsive: true
        });
    });

    function CheckedAll() {
        $("#chkAll").change(function () {
            $("input:checkbox").prop('checked', $(this).prop("checked"));
        });
    }

    function deleteCompany(Id) {        
        ShowProgress(true);
        $.ajax({
            type: 'POST',
            url: 'SMCompanyMapping.aspx/DeleteCompany',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            //data: jsonTxt,
            data: "{'Id':'" + Id + "'}",
            cache: false,
            success: function (msg) {
                if (msg.d > 0) {
                    // ShowMessageBox("Company/s deleted successfully");
                    window.location.assign("SMCompanyMapping.aspx");
                }
                HideProgress();
            },
            error: ShowError
        });
    }

  </script>

 <div class="main purchaseOrder">
         <div class="topBlk">
             <div class="mainHead f1">
                 <asp:Literal ID="xlitcap" runat="server" Text=" Company Mapping"></asp:Literal>
             </div>
             <ul class="rightBtn">
               <li>
                    <asp:LinkButton ID="btnMap" runat="server" value="Add" Text="Add" CssClass="btnBlk" OnClick="btnMap_Click" OnClientClick="javascript:ShowProgress(true)"></asp:LinkButton>                                                                                  
                </li>
                 <li>
                     <asp:LinkButton ID="btnMapCompany" runat="server" value="Next"  Text="Next" CssClass="btnBlk" OnClick="btnMapCompany_Click" OnClientClick="javascript:ShowProgress(true)"></asp:LinkButton>
                </li>
                 <li>
                     <asp:LinkButton ID="btnCancel" runat="server" CssClass="btnBlk" OnClick="btnCancel_Click"  >BACK</asp:LinkButton>                            
                </li>
                 <li>
                     <asp:LinkButton ID="btnBack" runat="server" CssClass="btnBlk" OnClick="btnBack_Click" visible="false">Back</asp:LinkButton>                            
                </li>
            </ul>
             <br class="cl"/>
         </div>

         <div class="clmn1">
             <div class="row1" >               
                 <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>                            
             </div>             
             <br class="cl" />        
            <div class="whiteBox">
             <div class="row1 immrb20">               
                 <div id="divSelCompanylst"  class="tablemT10" runat="server">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <h4><span> Company Mapped List </span></h4>
                       <asp:Literal ID="xlitSelCompanyList"  runat="server"></asp:Literal>
                    </table>
                 </div>
                            
                 <div id="divCompanylst"  class="tablemT10" style="display:none" runat="server">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <h4><span>Select Company For Mapping</span></h4>
                       <asp:Literal ID="xlitCompanyList" runat="server"></asp:Literal>
                    </table>
                 </div>
            </div>
                                        
           </div>          
             
             <asp:Literal ID="xlitScript" runat="server"></asp:Literal>             

          </div>
    </div>

</asp:Content>