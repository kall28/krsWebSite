<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_ReportCenter_SalesManageReport, App_Web_salesmanagereport.aspx.51bd485d" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });
        $(document).ready(function () {
            BindDatePicker();
        });
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            BindDatePicker();
        });

        function BindDatePicker() {
            $("#ContentPlaceHolder1_xtxtFromDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');
        }

        </script>
    <%--<div class="main purchaseOrder">--%>
    <div class="main supplier">

        <div class="clmn1"> 
             <div class="whiteBox brdPink">
                 <div class="formRow">
                     <div class="formRow1">
                         <table style="width:100%;">
                             <tr>
                                <td>
                                    <div  id="divSearchByName"  runat="server"> <%--class="leftClmn"--%>
                                    <label class="fL">Search By Name</label>
                                    <asp:TextBox ID="xtxtCity" runat="server" maxlength="100" ></asp:TextBox> <%--CssClass="selDate imw85p"--%>
                                </div>
                                  </td>

                                <td>
                                    <div  id="divRMRAMList"  runat="server">  <%--class="rightClmn"--%>
                                    <div id="divRMSelect"  runat="server" class="imw48p immr10 fl"> <%--class="imw48p immr10 fl"--%>
                                         <label class="fL">Search By RM</label>
                                        <div class="formRow1">
                                        <div class="imw68p bgGrey">
                                        <div id="divRMlist" runat="server" class="styled-select selOrganization">    <%--class="styled-select imw88p"--%>
                                            <asp:DropDownList ID="xddlRMList" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                            </div>
                                            </div>
                                    </div>
                                    <div id="divRAMSelect" class="imw48p fl" runat="server" >   <%--class="imw48p fl"--%>
                                        <label class="fL">Search By RAM</label>
                                        <div class="formRow1">
                                        <div class="imw68p bgGrey">
                                        <div id="divRAMlist" runat="server" class="styled-select selOrganization">                    
                                            <asp:DropDownList ID="xddlRAMList" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                            </div>
                                            </div>
                                    </div>
                                </div>   
                                 </td>
                                 </tr>
                             <tr>
                                <td>
                                    <div  class ="immrt10"><asp:LinkButton  ID="xlbtnSearch" runat="server" CssClass="btnRed" OnClick="btnSearch_click">Search</asp:LinkButton>
                                    </div>
                                  </td>
                              </tr>
                           </table>                   
                      </div>
                 </div> 
                 <br class="cl" />
              </div>

             <div class="row1">
                            <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>                            
                        </div>
             <br class="cl"/>
             <div class="row1 immrb20">
                          <div class="whiteBox">
                            <div class="table mT10">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                                </table>
                            </div>
                           </div>
                        </div>
        </div>
                    
      </div>
    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
</asp:Content>

