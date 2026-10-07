<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="PurchaseCenter_PaymentFeedback, App_Web_paymentfeedback.aspx.750f10e" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .m0 {
            margin: 0 !important;
        }
    </style>
    <script>

        function rating(Id) {
            $("#ContentPlaceHolder1_hfSuppRating").val(Id);
            for (i = 1; i <= 5; i++) {
                if (i <= Id) {
                    $("#rating" + i).attr('src', '../images/ico-invoice-rate-full.png');
                }
                else {
                    $("#rating" + i).attr('src', '../images/ico-invoice-rate-none.png');
                }
            }
            return false;
        }
        function SetRating(Id) {
            $("#ContentPlaceHolder1_hfSuppRating").val(Id);
            for (i = 1; i <= 5; i++) {
                if (i <= Id) {
                    $("#rating" + i).attr('src', '../images/ico-invoice-rate-full.png');
                }
                else {
                    $("#rating" + i).attr('src', '../images/ico-invoice-rate-none.png');
                }
            }
            return false;
        }

    </script>
    <script>
        
        //accordian chat
        $(document).ready(function () {
            var selectIds = $('#chatpanel1,#chatpanel2');
            $(function ($) {
                selectIds.on('show.bs.collapse hidden.bs.collapse', function () {
                    $(this).prev().find('.glyphicon').toggleClass('glyphicon-plus glyphicon-minus');
                })
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.btnHelper').click(function () {
                $('.helpSlide').addClass('HelpMoveRight');
                $('.helpSlide').show();
                $('.helpBlockAll').css('display', 'block');
                $('.helpBlockAll').show();
                $('.helpSlide').stop().animate({ 'marginRight': '0px' }, 1000);
                return false;
            });
            $('.helpBlockAll').click(function () {
                $('.helpBlockAll').hide();
                $('.helpSlide').stop().animate({ 'marginRight': '-768px' }, 200);

            });
        });
    </script>
    <asp:UpdatePanel ID="xupnlPackage" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="main supplier newUI">
                <div class="topBlk" style="padding-bottom: 15px;">
                    <div class="mainHead txtCenter" style="float: none;">
                        <%-- <asp:Literal ID="xlitCap" runat="server" Text="PAYMENT FEEDBACK"></asp:Literal>--%>
                    </div>
                </div>
                <br class="cl" />
                <!--help panel start here-->
                <div class="btn-help btnHelper">
                    <img src="../images/icn-help.png" />
                </div>
                <div class="helpBlockAll"></div>
                <div class="fr helpBlk  srh-help helpSlide">
                    <!-- faq start here -->
                    <ctrl:FAQ ID="xFAQ" runat="server" />
                    <!-- faq end here -->
                    <!-- chat start here -->
                    <div class="chatBlk" style="display: none">
                        <div class="panel-group" id="chataccordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="chataccordion-toggle" data-toggle="collapse" data-parent="#chataccordion" href="#chatpanel1">
                                            <img src="../images/icn-chat.png" />Chat with Buyer<i class="glyphicon glyphicon-minus fr"></i></a>
                                    </h4>
                                </div>
                                <div id="chatpanel1" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="innerChat">
                                            <div class="chatImg">
                                                <img src="../images/chat-help-img.png" />
                                                <div class="chatlogo">
                                                    <img src="../images/nav_infilogo.png" />
                                                    <p>Or call us at <em>8898989898</em></p>
                                                    <p>Or email us at <em>team@renepay.com</em></p>
                                                </div>
                                            </div>
                                            <div class="chatName">
                                                <em>RenePay Team:</em>
                                                <p>How May i help you?</p>
                                            </div>
                                            <div class="chatInput">
                                                <input type="text" placeholder="Type your message here...">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="chataccordion-toggle" data-toggle="collapse" data-parent="#chataccordion" href="#chatpanel2">
                                            <img src="../images/icn-chat.png" />Chat with RenePay
                                            <i class="glyphicon glyphicon-plus fr"></i></a>
                                    </h4>
                                </div>
                                <div id="chatpanel2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="innerChat">
                                            <div class="chatImg">
                                                <img src="../images/chat-help-img.png" />
                                                <div class="chatlogo">
                                                    <img src="../images/nav_infilogo.png" />
                                                    <p>Or call us at <em>8898989898</em></p>
                                                    <p>Or email us at <em>team@renepay.com</em></p>
                                                </div>
                                            </div>
                                            <div class="chatName">
                                                <em>RenePay Team:</em>
                                                <p>How May i help you?</p>
                                            </div>
                                            <div class="chatInput">
                                                <input type="text" placeholder="Type your message here...">
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- chat end here -->
                </div>
                <!--help panel end here-->
                <div class="clmn1 imw72p fl">
                    <div class="row1">
                        <div class="whiteBox brdPink">
                            <div class="txtCenter pymtFeedback">
                                <asp:Literal ID="xlitImg" runat="server"><img src='../images/green-right-tick.png' width='94' height='94'/></asp:Literal>
                                <br class="cl" />
                                <asp:Literal ID="xlitMessage" runat="server"><h3 class="txtCenter">Payment done successfully.</h3></asp:Literal>
                                <br class="cl" />
                                <div class="rfp-confirm invoice-confirm" id="DivsupplierReview" runat="server">
                                    <%-- <div>--%>
                                    <div class="pymtHeader">
                                        <p>Your payment for</p>
                                        <p class="inrPrice" id="lblCurrency" runat="server"></p>
                                        <p class="inrPrice" id="lblTotalAmt" runat="server"></p>
                                        <p>has been made successfully.</p>
                                        <br class="cl" />
                                    </div>
                                    <%--<p id="pNote" runat="server">
                                        Your supplier has been informed of the payment being processed.
                                    </p>--%>
                                    <p>
                                        Thank you for using Renepay. We hope to see you back soon.
                                    </p>
                                    <br class="cl" />
                                    <p>Rate your experience with</p>
                                    <p id="lblSupplier" class="inrPrice" runat="server"></p>
                                </div>
                                <br class="cl" />
                                <div class="m0 starRat">
                                    <ul>
                                        <li id="li1">
                                            <img src="../images/ico-invoice-rate-none.png" class="ico-rate" id="rating1" onmouseover="return rating(1);" /></li>
                                        <li id="li2">
                                            <img src="../images/ico-invoice-rate-none.png" class="ico-rate" id="rating2" onmouseover="return rating(2);" /></li>
                                        <li id="li3">
                                            <img src="../images/ico-invoice-rate-none.png" class="ico-rate" id="rating3" onmouseover="return rating(3);" /></li>
                                        <li id="li4">
                                            <img src="../images/ico-invoice-rate-none.png" class="ico-rate" id="rating4" onmouseover="return rating(4);" /></li>
                                        <li id="li5">
                                            <img src="../images/ico-invoice-rate-none.png" class="ico-rate" id="rating5" onmouseover="return rating(5);" /></li>
                                    </ul>
                                </div>
                                <br />
                                <div id="DivBookmark" runat="server" class="bookmark" visible="false">
                                    <p>
                                        <asp:CheckBox ID="xchkBookmark" runat="server"></asp:CheckBox>
                                    </p>
                                    <p class="inrPrice" id="P2" runat="server">Bookmark as preferred supplier.</p>
                                </div>

                                <%-- </div>--%>
                                <asp:LinkButton ID="btnSubmit" CssClass="btnBlk" runat="server" OnClientClick="javascript:ShowProgress();" OnClick="btnSubmit_Click">Submit Feedback</asp:LinkButton>
                                <br class="cl" />
                                <asp:LinkButton ID="btnClose" Visible="false" CssClass="btnBlk immrt10" runat="server" OnClick="btnClose_Click" OnClientClick="javascript:ShowProgress();">Cancel</asp:LinkButton>
                            </div>
                            <br class="cl" />
                        </div>
                        <asp:HiddenField ID="hfSuppRating" runat="server" />
                        <asp:Literal ID="xlitmsg" runat="server"></asp:Literal>
                    </div>
                </div>
                <div class="modal fade" id="divConfirm" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" id="btncl" class="close"
                                    data-dismiss="modal">
                                    &times;</button>
                                <h4 class="modal-title" id="H2">Renepay</h4>
                            </div>
                            <div class="modal-body">
                                <p id="p1" runat="server">
                                    Send Feedback Successfully! 
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

