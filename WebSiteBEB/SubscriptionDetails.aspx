<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="SubscriptionDetails, App_Web_subscriptiondetails.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<!-- breadcrumbs -->
	<section class="breadcrumbs bg-light">
		<div class="container">
			<div class="row">
				<div class="col">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('home');">Home</a></li>
							<li class="breadcrumb-item"><a href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('subscription');">SubScriptions</a></li>
							<li class="breadcrumb-item active" aria-current="page">Subscription</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- product -->
	<section class="hero bg-light pt-5">
		<div class="container">
			<div class="row gutter-2 gutter-md-4 justify-content-between">
				<asp:Literal ID="xlitProdDet" runat="server"></asp:Literal>
				<%--<div class="col-lg-7">
					<div class="row gutter-1 justify-content-between">
						<div class="col-lg-10 order-lg-2">
							<div class="owl-carousel gallery" data-slider-id="1" data-thumbs="true" data-nav="true">
								<figure class="equal">
									<a class="image" href="images/product-1.jpg" style="background-image: url(images/product-1.jpg);"></a>
								</figure>
								<figure class="equal">
									<a class="image" href="images/product-2.jpg" style="background-image: url(images/product-2.jpg);"></a>
								</figure>
								<figure class="equal">
									<a class="image" href="images/product-1-3.jpg" style="background-image: url(images/product-1.jpg);"></a>
								</figure>
							</div>
						</div>
						<div class="col-lg-2 text-center text-lg-left order-lg-1">
							<div class="owl-thumbs" data-slider-id="1">
								<span class="owl-thumb-item">
									<img src="images/product-1.jpg" alt=""></span>
								<span class="owl-thumb-item">
									<img src="images/product-2.jpg" alt=""></span>
								<span class="owl-thumb-item">
									<img src="images/product-1.jpg" alt=""></span>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-5 mb-5 mb-lg-0">
					<div class="row">
						<div class="col-12">
							<span class="item-brand">Veggies</span>
							<h1 class="item-title">Garden Mix - Farm Fresh Salad Box</h1>
							<span class="item-price"><s class="text-muted">Rs. 275.00</s> Rs. 175.00</span>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<p>
								This minimalist backpack is suitable for any occasion. Whether on the road by bike, shopping or in the
                nightlife.
							</p>
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-12">
							<div class="form-group">
								<label>Subscribe & Save</label>
								<div class="btn-group-toggle btn-group-square " data-toggle="buttons">
									<label class="btn active ">
										1 Box
                   
										<input type="radio" name="options" id="option1-2" checked>
									</label>
									<label class="btn  ">
										1 Box per week 1 Month (5% Off)
                   
										<input type="radio" name="options" id="option1-2" checked>
									</label>
									<label class="btn  ">
										1 Box per week 3 Months (10% Off)
										<input type="radio" name="options" id="option1-2" checked>
									</label>
									<label class="btn  ">
										1 Box per week 6 Months (15% Off)
                   
										<input type="radio" name="options" id="option1-2" checked>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8">
							<a href="cart.html" class="btn btn-block btn-lg btn-primary">Add to Cart</a>
						</div>
						<div class="col-12 mt-1">
							<ul class="nav nav-actions">
								<li class="nav-item">
									<a class="nav-link" href="product-classic.html#">Add to wishlist</a>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="product-classic.html#" role="button"
										aria-haspopup="true" aria-expanded="false">Share this product</a>
									<ul class="dropdown-menu">
										<li>
											<a class="dropdown-item" href="product-classic.html#">Facebook</a>
										</li>
										<li>
											<a class="dropdown-item" href="product-classic.html#">Twitter</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>--%>
			</div>
		</div>
	</section>

	<!-- info -->
	<section class="">
		<div class="container">
			<div class="row gutter-2 gutter-lg-4 recipWrap">
				<asp:Literal ID="xlitProdDesc" runat="server"></asp:Literal>
				<%--	<div class="col-md-8  ">	
					<h3>Description</h3>
					<p>
						A delicious Premium Salad Box featuring a stunning mix of 2-3 different kinds of lettuce with a variety of
						colours, shapes and textures. Freshly harvested and pre-washed for you to create crunchy, delicious and
						health salads. It may include green oakleaf, red oakleaf, green romaine, red romaine, lollo rosso and red leaf lettuces.
					</p>
					<p>
						This product is grown in a premium high-grade Aquaponics farm with no chemical pesticides, fertilizers, or soil
						contamination. Delivered to you fresh from Farm to Fork.         
					</p>
					<p>
						Harvested on order for maximum nutrition, freshness, and flavor! By buying Aquaponically grown produce, you just
						saved 52+ Liters of water compared to similar produce grown in soil. Thank you for supporting Sustainable Agriculture.				
					</p>
					<p>
						*Please note we deliver based on location and pre-order. The mix of each box may vary slightly depending on
						the fresh harvest of the day.
					</p>
					<p>
						ONLY 140 GMS IS AVAILABLE IN SUBSCRIPTIONS. IF YOU'D LIKE TO ADD MORE, DO SO BY INCREASING THE NUMBER OF ITEMS (QTY).
					</p>
					<p>FOR EG, TO GET 2 BOXES DELIVERED PER WEEK, ADD 2 QTY AND TO GET 4 BOXES DELIVERED WEEKLY, ADD 4 QTY.</p>
					<p>How to Use: Toss in your favourite salad dressing and enjoy!</p>
					<p>Ingredients: 2-4 varieties of red/green premium aquaponic lettuce.</p>
					<p>Weight: 140 grams</p>
					<p>Made by: Urban Farm Co.</p>
				</div>

				<div class="col-lg-4">
					<ul class="list-group list-group-line">
						<li class="list-group-item d-flex justify-content-between align-items-center">SKU
							<span class="text-dark">1421354</span>
						</li>
						<li class="list-group-item d-flex justify-content-between align-items-center">Category
							<span class="text-dark"><a href="product-classic.html" class="underline text-dark">Bags</a>,
								<a href="product-classic.html" class="underline text-dark">Backpack</a></span>
						</li>
						<li class="list-group-item d-flex justify-content-between align-items-center">Tags
							<span class="text-dark"><a href="product-classic.html" class="underline text-dark">backpack</a>, 
								<a href="product-classic.html" class="underline text-dark">minimal</a></span>
						</li>
					</ul>
					<div class="border-top col-lg-12 col-md-12 mt-7 pt-5">
						<div class="rate">
							<span>4.9</span>
							<a data-toggle="modal" data-target="#reviews" class="action eyebrow text-primary underline">View Reviews</a>
						</div>
					</div>
					<div class="col-md-12 col-lg-12 pt-2">
						<p>
							This minimalist backpack is suitable for any occasion. Whether on the road by bike, shopping or in the
								nightife. The roll-top closes with velcro and allows a practical filling of the Hajo backpack.
						</p>
					</div>
				</div>--%>
			</div>
		</div>
	</section>
	<br />
	<br />
	<br />

	<!-- related products -->
	<section class="no-overflow separator-top">
		<div class="container">
			<div class="row">
				<div class="col-12 mb-3">
					<div class="nav nav-tabs lavalamp" id="myTab" role="tablist">
						<div class="nav-item">
							<a class="nav-link " id="home-tab" href="#home">Related Products</a>
						</div>
					</div>
				</div>
				<section class="pb-1 no-overflow">
					<div class="container">
						<div class="row gutter-1">
							<!-- <div class="col-md-6 col-lg-4 level-1">
								<div class="card card-equal bg-primary text-white equal-80 relHdr">
									<div class="card-header p-4">
										<i class="icon-instagram fs-30"></i>
									</div>
									<div class="card-footer p-4">
										<h2 class="card-title fs-30">Related Products </br>
										
											<a href="javascript:void(0);" onclick="WebNavHelper.redirectToPageMain('subscription');" class="font-weight-bold underline">View More</a>
										</h2>
									</div>
								</div>
							</div> -->
							<div class="col-md-6 col-lg-8">
								<div class="owl-carousel owl-carousel-alt visible owl-loaded owl-drag" data-items="[3,3,1,1]"
									data-margin="10" data-loop="false" data-nav="false">
									<div class="owl-stage-outer">
										<asp:Literal ID="xlitReletedProdLst" runat="server"></asp:Literal>
									</div>
									<div class="owl-dots disabled"></div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
	<br />
</asp:Content>

