<%@ page language="C#" autoeventwireup="true" masterpagefile="~/SiteMaster.master" inherits="New_SalesCenter_SMVendorMapping, App_Web_smvendormapping.aspx.8fa951ba" %>
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

    function deleteVendor(Id) {
        ShowProgress(true);
        $.ajax({
            type: 'POST',
            url: 'SMVendorMapping.aspx/DeleteVendor',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            //data: jsonTxt,
            data: "{'Id':'" + Id + "'}",
            cache: false,
            success: function (msg) {
                if (msg.d <= 0) {
                    ShowMessageBox("Error while deleting supplier.");
                }
                else {
                    window.location.assign("SMVendorMapping.aspx");

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
                 <asp:Literal ID="xlitcap" runat="server" Text=" Vendor Mapping"></asp:Literal>
             </div>
             <ul class="rightBtn">
               <li>
                    <asp:LinkButton ID="btnMap" runat="server" value="Add" Text="Add" CssClass="btnBlk" OnClick="btnMap_Click" OnClientClick="javascript:ShowProgress(true)"></asp:LinkButton>                                                                                  
                </li>
                 <li>
                     <asp:LinkButton ID="btnMapVendor" runat="server" value="Next"  Text="Next" CssClass="btnBlk" OnClick="btnMapVendor_Click" OnClientClick="javascript:ShowProgress(true)"></asp:LinkButton>
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
                 <div class="col-2" id="divddlCat" runat="server" style="display:none">
                                <div class="styled-select imw88p">
                                    <label> Category</label></div>                                
                                   <asp:DropDownList ID ="ddlCategory" runat="server"  AutoPostBack="true"
                                         ></asp:DropDownList>                                
                            </div>
                 <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>                                            
             </div>             
             <br class="cl" />
           <div class="row1 immrb20">
               <div class="whiteBox">
                 <div id="divSelVendorList" class="tablemT10" runat="server">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <h4><span> Vendor Mapped List </span></h4>
                       <asp:Literal ID="xlitSelVendorList" runat="server"></asp:Literal>
                    </table>
                 </div>

                 <div id="divVendorlst"  class="tablemT10" style="display:none" runat="server">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <h4><span>Select Vendor For Mapping</span></h4>
                       <asp:Literal ID="xlitVendorList" runat="server"></asp:Literal>
                    </table>
                 </div>
             </div>
               </div>
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>             

          </div>
    </div>

</asp:Content>