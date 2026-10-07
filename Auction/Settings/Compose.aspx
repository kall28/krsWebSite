<%@ page title="" language="C#" masterpagefile="~/Settings/SettingMaster.master" autoeventwireup="true" validaterequest="false" inherits="New_Settings_Compose, App_Web_compose.aspx.f634c32f" %>

<%@ MasterType VirtualPath="~/Settings/SettingMaster.master" %>
<%@ Reference VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderButton" Runat="Server">
    <div class="mainHead fl">COMPOSE MAIL</div>
				<ul class="rightBtn">
                    <li><asp:LinkButton ID="xlnkbtnSend" runat="server" CssClass="btnBlk"
                                    OnClientClick="javascript: return validateCompose();"
                                    OnClick="xlnkbtnSend_Click">SEND</asp:LinkButton></li>
                    <li><asp:LinkButton ID="xlnkbtnBack" runat="server" CssClass="btnBlk"
                                    OnClick="xlnkbtnBack_Click">BACK</asp:LinkButton></li>
              	</ul>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">

    <link href="../Styles/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/plugins/tinymce_4.1.9/tinymce/js/tinymce/tinymce.min.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(function () {

            SearchText();
        });
        function SearchText() {

            $("#ContentPlaceHolder1_ContentPlaceHolderContent_xtxtTo, #ContentPlaceHolder1_ContentPlaceHolderContent_txtCC,#ContentPlaceHolder1_ContentPlaceHolderContent_txtBCC").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Compose.aspx/GetAutoCompleteData",
                        data: "{'username':'" + extractLast(request.term) + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                },
                focus: function () {
                    // prevent value inserted on focus
                    return false;
                },
                select: function (event, ui) {
                    var terms = split(this.value);
                    // remove the current input
                    terms.pop();
                    // add the selected item
                    terms.push(ui.item.value);
                    // add placeholder to get the comma-and-space at the end
                    terms.push("");
                    this.value = terms.join(", ");
                    return false;
                }
            });
            $("#xtxtTo").bind("keydown", function (event) {
                if (event.keyCode === $.ui.keyCode.TAB &&
						$(this).data("autocomplete").menu.active) {
                    event.preventDefault();
                }
            })
            function split(val) {
                return val.split(/,\s*/);
            }
            function extractLast(term) {
                return split(term).pop();
            }
        }

        //   validation for compose

        function validateCompose() {

            var msg = "";
            if ($("#ContentPlaceHolder1_ContentPlaceHolderContent_xtxtTo").val() == "") {
                msg = "Please enter recipient name";
                $("#ContentPlaceHolder1_ContentPlaceHolderContent_xtxtTo").focus();
                ShowToolTip("#ContentPlaceHolder1_ContentPlaceHolderContent_xtxtTo", msg, "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_ContentPlaceHolderContent_xtxtSubject").val() == "") {
                msg = "Please enter subject";
                $("#ContentPlaceHolder1_ContentPlaceHolderContent_xtxtSubject").focus();
                ShowToolTip("#ContentPlaceHolder1_ContentPlaceHolderContent_xtxtSubject", msg, "bottom");
                return false;
            }
            //            else if ($("#ContentPlaceHolder1_ContentPlaceHolderContent_FreeTextBox1").val() == '') {
            //                msg = "Please Write Body";
            //                ShowToolTip("#ContentPlaceHolder1_ContentPlaceHolderContent_FreeTextBox1_designEditorArea", msg);
            //                return false;
            //            }

            //if (msg.length <= 0) {
            //    ShowProgress(true);
            //    return true;
            //}
            ShowProgress();
            return true;
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

                    <%--<div style="width:100%; background-color:#c0c0c0;">--%>
                        <label>To</label>
                        <asp:TextBox ID="xtxtTo" runat="server" CssClass="imw97p" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                        <label>Subject</label>
                        <asp:TextBox ID="xtxtSubject" CssClass="imw97p" runat="server"></asp:TextBox>
                        <label class="immrb10">Body</label>
                        <textarea id="xtxtarea" name="content" runat="server" style="width:100%"></textarea>
                    <%--</div>--%>
</asp:Content>

