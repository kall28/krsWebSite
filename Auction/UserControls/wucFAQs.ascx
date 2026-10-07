<%@ control language="C#" autoeventwireup="true" inherits="UserControls_wucFAQs, App_Web_wucfaqs.ascx.6bb32623" %>
<asp:UpdatePanel ID="xupnlFAQ" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
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
        <div class="faqBlk">
            <div class="faqTitle">
                <img id="img" runat="server" src="~/images/icn-ques.png" />
                FAQ's                
            </div>
            <asp:Literal ID="xlitFAQ" runat="server"></asp:Literal>
        </div>
        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
    </ContentTemplate>
</asp:UpdatePanel>
