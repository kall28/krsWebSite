<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Comm_CommTemplateCreate, App_Web_commtemplatecreate.aspx.c93392d6" validaterequest="false" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
        

    <script src="../Scripts/plugins/tinymce_4.1.9/tinymce/js/tinymce/tinymce.min.js" type="text/javascript"></script>

            <script>
                function validateTemplate() {
                    var msg = "";
                    if ($("#ContentPlaceHolder1_xtxtSearch").val() == '') {
                        msg = "Please Enter Name";
                        ShowToolTip("#ContentPlaceHolder1_xtxtSearch", msg);
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xddlActivity option:selected").index() <= 0) {
                        msg = "Please Select CommType";
                        ShowToolTip("#ContentPlaceHolder1_xddlActivity", msg);
                        return false;
                    }
                    else if ($("#ContentPlaceHolder1_xtxtSubject").val() == '') {
                        msg = "Please Enter Subject";
                        ShowToolTip("#ContentPlaceHolder1_xtxtSubject", msg);
                        return false;
                    }
                    //            else if ($("#ContentPlaceHolderMaster_FreeTextBox1").val() == '') {
                    //                msg = "Please Write Body";
                    //                ShowToolTip("#ContentPlaceHolderMaster_FreeTextBox1_designEditorArea", msg);
                    //                return false;
                    //            }

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
       <%-- <asp:UpdatePanel ID="xupnlTemplate" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>
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
                                    <label>Name</label><br />
                                    <asp:TextBox ID="xtxtSearch" runat="server" CssClass="imw97p" ToolTip="Please enter name" autocomplete="off"></asp:TextBox>
                                    <br /><br />
                                    <label>Type</label><br />
                                    <div class="styled-select fl selOrganization">
                                        <asp:DropDownList ID="xddlActivity" runat="server" >
                                            <asp:ListItem value="00" Selected="True">-Select-</asp:ListItem>
                                            <asp:ListItem value="EML">EMAIL</asp:ListItem>
                                            <asp:ListItem value="MSG">MESSAGE</asp:ListItem>
                                             <asp:ListItem value="SMS">SMS</asp:ListItem>
                                           <%-- <asp:ListItem value="RFP">RFP</asp:ListItem>
                                            <asp:ListItem value="AUC">AUCTION</asp:ListItem>
                                            <asp:ListItem value="OTH">OTHER</asp:ListItem>--%>
                                        </asp:DropDownList>
                                    </div><br /><br /><br />
                                    <label>Subject</label><br />
                                    <asp:TextBox ID="xtxtSubject" runat="server" CssClass="imw97p" ToolTip="Please enter name" autocomplete="off"></asp:TextBox>
                                    <br /><br />
                                    <%--<div id="divchckPublish" class="chk" runat="server" visible="true">--%>
                                        <label>Published</label>
                                        <asp:CheckBox ID="xchkpublish" runat="server" />
                                    <%--</div>--%>
                                    <br /><br />

                                    <label>Body</label><br />
                                    
                                    <%--<textarea id="txtArea" name="content" runat="server" rows="10" style="width:100%"></textarea>--%>                                                                        
                                        <textarea id="txtArea" name="content" runat="server" ></textarea>
                                    <br /><br />
                                    <%--<asp:LinkButton ID="btnSend" runat="server" CssClass="btnBlk"
                                        OnClick="btnSend_Click" OnClientClick="javascript:if(!validateTemplate()){ return false; }">Insert</asp:LinkButton>--%>

                                    <asp:LinkButton ID="btnSend" runat="server" CssClass="btnBlk"
                                        OnClick="btnSend_Click" OnClientClick="javascript:if(validateTemplate())">Insert</asp:LinkButton>
                                        <asp:LinkButton ID="btnCancel" runat="server" CssClass="btnBlk"
                                        OnClick="btnCancel_Click" OnClientClick="javascript:ShowProgress(true);">Cancel</asp:LinkButton>

                            </div>
                            <%--<div class="rightClmn">
                            </div>--%>
                            <br class="cl">
                        </div>
                    </div>
                </div>
            </div>
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

