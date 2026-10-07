<%@ page language="C#" autoeventwireup="true" inherits="Account_Login, App_Web_login.aspx.359963b0" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" height="500">
        <tr>
            <td align="center">
                
            </td>
        </tr>
        <tr align="center">
            <td width="100%">
                <table width="100%" height="200">
                    <%--<tr>
                        <td align="center">
                            <img src="../Images/cinemaxx-logo.gif" height="58" width="100" />
                        </td>
                    </tr>--%>
                    <tr>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td align="center">
                                        <table cellpadding="2" cellspacing="0" style="border: solid 1pt #45260c; font-size: 11pt;">
                                            <tr>
                                                <td style="background-color: #45260c;color:#fff; font-weight: bold; height: 25px; padding-left: 10px;">
                                                    Login
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" width="400px" style="text-align: center">
                                                    <table width="80%">
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 25px; text-align: right;">
                                                                UserName :
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="Server" ID="xtxtUserName" MaxLength="10" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td align="center">
                                                                <asp:RequiredFieldValidator ID="xValTxtName" ControlToValidate="xtxtUserName" ErrorMessage="Please enter user name !"
                                                                    runat="server" Font-Names="Tahoma" Font-Size="Small" ForeColor="red" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 25px; text-align: right;">
                                                                Password :
                                                            </td>
                                                            <td style="height: 25px;">
                                                                <asp:TextBox runat="Server" TextMode="Password" ID="xtxtPassword" MaxLength="15" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td align="center">
                                                               <asp:RequiredFieldValidator ID="xValTxtPassword" ControlToValidate="xtxtPassword"
                                                                    ErrorMessage="Please enter user password !" runat="server" Font-Names="Tahoma"
                                                                    Font-Size="Small" ForeColor="Red" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="padding-right: 20px;">
                                                    <asp:Button ID="xbtnLogin" runat="server" Text="Login" OnCommand="Action_Command"
                                                        CommandName="login" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="font-size: 11pt;">
                                        <asp:Label ID="xlblErr" runat="server" Text="" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
