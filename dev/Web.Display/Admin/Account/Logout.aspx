<%@ page language="C#" autoeventwireup="true" inherits="Account_Logout, App_Web_logout.aspx.359963b0" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%--<table cellspacing="0" cellpadding="0" width="100%" style="height: 70px">
            <tr>
                <td align="center" colspan="2">
                    <img alt="" src="../Images/cinemaxx-logo.gif" height="58" width="100" />
                </td>
            </tr>
        </table>--%>
        <center>
            &nbsp;</center>
        <center>
            <asp:Label ID="Label1" runat="server" Text="You have successfully logout." Font-Bold="True"
                Font-Size="11pt" CssClass="servlab"></asp:Label>
        </center>
        <center>
            &nbsp;</center>
        <center>
            <table>
                <tr>
                    <td style="font-weight: bold; font-size: 12pt; width: 152px; color: #191993; font-family: 'Times New Roman';
                        height: 21px">
                        <input type="button" name="btnClose" value="Close this window." onclick="javascript:window.close();" />
                    </td>
                    <td style="font-weight: bold; font-size: 12pt; width: 152px; color: #191993; font-family: 'Times New Roman';
                        height: 21px">
                        <asp:LinkButton ID="xbtnLogin" runat="server" PostBackUrl="~/Account/Login.aspx" Text="Login Again"></asp:LinkButton>                        
                    </td>
                </tr>
            </table>
        </center>
    </div>
    </form>
</body>
</html>
