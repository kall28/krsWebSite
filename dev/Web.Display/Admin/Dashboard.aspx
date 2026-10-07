<%@ page language="C#" autoeventwireup="true" inherits="Dashboard, App_Web_dashboard.aspx.fdf7a39c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/Style.css" />
    <script language="javascript" type="text/javascript">
        function setSize() {
            var iframeElement = document.getElementById('iframeName');
            iframeElement.style.height = 768 - 145;
            iframeElement.style.width = 1024;
        }

        function showPage(pagepath) {

            var iframeElement = document.getElementById('iframeName');
            iframeElement.src = pagepath;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="xscrMgr" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <div>
        <table width="100%" border="0">
            <tr>
                <td>
                    <table width="100%">
                        <tr>
                            <%--<td>
                                <asp:Image ID="imglogo" ImageUrl="~/Images/cinemaxx-logo.gif" runat="server" Height="58" Width="100"/>
                            </td>--%>
                            <td align="right">
                                <font face="tahoma" size="2px">Welcome
                                    <asp:Label ID="xlblUserName" Font-Bold="true" runat="server"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</font>
                                <asp:LinkButton ID="xlnkchangePwd" runat="server" OnCommand="xlnk_command" CommandName="changepwd"
                                    ForeColor="Black" Font-Underline="false">Change Credentials</asp:LinkButton>
                                |&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="xlnkLogout" runat="server" 
                                ForeColor="Black" Font-Underline="false"
                                OnCommand="xlnk_command" CommandName="logout">LogOut</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="background-color:#45260c;color:#fff;height:24px;">
                    <asp:UpdatePanel ID="xupnlMenu" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:DataList ID="xdlstMenu" runat="server" RepeatDirection="Horizontal" CellPadding="4"
                                CellSpacing="4" RepeatColumns="20">
                                <ItemTemplate> 
                                    <span>
                                    <asp:LinkButton ID="xlnkMenu" runat="server"  Font-Underline="false" ForeColor="White" Font-Bold="true"
                                        Text='<%# DataBinder.Eval(Container.DataItem, "CategoryName")%>'
                                        OnCommand="lnkMenu_Command" CommandName="menu" 
                                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MenuCategoryId")%>'>
                                    </asp:LinkButton>&nbsp;&nbsp;</span>
                                </ItemTemplate>
                            </asp:DataList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <%--<tr>
                <td style="background-color:#DED29E;padding-left:10px;height:24px;">
                    <asp:UpdatePanel ID="xupnlSubMenu" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:DataList ID="xdlstSubMenu" runat="server" RepeatDirection="Horizontal" CellPadding="4"
                                CellSpacing="4" RepeatColumns="20">
                                <ItemTemplate>              
                                    <span>                      
                                    <asp:LinkButton ID="xlnkSubMenu" runat="server" Font-Underline="false" 
                                        ForeColor="black" Font-Bold="true" 
                                        Text='<%# DataBinder.Eval(Container.DataItem, "CategoryName")%>'
                                        OnCommand="lnkMenu_Command" CommandName="submenu" 
                                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MenuCategoryId")%>'>
                                    </asp:LinkButton>&nbsp;|&nbsp;</span>
                                </ItemTemplate>
                            </asp:DataList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>--%>
            <tr>
                <td colspan="2" valign="top" align="center" style="border-color: White; height: 100%;
                    width: 100%;" onload="self.focus()">
                    <table style="height: 100%; width: 100%;" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="150px" valign="top" style="background-color:#B3A580;padding:10px;">
                                <%--<div style="width:150px;">&nbsp;</div>--%>
                                <asp:UpdatePanel ID="xupnlMenuItem" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:DataList ID="xdlstMenuItem" runat="server" RepeatDirection="Horizontal" 
                                            RepeatColumns="1" Width="100%" CellPadding="4" CellSpacing="4">
                                            <ItemStyle HorizontalAlign="Left" BackColor="#F4F0CB"/>
                                            <ItemTemplate>
                                                <span>
                                                    <asp:LinkButton ID="xlnkMenu" runat="server" Font-Underline="false" ForeColor="black" Font-Bold="true"
                                                        Text='<%# DataBinder.Eval(Container.DataItem, "MenuTitle")%>'
                                                        OnCommand="lnkMenu_Command" CommandName="menuitem" 
                                                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PagePath")%>'>
                                                    </asp:LinkButton>
                                                </span>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="xupnlIFrame" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <iframe runat="server" width="100%" name="iframeName" id="iframeName" src="home.aspx"
                                            scrolling="auto" frameborder="0"></iframe>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <%--onload="setSize()" style="height: 623px;width: 1024px"  runat="server"--%>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
