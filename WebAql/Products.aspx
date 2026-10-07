<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="Products, App_Web_products.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">	﻿
	<script src="js/web.prod-1.0.js"></script>
	<!-- hero -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<asp:Literal ID="xlitMainBanner" runat="server"></asp:Literal>
				<%--<div class="image image-overlay" style="background-image: url(images/background-1.jpg)"></div>--%>
				<div class="container">
					<div class="row align-items-center vh-50">
						<div class="col-lg-8 mt-6 text-white">
							<asp:Literal ID="xlitBannerContent" runat="server"></asp:Literal>
							<%--<h1 class="display-3 mt-1 mb-3 font-weight-light">Fresher Crispier & Tastier<b
								class="d-block">Get delivered straight to your door step.</b></h1>--%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section>
		<div class="container">
			<div class="col-md-12 pb-2  text-center">
				<asp:Literal ID="xlitContent" runat="server"></asp:Literal>
				<%--<h2>Freshly Harvested Greens & Vegetables
				</h2>
				<p class="text-center">
					At Mumbai’s Biggest Hydroponic Farms, Aqua Leaf, we aim to deliver pesticide-free and antioxidant-rich crops that are grown in purified water. We use sustainable farming practices that prevent soil erosion, helps in water conservation, and avoids exhaustion of natural resources
				</p>
				<p class="text-center">
					Minimum Order - Rs.500 | Deliveries on every Wednesday | Book your orders by latest Monday 2pm |Delivery charges will be extra as application
				</p>--%>
			</div>
			<div class="row justify-content-end">
				<div class="col-lg-12">
					<div class="row gutter-2 align-items-end">
						<div class="col-md-6">
							<%--<h1 class="mb-0">Products</h1>--%>
							<span class='eyebrow' id="spnNoOfProducts"></span>
						</div>
						<div class="col-md-6 text-md-right">
							<%--<div class="dropdown">
										<a class="btn btn-outline-secondary btn-sm dropdown-toggle"
											href="listing-sidebar.html#!" role="button" id="dropdownMenuLink"
											data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">What's New
										</a>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
											<a class="dropdown-item" href="listing-sidebar.html#!">What's New</a>
											<a class="dropdown-item" href="listing-sidebar.html#!">Price high to low</a>
											<a class="dropdown-item" href="listing-sidebar.html#!">Price low to high</a>
										</div>
								</div>--%>
						</div>
					</div>
				</div>
			</div>
			<div class="row gutter-4">
				<!-- sidebar -->
				<%-- <aside class="col-lg-3 sidebar">
						<div class="widget">
							<span class="widget-collapse d-lg-none" data-toggle="collapse" data-target="#collapse-2"
								aria-expanded="false" aria-controls="collapse-2" role="button">Filter by Category
							</span>
							<div class="d-lg-block collapse" id="collapse-2">
								<span class="widget-title">Subscription</span>
								<div class="widget-content">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" checked class="custom-control-input" id="customCheck1">
										<label class="custom-control-label" for="customCheck1">Two Person Farm To Fork
										</label>
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" checked class="custom-control-input" id="customCheck2">
										<label class="custom-control-label" for="customCheck2">Three Person Farm To Fork
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="widget">
							<span class="widget-collapse d-lg-none" data-toggle="collapse" data-target="#collapse-2"
								aria-expanded="false" aria-controls="collapse-2" role="button">Filter by Category
							</span>
							<div class="d-lg-block collapse" id="collapse-2">
								<span class="widget-title">Category</span>
								<div class="widget-content">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" checked class="custom-control-input" id="customCheck">
										<label class="custom-control-label" for="customCheck1">All </label>
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck1">
										<label class="custom-control-label" for="customCheck1">Colored Bell Peppers
										</label>
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck2">
										<label class="custom-control-label" for="customCheck2">Coriander </label>
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck3">
										<label class="custom-control-label" for="customCheck3">Michael Kors</label>
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck4">
										<label class="custom-control-label" for="customCheck4">Balenciaga</label>
									</div>
								</div>
							</div>
						</div>
						<div class="widget">
							<span class="widget-collapse d-lg-none" data-toggle="collapse" data-target="#collapse-5"
								aria-expanded="false" aria-controls="collapse-5" role="button">Filter by Price
							</span>
							<div class="d-lg-block collapse" id="collapse-5">
								<span class="widget-title">Price</span>
								<div class="widget-content">
									<input type="text" class="rangeslider" name="Range Slider" value="" />
								</div>
							</div>
						</div>
						</aside>--%>

				<!-- content -->
				<div class="col-lg-12">
					<div class="row gutter-2 gutter-lg-3" id="divProductLst">
						<%--<asp:Literal ID="xlitSubscriptions" runat="server">
									</asp:Literal>--%>
						<%--<div class="col-6 col-md-4">
										<div class="product">
											<figure class="product-image">
												<a href="product.html">
													<img src="images/product-1.jpg" alt="Image">
												</a>
											</figure>
											<div class="product-meta">
												<h3 class="product-title">
													<a href="product.html">Two Person Farm To Fork Subscription Plan | 1
														Kg of
														Veggies per week | 4 Kgs per month
													</a>
												</h3>
												<div class="product-price">
													<span class="line-through">₹2,268</span> <span>₹2,268</span>
													<span class="product-action">
														<a href="product.html">Add to cart</a>
													</span>
												</div>
											</div>
										</div>
							</div>
							<div class="col-6 col-md-4">
								<div class="product">
									<figure class="product-image">
										<a href="product.html">
											<img src="images/product-1.jpg" alt="Image">
										</a>
									</figure>
									<div class="product-meta">
										<h3 class="product-title">
											<a href="product.html">Two Person Farm To Fork Subscription Plan | 1 Kg of
												Veggies per week | 4 Kgs per month
											</a>
										</h3>
										<div class="product-price">
											<span class="line-through">₹2,268</span> <span>₹2,268</span>
											<span class="product-action">
												<a href="product.html">Add to cart</a>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6 col-md-4">
								<div class="product">
									<figure class="product-image">
										<a href="product.html">
											<img src="images/product-1.jpg" alt="Image">
										</a>
									</figure>
									<div class="product-meta">
										<h3 class="product-title">
											<a href="product.html">Two Person Farm To Fork Subscription Plan | 1 Kg of
												Veggies per week | 4 Kgs per month
											</a>
										</h3>
										<div class="product-price">
											<span class="line-through">₹2,268</span> <span>₹2,268</span>
											<span class="product-action">
												<a href="product.html">Add to cart</a>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6 col-md-4">
								<div class="product">
									<figure class="product-image">
										<a href="product.html">
											<img src="images/product-1.jpg" alt="Image">
										</a>
									</figure>
									<div class="product-meta">
										<h3 class="product-title">
											<a href="product.html">Two Person Farm To Fork Subscription Plan | 1 Kg of
												Veggies per week | 4 Kgs per month
											</a>
										</h3>
										<div class="product-price">
											<span class="line-through">₹2,268</span> <span>₹2,268</span>
											<span class="product-action">
												<a href="product.html">Add to cart</a>
											</span>
										</div>
									</div>
								</div>
							</div>--%>
					</div>
					<div class="row">
						<div class="col">
							<%--<nav class="d-inline-block">
									<ul class="pagination">
										<li class="page-item active">
											<a class="page-link" href="filters.html">1 <span
													class="sr-only">(current)</span>
											</a>
										</li>
										<li class="page-item" aria-current="page">
											<a class="page-link" href="filters.html">2</a>
										</li>
										<li class="page-item"><a class="page-link" href="filters.html">3</a></li>
										<li class="page-item"><a class="page-link" href="filters.html">4</a></li>
									</ul>
									</nav>--%>
						</div>
					</div>
				</div>
			</div>
			<%--<div class="row">
					<div class="col">
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="home" role="tabpanel">
								<div class="row gutter-2 gutter-md-3" id="divProductLst">

								</div>
							</div>
						</div>
					</div>
					</div>
					<div class="row">
						<div class="col text-center">--%>
			<%--<a href="index.html#!" class="btn btn-outline-secondary">Load More</a>--%>
			<%--< /div>
						</div>--%>
		</div>
	</section>
</asp:Content>

