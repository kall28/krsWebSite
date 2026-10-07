<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Masters_CategoryCreate, App_Web_categorycreate.aspx.6044e34" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>
        function validateTextBox() {
            //if ($("#ContentPlaceHolder1_xddlcategory option:selected").index() <= 0) {                
            //    ShowToolTip($("#ContentPlaceHolder1_xddlcategory"), "Please select category");
            //    return false;
            //}
             if ($("#ContentPlaceHolder1_xtxtCategoryName").val() == "") {
                ShowToolTip("#ContentPlaceHolder1_xtxtCategoryName", "Please enter category name.");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtShortDescreption").val() == "") {
                ShowToolTip("#ContentPlaceHolder1_xtxtShortDescreption", "Please enter short description.");
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
                                    Please fill the details for Category.
                                    <br class="cl">
                                    <br class="cl">
                                    <label>Parent Category</label><br />
                                    <div class="styled-select fl selOrganization">
                                        <asp:DropDownList ID="xddlcategory" runat="server" ToolTip="Please select category" >
                                        </asp:DropDownList>
                                    </div>
                                    <asp:TextBox ID="xtxtCategoryName" runat="server" CssClass="imw97p" placeholder="Category Name"  ToolTip="Please enter category name." maxlength="30" autocomplete="off"></asp:TextBox>
                                    <asp:TextBox ID="xtxtShortDescreption" runat="server" CssClass="imw97p" placeholder="Short Descreption" ToolTip="Please enter short description." maxlength="60" autocomplete="off"></asp:TextBox>
                                    <br /><br />
                                    <div id="divchckPublish" class="chk" runat="server" visible="true">
                                        <label>Published</label>
                                        <asp:CheckBox ID="xchckPublish" runat="server" />
                                    </div>
                                <div id="divSetOrder" class="chk" runat="server" visible="true">
                                        <label>Set Popular</label>
                                        <asp:CheckBox ID="xchkPopular" runat="server" />
                                    </div>
                                    <br />
                                    <div class="grey-box bord-grey" id="divmsg" runat="server" visible="false">
                                            <strong>NOTE: </strong>You will receive a confirmation call from our representative,
                                            once we add all your requested details in our system.
                                    </div>
                                    <br class="cl">
                                    <asp:LinkButton ID="xlbtnSubmit" runat="server" CssClass="btnBlk"
                                        OnClick="btnSubmit_click" OnClientClick="javascript: return validateTextBox()">Submit</asp:LinkButton>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

