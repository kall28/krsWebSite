<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Admin_ChangeDetails, App_Web_changeemail.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        #ContentPlaceHolder1_xtxtOldPassword {
            padding: 2%;
            margin-bottom: 0%;
        }

        #ContentPlaceHolder1_xtxtNewPasswrod {
            padding: 2%;
            margin-bottom: 0%;
        }

        #ContentPlaceHolder1_xtxtConfirmPasswrod {
            padding: 2%;
            margin-bottom: 0%;
        }

        #ContentPlaceHolder1_xtxtPassword {
            padding: 2%;
            margin-bottom: 0%;
        }
    </style>
    <script type="text/javascript">

        function xlnkbtnSubmit_Email_Click() {

            if ($("#ContentPlaceHolder1_xtxtEmail").val() == "") {
                $("#ContentPlaceHolder1_xtxtEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtEmail"), "Please enter old Email.", "bottom");
                return false;
            }
            else if (!validateEmail($("#ContentPlaceHolder1_xtxtEmail").val())) {
                $("#ContentPlaceHolder1_xtxtEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtEmail"), "Please Enter Valid Email Address", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtNewEmail").val() == "") {
                $("#ContentPlaceHolder1_xtxtNewEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtNewEmail"), "Please enter new Email.", "bottom");
                return false;
            }
            else if (!validateEmail($("#ContentPlaceHolder1_xtxtNewEmail").val())) {
                $("#ContentPlaceHolder1_xtxtNewEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtNewEmail"), "Please Enter Valid New Email Address", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtConfirmEmail").val() == "") {
                $("#ContentPlaceHolder1_xtxtConfirmEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmEmail"), "Please enter confirm Email.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtNewEmail").val() != $("#ContentPlaceHolder1_xtxtConfirmEmail").val()) {
                $("#ContentPlaceHolder1_xtxtConfirmEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmEmail"), "Confirm email does not match.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtPassword").val() == "") {
                $("#ContentPlaceHolder1_xtxtPassword").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtPassword"), "Please enter Password.", "bottom");
                return false;
            }
            ShowProgress();
            return true;
        }

        function xlnkbtnSubmit_Mob_Click() {

            if ($("#ContentPlaceHolder1_xtxtMobile").val() == "") {
                $("#ContentPlaceHolder1_xtxtMobile").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMobile"), "Please enter old Mobile number.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtMobile").val().length < 10) {
                $("#ContentPlaceHolder1_xtxtMobile").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMobile"), "Please Enter valid MobileNo .", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtNewMobile").val() == "") {
                $("#ContentPlaceHolder1_xtxtNewMobile").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtNewMobile"), "Please enter new Mobile number.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtNewMobile").val().length < 10) {
                $("#ContentPlaceHolder1_xtxtNewMobile").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtNewMobile"), "Please Enter valid MobileNo .", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtConfirmMobile").val() == "") {
                $("#ContentPlaceHolder1_xtxtConfirmMobile").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmMobile"), "Please re-enter Mobile number.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtNewMobile").val() != $("#ContentPlaceHolder1_xtxtConfirmMobile").val()) {
                $("#ContentPlaceHolder1_xtxtConfirmMobile").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtConfirmMobile"), "Confirm mobile does not match.", "bottom");
                return false;
            }
            ShowProgress();
            return true;
        }
        function ValidateOTP() {
            if ($("#ContentPlaceHolder1_xtxtOTP").val() == "") {
                $("#ContentPlaceHolder1_xtxtOTP").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtOTP"), "Please enter OTP.", "bottom");
                return false;
            }
            ShowProgress();
            return true;
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div class="main supplier newUI">
                <div class="topBlk">
                    <div class="mainHead fl">Manage your account</div>
                    <%--<ul class="rightBtn" style="display:none">
                    <li><a href="#" class="btnBlk">Save</a></li>
                    <li><a href="#" class="btnBlk">Discard</a></li>
                    <li><a href="#" class="btnBlk">Close</a></li>
                </ul>--%>
                    <br class="cl" />
                </div>
                <div class="btn-help btnHelper">
                    <img src="../images/icn-help.png" />
                </div>
                <div class="helpBlockAll"></div>
                <div class="fr helpBlk  srh-help helpSlide">
                    <!-- faq start here -->
                    <div class="faqBlk">
                        <div class="faqTitle">
                            <img src="../images/icn-ques.png" />
                            FAQ's<a href="#" class="faqMore"><img src="../images/faq-more.png" /></a>
                        </div>
                        <div class="panel-group" id="Div1">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel1">Q: Can I participate in a Negotiationif I am travelling overseas?
                                            <i class="glyphicon glyphicon-minus fr"></i></a>
                                    </h4>

                                </div>
                                <div id="Div2" class="panel-collapse collapse in">
                                    <div class="panel-body">A: You and the sellers can participate in a Negotiation irrespective of where you’re located. All you need is an internet connection. The moment a registered buyer/supplier logs in, the system will recognise the country and open all the relevant details.</div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel2">Q: Can I participate in a Negotiationif I am travelling overseas?
                                            <i class="glyphicon glyphicon-plus fr"></i></a>
                                    </h4>

                                </div>
                                <div id="Div3" class="panel-collapse collapse">
                                    <div class="panel-body">A: You and the sellers can participate in a Negotiation irrespective of where you’re located. All you need is an internet connection. The moment a registered buyer/supplier logs in, the system will recognise the country and open all the relevant details.</div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel3">Q: Can I participate in a Negotiationif I am travelling overseas?
                                            <i class="glyphicon glyphicon-plus fr"></i></a>
                                    </h4>

                                </div>
                                <div id="Div4" class="panel-collapse collapse">
                                    <div class="panel-body">Contents panel 3</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- faq end here -->
                    <!-- chat start here -->
                    <div class="chatBlk">

                        <div class="panel-group" id="Div5">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="chataccordion-toggle" data-toggle="collapse" data-parent="#chataccordion" href="#chatpanel1">
                                            <img src="../images/icn-chat.png" />Chat with Buyer<i class="glyphicon glyphicon-minus fr"></i></a>
                                    </h4>

                                </div>
                                <div id="Div6" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="innerChat">
                                            <div class="chatImg">
                                                <img src="../images/chat-help-img.png" />
                                                <div class="chatlogo">
                                                    <img src="../images/nav_infilogo.png" />
                                                    <p>Or call us at <em>1-800 102 8591 between 9:30 am and 5 pm</em></p>
                                                    <p>Or email us at <em>team@renepay.com</em></p>
                                                </div>
                                            </div>
                                            <div class="chatName">
                                                <em>RenePay Team:</em>
                                                <p>How May i help you?</p>
                                            </div>
                                            <div class="chatInput">
                                                <input type="text" placeholder="Type your message here...">
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="chataccordion-toggle" data-toggle="collapse" data-parent="#chataccordion" href="#chatpanel2">
                                            <img src="../images/icn-chat.png" />Chat with RenePay
                                            <i class="glyphicon glyphicon-plus fr"></i></a>
                                    </h4>
                                </div>
                                <div id="Div7" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="innerChat">
                                            <div class="chatImg">
                                                <img src="../images/chat-help-img.png" />
                                                <div class="chatlogo">
                                                    <img src="../images/nav_infilogo.png" />
                                                    <p>Or call us at <em>1-800 102 8591 between 9:30 am and 5 pm</em></p>
                                                    <p>Or email us at <em>team@renepay.com</em></p>
                                                </div>
                                            </div>
                                            <div class="chatName">
                                                <em>RenePay Team:</em>
                                                <p>How May i help you?</p>
                                            </div>
                                            <div class="chatInput">
                                                <input type="text" placeholder="Type your message here...">
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- chat end here -->


                </div>

                <div class="clmn1 imw72p fl">
                     <div class="innerBx">
                        <div class="innerBxhead bgGrey">Change Email</div>
                        <div class="buyRegis innerBxbody brdGrey whiteBox">
                                <div class="formRow">
                                    <label>Old e-mail:</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtEmail" runat="server" CssClass="imw48p" 
                                            autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>New e-mail:</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtNewEmail" runat="server" CssClass="imw48p" TextMode="Password"  
                                             oncopy="return false" onpaste="return false" oncut="return false" 
                                            ondelete="return false" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Re-enter new e-mail:</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtConfirmEmail"  runat="server" CssClass="imw48p"
                                            oncopy="return false" onpaste="return false" oncut="return false" ondelete="return false" 
                                             autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Password</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtPassword" runat="server"  CssClass="imw48p" 
                                           TextMode="Password" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label></label>
                                    <div class="formRow1">
                                        <asp:LinkButton ID="xlnkbtnSubmitEmail" runat="server" CssClass="btnRed"
                                            OnClientClick="javascript: return xlnkbtnSubmit_Email_Click();" 
                                            OnClick="xlnkbtnSubmitEmail_Click">SUBMIT</asp:LinkButton>

                                        <asp:LinkButton ID="xlnkbtnCloseEmail" runat="server" CssClass="btnRed" Visible="false"
                                            OnClick="xlnkbtnCloseEmail_Click">CLOSE</asp:LinkButton>
                                    </div>
                                </div>
                                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                              <br class="cl" />
                            </div>
                          
                        </div>
                    
                    </div>
               
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

