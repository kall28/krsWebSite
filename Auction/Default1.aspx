<%@ page language="C#" autoeventwireup="true" inherits="New_Default1, App_Web_default1.aspx.cdcab7d2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>InfiAuction</title>
    <link rel="icon" type="image/png" href="<%=ResolveUrl("~/images/favicon.ico")%>" />
    <!-- main CSS -->
    <link href="<%=ResolveUrl("~/Styles/style.css")%>" rel="stylesheet" />

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
        body
        {
            background-color: #fff;
        }

        .carousel-control .fa.fa-angle-left, .carousel-control .fa.fa-angle-right
        {
            font-size: 65px;
            position: absolute;
            top: 45%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="xScrMgrMaster" runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/jquery-ui-1.11.2.custom/external/jquery/jquery.js" />
                <asp:ScriptReference Path="~/Scripts/jquery-ui-1.11.2.custom/jquery-ui.min.js" />
                <asp:ScriptReference Path="~/Scripts/bootstrap.min.js" />
                <%--<asp:ScriptReference Path="~/Scripts/sb-admin-2.js" />--%>
                <asp:ScriptReference Path="~/Scripts/common-2.0.js" />
            </Scripts>
        </asp:ScriptManager>
        <asp:UpdatePanel ID="xupnlMain" runat="server" UpdateMode="Conditional">
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
                                ShowToolTip("#xtxtUserName", "Please enter User Name.");
                                return false;
                            }

                            ctrl = $("#xtxtPassword");
                            if (ctrl.val() == "") {
                                ShowToolTip("#xtxtPassword", "Please enter password.");
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
                                ShowToolTip("#txtFUEMail", "Please enter email.");
                                return false;
                            }

                            ctrl = $("#txtFUMobileNo");
                            if (ctrl.val() == "") {
                                ShowToolTip("#txtFUMobileNo", "Please enter mobile no.");
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
                            var ctrl = $("#txtFPUserName");
                            if (ctrl.val() == "") {
                                ShowToolTip("#txtFPUserName", "Please enter user name.");
                                return false;
                            }

                            ctrl = $("#txtFPMobileNo");
                            if (ctrl.val() == "") {
                                ShowToolTip("#txtFPMobileNo", "Please enter mobile no.");
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
                                <h4 class="modal-title h3">Sign In</h4>
                            </div>
                            <div class="modal-body">
                                <div id="divLoginPanel" class="loginDetail">
                                    <div class="userid">
                                        <i class="fa fa-user fa-fw"></i>
                                        <input id="xtxtUserName" type="text" runat="server" placeholder="Enter your username" 
                                            autocomplete="off" onkeydown="if (event.keyCode == 13){return false;}" />
                                    </div>
                                    <a href="#" onclick="javascript: fUName_click(); return false;" class="forgot">Forgot Username?</a>
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
                                        onclick="javascript: return validateLogin();">Login</a>
                                </div>
                                <div id="divSignupPanel" class="signupInfo">
                                    <p class="h3">New to <em>Infiauction?</em></p>
                                    <p>Click here to sign up</p>
                                    <a class="btnRed" href="#" onclick="javascript:signup_click();return false;">Signup</a>
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
                                <h4 class="modal-title h3">Sign In</h4>
                            </div>
                            <div class="modal-body">
                                <div id="div4" class="signupInfo">
                                    <a class="btnRed" href="#" id="lnkRegBuyer" runat="server"
                                        onclick="javascript:signupsel_click('RB');"
                                        onserverclick="lnkRegBuyer_ServerClick">Register as a Buyer</a>
                                </div>
                                <div id="div1" class="signupInfo">
                                    <a class="btnRed" href="#" id="lnkRegSupplier" runat="server" 
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
                                <p>Enter your registered email address and mobile number to receive your User Name</p>
                                <br>
                                <div class="forgotUser">
                                    <div class="userid">
                                        <i class="fa fa-mail fa-fw"></i>
                                        <input type="text" id="txtFUEMail" runat="server" placeholder="Email Address"
                                            onkeydown="if (event.keyCode == 13){return false;}" />
                                    </div>
                                    <div class="userpswd">
                                        <i class="fa fa-mobile fa-fw"></i>
                                        <input type="text" id="txtFUMobileNo" runat="server" placeholder="Mobile Number"
                                            onkeydown="if (event.keyCode == 13){return false;}" />
                                    </div>
                                    <br class="cl">
                                    <br>
                                    <a class="btnRed" href="#" id="lnkFUSubmit" runat="server" onserverclick="xbtnFUSubmit_click"
                                        onclick="javascript:if(!validateFUName()){ return false;}">Submit</a>
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
                                <p>Enter your User Name and registered mobile number to receive your password</p>
                                <br>
                                <div class="forgotUser">
                                    <div class="userid">
                                        <i class="fa fa-user fa-fw"></i>
                                        <input type="text" id="txtFPUserName" runat="server" placeholder="User Name"
                                            onkeydown="if (event.keyCode == 13){return false;}" />
                                    </div>
                                    <div class="userpswd">
                                        <i class="fa fa-mobile fa-fw"></i>
                                        <input type="text" id="txtFPMobileNo" runat="server" placeholder="Mobile Number" 
                                            onkeydown="if (event.keyCode == 13){return false;}"/>
                                    </div>
                                    <br class="cl">
                                    <br>
                                    <a class="btnRed" href="#" id="lnkFPSubmit" runat="server" onserverclick="xbtnFPSubmit_click"
                                        onclick="javascript:if(!validateFPwd()){ return false;}">Submit</a>
                                </div>
                                <br class="cl">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="divMsgBox" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title" id="msgHeader"></h4>
                            </div>
                            <div class="modal-body">
                                <p id="msgBody"></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div id="indexup">
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
                            <img src="images/banner.jpg" alt="...">
                        </div>
                        <div class="item">
                            <img src="images/banner.jpg" alt="...">
                        </div>
                        <div class="item">
                            <img src="images/banner.jpg" alt="...">
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
                        <ul class="nav nav-pills nav-stacked">
                            <li class="nav-infologo"><a href="#indexup">
                                <img src="images/nav_infilogo.png" /></a></li>
                            <li class=""><a href="#hRow1">What is Infiauction?</a></li>
                            <li><a href="#hRow2">How it works?</a></li>
                            <li><a href="#hRow3">Why Infiauction?</a></li>
                            <li><a href="#hRow4">FAQs</a></li>
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
                            <li class="buySign">Buyer - <a href="#">Sign up</a></li>
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
                            <li class="buySign">Seller - <a href="#">Sign up</a></li>
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
                        <h1>What is Infiauction? </h1>
                        <p>InfiAuction is an e-procurement  platform that facilitates handshakes between buyers and suppliers. This  business-to-business services makes purchase and sale of supplies on the Internet fast, easy and transparent.</p>
                        <div class="video">
                            <img alt="" src="images/youtube-video.jpg">
                        </div>
                    </div>
                    <div class="clr"></div>
                </div>
            </div>

            <div id="hRow2" class="bg-wht">
                <div class="ind-wrapper">
                    <div class="indlnkspc">&nbsp;</div>
                    <div class="hwitwks">
                        <h1>How it works</h1>
                        <div class="grp-bg">
                            <div class="crcl1">
                                <span>1</span>
                                Buyer<br />
                                creates a
                                <br />
                                RFP
                            </div>
                            <div class="crcl2">
                                <span>2</span>
                                Suppliers<br />
                                respond<br />
                                to the RFP
                            </div>
                            <div class="crcl3">
                                <span>3</span>
                                Buyer views<br />
                                the response<br />
                                to his RFP
                            </div>
                            <div class="crcl4">
                                <span>4</span>
                                Supplier gets
                                <br />
                                Purchase Order
                                <br />
                                (PO) or auction notification
                            </div>
                            <div class="crcl5">
                                <span>5</span>
                                Buyer<br />
                                holds online<br />
                                auction
                            </div>
                            <div class="crcl6">
                                <span>6</span>
                                Suppliers<br />
                                bid during<br />
                                the auction
                            </div>
                            <div class="crcl7">
                                <span>7</span>
                                Buyer places<br />
                                the PO on the
                                <br />
                                lowest RFP/bid
                            </div>
                            <div class="crcl8">
                                <span>8</span>
                                Supplier<br />
                                receives the<br />
                                PO online
                            </div>
                            <div class="crcl9">
                                <span>9</span>
                                Buyer receives<br />
                                delivery of<br />
                                good/initiates payment 
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
                        <h1>Why Infiauction?</h1>
                        <div>
                            <ul class="circles">
                                <li>
                                    <div>
                                        <h2>400</h2>
                                        Verified Suppliers
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h2>400</h2>
                                        registered buyers
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h2>400</h2>
                                        product categories
                                    </div>
                                </li>
                                <li>
                                    <div>Multiple product sub-categories</div>
                                </li>
                                <div class="clr"></div>
                            </ul>
                            <ul class="yauct-txt">
                                <li>Reduced Cost
       
                            <p>E-procurement saves you money by preventing duplicate spending, leveraging volume buying, and saving you costs associated with paper-based systems.</p>
                                </li>
                                <li>Transparent Spending
       
                            <p>Electronically conducting your procurement makes it easier to write and analyze reports on your procurement systems, ensuring your procedures.</p>
                                </li>
                                <li>Increased Productivity
       
                            <p>Having your records stored electronically makes it easier to submit reusable tenders. Meanwhile, use of templates means paperwork can be filled out more quickly.</p>
                                </li>
                                <li>Increased Transaction Speed
       
                            <p>E-procurement is both time-saving and efficient.  The e-procurement process eliminates unnecessary activities, allowing you to focus on more valuable tasks.</p>
                                </li>
                            </ul>

                        </div>

                    </div>
                    <div class="clr"></div>
                </div>
            </div>
            <div id="hRow4" class="bg-wht">
                <div class="ind-wrapper">
                    <div class="indlnkspc">&nbsp;</div>
                    <div class="mulur-svgs">
                        <div class="col-sm-9 pg-ind">
                            <h1>Multiply Your Savings </h1>
                            <p class="video">Check Out Our Pre-negotiated Deals</p>
                            <div class="">
                                <div class="col1">
                                    <p class="head">25 Headsets</p>
                                    <span>@ Rs. 1,000 each </span>
                                </div>
                                <div class="col2">
                                    <p class="head">50 Laptop</p>
                                    <span>@ Rs. 30,000 each </span>
                                </div>
                                <div class="clearfix"></div>
                                <div class="btHdr1">
                                    <button class="btn">Learn More</button>
                                </div>
                            </div>
                            <div class=" ">
                                <p>Benifits for buyers and suppliers</p>
                                <div class="col1">
                                    <p class="head">Buyers</p>
                                    <h3>Check  Your Savings</h3>
                                    <div class="txt-gry">Calculate how much you've saved this quarter by using InfiAuction's e-procurement platform</div>
                                    <div class="btHdr2">
                                        <button class="btn">Learn More</button>
                                    </div>
                                </div>
                                <div class="col2">
                                    <p class="head">Suppliers</p>
                                    <h3><strong>Get Noticed by Top Buyers</strong> </h3>
                                    <div class="txt-gry">Catch the attention of regular buyers by completing your profile and improving your ratings. </div>
                                    <div class="img">
                                        <img width="216" height="229" alt="" src="images/calc.gif">
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="clr"></div>
                </div>
            </div>
            <%--<footer class="modal-footer ftHdr">
                <div id="myNavbar" class="collapse navbar-collapse footer">
                    <ul>
                        <li>About Us
   
                        <ul>
                            <li><a href="">Infinia Profile</a></li>
                        </ul>
                        </li>
                        <li>Help
   
                        <ul>
                            <li><a href="#">FAQs</a></li>
                            <li><a href="#">Toll free numbers</a></li>
                            <li><a href="#">Live chat</a></li>
                        </ul>
                        </li>
                        <li>Policies
   
                        <ul>
                            <li><a href="#">T&amp;C </a></li>
                            <li><a href="#">Privacy policy</a></li>
                            <li><a href="#">Disclaimer</a></li>
                        </ul>
                        </li>
                        <li class="cnecttus">Connect with us
   
                        <ul>
                            <li>+44000888<br>
                                help@bidder.com
                            </li>
                            <li class="social"><a href="#">
                                <img src="images/ico-fb.png" /></a><a href=""><img src="images/ico-in.png" /></a></li>
                        </ul>
                        </li>
                        <li>
                            <img src="images/ERFP_Logo.png" /></li>

                        <div class="clr"></div>
                    </ul>
                </div>
                <p>Copyright 2015. All rights reserved.</p>
            </footer>--%>
        </div>
        <div class="modal fade" id="divProgressBox" role="dialog">
            <div class="modal-dialog modal-sm">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="H1">Please wait...</h4>
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
