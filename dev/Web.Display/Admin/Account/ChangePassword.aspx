<%@ page language="C#" autoeventwireup="true" inherits="Account_ChangePassword, App_Web_changepassword.aspx.359963b0" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-1.7.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

        function validateUname() {
            var OldPassword = $("#xtxtOldPassword").val();
            var Uname = document.getElementById("xtxtUserName").value;


            if (trim(OldPassword) == null || trim(OldPassword) == "") {
                alert("Please Enter Old Password");
                document.getElementById("xtxtOldPassword").focus();
                return false;
            }

            if (trim(Uname) == null || trim(Uname) == "") {
                alert("Please Enter User Name");
                document.getElementById("xtxtUserName").focus();
                return false;
            }

        }

        function validatePWD() {
            var OldPassword = document.getElementById("xtxtOldPassword").value;
            var Password = document.getElementById("xtxtNewPassword").value;
            var CnfPassword = document.getElementById("xtxtConfNewPass").value;



            if (trim(OldPassword) == null || trim(OldPassword) == "") {
                alert("Please Enter Old Password");
                document.getElementById("xtxtOldPassword").focus();
                return false;
            }
            if (trim(Password) == null || trim(Password) == "") {
                alert("Password Should not be blank");
                document.getElementById("xtxtNewPassword").focus();
                return false;
            }

            if (trim(CnfPassword) == null || trim(CnfPassword) == "") {
                alert("Confirm Password Should not be blank");
                document.getElementById("xtxtConfNewPass").focus();
                return false;
            }

            if (trim(Password) != trim(CnfPassword)) {
                alert("Password does not match.");
                document.getElementById("xtxtNewPassword").value = "";
                document.getElementById("xtxtConfNewPass").value = "";
                document.getElementById("xtxtNewPassword").focus();
                return false;
            }
        }


        function validateControl() {

            var Uname = document.getElementById("xtxtUserName").value;
            var OldPassword = document.getElementById("xtxtOldPassword").value;
            var Password = document.getElementById("xtxtNewPassword").value;
            var CnfPassword = document.getElementById("xtxtConfNewPass").value;


            if (trim(OldPassword) == null || trim(OldPassword) == "") {
                alert("Please Enter Old Password");
                document.getElementById("xtxtOldPassword").focus();
                return false;
            }

            if (trim(Uname) == null || trim(Uname) == "") {
                alert("Please Enter User Name");
                document.getElementById("xtxtUserName").focus();
                return false;
            }

            if (trim(Password) == null || trim(Password) == "") {
                alert("Password Should not be blank");
                document.getElementById("xtxtNewPassword").focus();
                return false;
            }

            if (trim(CnfPassword) == null || trim(CnfPassword) == "") {
                alert("Confirm Password Should not be blank");
                document.getElementById("xtxtConfNewPass").focus();
                return false;
            }

            if (trim(Password) != trim(CnfPassword)) {
                alert("Password does not match.");
                document.getElementById("xtxtNewPassword").value = "";
                document.getElementById("xtxtConfNewPass").value = "";
                document.getElementById("xtxtNewPassword").focus();
                return false;
            }
        }
        function NoSpace() {
            if (window.event.keyCode == 32) {
                return false;
            }
        }

    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="xscrMgr" runat="server"></asp:ScriptManager>
    <div>
        <table cellpadding="2" cellspacing="2">
            <tr>
                <td colspan="2" align="center">
                    <b>Change Credentials</b>
                </td>
            </tr>
            <tr>
                <td height="10px" colspan="2">
                </td>
            </tr>            
            <tr style="display:none;">
                <td>
                    <asp:Label ID="xlblChangeType" runat="server" Text="Change Type : "></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="xrblstatus" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                        OnSelectedIndexChanged="xrblstatus_SelectedIndexChanged">
                        <asp:ListItem Value="0" Text="UserName"  Selected="True"></asp:ListItem>
                        <asp:ListItem Value="1" Text="Password"></asp:ListItem>
                         <asp:ListItem Value="2" Text="Both"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="xlblOldPassword" runat="server" Text="Old Password : "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="xtxtOldPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <asp:UpdatePanel ID="updpnlType" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <tr id="trUserName" runat="server">
                        <td>
                            <asp:Label ID="xlblUserName" runat="server" Text="User Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="xtxtUserName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr  id="trNewPWD" runat="server" visible="false">
                        <td>
                            <asp:Label ID="xlblNewPassword" runat="server" Text="New Password : "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="xtxtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr  id="trCnfPWD" runat="server" visible="false">
                        <td>
                            <asp:Label ID="xlblConfNewPass" runat="server" Text="Confirm New Password : "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="xtxtConfNewPass" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                </ContentTemplate>
            </asp:UpdatePanel>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="xbtnSave" runat="server" Text="Save" OnClick="xbtnSave_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="xlblMsg" runat="server" ForeColor="Red" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
