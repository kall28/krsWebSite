<%@ control language="C#" autoeventwireup="true" inherits="UserControls_wucUserFeedback, App_Web_wucuserfeedback.ascx.6bb32623" %>
<asp:UpdatePanel ID="xupnlFeedback" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div class="panel panel-default ">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a id="lnkHeader" runat="server" class="chataccordion-toggle" data-toggle="collapse">
                        <img id="imgIco" runat="server" src="~/images/icn-chat.png" />Contact Us
                    <i id="headerIcon" runat="server" class="glyphicon glyphicon-minus fr"></i></a>
                </h4>
            </div>
            <div id="divFeedback" runat="server" class="panel-collapse collapse in">
                <div class="panel-body">
                    <div class="innerChat">
                        <div class="chatImg">
                            <img id="imghelp" runat="server" src="~/images/chat-help-img.png" />
                            <div class="chatlogo">
                                <img id="imglog" runat="server" src="~/images/nav_infilogo.png" />
                                <%--<p>Or call us at <em>1-800 102 8591 between 9:30 am and 5 pm</em></p>--%>
                                <p> email us at <em>help@renepay.com</em></p>
                            </div>
                        </div>
                        <div class="chatInput">
                            <div id="divForm" runat="server">
                                <div class="HContL" id="divName" runat="server">
                                    <label>Name</label>
                                    <asp:TextBox ID="xtxtname" CssClass="imw100p" MaxLength="30" runat="server"></asp:TextBox>
                                </div>
                                <div class="HContR" id="divMobile" runat="server">
                                    <label>Mobile No</label>
                                    <asp:TextBox ID="xtxtMobileNo" CssClass="imw100p" MaxLength="10" onkeydown="IsNumeric(event);" runat="server"></asp:TextBox>
                                </div>
                                <div id="divUserMsg" runat="server" class="immrt10">
                                    <label id="lblMsgCap" runat="server">Message</label>
                                    <asp:TextBox ID="xtxtMessage" CssClass="imw100p" MaxLength="400" TextMode="MultiLine" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    <button id="btnSubmit" runat="server" class="btnRed immrt10" type="button">Submit</button>
                                    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                                </div>
                            </div>

                            <div id="divMsg" runat="server" style="display:none;">
                                <p id="pFeedbackMsg" runat="server"></p>
                                <button id="btnClose" runat="server" class="btnRed" type="button">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

