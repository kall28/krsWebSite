<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_PurchaseCenter_PaymentList, App_Web_paymentlist.aspx.750f10e" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="xupdInvoice" runat="server">
        <ContentTemplate>
            <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
            <link href="../Styles/clockpicker.css" rel="stylesheet" />
            <script>

                $(document).ready(function () {
                    BindPaging('tblList');
                    BindDatePicker();
                });
                function Show(Id) {
                    ShowProgress();
                    $("#ContentPlaceHolder1_xhdnInvoice").val(Id);
                    $("#ContentPlaceHolder1_btnShow").click();
                }

                function BindDatePicker() {
                    $("#txtDeliveryDate").datepicker({
                        defaultDate: '+1d',
                        numberOfMonths: 1,
                        dateFormat: 'dd/mm/yy'
                    });
                }

                Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
                    BindDatePicker();
                });

                function UpdateDeliveryDate() {
                    ShowProgress();
                    var InvId = $("#ContentPlaceHolder1_xhdnInvoice").val();
                    var DeliveryDate = $("#txtDeliveryDate").val();
                    var PayDate = $("#xlblPayDate").text();
                    $.ajax({
                        url: strUrl + 'PurchaseCenter/PaymentList.aspx/UpdateDeliveryDate',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'Id':'" + InvId + "','strDeliveryDate':'" + DeliveryDate + "','strPayDate':'" + PayDate + "'}",
                        dataType: 'json',
                        success: function (data) {
                            var newData = data.d;
                            if (newData == "0") {
                                ShowModalMsgBox("RenePay", "Deliverd date updated successfully!");
                                window.location = "PaymentList.aspx";
                            }
                            else {
                                HideProgress();
                                ShowModalMsgBox("RenePay", newData);
                            }
                        },
                        error: function (data) {

                        }
                    });
                }

                function ShowDetails(Id){                
                    $.ajax({
                        type: 'POST',
                        url: strUrl + 'PurchaseCenter/PaymentList.aspx/ShowDetails',
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        cache: false,
                        success: function (msg) {
                            if (msg.d != null) {
                                window.location.href =msg.d;
                            }
                        },
                        error:ShowError


                    });
                }

                function ShowPO(POId) {
                    ShowProgress();
                    $.ajax({
                        type: 'POST',
                        url: strUrl + 'PurchaseCenter/PaymentList.aspx/ShowPO',
                        contentType: 'application/json; charset=utf-8',
                        data: "{'POId':'" + POId + "'}",
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

            <div class="topBlk topBlkInn">
                <div class="fr">
                    <asp:LinkButton ID="xlnkbtnDelivered" runat="server" class="btnBlk" OnClientClick="return UpdateDeliveryDate();" Visible="false">Delivered</asp:LinkButton>
                    <asp:LinkButton ID="xlnkbtnPrint" runat="server" Visible="false" class="btnBlk">Print</asp:LinkButton>
                </div>
                <br class="cl" />
            </div>

            <div class="clmn1">
                <div class="row1">
                    <%--<div class="immrt30" id="xdivInvoicelist" runat="server">--%>
                    <div class="whiteBox" id="xdivInvoicelist" runat="server">
                        <asp:Literal ID="xlitPOList" runat="server"></asp:Literal>
                    </div>
                    <%--<div id="xdivInvoice" runat="server" visible="false">
                        <div class="whiteBox">
                            <asp:Literal ID="xlitLogo" runat="server"></asp:Literal>
                            <asp:Literal ID="xlitInvoiceDet" runat="server"></asp:Literal>
                        </div>
                    </div>--%>

                    </div>
              </div>

            <div id="xdivInvoice" runat="server" visible="false">
                                  
                 <div class="whiteBox  brdPink">  
                       <asp:Literal ID="xlitInvoiceDet" runat="server"></asp:Literal>                           
                  </div>

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
                
            <asp:Button ID="btnShow" runat="server" class="btnBlk immrt20" OnClick="btnShow_Click" Style="display: none;" Value="show" />
            <asp:HiddenField ID="xhdnInvoice" runat="server" />
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

