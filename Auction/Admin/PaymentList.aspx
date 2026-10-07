<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Admin_PaymentList, App_Web_paymentlist.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function HideProgress() {
            $("#divProgressBox").modal('hide');
        }


        $(document).ready(function () {
            BindPaging('tblList');
            GetDate();
        });

        function View_click(Id) {
            ShowProgress(true);
            $("#ContentPlaceHolder1_xhdnReportId").val(Id);
            $("#ContentPlaceHolder1_xbtnView").click();
            ShowProgress(false);

        }


        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            <%--$("#ContentPlaceHolder1_txtFromDate").datepicker({
                dateFormat: 'dd/mm/yy'
            });
            $("#ContentPlaceHolder1_txtToDate").datepicker({
                dateFormat: 'dd/mm/yy'
            });--%>
            GetDate();
        });

        function GetDate() {
            $("#ContentPlaceHolder1_txtFromDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_txtToDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');
        }
    </script>

    <div class="main supplier">
        <!--
        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="ChequePayment"></asp:Literal>
            </div>
            <ul class="rightBtn">
                <li>
                    <asp:LinkButton ID="btnBack" runat="server" CssClass="btnBlk" OnClick="btnBack_Click"
                        OnClientClick="javascript:ShowProgress(true);">CLOSE</asp:LinkButton>
                </li>
            </ul>
            <br class="cl">
        </div>
        -->
        <div class="clmn1">
            <%--  <div id="ListData" runat="server">
            <div class="row1">                
                <div class="whiteBox" id="SerachGroup" runat="server" visible="true">
                    <table style="width: 100%">
                        <tr>
                            <td > 
                                <label>Search By Name 
                                   <div class="styled-select imw88p ">
                                    <asp:DropDownList ID="ddlType" runat="server">
                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                        <asp:ListItem Value="PKG">Pacakage</asp:ListItem>
                                        <asp:ListItem Value="Inv">Invoice</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                              </label>                              
                            </td>
                            <td > 
                              <label>Search By Type 
                                <div class="styled-select imw88p ">
                                    <asp:DropDownList ID="ddlPaymentType" runat="server">
                                        <asp:ListItem >Select</asp:ListItem>
                                        <asp:ListItem Value="0">Pending</asp:ListItem>
                                        <asp:ListItem value="1">Paid</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                              </label>                                
                            </td>
                        </tr>
                        <tr>
                            <td class="">                                                            
                             <div class="imw45p fl">
                                <label>Start Date </label>                                 
                                    <input type="text" ID="txtFromDate"  runat="server" autocomplete="off"></input>                                                                
                                 
                               
                        </div>
                            </td>
                            <td class="imw33p">                               
                              <div class="imw45p fl">
                                   <label>End Date</label>                                      
                                        <asp:TextBox ID="txtToDate" CssClass="icnCal" runat="server" autocomplete="off"></asp:TextBox>                                      
                                   
                               </div>
                            </td>
                            <td class="imw33p">
                                <asp:LinkButton ID="btnSearch" runat="server" CssClass="btnBlk" OnClick="btnSearch_Click"
                                     OnClientClick="javascript:ShowProgress(true);">Submit</asp:LinkButton>
                            </td>
                        </tr>

                    </table>
                </div>                 
             </div>
            
             <br class="cl" />
             <div class="row1 immrb20"  id="PaymentList" runat="server">
                        <div class="table mT10">
                            <table border="0" cellspacing="0" cellpadding="0">
                                <asp:Literal ID="xlitReport" runat="server"></asp:Literal>
                            </table>
                        </div>
                    </div>
                <asp:Button ID="xbtnView" onclick="xbtnView_Click" runat="server" Style="display: none;" />
                <input type="hidden" id="xhdnReportId" runat="server" />
           </div>--%>

            <div id="ListData" runat="server">
                <div id="SerachGroup" runat="server">
                    <div class="row1">
                        <div class="whiteBox supplier">
                            <div class="leftClmn">
                                <div class="imw100p fl">
                                    <label>Search By Name </label>
                                    <div class="styled-select fl selOrganization">
                                        <asp:DropDownList ID="ddlType" runat="server">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="PKG">Pacakage</asp:ListItem>
                                            <asp:ListItem Value="Inv">Invoice</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="rightClmn">
                                <div class="imw100p fl">
                                    <label>Search By Type </label>
                                    <div class="styled-select fl selOrganization">
                                        <asp:DropDownList ID="ddlPaymentType" runat="server">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem Value="0">Pending</asp:ListItem>
                                            <asp:ListItem Value="1">Paid</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <br class="cl" />
                            <asp:LinkButton ID="btnSearch" runat="server" CssClass="btnBlk immrt20" OnClick="btnSearch_Click"
                                OnClientClick="javascript:ShowProgress(true);">SEARCH</asp:LinkButton>
                            <br class="cl" />
                        </div>

                        <table style="width: 100%">

                            <tr hidden="hidden">

                                <td class="imw33p">
                                    <label>From Date</label>
                                    <%--<input type="text" id="txtFromDate" class="selDate imw85p" runat="server" maxlength="10" autocomplete="off" ondrop="return false;" onpaste="return false;" />--%>
                                    <asp:TextBox ID="txtFromDate" runat="server" CssClass="selDate imw85p" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                </td>
                                <td class="imw33p">
                                    <label>To Date</label>
                                    <%--<input type="text" id="txtToDate" class="selDate imw85p" runat="server" maxlength="10" autocomplete="off" ondrop="return false;" onpaste="return false;" />--%>
                                    <asp:TextBox ID="txtToDate" runat="server" CssClass="selDate imw85p" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <br class="cl"/>
            <div class="whiteBox" id="PaymentList" runat="server">
                <asp:Literal ID="xlitReport" runat="server"></asp:Literal>
            </div>

            <asp:Button ID="xbtnView" OnClick="xbtnView_Click" runat="server" Style="display: none;" />
            <input type="hidden" id="xhdnReportId" runat="server" />
        </div>

        <div class="row1" id="xdivPaymentDet" runat="server" visible="false">

            <div class="whiteBox">
                <h2>Payment Details</h2>
                <asp:Literal ID="xlitPayDetails" runat="server"></asp:Literal>
                <h2>Payment Status</h2>
                <asp:CheckBox ID="xchckStatus" runat="server" />
                <h2>Comment</h2>
                <textarea id="textarea" name="content" runat="server" style="width: 300px"></textarea>
            </div>
            <asp:LinkButton ID="btnEdit" runat="server" CssClass="btnBlk" OnClick="btnEdit_Click" OnClientClick="javascript:ShowProgress(true);">Submit</asp:LinkButton>
            <asp:LinkButton ID="btnCancel" runat="server" CssClass="btnBlk" OnClick="btnCancel_Click" OnClientClick="javascript:ShowProgress(true);">Back</asp:LinkButton>

        </div>



    </div>
    </div>
    
</asp:Content>
