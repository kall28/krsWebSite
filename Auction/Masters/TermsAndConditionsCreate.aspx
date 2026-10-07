<%@ page language="C#" autoeventwireup="true" masterpagefile="~/SiteMaster.master" validaterequest="false" inherits="New_Masters_TermsAndConditionsCreate, App_Web_termsandconditionscreate.aspx.6044e34" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<script src="../plugins/tinymce_4.1.9/tinymce/js/tinymce/tinymce.min.js" type="text/javascript"></script>--%>
    <script src="../Scripts/plugins/tinymce_4.1.9/tinymce/js/tinymce/tinymce.min.js" type="text/javascript"></script>

    <script>

        function validateTextBox() {
            var msg = "";
            if ($("#ContentPlaceHolder1_xtxtName").val() == '') {
                msg = "Please Enter Name";
                ShowToolTip("#ContentPlaceHolder1_xtxtName", msg);
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtCode").val() == '') {
                msg = "Please Enter Code";
                ShowToolTip("#ContentPlaceHolder1_xtxtCode", msg);
                return false;
            }
            if (msg.length <= 0) {
                ShowProgress(true);
                return true;
            }
            return false;
        }

        //For tiny textbox
        tinymce.init({
            selector: "textarea",
            theme: "modern",
            plugins: [
        "advlist autolink lists link image charmap print preview hr anchor pagebreak",
        "searchreplace wordcount visualblocks visualchars code fullscreen",
        "insertdatetime media nonbreaking save table contextmenu directionality",
        "emoticons template paste textcolor colorpicker textpattern"
            ],
            toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
            toolbar2: "print preview media | forecolor backcolor emoticons",
            image_advtab: true,
            templates: [
        { title: 'Test template 1', content: 'Test 1' },
        { title: 'Test template 2', content: 'Test 2' }
            ]
        });


    </script>

    <%--<asp:UpdatePanel ID="xupnlCity" runat="server">
        <ContentTemplate>--%>
    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
    <div class="main supplier">
        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="Insert Details"></asp:Literal>
            </div>
        </div>

        <br class="cl">

        <div class="clmn1">
            <div class="row1">
                <div class="whiteBox">
                    <div class="leftClmn">
                        Please fill the details for Terms And Conditions.
                                    <br class="cl"/>
                        <br class="cl">
                        <label>Name</label>
                        <asp:TextBox ID="xtxtName" runat="server" CssClass="imw97p" ToolTip="Please enter name" MaxLength="30" autocomplete="off"></asp:TextBox>
                        <br class="cl">
                        <br class="cl">
                        <label>Code</label>
                        <asp:TextBox ID="xtxtCode" runat="server" CssClass="imw97p" ToolTip="Please enter code" MaxLength="3" autocomplete="off"></asp:TextBox>
                        <br />
                        <br />
                        <div id="divchckPublish" class="chk" runat="server">
                            <label>Published</label>
                            <asp:CheckBox ID="xchckPublish" runat="server" />
                        </div>
                        <div class="width100P">
                            <div class="w13 fL">
                                <label>Content</label>
                            </div>
                            <div class="fL">
                                <textarea id="textarea" name="content" runat="server"></textarea>
                                <%--<asp:TextBox ID="xtxtContent" runat="server" CssClass="imw97p"></asp:TextBox>--%>
                            </div>
                        </div>
                        <br />
                        <div class="grey-box bord-grey" id="divmsg" runat="server">
                            <strong>NOTE: </strong>You will receive a confirmation call from our representative,
                                            once we add all your requested details in our system.
                        </div>
                        <br class="cl">
                        <asp:LinkButton ID="xlbtnSubmit" runat="server" CssClass="btnBlk" OnClick="xlbtnSubmit_Click" OnClientClick="javascript:return validateTextBox();">INSERT</asp:LinkButton>
                        <asp:LinkButton ID="xlbtnCancel" runat="server" CssClass="btnBlk" OnClick="xlbtnCancel_Click" OnClientClick="javascript:ShowProgress(true);">CANCEL</asp:LinkButton>
                        <%--OnClientClick="javascript:ShowProgress(true);"--%>

                        <%--<asp:LinkButton ID="UpdateDetails" runat="server" onserverclick="UpdateDetails_click" 
                                            OnClientClick="javascript: if (!validateTextBox()) { return false;}">Update</asp:LinkButton>--%>
                        <%--<asp:LinkButton ID="Back" runat="server" OnClientClick="javascript: ShowProgress(true);" 
                                            onserverclick="btnBack_click">Back</asp:LinkButton>--%>
                    </div>
                    <div class="rightClmn">
                    </div>
                    <br class="cl">
                </div>
            </div>
        </div>
    </div>
    <%--    </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

