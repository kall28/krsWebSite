<%@ page title="" language="C#" masterpagefile="~/SiteMasterMain.master" autoeventwireup="true" inherits="New_Innerpages_FAQs, App_Web_faqs.aspx.9ea04a4a" %>
<%@ MasterType VirtualPath="~/SiteMasterMain.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script src="../Scripts/jquery.slicknav.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $(".accordion_container h3").each(function () {
                $(this).append("<span class='plusminus'>+</span>");
                $(this)
    		.nextUntil("h3")
    	    .wrapAll("<div class='new'></div>");
            });
            $(".new").hide();
            $('.accordion_container h3').click(function () {
                if ($('.new').is(':visible')) {
                    $(".new").slideUp(300);
                    $(".plusminus").text('+');
                }
                $(this).next(".new").slideDown(300);
                $(this).children(".plusminus").text('-');
            });
        });

        function showbuyer() {

            document.getElementById("buyerli").className = "buyerli"
            document.getElementById("supplierli").className = "supplierli"

            $(".divbuyer").show();
            $(".supplier").hide();
            $(".lnkSupplier").removeClass("act"); $(".lnkbuyer").addClass("act"); $("#lnkGettingStarted").show(); $("#spnRFP").text("Creating A RFP"); $(".lnkPurchase").text("Purchase Order");
            return false;
        }

        function showsuplier() {

            document.getElementById("buyerli").className = "supplierli"
            document.getElementById("supplierli").className = "buyerli"

            $(".divbuyer").hide(); $(".lnkSupplier").addClass("act"); $(".lnkbuyer").removeClass("act"); $(".lnkPurdhase").removeClass("act");
            $(".supplier").show(); $("#lnkGettingStarted").hide(); $("#spnRFP").text("Quoting A RFP"); $("#lnkPurdhase").text("Purchase Order");

            if ($("#chkVendor input[type='radio']").is(":checked")) {
                ShowRFP();
            }
            return false;
        }

        function ShowReverseAuction() {

            $("#divReverseAuction").show();
            $("#divGettingStarted").hide();
            $("#divREP").hide();
            $("#divAuction").hide();
            $("#divPurchase").hide();

            $("#lnkReverseAuction").addClass("act");
            $("#lnkGettingStarted").removeClass("act");
            $("#lnkREP").removeClass("act");
            $("#lnkAuction").removeClass("act");
            $("#lnkPurchase").removeClass("act");
            return false;
        }

        function ShowGettingStarted() {

            $("#divReverseAuction").hide();
            $("#divGettingStarted").show();
            $("#divREP").hide();
            $("#divAuction").hide();
            $("#divPurchase").hide();

            $("#lnkReverseAuction").removeClass("act");
            $("#lnkGettingStarted").addClass("act");
            $("#lnkREP").removeClass("act");
            $("#lnkAuction").removeClass("act");
            $("#lnkPurchase").removeClass("act");
            return false;
        }

        function ShowRFP() {

            $("#divReverseAuction").hide();
            $("#divGettingStarted").hide();
            $("#divREP").show();
            $("#divAuction").hide();
            $("#divPurchase").hide();

            $("#lnkReverseAuction").removeClass("act");
            $("#lnkGettingStarted").removeClass("act");
            $("#lnkREP").addClass("act");
            $("#lnkAuction").removeClass("act");
            $("#lnkPurchase").removeClass("act");
            return false;
        }

        function ShowAuction() {

            $("#divReverseAuction").hide();
            $("#divGettingStarted").hide();
            $("#divREP").hide();
            $("#divAuction").show();
            $("#divPurchase").hide();

            $("#lnkReverseAuction").removeClass("act");
            $("#lnkGettingStarted").removeClass("act");
            $("#lnkREP").removeClass("act");
            $("#lnkAuction").addClass("act");
            $("#lnkPurchase").removeClass("act");
            return false;
        }

        function ShowPurchase() {

            $("#divReverseAuction").hide();
            $("#divGettingStarted").hide();
            $("#divREP").hide();
            $("#divAuction").hide();
            $("#divPurchase").show();

            $("#lnkReverseAuction").removeClass("act");
            $("#lnkGettingStarted").removeClass("act");
            $("#lnkREP").removeClass("act");
            $("#lnkAuction").removeClass("act");
            $("#lnkPurchase").addClass("act");
            return false;
        }

    </script>

    <div class="indx-hdr">
        <div class="indx-banr">
            <img id="imgbanner" runat="server" src="~/images/bnr2.jpg" />
            <h2>FAQ</h2>
        </div>
        <div class="lgo-sgn">
            <div class="infilogo">
                <a href="#" onclick="javascript: link_click('H'); return false;">
                    <img id="imglogo" runat="server" src="~/images/ERFP_Logo.png" />
                </a>
            </div>
            <div class="sgnup">
                <a href="#" onclick="javascript: login_click(); return false;" id="lnkLogin" runat="server">
                    <img id="imgsignin" runat="server" src="~/images/ico-signin.png" /><span>Sign in</span></a>
            </div>
        </div>

    </div>

    <div class="pgHmHdr insd-wrapper" id="divFAQs" style="background-color:#f9f9f9" runat="server">
            
            <div class="mainHead fl">FAQ</div>
            <br class="cl"/>
            

                <div class="leftMenu">
                    <ul>
                            
                            <li id="buyerli" onclick="return showbuyer();" class="buyerli" ><a id="lnkbuyer" href="#" class="lnkbuyer">Buyer</a></li>
                            <li id="supplierli" onclick="return showsuplier();" class="supplierli"><a id="lnkSupplier" class="lnkSupplier" href="#">Supplier</a></li>

                            <li id="lnkReverseAuction" style="display:none"><input type="radio" name="Subhed" checked="checked" onchange="return ShowReverseAuction();" />Renepay</li>

                            <li id="lnkGettingStarted" style="display:none"><input type="radio" id="rdbGetttingStarted" name ="Subhed" onchange="return ShowGettingStarted();" />Getting Started</li>

                            <li id="lnkREP"><input type="radio" name ="Subhed" id="rdbRFP" onchange="return ShowRFP();" />Creating A RFP</li>

                            <li id="lnkAuction"><input type="radio" name ="Subhed" onchange="return ShowAuction();" />Conducting a Negotiation</li>

                            <li id="lnkPurchase"><input type="radio" name ="Subhed" onchange="return ShowPurchase();" />Purchase Order</li>
                    </ul>
                </div>

                <div id="divReverseAuction">
                    <div class="accordion_container divbuyer" id="divbuyer">
                        <h3>
                            Q: What is Renepay ?</h3>
                        <p>
                            A: Renepay is a tool used for business to business procurement. On this platform, 
                            the role of the buyer and the seller is reversed and the sellers compete to obtain business.
                            Renepay allows suppliers to quote as often as they wish during the negotiation stage. During negotiation,
                             suppliers are aware of when the prices change; they however, do not know the names of the competitors.</p>
                        <h3>
                            Q: How will Renepay benefit me?</h3>
                        <p>
                            A: A prospective user benefits from the Renepay Platform in the following
                            ways:
                            <br />
                            <ul class="listBullet">
                            <li>Real-time Pricing</li>
                            <li>Quote competition automatically drives the prices down to the actual market rates
                                or even more competitive pricing.</li>
                            <li>No Interface required with existing systems and no additional software or hardware
                                required.</li>
                            <li>Assists in meeting business purchase financial goals.</li>
                            <li>Allows for seller compliance, when it comes to product requirements requested by
                                the buyer.</li>
                        </ul>
                        </p>
                        <h3>
                            Q: Will Renepay help in bringing my costs down?</h3>
                        <p>
                            A: Renepays are known to be more successful in bringing the prices down.
                            The dynamic competition inherent in renepays results in pricing that is
                            closer to market rates. On an average, renepays results in a 10% to 24% price
                            reduction over that of traditional procurement methods. However there is no guarantee
                            that the buyer will get a lower price. If the negotiation does not yield a price below
                            the stated quote; there is no obligation to purchase.</p>
                    </div>
                    <div class="accordion_container supplier" style="display: none" id="supplier">
                        <h3>
                            Q: What is Renepay?</h3>
                        <p>
                            A:Renepay is a tool used for business to business procurement. On this platform, 
                            the role of the buyer and the seller is reversed and the sellers compete to obtain business.
                            Renepay allows suppliers to quote as often as they wish during the negotiation stage. During negotiation,
                             suppliers are aware of when the prices change; they however, do not know the names of the competitors.</p>
                        <h3>
                            Q: How will Renepay benefit me?</h3>
                        <p>
                            A: A prospective user of the Renepay platform can benefit in the following
                            ways:
                        <ul class="listBullet">
                            <li>Access to potential customers in one spot.</li>
                            <li>Reduced sales-cycle time</li>
                            <li>Streamlined sales process online</li>
                            <li>Ratings given by the customers help you build a strong profile.</li>
                            <li>No interface required with existing systems and no additional software or hardware
                                required.</li>
                            <li>Assists in meeting your business profit goals.</li>
                        </ul>
                            </p>
                        <h3>
                            Q: Will I be forced to under quote using Renepay vs. my standard procurement
                            process?</h3>
                        <p>
                            A: Renepay enables fair competition amongst the suppliers. However, you
                            should not under quote to get the order as it will subsequently not be sustainable
                            for your business. At all times, you should look at offering the best price possible
                            to win the contract.</p>
                        <h3>
                            Q: How does one get started on Renepay? What is the registration process?</h3>
                        <p>
                            A: It&rsquo;s very easy to register on the Renepay Platform. Click on the register
                            tab on the home page and select the option &ldquo;Would you like to register as
                            a supplier?&rdquo; You will then be redirected to a page where you will need to
                            fill a simple &amp; short form where you can fill your company&rsquo;s details.
                            Once you submit the form you will receive your user id and password via an email.
                            Once you log into the Renepay Platform using the details, you will be ready
                            to set up a quote for the RFPs and participate in Negotiations, basis selection by the
                            buyer.</p>
                        <h3>
                            Q: How do I update any of the information post registration?</h3>
                        <p>
                            A: Log onto <a href="http://www.ReNePay.com">http://www.ReNePay.com</a> and go
                            to go to manage your account. You can view and edit your profile there.</p>
                        <h3>
                            Q: At a high level how does the entire Renepay process work?</h3>
                        <p>
                            A: Once you register as a supplier, there will be no immediate action required by
                            you. Your process will start the moment a buyer selects you for an RFP. As a selected
                            supplier you will be sent an email notification informing you about the RFP. You
                            can then log onto <a class="txtC" href="http://www.ReNePay.com">http://www.ReNePay.com</a>&nbsp;and
                            submit your quote. Once the buyer gets all the quotes he will invite you to an Negotiation,
                            by notifying you via an email. You will then need to log onto the platform and make
                            your quote. The Negotiation ends at a predetermined time and if you are the chosen supplier,
                            the buyer will raise a&nbsp;<a href="FAQs.aspx">Purchase
                                Order</a>&nbsp;(PO) in your name. You can then create an invoice and send it
                            to the buyer. The buyer will then make his payment to you post which you deliver
                            the goods. Right from the RFP stage to the Negotiation stage, the selection of the suppliers
                            remains the buyer&rsquo;s decision.</p>
                        <h3>
                            Q: How long does the process from making a RFP to an Negotiation take?</h3>
                        <p>
                            A: The decision for the time given to the RFP and Negotiation is dependent on the buyer.
                            The platform has the flexibility to allow a RFP to be live for as little as 5 minutes
                            and the Negotiation to be conducted for as short a time period as 15 minutes. However,
                            we always advise the buyer to give at least 2 weeks for the selected suppliers to
                            respond to the RFP and provide the responding suppliers a 3 day lead time before
                            conducting the Negotiation.</p>
                        <h3>
                            Q: What are the benefits of Renepay?</h3>
                        
                            <p><ul class="listBullet">
                                <li>Renepay is an extremely simple and easy-to-use Platform. This
                                intuitive platform enables a buyer to conduct a negotiation all by himself,
                                which makes it very easy for you, as a supplier, to respond.</li>
                        
                                <li>Renepay is also backed by a strong customer support team who is available during
                                business hours to help you with any technical issues.
                                Renepay also has a growing SME base, which is online savvy and has procurement
                                requirements.</li>
                                <li>It is a cloud-based platform which means that all you need is an internet connection.
                                You can use this platform to participate from anywhere around the world. It requires
                                no integration with your current systems and there&rsquo;s no expensive software
                                to be downloaded.</li>
                            </ul>
                            </p>
                       
                        <h3>
                            Q: Can I use the Platform independently or will Infinia Corporate Solutions have
                            to manage the process for me?</h3>
                        <p>
                            A: Yes, as a supplier you can use the platform independently. The platform is designed
                            on a self-service model.</p>
                        <h3>
                            Q: What are the minimum system requirements that I need to use the Renepay platform?</h3>
                        <p>
                            A: You don&rsquo;t need any software. All you need is an access to the internet.</p>
                        <h3>
                            Q: Can I participate in a Negotiation if I am travelling overseas?</h3>
                        <p>
                            A: You and the buyers can participate in a Negotiation irrespective of where you&rsquo;re
                            located. All you need is an internet connection. The moment a registered buyer/supplier
                            logs in, the system will recognise the country and open all the relevant details.</p>
                       
                        <h3>
                            Q: Can I use Renepay in addition to my standard sales process?</h3>
                        <p>
                            A: Absolutely! The Renepay platform acts as an additional sales channel to generate
                            revenue for you. You should use it in conjunction with your regular sales process.</p>
                    </div>
                </div>

                <div id="divGettingStarted" style="display: none">
                    <div class="accordion_container divbuyer">
                        <h3>
                            Q: How does one get started on Renepay? What is the registration process?</h3>
                        <p>
                            A: The Renepay Platform is easy to register on. Click on the register tab on
                            the home page and select the option &ldquo;Would you like to register as a customer?&rdquo;
                            You will then be taken to a page where you will need to fill out a simple &amp;
                            short form with your company&rsquo;s details. Once you submit the form you will
                            be provided with a user id and password via an email. Once you log in using the
                            given user id and password, you are ready to use the Renepay Platform.</p>
                        <h3>
                            Q: How does the entire Renepay process work?</h3>
                        <p>
                            A: Once you register as a buyer, your first step will be to create a Request for
                            Proposal (RFP) that allows you to submit the details of your requirement and enables
                            you to choose the suppliers you wish to invite. When you submit the form, the selected
                            suppliers will respond to your RFP. Once you receive the quotes, you can conduct
                            an Negotiation with all or some of the suppliers who responded to your RFP. Each supplier
                            will quote. Ensuring that only the lowest quote is visible to all suppliers allows for
                            competitive rate submission. The Negotiation ends at a time predetermined by you. Thereafter,
                            you can choose the supplier you wish to award the contract to. The last step will
                            be to raise a Purchase Order (PO) towards the selected supplier. The best part is
                            that all this can be done online at your own convenience.</p>
                        <h3>
                            Q: How long does it take from the making of a RFP to conducting the Negotiation in total?</h3>
                        <p>
