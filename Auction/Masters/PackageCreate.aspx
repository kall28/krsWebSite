<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Masters_PackageCreate, App_Web_packagecreate.aspx.6044e34" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">

        function validateTextBox() {
            var ctrl = $("#ContentPlaceHolder1_xtxtPackageName");
            if (ctrl.val() == "") {
                ctrl.focus();
                ShowToolTip("#ContentPlaceHolder1_xtxtPackageName", "Please enter package name.");
                return false;
            }
            var ctrl = $("#ContentPlaceHolder1_xddlMode option:selected");
            if (ctrl.index() <= 0) {
                ShowToolTip("#ContentPlaceHolder1_xddlMode", "Please select mode.");
                return false;
            }
            var ctrl = $("#ContentPlaceHolder1_xtxtDescription");
            if (ctrl.val() == "") {
                ShowToolTip("#ContentPlaceHolder1_xtxtDescription", "Please enter description.");
                return false;
            }
            var ctrl = $("#ContentPlaceHolder1_xtxtNumberOfUser");
            if (ctrl.val() == "") {
                ShowToolTip("#ContentPlaceHolder1_xtxtNumberOfUser", "Please enter No of user.");
                return false;
            }
            var ctrl = $("#ContentPlaceHolder1_xtxtAmount");
            if (ctrl.val() == "") {
                ShowToolTip("#ContentPlaceHolder1_xtxtAmount", "Please enter amount.");
                return false;
            }
            ShowProgress(true);
            return true;
        }
    </script>

    <asp:UpdatePanel ID="xupnlCategory" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Literal ID="xlitScriptVal" runat="server"></asp:Literal>
            <div class="main supplier">
                <div class="topBlk">
                    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" ></asp:Literal>
                    </div>
                </div>
                <br class="cl">

                <div class="clmn1">
                    <div class="row1">
                        <div class="whiteBox">
                            <div class="leftClmn">
                                    Please fill the details for Package.
                                    <br class="cl">
                                    <br class="cl">
                                    <asp:TextBox ID="xtxtPackageName" runat="server" CssClass="imw97p" placeholder="Package Name" ToolTip="Please enter package name" maxlength="30" autocomplete="off"></asp:TextBox>
                                    <%--<br /><br /><label>Mode</label>--%>
                                    <div class="styled-select fl selOrganization">
                                        <asp:DropDownList ID="xddlMode" runat="server" >
                                        </asp:DropDownList>
                                    </div>
                                    <asp:TextBox ID="xtxtDescription" runat="server" CssClass="imw97p" placeholder="Descreption" ToolTip="Please enter description" maxlength="200" autocomplete="off"></asp:TextBox>
                                    <asp:TextBox ID="xtxtNumberOfUser" runat="server" CssClass="imw97p" placeholder="No of User" ToolTip="Please enter no of users" maxlength="3" autocomplete="off" onkeydown="return IsNumeric(event);"></asp:TextBox>
                                    <asp:TextBox ID="xtxtAmount" runat="server" CssClass="imw97p" placeholder="Amountr" ToolTip="Please enter amount" maxlength="3" autocomplete="off" onkeydown="return IsNumeric(event);"></asp:TextBox>
                                    <br /><br />
                                    <div id="divchckPublish" class="chk" runat="server" visible="true">
                                        <label>Active</label>
                                        <asp:CheckBox ID="xchckActive" runat="server" />
                                    </div>
                                    <br class="cl">
                                    <asp:LinkButton ID="xlbtnSubmit" runat="server" CssClass="btnBlk"
                                        OnClick="btnAddPackage_click" OnClientClick="javascript:if(!validateTextBox()){ return false;}">Submit</asp:LinkButton>
                                        <asp:LinkButton ID="xlbtnCancel" runat="server" CssClass="btnBlk"
                                        OnClientClick="javascript:ShowProgress(true); location.href='packageList.aspx'">CANCEL</asp:LinkButton>

                            </div>
                            <div class="rightClmn">
                            </div>
                            <br class="cl">
                        </div>
                    </div>
                </div>
            </div>
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

