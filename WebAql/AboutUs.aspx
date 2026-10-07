<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="AboutUs, App_Web_aboutus.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<!-- breadcrumbs -->
	<section class="breadcrumbs separator-bottom">
		<div class="container">
			<div class="row">
				<div class="col">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('home');">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">About Us</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- hero -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col">
					<h1>About Us</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- lookbook -->
	<section class=" ">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12 contWrap">
					<asp:Literal ID="xlitContent" runat="server"></asp:Literal>
					<%--<h3>INDIA&rsquo;S FOREMOST HYDROPONIC FARM - AQUA LEAF</h3>
					<p>
						Aqua Leaf Farms is a hydroponic farm located on the outskirts of Thane, Mumbai. Our hydroponic farm is a
            state of the art, producing a world class harvest, which is free of pesticides and any residues.
					</p>
					<h4>About our farm</h4>
					<p>
						Aqua Leaf Farms is Mumbai&rsquo;s largest hydroponic farm. It covers an area of 12,000 sq. ft. Our
            hydroponic farm is fully automated on artificial intelligence and IOT. We began our hydroponics journey in
            (20xx), and have not looked back since.
					</p>
					<h4>What is hydroponic farming?</h4>
					<p>
						Hydroponic farming is a farming technique which was introduced in the 18th century. This method did not
            involve any use of soil. In spite of the absence of a nutrient filled soil, the results of hydroponics
            produced a better yield and a premium quality harvest as compared to a conventional farming method
					</p>
					<h4>Why did we adapt this concept?</h4>
					<p>
						Hydroponic farms are the future of farming. This farming method produces multiple vegetables, herbs and
            other crops that are dense in nutrients. As there is no barrier of the type or quality of the soil to plant
            such a harvest, hydroponic farming can be done at any time of the year
					</p>
					<h4>How is it beneficial for the environment?</h4>
					<p>
						Hydroponic farming is not a conventional farming method. We at Aqua Leaf Farms use 90% less water while
            growing our harvest which helps us do our part for the environment on conservation of water. Apart from our
            harvest, we provide an eco-friendly packaging for all our products which helps with the sustainability of
            our environment.
					</p>
					<h4>How is it beneficial for your health?</h4>
					<p>
						We aim at creating a healthier world, one salad at a time with our hydroponically grown, farm to fork
            concept. Along with our promise to deliver fresh, juicy and crispiest greens, we also commit to a residue
            and pesticide free organic produce.
					</p>
					<h4>Our product range</h4>
					<p>
						We bring to your table the freshest, crunchiest, organically produced leafy greens and exotic vegetables,
            and the most aromatic herbs. Our hydroponic product line includes spinach, fenugreek, coriander, a wide
            variety of exotic lettuce and other leafy vegetables, parsley, basil, shiso, and other vine crops like bell
            peppers cherry tomatoes, zucchini and much more!
					</p>
					<p>&nbsp;</p>
					<p>
						<strong>We are doing our bit for a sustainable environment; let us do a bit for your healthy diet
              too!</strong>
					</p>--%>
				</div>
			</div>
		</div>
	</section>
</asp:Content>

