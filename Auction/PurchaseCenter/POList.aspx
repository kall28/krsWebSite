<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_PurchaseCenter_POList, App_Web_polist.aspx.750f10e" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        $(document).ready(function () {
            BindPaging('tblList');
        });
        function Show(Id) {
            ShowProgress();
            $("#ContentPlaceHolder1_xhdnPoId").val(Id);
            $("#ContentPlaceHolder1_btnShow").click();
        }

        function validateDecline() {
            if ($("#ContentPlaceHolder1_xtxtDeclineReason").val() == "") {
                $("#ContentPlaceHolder1_xtxtDeclineReason").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtDeclineReason"), "Please specify reason.", "bottom");
                return false;
            }
            HideModalBox('#divDeclineCrfm');
            ShowProgress();
            //HideModalBox('#divDeclineCrfm');
            return true;
        }

        function ShowDetails(Id) {
            $.ajax({
                type: 'POST',
                url: strUrl + 'PurchaseCenter/POList.aspx/ShowDetails',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                success: function (msg) {
                    if (msg.d != null) {
                        window.location.href = msg.d;
                    }
                },
                error: ShowError
            });
        }

    </script>
     

    <%--<asp:UpdatePanel ID="xupnlPurchase" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>
    <asp:UpdatePanel ID="xupnlAction" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="topBlk topBlkInn">
                <ul class="rightBtn">
                    <li>
                        <asp:LinkButton ID="xbtnWithdrawn" runat="server"
                            OnCommand="xlnk_Command" CommandName="Withdrawn"
                            Visible="false" Text="Withdraw" CssClass="btnBlk" /></li>
                    <li>
                        <asp:LinkButton ID="xbtnAccept" runat="server" Visible="false"
                            OnCommand="xlnk_Command" CommandName="Accept"
                            CssClass="btnBlk" Text="Accept PO" /></li>
                    <li>
                        <asp:LinkButton ID="xbtnDecline" runat="server" Visible="false"
                            OnCommand="xlnk_Command" CommandName="Decline" 
                            CssClass="btnBlk" Text="Decline PO" />
                    </li>
                    <li>
                        <asp:LinkButton ID="xlnkbtnReIssue" runat="server" Visible="false"
                            OnCommand="xlnk_Command" CommandName="ReIssue" OnClientClick="javascript:ShowProgress(true);"
                            CssClass="btnBlk" Text="Re-Issue PO" />
                    </li>
                    <li>
                        <asp:LinkButton ID="xlnkRaiseInvoice" runat="server"
                            OnCommand="xlnk_Command" CommandName="Invoice" OnClientClick="javascript:ShowProgress(true);"
                            Text="Raise Invoice" CssClass="btnBlk"></asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="xlnkShowInvoice" runat="server" Visible="false"
                            OnCommand="xlnk_Command" CommandName="ViewInvoice" OnClientClick="javascript:ShowProgress(true);"
                            Text="View Invoice" CssClass="btnBlk"></asp:LinkButton>
                    </li>
                    <li>
                        <a class="btnBlk" id="liRaiseInvoice" visible="false" runat="server"
                            href="InvoiceGenerate.aspx">Raise Invoice</a>
                    </li>
                    
                </ul>
                <br class="cl" />
            </div>
            <div class="modal fade" id="divWthdrawCrfm" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="Button1" class="close"
                                data-dismiss="modal">
                                &times;</button>
                            <%--<h4 class="modal-title" id="H2">Purchase Order withdrawn Confirmation</h4>--%>
                            <h4 class="modal-title" id="H2">Withdraw Purchase Order</h4>
                        </div>
                        <div class="modal-body">
                            <p id="p1">
                                Do you want to withdraw purchase order ?
                            </p>                             
                        </div>
                        <div  class="modal-footer" >  
                           <a class="btnRed" href="#" id="lnkWithdrawRFP" runat="server"
                                onclick="HideModalBox('#divWthdrawCrfm'); ShowProgress();"
                                onserverclick="xbtnWithdrawn_Click">CONTINUE</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="divDeclineCrfm" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="Button2" class="close"
                                data-dismiss="modal">
                                &times;</button>
                            <h4 class="modal-title" id="H3">Purchase Order Decline Confirmation</h4>
                        </div>
                        <div class="modal-body">
                            <p id="p4">
                                Do you want to decline the purchase order ?Please specify the reason
                            </p>
                            <textarea id="xtxtDeclineReason" runat="server" placeholder="Reason" style="vertical-align:bottom" ></textarea> 
                        </div>
                        <div class="modal-footer">
                            <%--<textarea id="xtxtDeclineReason" runat="server" placeholder="Reason" height="20 px" ></textarea> --%>

                            <a class="btnRed" href="#" id="xlnkDecline" runat="server"
                                onclick="javascript: return validateDecline();"
                                onserverclick="xbtnDecline_Click">CONTINUE</a>    <%--onclick="HideModalBox('#divDeclineCrfm'); ShowProgress();"--%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="divAcceptCrfm" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="Button3" class="close"
                                data-dismiss="modal">
                                &times;</button>
                            <h4 class="modal-title" id="H4">Purchase Order Accept Confirmation</h4>
                        </div>
                        <div class="modal-body">
                            <p id="p2">
                                Do you want to accept purchase order ?
                            </p>
                        </div>
                        <div class="modal-footer">
                            <a class="btnRed" href="#" id="lnkAccept" runat="server"
                                onclick="HideModalBox('#divAcceptCrfm'); ShowProgress();"
                                onserverclick="xbtnAccept_Click">CONTINUE</a>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Literal ID="xlitCrfm" runat="server"></asp:Literal>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <div class="clmn1" id="xdivPolist" runat="server">
        <div class="row1">
            <div class="whiteBox" id="xdivSearch" runat="server" visible="false">
                <h2>Search by</h2>
                <form class="immrt30">
                    <div class="styled-select imw30p fl">
                        <select>
                            <option>PO Code</option>
                            <option>PO Code</option>
                        </select>
                    </div>
                    <div class="selDate">
                        <a href="#">PO Date<img src="images/icon-calender.png"></a>
                    </div>
                    <div class="styled-select imw30p fl">
                        <select>
                            <option>Buyer Name</option>
                            <option>Buyer Name</option>
                        </select>
                    </div>
                </form>
                <br class="cl" />
            </div>
            <div class="whiteBox">

                <%--<div class="immrt30" id="xdivPolist" runat="server">--%>
                <asp:Literal ID="xlitPOList" runat="server"></asp:Literal>
                <%--<a href="#" class="btnBlk immrt20">Raise Invoice</a>--%>
                <%--</div>--%>
            </div>
        </div>
    </div>
    <div id="xdivPoDetails" runat="server" visible="false">
        <div class="Newclmn1">
            <div class="row1">
                <div class="innerBxhead bgRed">Purchase Order Summary</div>
                <div class="whiteBox  brdPink">  
                    <asp:Literal ID="xlitPoDet" runat="server"></asp:Literal>                   
                    <br class="cl" />
                </div>
            </div>

             <%-- <asp:Button ID="xbtnWithdrawn" runat="server" Visible="false" class="btnBlk immrt20" Text="Withdrawn" OnClick="xbtnWithdrawn_Click" />
                            <asp:Button ID="xbtnAccept" runat="server" Visible="false" class="btnBlk immrt20" Text="Accept PO" OnClick="xbtnAccept_Click"/>
                            <asp:Button ID="xbtnDecline" runat="server" Visible="false" class="btnBlk immrt20" Text="Decline PO" OnClick="xbtnDecline_Click"/>--%>

            <div class="modal fade" id="divWithdrawnCrfm" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="btnClose" class="close"
                                data-dismiss="modal">
                                &times;</button>
                            <h4 class="modal-title" id="H1">Purchase Order withdraw Confirmation</h4>
                        </div>
                        <div class="modal-body">
                            <p id="pRegMsg">
                                Do you want to withdrawn Purchase Order ?
                            </p>
                        </div>
                        <div class="modal-footer">
                            <a class="btnRed" href="#" id="lnkWithdrawPO" runat="server"
                                onclick="HideModalBox('#divWithdrawnCrfm'); ShowProgress();">CONTINUE</a>
                            <%--onserverclick="lnkWithdrawPO_ServerClick"--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--help panel start here-->
        <div class="btn-help btnHelper">
            <img src="../images/icn-help.png" />
        </div>
        <div class="helpBlockAll"></div>
        <div class="fr helpBlk helpBlkInn srh-help helpSlide">
            <!-- faq start here -->
            <ctrl:FAQ ID="xFAQ" runat="server" />
            <!-- faq end here -->
            <!-- chat start here -->
            <div class="chatBlk">
                <div class="panel-group" id="chataccordionRenepay">
                    <ctrl:Feedback ID="xFBK" runat="server" Data_Parent="chataccordionRenepay" />
                </div>
            </div>
            <!-- chat end here -->
        </div>
        <!--help panel end here-->
    </div>
   

    <asp:Button ID="btnShow" runat="server" class="btnBlk" OnClick="btnShow_Click" Style="display: none;" Value="show" />
    <asp:HiddenField ID="xhdnPoId" runat="server" />
    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

