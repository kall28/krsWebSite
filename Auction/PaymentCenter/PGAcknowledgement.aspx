<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_PaymentCenter_PGAcknowledgement, App_Web_pgacknowledgement.aspx.4a2dc9c1" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="xupnlPopup" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <script language="javascript" type="text/javascript">
                function DownloadInvoice() {
                    ShowProgress(true);
                    $.ajax({
                        url: strUrl + 'PaymentCenter/PGAcknowledgement.aspx/DownloadFile',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData != "") {
                                    window.open(strUrl + "Handlers/FileCreate.ashx?det=2/" + newData);
                                }
                                else {
                                    ShowMessageBox("Invalid file parameter");
                                }
                                ShowProgress(false);
                            }
                            catch (e) {
                                ShowProgress(false);
                                ShowModalMsgBox(e.Message);
                            }
                        },
                        error: function (data) {
                            ShowProgress(false);
                            ShowModalMsgBox(data);
                        }
                    });
                    return true;
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
            <div class="main supplier newUI">
                <div class="topBlk">
                    <div class="mainHead fl">Payment Summary</div>
                    <ul class="rightBtn">
                    </ul>
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
                        <div class="whiteBox immrt20 brdPink">
                            <table>
                                <tr>
                                    <td colspan="2" class="txtCenter">
                                        <asp:Literal ID="xlitImg" runat="server"><img src="../images/red-cross-tick.png" width="94" height="94"/></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="txtCenter">
                                        <h1>
                                            <asp:Literal ID="xlitMsg" runat="server"></asp:Literal></h1>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%">Reference Id :</td>
                                    <td>
                                        <label id="lblRefId" runat="server"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%">Payment Amount :</td>
                                    <td>
                                        <label id="lblPayAmt" runat="server"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%">Payment Description :</td>
                                    <td>
                                        <label id="lblPayDesc" runat="server"></label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <asp:LinkButton ID="btnNext" runat="server" class="btnRed immrt10" OnClientClick="javascript:ShowProgress(true);"
                                OnClick="btnNext_click" Visible="false">
                            CONTINUE</asp:LinkButton>
                            <asp:LinkButton ID="btnClose" runat="server" class="btnRed immrt10" OnClientClick="javascript:ShowProgress(true);"
                                OnClick="btnClose_click">
                            CLOSE</asp:LinkButton>
                            <asp:LinkButton ID="btnDownload" runat="server" class="btnRed immrt10" OnClientClick="javascript:DownloadInvoice();return false;" Visible="false">
                            DOWNLOAD </asp:LinkButton>
                            <asp:Literal ID="xlitScriptPopup" runat="server"></asp:Literal>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="wrap">
                    <div id="ContentPlaceHolderMaster_divReg" style="display: block">
                        <span id="spnCap">
                            <h4>Payment summary</h4>
                        </span>
                        <div class="greybox">
                            <div class="greentick">
                                <asp:Literal ID="xlitImg" runat="server"><img src="../images/red-cross-tick.png" width="94" height="94"/></asp:Literal>
                                <h1>
                                    <asp:Literal ID="xlitMsg" runat="server"></asp:Literal></h1>
                                <div class="pad">
                                    Transaction Details
                                </div>
                                <div class="point">
                                    <ul>
                                        <li>Reference Id <em>:</em></li>
                                        <li>
                                            <label id="lblRefId" runat="server">
                                            </label>
                                        </li>
                                        <li>Payment Amount<em>:</em></li>
                                        <li>
                                            <label id="lblPayAmt" runat="server">
                                            </label>
                                        </li>
                                        <li>Payment Description<em>:</em></li>
                                        <li>
                                            <label id="lblPayDesc" runat="server">
                                            </label>
                                        </li>
                                    </ul>
                                    <br class="clr" />
                                </div>
                                <div>
                                    <button id="btnNext" runat="server" type="button" onclick="javascript:ShowProgress(true);"
                                        onserverclick="btnNext_click" visible="false">
                                        Continue</button>
                                    <button id="btnClose" runat="server" type="button" onclick="javascript:ShowProgress(true);"
                                        onserverclick="btnClose_click">
                                        Close</button>
                                    <button id="btnDownload" runat="server" type="button" onclick="javascript:DownloadInvoice();return false;" visible="false">
                                        Download</button>
                                    <asp:Literal ID="xlitScriptPopup" runat="server"></asp:Literal>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

