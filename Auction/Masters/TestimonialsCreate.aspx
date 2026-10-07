<%@ page language="C#" autoeventwireup="true" masterpagefile="~/SiteMaster.master" validaterequest="false" inherits="New_Masters_TestimonialsCreate, App_Web_testimonialscreate.aspx.6044e34" %>
<%@ MasterType virtualpath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="../Scripts/plugins/tinymce_4.1.9/tinymce/js/tinymce/tinymce.min.js" type="text/javascript"></script>

    <script>

        function validateTextBox() {
            var msg = "";
            if ($("#ContentPlaceHolder1_xtxtName").val() == '') {
                msg = "Please Enter Name";
                ShowToolTip("#ContentPlaceHolder1_xtxtName", msg, "bottom");
                $("#ContentPlaceHolder1_xtxtName").focus();
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtDesignation").val() == '') {
                msg = "Please Enter Code";
                ShowToolTip("#ContentPlaceHolder1_xtxtDesignation", msg, "bottom");
                $("#ContentPlaceHolder1_xtxtDesignation").focus();
                return false;
            }
            if (msg.length <= 0) {
                ShowProgress(true);
                return true;
            }
            return false;
        }


        function ShowCompanySelection() {
            if ($("#ContentPlaceHolder1_rdCompanyLogo").is(":checked")) {

                $("#ContentPlaceHolder1_xdivCompanyLogo").show();
                $("#ContentPlaceHolder1_xdivCompanyName").hide();
            }
            else {
                $("#ContentPlaceHolder1_xdivCompanyName").show();
                $("#ContentPlaceHolder1_xdivCompanyLogo").hide();
            }
        }

        // For tiny textbox
        tinymce.init({
            selector: "textarea",
            theme: "modern",
            height: "200px",
            width: "800px",
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
                        Please fill the details for Testimonials
                                    <br class="cl">
                        <br class="cl">
                        <label>Name</label>
                        <asp:TextBox ID="xtxtName" runat="server" CssClass="imw97p" ondrop="return false;" onkeydown="return IsCharacter(event);" autocomplete="off"></asp:TextBox>
                        <br class="cl">
                        <label>Designation</label>
                        <asp:TextBox ID="xtxtDesignation" runat="server" CssClass="imw97p" MaxLength="50" ondrop="return false;" onkeydown="return IsCharacter(event);" autocomplete="off"></asp:TextBox>
                        <br class="cl">
                        <br class="cl">
                        <div class="width100P">
                            <div class="w13 fL">
                                <label>Message</label>
                            </div>
                            <div class="fL">
                                <textarea id="textarea" name="content" runat="server"></textarea>
                            </div>
                        </div>
                        <br class="cl">
                        <br class="cl">

                        <div id="xdivProfileLogo" runat="server">
                            <label>Profile Logo</label>
                            <ctrl:UploadFile ID="xctrlProfileLogo" runat="server" UserType="ADM" UploadDocType="TestimonialsProfile" UploadFileType="Img" />
                        </div>
                        <br />

                        <div id="xdivCpmpanySelect">
                            <table>
                                <tr>
                                    <td>
                                        <input type="radio" id="rdCompanyLogo" runat="server" checked="true" onchange="javascript:return ShowCompanySelection();" />
                                    </td>
                                    <td>
                                        <label id="lblCompanyLogo">Company Logo</label>
                                    </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td>
                                        <input type="radio" id="rdCompanyName" runat="server" value="Company Name" onchange="javascript:return ShowCompanySelection();" />
                                    </td>
                                    <td>
                                        <label id="lblCompanyName">Company Name</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="xdivCompanyName" runat="server" style="display: none;">
                            <label id="lblCompName">Company Name</label>
                            <asp:TextBox ID="xtxtCompanyName" runat="server" CssClass="imw97p" ToolTip="Please enter company name" MaxLength="30" autocomplete="off"></asp:TextBox>
                        </div>

                        <div id="xdivCompanyLogo" runat="server">
                            <label>Company Logo</label>
                            <ctrl:UploadFile ID="xctrlCompanyLogo" runat="server" UserType="ADM" UploadDocType="TestimonialsLogo" UploadFileType="Img" />
                        </div>
                        <br />
                        <div id="divchckPublish" class="chk" runat="server">
                            <label>Published</label>
                            <asp:CheckBox ID="xchckPublish" runat="server" />
                        </div>
                        <br />
                        <div class="grey-box bord-grey" id="divmsg" runat="server" visible="false">
                            <strong>NOTE: </strong>You will receive a confirmation call from our representative,
                                            once we add all your requested details in our system.
                        </div>
                        <br class="cl">
                        <asp:LinkButton ID="xlbtnSubmit" runat="server" CssClass="btnBlk" OnClick="xlbtnSubmit_Click" OnClientClick="javascript:return validateTextBox();">INSERT</asp:LinkButton>
                        <asp:LinkButton ID="xlbtnCancel" runat="server" CssClass="btnBlk" OnClick="xlbtnCancel_Click" OnClientClick="javascript:ShowProgress(true);">CANCEL</asp:LinkButton>
                        <%--OnClientClick="javascript:ShowProgress(true);"--%>
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


