<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Masters_CompanyCategorycreate, App_Web_companycategorycreate.aspx.6044e34" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        function validateTextBox() {
        var ctrl = $("#ContentPlaceHolder1_xtxtCompanyCategory");
            if (ctrl.val() == "") {
                ShowToolTip("#ContentPlaceHolder1_xtxtCompanyCategory", "Please enter company category.");
                return false;
            }
            var ctrl = $("#ContentPlaceHolder1_xtxtDescreption");
            if (ctrl.val() == "") {
                ShowToolTip("#ContentPlaceHolder1_xtxtDescreption", "Please enter short description.");
                return false;
            }
            ShowProgress(true);
            return true;
    }
   </script>

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
                                    Please fill the details for Company Category.
                                    <br class="cl">
                                    <br class="cl">
                                    <label>Company Category</label>
                                    <asp:TextBox ID="xtxtCompanyCategory" runat="server" CssClass="imw97p" ToolTip ="Please enter company category." maxlength="30" autocomplete="off"></asp:TextBox>
                                    <label>Description</label>
                                    <asp:TextBox ID="xtxtDescreption" runat="server" CssClass="imw97p" ToolTip="Please enter short description." maxlength="70" autocomplete="off"></asp:TextBox>
                                    <br /><br />
                                    <div id="divchckPublish" class="chk" runat="server" visible="true">
                                        <label>Published</label>
                                        <asp:CheckBox ID="xchckPublish" runat="server" />
                                    </div>
                                    <br />
                                    <div class="grey-box bord-grey" id="divmsg" runat="server" visible="false">
                                            <strong>NOTE: </strong>You will receive a confirmation call from our representative,
                                            once we add all your requested details in our system.
                                    </div>
                                    <br class="cl">
                                    <asp:LinkButton ID="xlbtnSubmit" runat="server" CssClass="btnBlk"
                                        OnClick="UpdateCompanyCategory" OnClientClick="javascript:if(!validateTextBox()){ return false; }">Submit</asp:LinkButton>
                                        <asp:LinkButton ID="xlbtnCancel" runat="server" CssClass="btnBlk"
                                        OnClick="btnCancel_click" OnClientClick="javascript:ShowProgress(true);">CANCEL</asp:LinkButton>

                            </div>
                            <div class="rightClmn">
                            </div>
                            <br class="cl">
                        </div>
                    </div>
                </div>
            </div>
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
</asp:Content>

