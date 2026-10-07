<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="Admin_ChangeMobile, App_Web_changemobile.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div class="main supplier newUI">
                <div class="topBlk">
                    <div class="mainHead fl">Manage your account</div>

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
                        <div class="innerBxhead bgGrey">Change Mobile Number</div>
                        <div class="buyRegis innerBxbody brdGrey whiteBox">
                                
                                <br />
                                <div class="formRow">
                                    <label>Old Mobile Number</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtMobile" runat="server" CssClass="imw48p" MaxLength="10" autocomplete="off" 
                                            onkeydown="return IsNumeric(event);"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>New Mobile Number</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtNewMobile" runat="server" oncopy="return false" TextMode="Password"
                                            onpaste="return false" oncut="return false" ondelete="return false"
                                             CssClass="imw48p" MaxLength="10" autocomplete="off" onkeydown="return IsNumeric(event);"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Re-enter mobile number</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtConfirmMobile" runat="server" CssClass="imw48p" MaxLength="10" 
                                             autocomplete="off" onkeydown="return IsNumeric(event);"></asp:TextBox>
                                    </div>
                                </div>
                                <%--<div class="formRow">
                                    <label>Re-enter mobile number</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtConfirmMobile" oncopy="return false" onpaste="return false" oncut="return false" ondelete="return false" TextMode="Password" runat="server" CssClass="imw48p" MaxLength="10" autocomplete="off" onkeydown="return IsNumeric(event);"></asp:TextBox>
                                    </div>
                                </div>--%>

                                <div class="formRow" id="divOTP" runat="server" style="display:none" >
                                    <label>OTP</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtOTP" runat="server" CssClass="imw48p" autocomplete="off"
                                             onkeydown="return IsNumeric(event);"></asp:TextBox>

                                        <asp:LinkButton ID="xlnkbtnResend" runat="server" CssClass="btnGrey"  Visible="false"
                                            OnClick="xllnkResend_Click">RESEND OTP</asp:LinkButton>
                                    </div>
                                </div>

                                <div class="formRow">
                                    <label></label>
                                    <div class="formRow1">
                                        <asp:LinkButton ID="xlnkbtnSubmitMob" runat="server" CssClass="btnRed"
                                            OnClientClick="javascript: return xlnkbtnSubmit_Mob_Click();"
                                            OnClick="xlnkbtnSubmitMob_Click">SUBMIT</asp:LinkButton>
                                        <asp:LinkButton ID="xlnkbtnSubmitMobFinal" runat="server" CssClass="btnRed" Visible="false" 
                                            OnClientClick="javascript: return ValidateOTP();"
                                            OnClick="xlnkbtnSubmitMobFinal_Click">SUBMIT</asp:LinkButton>
                                        <asp:LinkButton ID="xlnkbtnCloseMob" runat="server" CssClass="btnRed" Visible="false"
                                            OnClick="xlnkbtnCloseMob_Click">CLOSE</asp:LinkButton>
                                        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                                    </div>
                                </div>
                            <br class="cl" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

