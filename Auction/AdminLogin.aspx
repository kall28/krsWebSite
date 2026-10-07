<%@ page language="C#" autoeventwireup="true" inherits="AdminLogin, App_Web_adminlogin.aspx.cdcab7d2" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="apple-touch-icon" sizes="57x57" href="<%=ResolveUrl("~/favicon/apple-icon-57x57.png")%>" />
    <link rel="apple-touch-icon" sizes="60x60" href="<%=ResolveUrl("~/favicon/apple-icon-60x60.png")%>" />
    <link rel="apple-touch-icon" sizes="72x72" href="<%=ResolveUrl("~/favicon/apple-icon-72x72.png")%>" />
    <link rel="apple-touch-icon" sizes="76x76" href="<%=ResolveUrl("~/favicon/apple-icon-76x76.png")%>" />
    <link rel="apple-touch-icon" sizes="114x114" href="<%=ResolveUrl("~/favicon/apple-icon-114x114.png")%>" />
    <link rel="apple-touch-icon" sizes="120x120" href="<%=ResolveUrl("~/favicon/apple-icon-120x120.png")%>" />
    <link rel="apple-touch-icon" sizes="144x144" href="<%=ResolveUrl("~/favicon/apple-icon-144x144.png")%>" />
    <link rel="apple-touch-icon" sizes="152x152" href="<%=ResolveUrl("~/favicon/apple-icon-152x152.png")%>" />
    <link rel="apple-touch-icon" sizes="180x180" href="<%=ResolveUrl("~/favicon/apple-icon-180x180.png")%>" />
    <link rel="icon" type="image/png" sizes="192x192"  href="<%=ResolveUrl("~/favicon/android-icon-192x192.png")%>" />
    <link rel="icon" type="image/png" sizes="32x32" href="<%=ResolveUrl("~/favicon/favicon-32x32.png")%>" />
    <link rel="icon" type="image/png" sizes="96x96" href="<%=ResolveUrl("~/favicon/favicon-96x96.png")%>" />
    <link rel="icon" type="image/png" sizes="16x16" href="<%=ResolveUrl("~/favicon/favicon-16x16.png")%>" />
    <link rel="manifest" href="<%=ResolveUrl("~/favicon/manifest.json")%>" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="msapplication-TileImage" content="<%=ResolveUrl("~/favicon/ms-icon-144x144.png")%>" />
    <meta name="theme-color" content="#ffffff" />
    <title>Renepay</title>
    <%--<link rel="icon" type="image/png" href="<%=ResolveUrl("~/images/favicon.ico")%>" />--%>
    <!-- main CSS -->
    <link href="<%=ResolveUrl("~/Styles/style-2.1.css")%>" rel="stylesheet" />

    <!-- Home CSS -->
    <link href="<%=ResolveUrl("~/Styles/Home.css")%>" rel="stylesheet" />

     <!-- responsive CSS -->
    <link href="<%=ResolveUrl("~/Styles/responsive.css")%>" rel="stylesheet" />


    <!-- Bootstrap Core CSS -->
    <link href="<%=ResolveUrl("~/Styles/bootstrap.min.css")%>" rel="stylesheet" />

    <!-- MetisMenu CSS -->
    <link href="<%=ResolveUrl("~/Styles/metisMenu.min.css")%>" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="<%=ResolveUrl("~/Styles/sb-admin-2.css")%>" rel="stylesheet" />

    <!-- Custom Fonts -->
    <link href="<%=ResolveUrl("~/Styles/font-awesome.min.css")%>" rel="stylesheet" type="text/css" />
    <!-- jQuery -->
    <style>
        body {
            background-color: #fff;
        }

        
    </style>
    <style>
        .badge-notify{
           background:red;
           position:absolute;
           top: 0px;
           left: 0px;
        }
    </style>
   
