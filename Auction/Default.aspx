<%@ page title="" language="C#" masterpagefile="~/SiteMasterMain.master" autoeventwireup="true" inherits="New_Default, App_Web_default.aspx.cdcab7d2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
                .OurclientBlk {
    overflow: hidden;
    width: 90%;
    margin: 20px auto 0 auto;
    text-align: center;
    padding-bottom: 25px;
}
        
.sponsor-logo {
   margin-bottom: 1.5%;
}
    .sponsor-logo h2 {
        font-size: 32px;
        color: #000; 
        text-align: center;
        margin-bottom:15px;
    }

    .sponsor-logo  .slide img {
    border: 1px solid #ddd;
}

    .sponsor-logo ul {
        margin: 0;
        padding: 0;
        position: relative;
        margin-bottom: 60px;
    }

        .sponsor-logo ul li {
            list-style: outside none none;
            margin: 0;
            padding: 0;
            position: relative;
            display: inline-block;
            cursor: pointer;
        }
        .scroll-area
        {
            min-height: 140px;
        /*width: 200px;
            height:200px;
        max-height: 200px;
        min-height:200px;
        overflow-x:auto;*/
    }

.t-monials .col-md-6 {
    width: 100%;
}
.t-monials .col-md-offset-3{ margin-left:0px;}
            .carousel-control 			 { width:  4%; }
