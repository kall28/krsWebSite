<%@ page language="C#" autoeventwireup="true" inherits="PaymentGateway_PGRequest, App_Web_pgrequest.aspx.4a2dc9c1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script src="../Scripts/jquery-ui-1.11.2.custom/external/jquery/jquery.js" type="text/javascript"></script>
    <%--<script type="text/javascript">
        $(document).ready(function () {
            $("#nonseamless").submit();
        });
    </script>--%>
    <title></title>
</head>
<body>
    <%--<form id="nonseamless" runat="server" method="post" name="redirect" action="https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction"> 
        <input type="hidden" id="encRequest" name="encRequest" value="<%=strEncRequest%>"/>
        <input type="hidden" name="access_code" id="Hidden1" value="<%=strAccessCode%>"/>
    </form>--%>
    <form id="form1" runat="server" method="post" name="redirect"> 
        <asp:HiddenField ID="encRequest" runat="server"  />
        <asp:HiddenField ID="access_code" runat="server" />
        <asp:HiddenField ID="msg" runat="server"  />
        <div style="width:100%;top:100px;text-align:center;">
            Please wait processing your payment
        </div>
    </form>
    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
</body>
</html>