</head>
<body>
    
    <form id="form2" runat="server">
        <asp:ScriptManager ID="xScrMgrMaster" runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/jquery-ui-1.11.2.custom/external/jquery/jquery.js" />
                <asp:ScriptReference Path="~/Scripts/jquery-ui-1.11.2.custom/jquery-ui.min.js" />
                <asp:ScriptReference Path="~/Scripts/bootstrap.min.js" />
                
                <asp:ScriptReference Path="~/Scripts/common-2.1.js" />
                <asp:ScriptReference Path="~/Scripts/jquery.slicknav.js" />
                
            </Scripts>
        </asp:ScriptManager>
       <%-- <asp:ScriptManager ID="ScriptManager" runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/jquery-ui-1.11.2.custom/external/jquery/jquery.js" />
                <asp:ScriptReference Path="~/Scripts/jquery-ui-1.11.2.custom/jquery-ui.min.js" />
                <asp:ScriptReference Path="~/Scripts/bootstrap.min.js" />
               
                <asp:ScriptReference Path="~/Scripts/common-2.0.js" />
            </Scripts>
        </asp:ScriptManager>--%>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <script>
                    function login_click() {
                        ShowModalBox($("#divLogin"));
                        HideModalBox($("#divSignup"));
                        HideModalBox($("#divFPassword"));
                        HideModalBox($("#divFUsername"));
                    }

                    function fPwd_click() {
                        ShowModalBox($("#divFPassword"));
                        HideModalBox($("#divSignup"));
                        HideModalBox($("#divLogin"));
                        HideModalBox($("#divFUsername"));
                    }

                    function fUName_click() {
                        ShowModalBox($("#divFUsername"));
                        HideModalBox($("#divSignup"));
                        HideModalBox($("#divLogin"));
                        HideModalBox($("#divFPassword"));
                    }

                    function signup_click() {
                        ShowModalBox($("#divSignup"));
                        HideModalBox($("#divFUsername"));
                        HideModalBox($("#divLogin"));
                        HideModalBox($("#divFPassword"));
                    }

                    function signupsel_click(mode) {
                        HideModalBox($("#divSignup"));
                        HideModalBox($("#divFUsername"));
                        HideModalBox($("#divLogin"));
                        HideModalBox($("#divFPassword"));
                        //link_click(mode);
                        ShowProgress();
                    }

                    function validateLogin() {
                        //if ($("#divLogin").is(":visible")) {
                        var ctrl = $("#xtxtUserName");
                        if (ctrl.val() == "") {
                            $("#xtxtUserName").focus();
                            ShowToolTip("#xtxtUserName", "Please enter User Name.", "bottom");
                            return false;
                        }

                        ctrl = $("#xtxtPassword");
                        if (ctrl.val() == "") {
                            $("#xtxtPassword").focus();
                            ShowToolTip("#xtxtPassword", "Please enter password.", "bottom");
                            return false;
                        }

                        HideModalBox($("#divLogin"));
                        ShowProgress();
                        return true;
                        //}
                        //else {
                        //    return false;
                        //}
                    }

                    function validateFUName() {
                        //if ($("#divFUsername").is(":visible")) {
                        var ctrl = $("#txtFUEMail");
                        if (ctrl.val() == "") {
                            $("#txtFUEMail").focus();
                            ShowToolTip("#txtFUEMail", "Please enter emailAddress.", "bottom");
                            return false;
                        }
                        if (!validateEmail($("#txtFUEMail").val())) {
                            $("#txtFUEMail").focus();
                            ShowToolTip($("#txtFUEMail"), "Please Enter ValidEmailAddress", "bottom");
                            return false;
                        }
                        ctrl = $("#txtFUMobileNo");
                        if (ctrl.val() == "") {
                            $("#txtFUMobileNo").focus();
                            ShowToolTip("#txtFUMobileNo", "Please enter mobile no.", "bottom");
                            return false;
                        }
                        HideModalBox($("#divFUsername"));
                        ShowProgress();
                        return true;
                        //}
                        //else {
                        //    return false;
                        //}
                    }

                    function validateFPwd() {
                        //if ($("#divFPassword").is(":visible")) {
                        //var ctrl = $("#txtFPUserName");
                        //if (ctrl.val() == "") {
                        //    $("#txtFPUserName").focus();
                        //    ShowToolTip("#txtFPUserName", "Please enter user name.", "bottom");
                        //    return false;
                        //}

                        //ctrl = $("#txtFPMobileNo");
                        //if (ctrl.val() == "") {
                        //    $("#txtFPMobileNo").focus();
                        //    ShowToolTip("#txtFPMobileNo", "Please enter mobile no.", "bottom");
                        //    return false;
                        //}
                        if ($("#txtFPUserName").val() == "" && $("#txtFPMobileNo").val() == "") {
                            $("#txtFPUserName").focus();
                            ShowToolTip("#txtFPUserName", "Please enter your username / registered mobile number.", "bottom");
                            // ShowModalMsgBox("Error", "Please enter your username / registered mobile number.");
                            return false;
                        }
                        HideModalBox($("#divFPassword"));
                        ShowProgress();
                        return true;
                        //}
                        //else {
                        //    return false;
                        //}
                    }

                    //$(document).ready(function(){
                    //$(document).keypress(function (event) {
                    //    if (event.keyCode == 13) {
                    //        if ($("#divLogin").is(":visible")) {
                    //            $("#lnkLogin").click();
                    //        }
                    //        else if ($("#divFUsername").is(":visible")) {
                    //            $("#lnkFUSubmit").click();
                    //        }
                    //        else if ($("#divFPassword").is(":visible")) {
                    //            $("#lnkFPSubmit").click();
                    //        }
                    //        else { event.preventDefault(); return false; }
                    //    }
                    //});
                    //});                    
                </script>
                <!-- Modal -->
                <div class="modal fade" id="divLogin" role="dialog">
                    <div class="modal-dialog loginBlk">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title h3">LOG IN</h4>
                            </div>
                            <div class="modal-body">
                                <div id="divLoginPanel" class="loginDetail">
                                 <%-- <asp:RadioButtonList ID="rdbLoginType" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" CellPadding="20" CellSpacing="20" Width="100%">
                             <asp:ListItem Text="As Buyer" Value="B" Selected="True"></asp:ListItem>
                              <asp:ListItem Text="As Supplier" Value="S"></asp:ListItem>
                                 <asp:ListItem Text="Other" Value="O"></asp:ListItem>
                               </asp:RadioButtonList>--%>
                                    <div class="userid">
                                        <i class="fa fa-user fa-fw"></i>
                                        <input id="xtxtUserName" type="text" runat="server" placeholder="Email / Mobile number"
                                            autocomplete="off" onkeydown="if (event.keyCode == 13){return false;}" />
                                    </div>
                                    <a href="#" onclick="javascript: fUName_click(); return false;" class="forgot" style="display:none;">Forgot Username?<br /></a>
                                    <div class="userpswd">
                                        <i class="fa fa-lock fa-fw"></i>
                                        <input id="xtxtPassword" type="password" runat="server" placeholder="Enter your password"
                                            autocomplete="off" onkeydown="if (event.keyCode == 13){return false;}" />
                                    </div>
                                    <a href="#" onclick="javascript: fPwd_click(); return false;" class="forgot">Forgot Password?</a><br>
                                    <input type="checkbox" id="chkremember" runat="server" value="passwrod" />
                                    Remember me<br>
                                    <br>
                                    <a class="btnRed" href="#" id="lnkLogin" runat="server" onserverclick="xbtnLogin_click"
                                        onclick="javascript: return validateLogin();">LOG IN</a>
                                </div>
                                <div id="divSignupPanel" class="signupInfo" style="display:none"> 
                                    <p class="h3">New to <em>Renepay?</em></p>
                                    <p>Click here to sign up</p>
                                    <a class="btnRed" href="#" onclick="javascript:signup_click();return false;">SIGN UP</a>
                                </div>
                                <br class="cl">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="divSignup" role="dialog">
                    <div class="modal-dialog loginBlk">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" onclick="javascript: login_click(); return false;">&times;</button>
                                <h4 class="modal-title h3">SIGN UP</h4>
                            </div>
                            <div class="modal-body">
                                <div id="div4" class="signupInfo">
                                    <a class="btnRed" href="#" id="A1" runat="server"
                                        onclick="javascript:signupsel_click('RB');"
                                        onserverclick="lnkRegBuyer_ServerClick">Register as a Buyer</a>
                                </div>
                                <div id="div1" class="signupInfo">
                                    <a class="btnRed" href="#" id="A2" runat="server"
                                        onclick="javascript:signupsel_click('RS');"
                                        onserverclick="lnkRegSupplier_ServerClick">Register as a Supplier</a>
                                </div>
                                <br class="cl">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="divFUsername" role="dialog">
                    <div class="modal-dialog loginBlk">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" onclick="javascript: login_click(); return false;">&times;</button>
                                <h4 class="modal-title h3">Forgot your username?</h4>
                            </div>
                            <div class="modal-body">
                                <p>Enter your registered email address and mobile number to receive your username</p>
                                <br>
                                <div class="forgotUser">
                                    <div class="userid">
                                        <i class="fa fa-mail fa-fw"></i>
                                        <input type="text" id="txtFUEMail" runat="server" placeholder="Email Address"
                                            onkeydown="if (event.keyCode == 13){return false;}" />
                                    </div>
                                    <div class="userpswd">
                                        <i class="fa fa-mobile fa-fw"></i>
                                        <input type="text" id="txtFUMobileNo" runat="server" placeholder="Mobile Number" maxlength="10"
                                            onkeydown="return IsNumeric(event);" />
                                    </div>
                                    <br class="cl">
                                    <br>
                                    <a class="btnRed" href="#" id="lnkFUSubmit" runat="server" onserverclick="xbtnFUSubmit_click"
                                        onclick="javascript:if(!validateFUName()){ return false;}">SUBMIT</a>
                                </div>
                                <br class="cl">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="divFPassword" role="dialog">
                    <div class="modal-dialog loginBlk">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" onclick="javascript: login_click(); return false;">&times;</button>
                                <h4 class="modal-title h3">Forgot your password?</h4>
                            </div>
                            <div class="modal-body">
                                <p>Enter your username / registered mobile number to receive your reset password link</p>
                                <br/>
                               <%-- <asp:RadioButtonList ID="rdbloggTypeFP" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" CellPadding="20" CellSpacing="20" Width="100%">
                             <asp:ListItem Text="As Buyer" Value="B" Selected="True"></asp:ListItem>
                              <asp:ListItem Text="As Supplier" Value="S"></asp:ListItem>
                                 <asp:ListItem Text="Other" Value="O"></asp:ListItem>
                               </asp:RadioButtonList>--%>
                                <br />
                                <div class="forgotUser">
                                    <div class="userid">
                                        <i class="fa fa-user fa-fw"></i>
                                        <input type="text" id="txtFPUserName" runat="server" placeholder="User Name / mobile number"
                                            onkeydown="if (event.keyCode == 13){return false;}" />
                                    </div>
                                    <div class="userpswd" style="display:none">
                                        <i class="fa fa-mobile fa-fw"></i>
                                        <input type="text" id="txtFPMobileNo" runat="server" placeholder="Mobile Number" maxlength="10"
                                            onkeydown="return IsNumeric(event);" />
                                    </div>
                                    <br class="cl">
                                    <br>
                                    <a class="btnRed" href="#" id="lnkFPSubmit" runat="server" onserverclick="xbtnFPSubmit_click"
                                        onclick="javascript:if(!validateFPwd()){ return false;}">SUBMIT</a>
                                </div>
                                <br class="cl">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="divMsgPopUpBox" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title" id="msgHeader" runat="server"></h4>
                            </div>
                            <div class="modal-body">
                                <p id="msgBody" runat="server"></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="xbtnClose" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            </ContentTemplate>
        </asp:UpdatePanel>
         <script>
             function lnkPop_click(mode) {
                 var strHeader = "";
                 var strContent = "";
                 switch (mode) {
                     case 1:
                         strHeader = "Buyers creates a Request for proposal (RFP)";
                         strContent = "Here the buyer sets up their Request for Proposal (RFP). They specify everything from category/brand, delivery date and address to the details of the contract such as the time period and terms and conditions. They can choose the suppliers their RFP will be sent to and finally activate the RFP. Here, the dashboard allows the buyer to keep up to date with and manage everything in their account – viewing live, draft, and closed RFP’s, while also getting reports and analytics on their RFP activity both past and present.";
                         break;
                     case 2:
                         strHeader = "Suppliers respond to the RFP";
                         strContent = "Here, the suppliers respond to the RFP that they have been invited to. They can view the RFP that has been created by the buyer along with all its details including information about the product, its end date and how many other suppliers have been invited. They can then accept or reject it depending on whether they are able to meet the requirements set.";
                         break;
                     case 3:
                         strHeader = "Buyer views the responses to the RFP";
                         strContent = "After the suppliers quote on the buyer’s RFP, the buyer can then view the quotes they have received. They can see all the suppliers and their respective quotes.  He can compare the quotes from the various suppliers.  He can then move on to inviting all or some of them to participate in a negotiation.";
                         break;
                     case 4:
                         strHeader = "Supplier receives Negotiation notification";
                         strContent = "Here, the suppliers receive an email intimation to participate in the negotiation. This informs them of the time, duration and other details of the negotiation that they will be participating in.";
                         break;
                     case 5:
                         strHeader = "Buyer holds online Negotiation";
                         strContent = "The Buyer holds the negotiation for their RFP. Here, the buyer can see the different suppliers they have invited to participate and in real-time keep up to date with their quotes as they fluctuate. They are also able to contact each of the suppliers and respond to any enquiries they may have from the dashboard.";
                         break;
                     case 6:
                         strHeader = "Suppliers quote during the Negotiation";
                         strContent = "Here, the different suppliers that have been invited to participate in the negotiation make their quotes. They quote the price that they are willing to provide the requested goods/services for and can reduce their cost basis the lowest quote from another supplier. They are able to see all relevant information such as when the negotiation started, how much time is left and whether or not they have successfully placed a quote and the lowest quote.";
                         break;
                     case 7:
                         strHeader = "Buyer places the PO on the lowest quote";
                         strContent = "Once the negotiation is over, the buyer then selects the lowest quote offered (or any other quote) and places the Purchase Order with this supplier. The purchase order will have all the details prepopulated such as the supplier name, product, quantity, amount before tax, etc.";
                         break;
                     case 8:
                         strHeader = "Supplier receives the PO";
                         strContent = "The Supplier then receives the PO from the buyer. From here they are able to review every detail of the PO including its date, company name, delivery address, method of payment, the quantity and price of products/services selected and the delivery address.  Basis the Purchase Order the seller makes the delivery.";
                         break;
                     case 9:
                         strHeader = "Buyer receives delivery of goods and initiates payment";
                         strContent = "Finally, the buyer receives the delivery of the goods/services in the agreed upon time and subsequently initiates the payment on the platform towards the seller.";
                         break;
                 }

                 var str = "<h2><span>0" + mode + "</span>" + strHeader + "</h2>"
                     + "<p>" + strContent + "</p><br class='clr' />";
                 $("#divPopMsg").html(str);
                 $("#divPopMsg").show();
             }
    </script>
    <div class="indx-hdr">
        <%--<div class="indx-banr">
                    <img src="images/banner.jpg" />
                </div>--%>
        <!-- home carousel start here -->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="images/Gift card banner.jpg" alt="..." />
                </div>
                <div class="item">
                    <img src="images/Banner 1.jpg" alt="..." />
                </div>
                <div class="item">
                    <img src="images/Banner 2.jpg" alt="..." />
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="fa fa-angle-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="fa fa-angle-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- home carousel end here -->

        <div class="lgo-sgn">
            <div class="infilogo">
                <img src="images/ERFP_Logo.png" />
            </div>
            <div class="sgnup">
                <a href="#" onclick="javascript: login_click(); return false;">
                    <img src="images/ico-signin.png" /><span>Sign in</span></a>
            </div>
        </div>
    </div>
    <div class="pgHmHdr ind-wrapper">
        <div id="sticky-anchor"></div>
        <div id="sticky">
            <div id="myScrollspy">
                <ul class="nav nav-pills nav-stacked" id="ulNav" runat="server">
                    <li class="nav-infologo"><a href="#indexup">
                        <img src="images/nav_infilogo.png" /></a></li>
                    <li class=""><a href="#hRow1">What is Renepay?</a></li>
                    <li><a href="#hRow2">Renepay for Buyers</a></li>
                    <li><a href="#hRow3">Renepay for Suppliers</a></li>
                    <li><a href="#hRow4">How it works?</a></li>                    
                </ul>
            </div>
        </div>

        <div class="bs-signup">
            <div class="byr">
                <ul class="homeSign">
                    <li>
                        <a href="#" id="lnkRegBuyerImg" runat="server"
                            onclick="javascript:signupsel_click('RB');"
                            onserverclick="lnkRegBuyer_ServerClick">
                            <img id="imgRegBuyer" runat="server" src="~/images/ico-buyer.png"
                                width="133" height="133" alt="" /></a></li>
                    <li class="buySign">Buyer - <a href="#" id="lnkRegBuyer" runat="server"
                            onclick="javascript:signupsel_click('RB');"
                            onserverclick="lnkRegBuyer_ServerClick">Sign up</a></li>
                    <li>Make your procurement management easy,
                            <br>
                        efficient, cost-effective and transparent. </li>
                </ul>
            </div>
            <div class="arr-byrslr"></div>
            <div class="slr">
                <ul class="homeSign">
                    <li>
                        <a href="#" id="lnkRegSupplierImg" runat="server"
                            onclick="javascript:signupsel_click('RS');"
                            onserverclick="lnkRegSupplier_ServerClick">
                            <img id="imgRegSupplier" runat="server" src="~/images/ico-seller.png"
                                width="133" height="133" alt="" /></a></li>
                    <li class="buySign">Seller - <a href="#" id="lnkRegSupplier" runat="server"
                            onclick="javascript:signupsel_click('RS');"
                            onserverclick="lnkRegSupplier_ServerClick">Sign up</a></li>
                    <li>Get access to a large, qualified database of
                            <br>
                        customers who have huge potential for business. </li>
                </ul>
            </div>
            <div class="clr"></div>
        </div>


        <div class="clr"></div>
    </div>
    <div class="bg-gry" id="hRow1">
        <div class="ind-wrapper">
            <div class="indlnkspc">&nbsp;</div>
            <div class="wabt-act">
                <h1>What is Renepay? </h1>
                <%--<p>Renepay is a cloud-based e-commerce platform that facilitates contracts between buyers and suppliers.The online, auction-based service ensures for transparent and time and cost-efficient winning of business-to-business deals.</p>--%>
                    <p>Renepay is a cloud-based e-commerce platform that facilitates transactions between buyers and suppliers. The online, procurement service ensures transparent, and time and cost-efficient business-to-business deals.</p>
                <div class="video">
                    <%--<img alt="" src="images/youtube-video.jpg">--%>
                    <iframe width="854" height="479" src="//www.youtube.com/embed/YiTDVQhtSV8?rel=0" frameborder="0" allowfullscreen></iframe>
                    <%--https://youtu.be/YiTDVQhtSV8--%>
                     <%--<iframe width="854" height="479" src="//www.youtube.com/watch?v=YiTDVQhtSV8&feature=youtu.be" frameborder="0" allowfullscreen></iframe>--%>
                </div>
            </div>
            <div class="clr"></div>
        </div>
    </div>
        
    <div id="hRow2" class="bg-wht">
        <div class="ind-wrapper">
            <div class="indlnkspc">&nbsp;</div>
            <div class="mulur-svgs">
                <div class="pg-ind">
                    <h1>Renepay for Buyers</h1>
                    <p class="video">As a buyer, you save on time and money to benefit from higher productivity and efficiency.</p>
                    <div class="y-auct">
                        <ul class="circles">
                        <li>
                            <div>
                                <h2>300</h2>
                                engaged Suppliers
                            </div>
                        </li>
                        <li>
                            <div>
                                <h2>17</h2>
                                product categories
                            </div>
                        </li>
                       
                        <div class="clr"></div>
                    </ul>
                    <br />
                    <ul class="home-txt">
                        <li>
                            <h2>Reasons why Renepay is beneficial for you</h2>
                            <b>Reduced Cost</b>
                            <%--<p>By allowing multiple suppliers to offer you their lowest possible price, you are able to view all the competition in one place and select that which is most cost-efficient and relevant to what you need. Not to mention avoiding duplicate spending, having it all in one place ensures you buy exactly what fits your needs.</p>--%>
                            <p>By consolidating your spend on one platform, Renepay allows you to significantly reduce costs. With multiple suppliers offering their lowest possible price, Renepay offers you the ability to select the most relevant and cost-efficient option for you. Additionally, using the insights we have on typical business purchasing needs, we proactively secure the best deals on your key requirements – we know what you need, even before you do!</p>
                            <b>Increased Productivity</b>
                            <%--<p>Having all your options in one place means that there is no need to search for multiple options, complete your order and transactions from beginning to end in one platform, along with re-usable templates and having all your records stored electronically means optimum productivity.</p>--%>
                            <p>Having suppliers quote based on your requirements, means that there is no need to spend time researching products and suppliers. You can review quotes, select your supplier, generate the order and complete your transaction from beginning to end in one platform. With everything done online, from any location, Renepay takes the hassle out of procurement, and  allows you to focus on your core job.</p>
                            <%--<b>Increased Transaction Speed</b>--%>
                            <b>Increased Transparency and Compliance</b>
                            <%--<p>Being a cloud-based e-procurement platform, Renepay allows you to process transactions in no time. With everything done online from any location, this incredibly time and cost-efficient process allows you to focus on more important tasks while keeping transactions organised like never before.</p>--%>
                            <p>By taking your purchases offline to online, Renepay brings transparency to every element of the process whether it’s the pricing agreed, choice of suppliers or the payment itself. The platform eliminates paper based processes and minimizes need for human intervention. All your order history is captured electronically so you can track spending and ensure compliance.</p>
                        </li>
                    </ul>
                    <%--<div class="homeprodList">
                            <h2>Checkout our pre-negotiated deals</h2>
                        	<img src="images/head-phone.jpg">
                            <div class="homeprodDetail">
                            	<h3>25 Headsets<span>@ Rs 1000 each</span></h3>
                                <p>Brand: <em>HP</em> | Original Price: <em>Rs 1600</em></p>
                                <a href="#" class="btnLearn">Learn More</a>
                            </div>
                            <br class="cl">
                        </div>
                        <div class="homeprodList imbrd0">
                        	<img src="images/laptop.jpg">
                            <div class="homeprodDetail">
                            	<h3>50 Laptops<span>@ Rs 30,000 each</span></h3>
                                <p>Brand: <em>HP</em> | Original Price: <em>Rs 45000</em></p>
                                <a href="#" class="btnLearn">Learn More</a>
                            </div>
                            <br class="cl">
                        </div>--%>
                        <div id="PreNegoDealID" runat="server">
                    </div>
                    </div>
                </div>
            </div>
            <div class="clr"></div>
        </div>
    </div>
    <div class="bg-gry" id="hRow3">
        <div class="ind-wrapper">
            <div class="indlnkspc">&nbsp;</div>
            <div class="y-auct">
                <h1>Renepay for Suppliers</h1>
                <p class="video">As a seller, you ensure your products get access to a much wider marketplace.</p>

                <div class="y-auct">
                        <ul class="circles">
                        <li>
                            <div>
                                <h2>900+</h2>
                                REGISTERED BUYERS
                            </div>
                        </li>
                        <li>
                            <div>
                                <h2>200+</h2>
                                RFPs per month
                            </div>
                        </li>
                        <div class="clr"></div>
                    </ul>
                    <br />
                        <ul class="home-txt">
                        <li>
                            <h2>Reasons why Renepay is beneficial for you</h2>
                            <b>Ease of Marketing</b>
                            <p>No need to spend time or money on cold calls or advertising, simply list what you provide and the potential customers will come to you. </p>
                            <b>Increased Transaction Speed</b>
                            <p>Being a cloud-based e-procurement platform, Renepay allows you to process transactions in no time. With everything done online from any location, this incredibly time and cost-efficient process allows you to focus on more important tasks while keeping transactions organised like never before.</p>
                            <b>Exposure to Top Buyers</b>
                            <p>By registering on Renepay, your business automatically gains exposure to the top buyers in your area of expertise, ensuring that whenever they require your product or services, your name is always provided.</p>
                        </li>
                    </ul>
                        <%--<div class="homeprodList imbrd0">
                            <h2>Get Your Ratings</h2>
                        	<img src="images/laptop-clipart.png">
                            <div class="homeprodDetail">
                            	<h3><span>Using our system of supplier ratings, you can get the attention of top Buyers. By having an updated profile, your exposure greatly increases and you will get more attention, increasing your chances of winning more contracts.</span></h3>
                                
                            </div>
                            <br class="cl">
                        </div>--%>
                    </div>

            </div>
            <div class="clr"></div>
        </div>
    </div>
    <div id="hRow4" class="bg-wht">
        <div class="ind-wrapper">
            <div class="indlnkspc">&nbsp;</div>
            <div class="hwitwks">
                <h1>How it works</h1>
                <div class="grp-bg">
                    <a href="#" onclick="javascript:lnkPop_click(1); return false;">
                        <div class="crcl1">
                            <span>1</span>
                            Buyer<br />
                            creates a
                                <br />
                            RFP
                        </div>
                    </a>
                    <a href="#" onclick="javascript:lnkPop_click(2); return false;">
                        <div class="crcl2">
                            <span>2</span>
                            Suppliers<br />
                            respond<br />
                            to the RFP
                        </div>
                    </a>
                    <a href="#" onclick="javascript:lnkPop_click(3); return false;">
                        <div class="crcl3">
                            <span>3</span>
                            Buyer views<br />
                            the response<br />
                            to his RFP
                        </div>
                    </a>
                    <a href="#" onclick="javascript:lnkPop_click(4); return false;">
                        <div class="crcl4">
                            <span>4</span>
                            Supplier receives
                                <br />
                            Negotiation
                                <br />
                            notification
                        </div>
                    </a>
                    <a href="#" onclick="javascript:lnkPop_click(5); return false;">
                        <div class="crcl5">
                            <span>5</span>
                            Buyer
                            <br />
                            holds online<br />
                            Negotiation
                        </div>
                    </a>
                    <a href="#" onclick="javascript:lnkPop_click(6); return false;">
                        <div class="crcl6">
                            <span>6</span>
                            Suppliers<br />
                            quote during<br />
                            the Negotiation
                        </div>
                    </a>
                    <a href="#" onclick="javascript:lnkPop_click(7); return false;">
                        <div class="crcl7">
                            <span>7</span>
                            Buyer places<br />
                            the PO on the
                                <br />
                            lowest quote
                        </div>
                    </a>
                    <a href="#" onclick="javascript:lnkPop_click(8); return false;">
                        <div class="crcl8">
                            <span>8</span>
                            Supplier<br />
                            receives the<br />
                            PO
                        </div>
                    </a>
                    <a href="#" onclick="javascript:lnkPop_click(9); return false;">
                        <div class="crcl9">
                            <span>9</span>
                            Buyer receives<br />
                            delivery of good<br />
                            and initiates payment 
                        </div>
                    </a>
                </div>
            </div>
            <div class="clr"></div>
            <div class="PopMsg" id="divPopMsg" style="display: none;">
            </div>
        </div>
    </div>
    <asp:Literal ID="xlitTestimonials" runat="server"> </asp:Literal>
    <div class="modal fade" id="divTestimonialMore" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <%--<h4 class="modal-title" id="H1">Please wait...</h4>--%>
                </div>
                <div class="modal-body">
                    <div id='divVendorDet'>
                        <div id='divMsgBox' class='msgMore'>
                            <div class='viewProfile vidPop'>
                                <div id="divProfileDet">
                                </div>
                                <div class='clear'>
                                </div>
                                <div class='col-profileData'>
                                    <div class="moreInf">
                                        <div id="divFullInfo"></div>
                                        <div class='clear'>
                                        </div>
                                    </div>                                    
                                </div>
                            </div>
                        </div>
                    </div>                   
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        function sticky_relocate() {
            var window_top = $(window).scrollTop();
            var div_top = $('#sticky-anchor').offset().top;
            if (window_top > div_top) {
                $('#sticky').addClass('stick');
            } else {
                $('#sticky').removeClass('stick');
            }
        }

        $(function () {
            $(window).scroll(sticky_relocate);
            sticky_relocate();
        });

        function ShowTestimonialMore(id) {
            $("#divProfileDet").html($("#divProfileDet" + id).html());
            $("#divFullInfo").html($("#hdnTestimonial" + id).val());
            ShowModalBox($("#divTestimonialMore"));
        }

        //$('#scroll-area').niceScroll({
        //    autohidemode: 'false',     // Do not hide scrollbar when mouse out
        //    cursorborderradius: '0px', // Scroll cursor radius
        //    background: '#E5E9E7',     // The scrollbar rail color
        //    cursorwidth: '10px',       // Scroll cursor width
        //    cursorcolor: '#999999'     // Scroll cursor color
        //});
    </script>    
   <script type='text/javascript'>

       $(document).ready(function () {

           $('.carousel[data-type="multi"] .item').each(function () {
               var next = $(this).next();
               if (!next.length) {
                   next = $(this).siblings(':first');
               }
               next.children(':first-child').clone().appendTo($(this));

               for (var i = 0; i < 1; i++) {
                   next = next.next();
                   if (!next.length) {
                       next = $(this).siblings(':first');
                   }

                   next.children(':first-child').clone().appendTo($(this));
               }
           });

       });

        </script>
        <div class="modal fade" id="divProgressBox" role="dialog">
            <div class="modal-dialog modal-sm">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="H2">Please wait...</h4>
                    </div>
                    <div class="modal-body">
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped active" role="progressbar"
                                aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function sticky_relocate() {
                var window_top = $(window).scrollTop();
                var div_top = $('#sticky-anchor').offset().top;
                if (window_top > div_top) {
                    $('#sticky').addClass('stick');
                } else {
                    $('#sticky').removeClass('stick');
                }
            }

            $(function () {
                $(window).scroll(sticky_relocate);
                sticky_relocate();
            });
        </script>
    </form>
</body>
</html>


<script>
    /*footer nav script*/
    $(document).ready(function () {
        $('#fnav').slicknav({
            prependTo: '#FootNav',
            label: 'FOOTER MENU'
        });
    });
    </script>



<script>
    /*footer nav script*/
    $(document).ready(function () {
        $('#fnav').slicknav({
            prependTo: '#FootNav',
            label: 'FOOTER MENU'
        });
    });
    </script>
