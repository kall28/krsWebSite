<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_SearchCenter_CustomerSearch, App_Web_customersearch.aspx.6987701c" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">

        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });

        $(document).ready(function () {
            $('#tblRFP').DataTable({
                responsive: true
            });
        });

        $(document).ready(function () {
            $('#tblRFPVendors').DataTable({
                responsive: true
            });
        });

        $(document).ready(function () {
            $('#tblPO').DataTable({
                responsive: true
            });
        });

        function SendMail(Id, ReqId) {
            //if (status = 0) {
            //ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: strUrl + 'SearchCenter/CustomerSearch.aspx/SendMail',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id': '" + Id + "','ReqId': '" + ReqId + "'}",
                cache: false,
                success: function (msg) {
                    //ShowProgress(false);
                    //ShowMessageBox(msg.d);
                    ShowModalMsgBox("Error", msg.d);
                },
                error: ShowError
            });
            //}
            //else
            //    ShowMessageBox("Payment Already Done.");
        }
        
    </script>     
    <script src="../Scripts/customerSearch-1.0.js" type="text/javascript" ></script>   

    <%--<div class="main purchaseOrder">  --%>
    <div class="main supplier">

        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="Search Customer Details"></asp:Literal>
            </div>
            <div id="divClose">
            <ul class="rightBtn">
                 <asp:LinkButton ID="btnCancel" runat="server" CssClass="btnBlk"
                                    OnClientClick="javascript:ShowProgress(true);" OnClick="btnCancel_Click" >CLOSE</asp:LinkButton>                                
            </ul>
            </div>
                      
              <div  id="divFullDet"   class="insidepages"  style="display:none;">   <%--style="display:none;"  class="insidepages"   --%>         
                <div >                
                    <ul class='rightBtn'>  <li>                       
                         <%--<asp:LinkButton ID="LinkButton1" runat="server" CssClass="btnBlk"   
                                    OnClientClick="javascript:CustomerFullDetailsBack();" >BACK</asp:LinkButton>--%>
                        <input id="btnBack" type="button" value="BACK" runat="server" class="btnBlk" onclick= "javascript: CustomerFullDetailsBack();"/>
                    </li></ul><div></div><div class='clr'></div>  
                    <br class="cl">

            <div id="divDet" class='table'></div>
        </div>

            <br class="cl">
            <div class="row1 immrb20">
                <div class="table mT10" >
                    <table border="0" cellspacing="0" cellpadding="0">
                         <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                    </table>
                </div>
            </div>

        </div>
            
            <br class="cl">
        </div>

        <div class="clmn1">
             <div id="divSearchName" runat="server" >
            <div class="row1">
                <div class="whiteBox"  id="divSearch">  
                  <%--<table style="width: 100%" >
                        <tr>
                            <td class="imw33p" >
                             <label>Email</label>                            
                                <input type="text" id="txtEmail"    onkeypress="return RestrictText(event);" ondrop="return false;" autocomplete="off" maxlength="50"/>                                
                              </td>
                            <td class="imw33p">
                                <label>Mobile</label>                               
                                <input type="text" id="txtMobile"    ondrop="return false;" autocomplete="off"  onkeydown="IsNumeric(event);" maxlength="10"/>
                            </td>  
                            
                            <td class="imw33p">
                                <label>Company Name</label>                                                                 
                                 <input type="text" id="txtName"  onkeypress="return RestrictText(event);" ondrop="return false;" autocomplete="off" maxlength="50"/>
                              </td>
                               <td class="imw33p">
                                <label>Contact Person</label>                               
                                   <input type="text" id="txtContactPerson"  onkeypress="return RestrictText(event);" ondrop="return false;" autocomplete="off" maxlength="50"/>
                              </td>                            
                        </tr>
                       
                    </table>--%>
                     <%-- <br class="cl"/>         
                    <ul class="rightBtn">
                        <asp:LinkButton ID="btnSearchSubmit" runat="server" CssClass="btnBlk" 
                                      OnClientClick="javascript:CustomerSearch(); return false;">SEARCH</asp:LinkButton>    
                               
                    </ul>--%>
                    <div class="leftClmn">
                                   <div class="imw48p fl immr10">
                                        <label class="fL">Email</label><br />
                                       <input type="text" id="txtEmail" class="selDate imw85p" autocomplete="off" maxlength="50"/>                                
                                       <%-- <asp:TextBox ID="txtEmail" runat="server" onkeypress="return RestrictText(event);" ondrop="return false;" maxlength="50" CssClass="selDate imw85p"></asp:TextBox>--%>
                                   </div>
                                    <div class="imw48p fl">
                                        <label class="fL">Mobile</label><br />
                                         <input type="text" id="txtMobile" class="selDate imw85p" autocomplete="off"  onkeydown="IsNumeric(event);" maxlength="10"/>
                                        <%--<asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>--%>
                                  <%--  <asp:TextBox ID="txtMobile" runat="server" onkeypress="return RestrictText(event);" autocomplete="off"  onkeydown="IsNumeric(event);" maxlength="10" CssClass="selDate imw85p" ondrop="return false;"></asp:TextBox>--%>
                                    </div>
                            </div>
                            <div class="rightClmn">
                                    <div class="imw48p fl immr10">
                                        <label class="fL">Company Name</label><br />
                                         <input type="text" id="txtName" class="selDate imw85p" onkeypress="return RestrictText(event);" onpaste="return false;" autocomplete="off" maxlength="50"/>
                                       <%-- <asp:TextBox ID="txtName" runat="server" maxlength="50" CssClass="selDate imw85p" onkeypress="return RestrictText(event);" ondrop="return false;"></asp:TextBox>--%>
                                   </div>
                                    <div class="imw48p fl">
                                        <label class="fL">Contact Person</label><br />
                                         <input type="text" id="txtContactPerson" class="selDate imw85p"  onkeypress="return RestrictText(event);" onpaste="return false;" autocomplete="off" maxlength="50"/>
                                        <%--<asp:TextBox ID="txtContactPerson" runat="server" maxlength="50" CssClass="selDate imw85p" onkeypress="return RestrictText(event);" ondrop="return false;" autocomplete="off"></asp:TextBox>--%>
                                    </div>
                                    
                            </div>
                            <br class="cl" /><br/>
                                <div class="rightBtn">
                                     <asp:LinkButton ID="btnSearchSubmit" runat="server" CssClass="btnBlk" 
                                      OnClientClick="javascript:CustomerSearch(); return false;">SEARCH</asp:LinkButton>   
                                  <%--  <asp:LinkButton ID="btnSearchSubmit" runat="server" CssClass="btnBlk"
                                         OnClientClick="javascript:CustomerSearch(); return false;">SEARCH</asp:LinkButton>--%>
                                </div>
                            <br class="cl" />
                    <br class="cl"/> 
                </div>

                 <br class="cl"/>         
            <div class="table" id="divCustList" >
            </div>
             
                 </div>
             </div>

          <%--  <div class="insidepages" id="divFullDet" style="display:none;" >         
                <div > <ul class='rightBtn'>  <li>     
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btnBlk"   
                                    OnClientClick="javascript:CustomerFullDetailsBack();" >BACK</asp:LinkButton>

                    </li></ul><div></div><div class='clr'></div>  

            <div id="divDet" class='table'></div>
        </div>

            <br class="cl">
            <div class="row1 immrb20">
                <div class="table mT10" >
                    <table border="0" cellspacing="0" cellpadding="0">
                         <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                    </table>
                </div>
            </div>

        </div>--%>
        </div>
    </div>

</asp:Content>

