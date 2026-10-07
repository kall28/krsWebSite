<%@ page language="C#" autoeventwireup="true" masterpagefile="~/SiteMaster.master" validaterequest="false" inherits="New_Comm_CommActivityCreate, App_Web_commactivitycreate.aspx.c93392d6" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>     


        function validateForm() {
            var msg = "";
            if ($("#ContentPlaceHolder1_xtxtShortName").val() == '') {
                msg = "Please Enter Short Name";
                ShowToolTip("#ContentPlaceHolder1_xtxtShortName", msg);
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtName").val() == '') {
                msg = "Please Enter Name";
                ShowToolTip("#ContentPlaceHolder1_xtxtName", msg);
                return false;
            }            
            else if ($("#ContentPlaceHolder1_ddlActivity option:selected").index() <= 0) {
                msg = "Please select activitytype"
                ShowToolTip("#ContentPlaceHolder1_ddlActivity",msg);
                return false;
            }
            if (msg.length <= 0) {
                //ShowProgress(true);
                return true;
            }
            return false;
        }


</script>
     <asp:UpdatePanel ID="xupnlSupplier" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <div class="main supplier">
        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="Insert Details"></asp:Literal>
            </div>
        </div>

         <br class="cl">

                <div class="clmn1" id="divCommActivity" runat="server">
                    <div class="row1">
                        <div class="whiteBox">
                           <div class="leftClmn">
                        Please fill the details for Activity
                                    <br class="cl"/>
                        <br class="cl">
                          <label>Short Name</label>
                        <asp:TextBox ID="xtxtShortName" runat="server" CssClass="imw97p"  MaxLength="30" autocomplete="off"></asp:TextBox>                       
                        <br class="cl">
                           <label>Name</label>
                        <asp:TextBox ID="xtxtName" runat="server" CssClass="imw97p"  MaxLength="30" autocomplete="off"></asp:TextBox>    
                        <br class="cl">
                         <label>Description</label>
                        <asp:TextBox ID="xtxtDescription" runat="server" CssClass="imw97p" maxlength="70" autocomplete="off"></asp:TextBox>
                        <br class="cl">
                        <label>Type</label> 
                        <div class="styled-select fl selOrganization">
                         <asp:DropDownList ID="ddlActivity" runat="server">
                                        <asp:ListItem Value="00">-Select-</asp:ListItem>
                                        <asp:ListItem Value="RFP">RFP</asp:ListItem>
                                        <asp:ListItem Value="AUC">AUCTION</asp:ListItem>
                                        <asp:ListItem Value="PUR">PURCHASE</asp:ListItem>
                                        <asp:ListItem value="OTH">OTHER</asp:ListItem>
                          </asp:DropDownList> 
                           </div>      
                        <br class="cl">
                        <label>CC</label>
                        <asp:TextBox ID="xtxtCC" runat="server" CssClass="imw97p" ToolTip="Enter CC separated by ;"  autocomplete="off"></asp:TextBox>
                        <br class="cl">
                        <label>BCC</label>
                        <asp:TextBox ID="xtxtBCC" runat="server" CssClass="imw97p" ToolTip="Enter BCC separated by ;" autocomplete="off"></asp:TextBox>
                        <br class="cl">                        
                        <div id="divchckPublish" runat="server">
                           <table>
                             <tr> <td width="3%" ><asp:CheckBox ID="xchckPublish" runat="server" /></td> <td  width="20%" > <label style="vertical-align:auto"> Published</label></td>
                              <td  width="3%"><asp:CheckBox ID="xchckQueued" runat="server" /></td><td width="20%"><label style="vertical-align:auto"> Queued</label></td>
                              <td  width="3%"><asp:CheckBox ID="xchkScheduled" runat="server" /></td><td width="20%"><label style="vertical-align:auto"> Scheduled</label></td>

                             </tr>

                            </table>
                        </div>
                        <br class="cl">                      
                    </div>                          
                            <br class="cl">                    
                            <asp:LinkButton ID="xlbtnCancel" runat="server" CssClass="btnBlk" OnClick="xlbtnCancel_Click" OnClientClick="javascript:ShowProgress(true);">CANCEL</asp:LinkButton>                       
                            <asp:LinkButton ID="xlbtnNext" runat="server" CssClass="btnBlk" OnClientClick="javascript:return validateForm();" OnClick="xlbtnNext_Click" >NEXT</asp:LinkButton>
                    
                        </div>
                    </div>
                </div>
         <div id="divCommTemplateList" runat="server" visible="false">
                <asp:Literal ID="xlitCommTempalateList" runat="server"></asp:Literal>
                <div class="col-1">                  

                    <asp:LinkButton ID="btnBack" runat="server" CssClass="btnBlk" OnClick="btnBack_Click" >BACK</asp:LinkButton>
                    <asp:LinkButton ID="xlbtnSubmit" runat="server" CssClass="btnBlk" OnClick="xlbtnSubmit_Click"  >INSERT</asp:LinkButton>                    
                    
                </div>
            </div>

        <asp:Literal ID="xlitScript"  runat="server"></asp:Literal>
        </div>
            </ContentTemplate>
         </asp:UpdatePanel>

 </asp:Content>



   