.carousel-control.left,.carousel-control.right {margin-left:15px;background-image:none;}
@media (max-width: 767px) {
	.carousel-inner .active.left { left: -100%; }
	.carousel-inner .next        { left:  100%; }
	.carousel-inner .prev		 { left: -100%; }
	.active > div { display:none; }
	.active > div:first-child { display:block; }

}
@media (min-width: 767px) and (max-width: 992px ) {
	.carousel-inner .active.left { left: -50%; }
	.carousel-inner .next        { left:  50%; }
	.carousel-inner .prev		 { left: -50%; }
	.active > div { display:none; }
	.active > div:first-child { display:block; }
	.active > div:first-child + div { display:block; }
}
@media (min-width: 992px ) {
	.carousel-inner .active.left { left: -33.33%; }
    .carousel-inner .active.right { left: 33.33%; }
	.carousel-inner .next        { left:  33.33%; }
	.carousel-inner .prev		 { left: -33.33%; }	
            .carousel-control.left,.carousel-control.right {background-image:none;}
}





  </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <%--<script src="Scripts/jquery.nicescroll.min.js"></script>--%>
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
                <%--<li data-target="#carousel-example-generic" data-slide-to="2"></li>--%>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <%--<div class="item active">
                    <img src="images/Banner1a.jpg" alt="..." />
                </div>
                <div class="item">
                    <img src="images/Gift card banner.jpg" alt="..." />
                </div>--%>
                <div class="item active">
                    <img src="images/Banner 1.jpg" alt="..." />
                </div>
                <div class="item">
                    <img src="images/Banner 2.jpg" alt="..." />
                </div>
               <%-- <div class="item">
                    <img src="images/Banner 1.jpg" alt="..." />
                </div>--%>
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
                    <li><a href="#hRow2">Renepay for Corporates</a></li>
                    <li><a href="#hRow3">Renepay for Sellers</a></li>
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
    <!--sponser logo start here--> <%--New Div Added dt 01/12/2016 --%>
        <%--<div class="sponsor-logo">
            <h2>Our Clients</h2>
            <ul class="slider6">
                <li class="slide"><img src="images/logo-knowlarity.jpg" /></li>
                <li class="slide">
                    <img src="images/logo-nitco.jpg" /></li>
                <li class="slide">
                    <img src="images/logo-oxygen.jpg" /></li>
                <li class="slide">
                    <img src="images/logo-sumitomo.jpg" /></li>
                <li class="slide">
                    <img src="images/logo-tajsats.jpg" /></li>
                <li class="slide">
                    <img src="images/logo-voltas.jpg" /></li>
                <li class="slide">
                    <img src="images/logo-weiss.jpg" /></li>

            </ul>
        </div>--%>
        <!--sponser logo end here-->
    <div class="bg-gry" id="hRow1">
        <div class="ind-wrapper">
            <div class="indlnkspc">&nbsp;</div>
            <div class="wabt-act">
                <h1>What is Renepay? </h1>
                <%--<p>Renepay is a cloud-based e-commerce platform that facilitates contracts between buyers and suppliers.The online, auction-based service ensures for transparent and time and cost-efficient winning of business-to-business deals.</p>--%>
                <%--<p>Renepay is a cloud-based e-commerce platform that facilitates transactions between buyers and suppliers. The online, procurement service ensures transparent, and time and cost-efficient business-to-business deals.</p>--%>
                <p>Renepay is a cloud-based procurement platform that facilitates transactions between corporates and suppliers. Corporates can request for quotes, negotiate prices, issue purchase orders and make payments online, improving both efficiency and transparency across their procurement processes.</p>
                <div class="video">
                    <%--<img alt="" src="images/youtube-video.jpg">--%>
                    <iframe width="854" height="479" src="https://www.youtube.com/embed/z-wFKAMn0vg" frameborder="0" allowfullscreen></iframe>
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
                    <h1>Renepay for Corporates</h1>
                    <%--<p class="video">As a buyer, you save on time and money to benefit from higher productivity and efficiency.</p>--%>
                    <p class="video">Renepay helps corporates move their purchasing processes offline to online - they can request for quotes, negotiate prices, issue purchase orders and make payments online. And the best part is that our dedicated relationship managers are there support you at every step.</p>
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
                            <%--<b>Reduced Cost</b>--%>
                            <b>Higher Productivity</b>
                            <p>Eliminate paper-based processes and the time consuming back and forth with sellers.</p>
                            <%--<p>By allowing multiple suppliers to offer you their lowest possible price, you are able to view all the competition in one place and select that which is most cost-efficient and relevant to what you need. Not to mention avoiding duplicate spending, having it all in one place ensures you buy exactly what fits your needs.</p>--%>
                            <%--<p>By consolidating your spend on one platform, Renepay allows you to significantly reduce costs. With multiple suppliers offering their lowest possible price, Renepay offers you the ability to select the most relevant and cost-efficient option for you. Additionally, using the insights we have on typical business purchasing needs, we proactively secure the best deals on your key requirements – we know what you need, even before you do!</p>--%>
                            <%--<b>Increased Productivity</b>--%>
                            <b>Reduced Costs</b>
                            <p>Consolidate your spending and let multiple vendors bid for your business so you get the best prices.</p>
                            <%--<p>Having all your options in one place means that there is no need to search for multiple options, complete your order and transactions from beginning to end in one platform, along with re-usable templates and having all your records stored electronically means optimum productivity.</p>--%>
                            <%--<p>Having suppliers quote based on your requirements, means that there is no need to spend time researching products and suppliers. You can review quotes, select your supplier, generate the order and complete your transaction from beginning to end in one platform. With everything done online, from any location, Renepay takes the hassle out of procurement, and  allows you to focus on your core job.</p>--%>
                            <%--<b>Increased Transaction Speed</b>--%>
                            <%--<b>Increased Transparency and Compliance</b>--%>
                            <b>Improved Transparency</b>
                            <p>Track spending across departments and keep purchase records electronically to ensure compliance of company policies.</p>
                            <%--<p>Being a cloud-based e-procurement platform, Renepay allows you to process transactions in no time. With everything done online from any location, this incredibly time and cost-efficient process allows you to focus on more important tasks while keeping transactions organised like never before.</p>--%>
                            <%--<p>By taking your purchases offline to online, Renepay brings transparency to every element of the process whether it’s the pricing agreed, choice of suppliers or the payment itself. The platform eliminates paper based processes and minimizes need for human intervention. All your order history is captured electronically so you can track spending and ensure compliance.</p>--%>
                            <b>Large marketplace of sellers</b>
                            <p>Choose our verified sellers and bring your partners onboard to get the best prices.</p>
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
                <h1>Renepay for Sellers</h1>
                <%--<p class="video">As a seller, you ensure your products get access to a much wider marketplace.</p>--%>
                <p class="video">Renepay helps sellers reach thousands of corporates and bid to win their business. Sellers can quote, negotiate and get paid online. It saves time and effort on unnecessary sales processes, and lets sellers focus on their core business.</p>
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
                            <%--<b>Ease of Marketing</b>--%>
                            <%--<p>No need to spend time or money on cold calls or advertising, simply list what you provide and the potential customers will come to you. </p>--%>
                            <%--<b>Increased Transaction Speed</b>--%>
                            <%--<p>Being a cloud-based e-procurement platform, Renepay allows you to process transactions in no time. With everything done online from any location, this incredibly time and cost-efficient process allows you to focus on more important tasks while keeping transactions organised like never before.</p>--%>
                            <%--<b>Exposure to Top Buyers</b>--%>
                            <%--<p>By registering on Renepay, your business automatically gains exposure to the top buyers in your area of expertise, ensuring that whenever they require your product or services, your name is always provided.</p>--%>
                            <b>Engaged Corporate Customers</b>
                            <p>Access a large base of verified Corporate buyers, looking to make a purchase.</p>
                            <b>Shorter sales cycle</b>
                            <p>Automation to reduce the procure to pay cycle and as a result, your overhead costs.</p>
                            <b>Higher margins</b>
                            <p>Secure higher value B2B transactions and only pay when you make a sale</p>

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
    <%--<div class="t-monials">
        <div class="col-md-6 col-md-offset-3">
            <div class="carousel slide" data-ride="carousel" data-type="multi" data-interval="3000" id="myCarousel">
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <a href="#">
                                <img src="http://placehold.it/500/e499e4/fff&amp;text=1" class="img-responsive"></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <a href="#">
                                <img src="http://placehold.it/500/e477e4/fff&amp;text=2" class="img-responsive"></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <a href="#">
                                <img src="http://placehold.it/500/eeeeee&amp;text=3" class="img-responsive"></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <a href="#">
                                <img src="http://placehold.it/500/f4f4f4&amp;text=4" class="img-responsive"></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <a href="#">
                                <img src="http://placehold.it/500/f566f5/333&amp;text=5" class="img-responsive"></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <a href="#">
                                <img src="http://placehold.it/500/f477f4/fff&amp;text=6" class="img-responsive"></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <a href="#">
                                <img src="http://placehold.it/500/eeeeee&amp;text=7" class="img-responsive"></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <a href="#">
                                <img src="http://placehold.it/500/fcfcfc/333&amp;text=8" class="img-responsive"></a>
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
            </div>
        </div>
    </div>--%>
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
     <!-- bxslider script -->
    <script src="Scripts/jquery.bxslider.min.js"></script>
    <link href="Styles/jquery.bxslider.css" rel="stylesheet" />
    <script>
        $('.slider6').bxSlider({
            slideWidth: 140,
            minSlides: 2,
            moveSlides: 1,
            maxSlides: 8,
            slideMargin: 10,
            speed: 40000,
            infiniteLoop: true,
            ticker: true,
            tickerHover: true,
            useCSS: false,
            controls: true
        });

    </script>
</asp:Content>

