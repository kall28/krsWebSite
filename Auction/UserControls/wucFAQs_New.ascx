<%@ control language="C#" autoeventwireup="true" inherits="UserControls_wucFAQs_New, App_Web_wucfaqs_new.ascx.6bb32623" %>
<asp:UpdatePanel ID="xupnlFAQ" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <%--<div class="panel-group" id="accordion">
            <div class="panel panel-default" id="divYourSpending">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                            <i id="licollapse1" class="glyphicon glyphicon-plus"></i>&nbsp;Your Spending
                        </a>
                    </h4>
                </div>
                <div id="collapse1" class="panel-collapse collapse">
                    <div class="panel-body">
                        <h5>By month</h5>
                    </div>
                </div>
            </div>
        </div>--%>
        <div id="divFAQAccordion" runat="server" class="panel-group">
            <div class="panel panel-default ">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a id="lnkHeader" runat="server" class="chataccordion-toggle" data-toggle="collapse">
                            <img id="imgIco" runat="server" src="~/images/icn-ques.png" />FAQ's
                            <i id="headerIcon" runat="server" class="glyphicon glyphiconFAQ glyphicon-minus fr"></i>
                        </a>
                    </h4>
                </div>
                <div id="divFAQ" runat="server" class="panel-collapse collapse collapseFAQ in">
                    <%--<div class="panel-body">--%>
                        <div class="faqBlk">
                            <asp:Literal ID="xlitFAQ" runat="server"></asp:Literal>
                        </div>
                    <%--</div>--%>
                </div>
            </div>
        </div>
        <%--<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a id="lnkHeader" runat="server" class="chataccordion-toggle" data-toggle="collapse">
                        <img id="imgIco" runat="server" src="~/images/icn-ques.png" />FAQ
                    <i id="headerIcon" runat="server" class="glyphicon glyphicon-minus fr"></i></a>
                </h4>
            </div>
            <div id="divFAQ" runat="server" class="panel-collapse collapse in">
                <div class="panel-body">
                <asp:Literal ID="xlitFAQ" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>--%>
        <%--<div class="faqBlk">
            <div class="faqTitle">
                <img id="img" runat="server" src="~/images/icn-ques.png" />
                FAQ's                
            </div>
            
        </div>--%>
        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
    </ContentTemplate>
</asp:UpdatePanel>