A: The platform gives you the flexibility to allow a RFP or a Negotiation to be live for as little as 5 minutes.However, we recommend that you give 2 weeks to your selected suppliers to respond to your RFP and provide the ones who have responded at least a 3 day lead-time before you start the negotiation.</p>
                        <h3>
                            Q: Do I have to make any changes to my company&rsquo;s procurement policies &amp;
                            procedures to use this platform?</h3>
                        <p>
                            A: No. Procurement on Renepay does not alter your current procurement practices
                            in any way. The Renepay Platform only aims to enhance/add to your standard
                            organizational requirements.</p>
                        <h3>
                            Q: How much does this platform cost?</h3>
                        <p>
                            A: The license fee to use the platform depends on the number of users within your
                            organization and the duration of the usage. As you go through the registration process
                            online, you will see the various fee structures. However, if you are a customer
                            of any of the banks with whom we have a tie up, then the use of the platform is
                            absolutely free. In the event you decide to invite your own suppliers to participate
                            in the negotiation, registration and participation is free for them. However, if a supplier
                            at some stage wants to be a buyer also and conduct an negotiation, a standard fee will
                            apply to them.</p>
                        <h3>
                            Q: What are the benefits of Renepay?</h3>
                        <ul class="listBullet">
                            <li>A: An extremely simple and easy-to-use Platform. This intuitive platform
                                enables a buyer to conduct a negotiation all by himself.</li>
                            <li>Backed by a strong customer support team who is available during business hours
                                to help buyers with technical issues.</li>
                            <li>Availability of a broad array of suppliers of goods and services for small &amp;
                                medium businesses.</li>
                            <li>A cloud-based platform where all you need is an internet connection. You can use
                                this platform to conduct an Negotiation sitting anywhere in the world. It requires no
                                integration with your current systems and there&rsquo;s no expensive software to
                                be downloaded.</li>
                        </ul>
                        <h3>
                            Q: Can I use the Platform independently or will Infinia Corporate Solutions manage
                            the process for me?</h3>
                        <p>
                            A: Yes. As a Buyer you can use the platform independently. The platform has been
                            designed as a self-service model.</p>
                        <h3>
                            Q: What are the minimum system requirements that I need to use the Renepay platform?</h3>
                        <p>
                            A: All you need is access to the internet.</p>
                        <h3>
                            Q: Can I participate in a Negotiation if I am travelling overseas?</h3>
                        <p>
                            A: You and the sellers can participate in a Negotiation irrespective of where you&rsquo;re
                            located. All you need is an internet connection. The moment a registered buyer/supplier
                            logs in, the system will recognise the country and open all the relevant details.</p>
                        <h3>
                            Q: How many additional users can I add to my account?</h3>
                        <p>
                            A: There is no limit on the number of users you can add to your account. </p>
                        <h3>
                            Q: Can I use Renepay in addition to my standard procurement process?</h3>
                        <p>
                            A: Absolutely. The Renepay Platform is an additional tool that helps you get
                            the best price for your requirement.</p>
                    </div>
                    <div class="accordion_container supplier" style="display: none">
                    </div>
                </div>

                <div id="divREP" style="display: none">
                    <div class="accordion_container divbuyer">
                        <h3>
                            Q: Is there any training available to help navigate through the Renepay platform
                            while creating a RFP?</h3>
                        <p>
                            A: While the Renepay Platform is easy to use, to guide first timers you can
                            view our online video on the homepage of www.Renepay.com, which is a step-by-step
                            guide for creating a RFP. Alternatively, you can also call our Renepay Support Team
                            on 1-800 102 8591 and they
                            will be able to assist you further.</p>
                        <h3>
                            Q: Can I use my own RFP format to invite suppliers?</h3>
                        <p>
                            A: Absolutely. You can use your own format or can choose to use our RFP maker basis
                            your convenience.</p>
                        <h3>
                            Q: Is there a supplier list that I can choose from? How is it created?</h3>
                        <p>
                            A: Yes. We provide a comprehensive catalogue of suppliers on the platform from which
                            you can choose. These suppliers have been selected and brought on board by Infinia
                            Corporate Solutions to support you with your procurement process.</p>
                        <h3>
                            Q: If I have a preferred supplier whom I currently deal with, can it get added to
                            the list?</h3>
                        <p>
                            A: Absolutely! You can log onto&nbsp;<a href="FAQs.aspx">www.ReNePay.com</a>&nbsp;and
                            invite them. Our InfiSales representative will reach out to them within 4 hours
                            to verify and get them to register on the platform. Once they register, they can
                            log onto&nbsp;<a href="FAQs.aspx">www.ReNePay.com</a>&nbsp;and
                            submit a quote in response to your RFP.</p>
                        <h3>
                            Q: Who should I contact if I need any help during the RFP process?</h3>
                        <p>
                            A: Should you require any assistance you can contact the Renepay Support team between
                            9 am to 5 pm, Monday to Friday and they will be able to help you online. In case
                            you require further assistance, the InfiSales’ representative will be able to log
                            onto the platform and support you. Most problems can be fixed in a short duration
                            to ensure that the Negotiation is not interrupted. If there are more extensive technical
                            difficulties, the InfSales’ representative can be granted the authority to extend,
                            or postpone the Negotiation until you are notified with additional instructions.</p>
                        <h3>
                            Q: What if there are no initial quotes to my RFP?</h3>
                        <p>
                            A: If no selected supplier quotes for your RFP then the event can be cancelled by
                            you and you can restart the entire process by choosing a new set of suppliers.</p>
                        <h3>
                            Q: Are the suppliers rated? How do I rate a supplier’s performance?</h3>
                        <p>
                            A: Yes, the suppliers are rated as they come on board the Renepay Platform.
                            This rating is a combination of various parameters of their business. You can also
                            the rate the suppliers with whom you do any dealing with at the end of your procurement
                            process on a 5 star rating scale.</p>
                        <h3>
                            Q: Can I specify brand-name requirements in the RFP?</h3>
                        <p>
                            A: Yes. You can specify brand-names are per your requirements in the RFP process.
                        </p>
                        <h3>
                            Q: What currency are renepays carried out in?</h3>
                        <p>
                            A: Renepays are carried out in the currency of the country where the Buyer
                            is based. For example India-based buyers will only have the option to conduct the
                            Renepay in Indian Rupees.</p>
                        <h3>
                            Q: Can suppliers view all the RFP’s, being made; and if so, will they be able to
                            participate in the RFP’s, where they are not invited?</h3>
                        <p>
                            A: No. A supplier cannot view any RFP other than the one he is invited to.</p>
                        <h3>
                            Q: Can I make changes/edits on a RFP during the Negotiation?</h3>
                        <p>
                            A: No. You will need to withdraw the current RFP &amp; Negotiation and set up a new
                            RFP &amp; Negotiation to include your changed requirements.</p>
                        <h3>
                            Q: I don’t have time to create a RFP or monitor an Negotiation; can Infinia Corporate
                            Solutions do this for me?</h3>
                        <p>
                            A: While RFP’s must be submitted by the buyer; Infinia Corporate Solutions can oversee
                            an Negotiation as it is happening. Additionally, our RFP-maker makes this process fast
                            and easy for first-time users. For any inquiries at any time of the RFP-making process,
                            our customer care can be reached on +91 <a href="FAQs.aspx">
                                8010277278</a>, and will be glad to help you in completing the process.</p>
                        <h3>
                            Q: I have created and submitted a RFP. Why can’t I see it in the live RFP section?</h3>
                        <p>
                            A: If you are unable to see your submitted RFP in the live RFP section, please look
                            in the draft RFP section. You would have chosen a certain time for the RFP to go
                            live and it will reflect in the live RFP section only post that selected time.</p>
                        <h3>
                            Q: What is the difference between Quantity and Unit?</h3>
                        <p>
                            A: Quantity is the numerical value of the product required. Unit is the description
                            of the requirement. For example, if you require 100 laptops then 100 will be written
                            under the Quantity section and laptops will be written under units.</p>
                    </div>
                    <div class="accordion_container supplier" style="display: none">
                        <h3>
                            Q: Will Infinia Corporate Solutions reach out to suppliers periodically to let them
                            know about participating in an upcoming RFP?</h3>
                        <p>
                            A: No. Infinia Corporate Solutions Pvt Limited will not reach out to the suppliers
                            directly. Only buyers have the authority to invite suppliers to participate in a
                            RFP and Negotiation. When selected, suppliers will receive an email notification on
                            their registered/official email id.
                        </p>
                        <h3>
                            Q: Is there any training available to help one to navigate through the Renepay
                            platform when submitting a quote for a RFP?</h3>
                        <p>
                            A: Renepay is a very easy to use platform, and quoting for a RFP is just a simple
                            4 click process. In case of any issues you can also call the Renepay Support Team on
                            +91 <a href="FAQs.aspx">8010277278</a> for further
                            assistance.</p>
                        <h3>
                            Q: What is the level of detail provided on the RFP to ensure the quote I make is
                            an informed one?</h3>
                        <p>
                            A: The RFP format created for the buyer is well defined. It captures all the key
                            data points such as the requirement, category, sub-category, brand, product, quantity,
                            delivery date, delivery city etc. Rest assured, all the information that you&rsquo;ll
                            require to make the best quote possible will be provided by the buyer in the RFP.
                            For any additional queries you can always ask a question to the buyer via &lsquo;Ask
                            a question&rsquo; button on the RFP page.</p>
                        <h3>
                            Q: Can I view quotes made by other suppliers?</h3>
                        <p>
                            A: No. You cannot view the quotes of other suppliers when you are quoting for an
                            RFP. The only quote visible will be the lowest one without the name of the supplier
                            who has submitted it.</p>
                        <h3>
                            Q: When I quote will I be able to see my quote and where it stands vis a vis other
                            suppliers?</h3>
                        <p>
                            A: When you submit your quote you will be able to view it on the RFP centre only
                            if it&rsquo;s the lowest quote. So, while your quote is submitted to the buyer,
                            it is the lowest quote that will continue to remain in display.</p>
                        <h3>
                            Q: Can I reach out to a customer directly to select me for a RFP?</h3>
                        <p>
                            A: No. Choosing a supplier is something which is prerogative to the buyer only.</p>
                        <h3>
                            Q: What if no buyer invites me?</h3>
                        <p>
                            A: While the decision to invite you for an RFP lies solely on the buyer, you can
                            increase your chances of being selected in the following ways:</p>
                        <ul>
                            <li>Make sure that you have represented your services well during the registration process.</li>
                        </ul>
                        <ul class="listBullet">
                            <li>Our endeavour is to sign up with a large number of buyers with varied procurement
                                requirements so there is a fair chance of you being invited.</li>
                            <li>Every time you are selected for an RFP make sure that you send your quote. Even
                                if you are not selected as the final supplier you do get considered by the buyer</li>
                        </ul>
                        <ul class="listBullet">
                            <li>Over time, you will also get ratings by buyers who select you. This will add to
                                your credibility and enhance your chances of being selected in the future.</li>
                        </ul>
                        <h3>
                            Q: What is the rating system for suppliers?</h3>
                        <p>
                            A: The rating system is a combination of what the system assigns to a supplier basis
                            their profile information available like &lsquo;Turnover, Pan India presence, etc.&rsquo;
                            and when the supplier is awarded with the contract, the buyer rates him basis his
                            experience. This rating gets added to his overall rating.</p>
                        <h3>
                            Q: What currency are Renepays carried out in?</h3>
                        <p>
                            A: Renepays are carried out in the currency of the particular country where
                            the Buyer is based, for example: Indian buyers will only have the option to conduct
                            the Renepay in Indian Rupees.</p>
                        <h3>
                            Q: Can I view all RFP&rsquo;s made, and if so, will I be able to join RFP&rsquo;s
                            at will or only to those that I have been invited to?</h3>
                        <p>
                            A: No. You cannot view any other RFP other than the one you are invited to.</p>
                        <h3>
                            Q: Can I make changes/edits on my quote during a RFP?</h3>
                        <p>
                            A: No, you cannot make any changes/edits. You can quote only once during the RFP.</p>
                        <h3>
                            Q: I have quoted for an RFP then why can&rsquo;t I see it in the live RFP section?</h3>
                        <p>
                            A: Only the lowest quote is displayed on the live RFP and a rank will be assigned
                            to you. So, while your quote is submitted to the buyer, if it is not the lowest,
                            it won&rsquo;t be visible on the platform. However, the buyer has visibility to
                            your quote.</p>
                        <h3>
                            Q: What should I do after making a quote?</h3>
                        <p>
                            A: There is no action required by you after submitting the quote. You have to wait
                            for the RFP to end after which the buyer may or may not select you for the Negotiation.
                            If selected, you will be notified via an email.</p>
                        <h3>
                            Q: What if I have a question for the buyer during the RFP process?</h3>
                        <p>
                            A: You can ask a question before quoting by clicking on the &ldquo;ask a question&rdquo;
                            link on the live RFP site. Post that, you can use the in box facility, which the
                            Renepay platform, has to communicate with the buyer.</p>
                    </div>
                </div>

                <div id="divAuction" style="display: none">
                    <div class="accordion_container divbuyer">
                        <h3>
                            Q: Am I obligated to award the quote to the lowest bidder?</h3>
                        <p>
                            A: No. You are under no obligation to award the quote/contract to the lowest bidder.
                            You can choose any one of the suppliers who have responded basis the criteria set
                            by you.</p>
                        <h3>
                            Q: Do I have to give the contract to a supplier even if I am not satisfied with
                            the Renepay results?</h3>
                        <p>
                            A: No. It is not mandatory for you to give the contract to a supplier. If you are
                            not satisfied with the quote then you can close the negotiation without choosing a
                            supplier. You can start a new negotiation by inviting fresh set of suppliers.</p>
                        <h3>
                            Q: Do I have the option to amend any aspect of my Negotiation (such as quantities solicited)
                            after an Negotiation has started?</h3>
                        <p>
                            A: No. You can only withdraw or extend an Negotiation once it has started. If you want
                            to add new suppliers when the Negotiation has gone live or want to change the number
                            of units being purchased, then you need to withdraw the current Negotiation and set
                            it up from scratch in the Negotiation Centre.</p>
                        <h3>
                            Q: Will Suppliers be able to view other bidders participating in the negotiation? Will
                            the winning supplier’s name be displayed to the other bidders at the close of the
                            Negotiation?</h3>
                        <p>
                            A: No, suppliers will not be able to view the names of other suppliers participating
                            in the quote process. The winning supplier’s name won’t be displayed to the other
                            competing suppliers at the end of the negotiation.</p>
                        <h3>
                            Q: What time zones are displayed on the Renepay Platform? (IST,
                            GMT etc.)</h3>
                        <p>
                            A: The platform will take the buyer’s location time zone. The server time will be
                            as per the buyer’s time zone.</p>
                        <h3>
                            Q: How are the prices quoted? Unit price or Total price?</h3>
                        <p>
                            A: The price quoted is per unit cost. Then there is an option to put delivery charges
                            and relevant taxes. The total price gets calculated by the system.</p>
                        <h3>
                            Q: How do I improve my chances of getting more bidders for the Negotiation?</h3>
                        <p>
                            A: By ensuring that all product specifications and terms &amp; conditions are well
                            defined during the RFP process. It will help prospective suppliers understand your
                            requirement better and respond more effectively to your RFP.</p>
                        <h3>
                            Q: What happens if two sellers quote the same amount? Which one gets the contract?</h3>
                        <p>
                            A: The decision to award the contract lies solely with you.</p>
                        <h3>
                            Q: How do I place an order after the Renepay is completed?</h3>
                        <p>
                            A: You can place the order via the Purchase Centre. You will need to raise a Purchase
                            Order online against the receipt of goods and make the payment online against the
                            invoice raised and submitted by the supplier.</p>
                        <h3>
                            Q: Do the suppliers set the quote price at their own will, or is this calculated as
                            a percentage lower than the initial price?</h3>
                        <p>
                            A: Yes. In a Renepay such as ours, sellers are free to quote any price they
                            wish.</p>
                        <h3>
                            Q: Can suppliers make quotes once the Renepay deadline is over?</h3>
                        <p>
                            A: No. Unless you extend the deadline/time limit for the Negotiation, no quotes will be
                            accepted once it is over.</p>
                        <h3>
                            Q: How do I make a payment to my selected supplier post the Negotiation?</h3>
                        <p>
                            A: You can make a payment via bank transfer.</p>
                        <h3>
                            Q: Can suppliers be invited to join a Renepay midway through an Negotiation,
                            or only before an Negotiation has started?</h3>
                        <p>
                            A: No. Suppliers can be invited only at the beginning of the Negotiation.</p>
                        <h3>
                            Q: If suppliers decide they want to quote at a lower price after making a quote, can
                            they continue to do so, or should they wait until other sellers have made quotes to
                            make another one themselves?</h3>
                        <p>
                            A: They can continue to reduce or change their quote at their will till the negotiation
                            ends and last quote notification is made.</p>
                        <h3>
                            Q: What happens if the internet connection is lost during the live Negotiation?</h3>
                        <p>
                            A: The Negotiation will continue even if the internet connection is lost for the buyer
                            or the supplier. Both parties can log back into the Negotiation as soon as they regain
                            the connection.</p>
                        <h3>
                            Q: Can suppliers pull out of an negotiation before it has ended?</h3>
                        <p>
                            A: Yes, a supplier can choose not to quote if he doesn’t want to.</p>
                        <h3>
                            Q: How do I view the refreshed quotes?</h3>
                        <p>
                            A: The quotes will get automatically refreshed after every 2 seconds.</p>
                        <h3>
                            Q: What is a general time for submission of quotes?</h3>
                        <p>
                            A: There is no specific time for suppliers to make the quote. They can make a quote
                            any time after the Negotiation starts and can quote till the very last minute prior to
                            the Negotiation ending</p>
                        <h3>
                            Q: Earnest / Quote money? How to set up?</h3>
                        <p>
                            A: This feature is currently not available and has to be done offline.</p>
                        <h3>
                            Q: Can I make changes/edits on a quote / RFP during the negotiation?</h3>
                        <p>
                            A: No. You will need to withdraw the current RFP &amp; Negotiation and set up a new
                            RFP &amp; Negotiation to include your changed requirements.</p>
                        <h3>
                            Q: How do I award a contract after the Negotiation is over?</h3>
                        <p>
                            A: After the Negotiation, you can go to the Purchase Centre option on the platform.
                            It is there that you can create a Purchase Order towards the final selected supplier.
                            A notification will be sent to the supplier and they can create an invoice thereafter.
                            Payments can be made via the platform against the invoice.</p>
                        <h3>
                            Q. Can the customer award the contract to more than one supplier at the end of the
                            Negotiation?</h3>
                        <p>
                            A: No. Currently you can select only one supplier after an Negotiation. This functionality
                            will be made available in the subsequent updates on the platform.</p>
                    </div>
                    <div class="accordion_container supplier" style="display: none">
                        <h3>
                            Q: How will I get to know if I have been selected for the Negotiation?</h3>
                        <p>
                            A: You will be notified via an email if the buyer selects you. Thereafter, you will
                            be invited to participate in the Negotiation.</p>
                        <h3>
                            Q: How do I make a quote?</h3>
                        <p>
                            A: Making a quote is simple. Just log onto&nbsp;<a href="FAQs.aspx">www.Renepay.com</a>
                            or click on the link given in the email sent to you by the buyer. Then go to the
                            Negotiation Centre and click on the relevant RFP and make your quote.</p>
                        <h3>
                            Q: Will I be able to view other bidders participating in the Negotiation? Will the winning
                            supplier’s name be displayed to the other bidders at the close of the Negotiation?</h3>
                        <p>
                            A: No. At no point will you or any of the other suppliers be able to view the names
                            of the other bidders participating in the bidding process. The winning supplier’s
                            name won’t be put on display at the end of the negotiation. However, you can see the
                            lowest quote made.</p>
                        <h3>
                            Q: Do I have the option to amend my quote after an Negotiation has started?</h3>
                        <p>
                            A: Yes. You can quote multiple times during the Negotiation. However, you cannot quote higher
                            than what you previously quoted.</p>
                        <h3>
                            Q: What is the general time for submission of quotes?</h3>
                        <p>
                            A: There is no specific time for you to make a quote. You can make a quote any time
                            after the Negotiation start time and can continue to make a quote till the very last minute
                            of the Negotiation ending.</p>
                        <h3>
                            Q: Can I quote at my own will, or is this calculated as a percentage lower than the
                            initial price?</h3>
                        <p>
                            A: Yes. In a Renepay such as ours, you are free to quote at any price.</p>
                        <h3>
                            Q: Can I make quotes once the Renepay deadline is over?</h3>
                        <p>
                            A: No, unless the buyer extends the deadline/time limit for the Negotiation, no quotes
                            will be accepted once it is over.</p>
                        <h3>
                            Q: Can I join a Renepay midway through an Negotiation, or only before a Negotiation
                            has started?</h3>
                        <p>
                            A: No. You can be invited only at the beginning of the Negotiation and cannot join mid
                            way.</p>
                        <h3>
                            Q: If I decide to quote at a lower price after making a quote, can I continue to do
                            so, or do I have to wait until other suppliers have made quotes?</h3>
                        <p>
                            A: You can continue to reduce/change the quote at your will, till the Negotiation ends
                            and the last quote notification is made.</p>
                        <h3>
                            Q: Can I be selected even if I am not the lowest bidder?</h3>
                        <p>
                            A: Yes. The buyer makes a decision basis several considerations, price being one.
                            Hence there is a chance of you being selected. The decision is totally up to the
                            buyer.</p>
                        <h3>
                            Q: Is it possible that the buyer, even after conducting a Negotiation, does not give
                            the contract to any supplier?</h3>
                        <p>
                            A: Yes it’s possible. If the buyer for some reason is not satisfied with the quote
                            then he can close the Negotiation without even choosing a supplier.</p>
                        <h3>
                            Q: What time zones are displayed on the Renepay Platform? (IST,
                            GMT etc.)</h3>
                        <p>
                            A: It will take the buyer location time zone into consideration. The server time
                            will be the buyer’s time zone.</p>
                        <h3>
                            Q: How are the prices quoted? Unit price or Total price?</h3>
                        <p>
                            A: The price quoted is per unit cost. Then there is an option to put delivery charges
                            and relevant taxes. The total price gets calculated by the system.</p>
                        <h3>
                            Q: What happens if two suppliers quote the same amount? Which one gets the contract?</h3>
                        <p>
                            A: The decision to award the contract lies solely with the buyer.</p>
                        <h3>
                            Q: What happens if the internet connection is lost during the live Negotiation?</h3>
                        <p>
                            A: The Negotiation will continue even if the internet connectivity is lost. Buyers and
                            suppliers can log back into the Negotiation as soon as they regain connection.</p>
                        <h3>
                            Q: Can I pull out of an Negotiation before it ends?</h3>
                        <p>
                            A: In a Renepay such as ours, there is no process to withdraw. However you
                            can choose not to quote.</p>
                        <h3>
                            Q: How do I view the refreshed quotes?</h3>
                        <p>
                            A: Quotes will be automatically refreshed by our system after every 2 seconds.</p>
                        <h3>
                            Q: How do I know that the contract has been awarded to me?</h3>
                        <p>
                            A: Post the Negotiation; the buyer will raise a purchase order towards the supplier
                            they select. A notification will be sent to the supplier who can then create an
                            invoice.
                        </p>
                        <h3>
                            Q. Can the customer award the contract to more than one supplier at the end of the
                            Negotiation?</h3>
                        <p>
                            A: No. The customer can select only one supplier after a Negotiation.
                        </p>
                    </div>
                </div>

                <div id="divPurchase" style="display:none;">
                    <div class="accordion_container divbuyer">
                        <h3>
                            Q: I don’t know how to create a Purchase Order. Can someone help me with this?</h3>
                        <p>
                            A:You can create a Purchase Order by going to the Purchase Centre on the home page. 
                            Click on new order to create a Purchase Order from a closed RFP or an Negotiation. 
                            You can call our Renapay Support Team on 1-800 102 8591, Monday – Friday, 
                            9:30AM - 05:00PM and they will be able to assist you further.</p>
                        <h3>
                            Q:Can I withdraw my Purchase Order after submitting it to the supplier?</h3>
                        <p>
                            A: Yes, you can withdraw a Purchase Order that is awaiting an acceptance from the Supplier. 
                            You can go to Sent Order at the Purchase Centre to withdraw your Purchase Order. 
                            Once a Purchase Order is accepted, it cannot be withdrawn.</p>
                        <h3>Q: Can I make amendments to my Request For Proposal after a Purchase Order<br> has been submitted?</h3>
                        <p>A: No, if you wish to make any amendments, you must cancel the Request For Proposal by withdrawing the Purchase Order and send a new request.</p>
                        <h3>
                            Q: At what stage do I need to make the payment? What form of payment do I make to the supplier</h3>
                        <p>
                            A: This depends on the terms of the RFP, whether payment is taken in advance or on delivery of the products. 
                            This is up to you – either bank transfer or card payment – and you can set these details when you create your RFP.</p>
                        <h3>
                            Q: Can I be assured that all payments I make are done securely?</h3>
                        <p>
                            A: The card and net banking payment processing is done securely through CC Avenue. All transactions take place over Secure Sockets Layer (SSL). 
                            Whichever method you choose, you can be rest assured that your payment is always safe. </p>
                        <h3>
                            Q: Can I change the payment details of purchase orders?</h3>
                        <p>
                            A: Yes, in the ‘Payment Details’ section of the Purchase Centre, you can edit payment details for the RFP in question.</p>
                        <h3>
                            Q: Who should I contact if I need any help at the Purchase Order stage?</h3>
                        <p>
                            A: You can write in to <a href="mailto:help@ReNePay.com" class="txtC">help@ReNePay.com</a> or call our InfiSupport Team on 1-800 102 8591, Monday – Friday, 
                            9:30AM - 05:00PM and they will be able to assist you further.</p>
                    </div>
                    <div class="accordion_container supplier" style="display: none">
                        <h3>
                            Q: What if there are other additional fees I need to add to the invoice?</h3>
                        <p>
                            By selecting ‘raise an invoice’ when viewing the Purchase Order in question you can add fees such as additional taxes and delivery fees.</p>
                        <h3>
                            Q: Can any other suppliers see what is happening between me and the buyer at this stage?</h3>
                        <p>
                            A: No, as the buyer has chosen you to be their supplier at this stage, all dealings are only visible to you and the buyer.</p>
                        <h3>
                            Q: Can I withdraw after receiving a Purchase Order from the buyer?</h3>
                        <p>
                            A: If you feel you can no longer fulfill the terms of the RFP, then you should inform the buyer and subsequently decline the purchase order. 
                            However, bear in mind that this may detrimentally affect any future RFP’s you join as buyers are able to rate the suppliers basis their experience.</p>
                        <h3>
                            Q: Is there any way I can directly contact the buyer via Renepay in the same way that I was able to during the negotiation itself?</h3>
                        <p>
                            A: The real-time question/answer is not available at this stage. If you have the contact details of the buyer, you can contact them on your own terms. 
                            Alternately, you can write in to <a href="mailto:help@ReNePay.com" class="txtC">help@ReNePay.com</a> or call our InfiSupport Team on 1-800 102 8591, Monday – Friday, 9:30AM - 05:00PM for any queries.
                        </p>
                    </div>
                </div>

            

        <div class="clr"></div>
    </div>

</asp:Content>

