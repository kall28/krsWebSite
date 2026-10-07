<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="ShopProductList, App_Web_shopproductlist.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.shop-productlist-1.0.js"></script>
	<!-- breadcrumbs -->
	<section class="breadcrumbs separator-bottom">
		<div class="container">
			<div class="row">
				<div class="col">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Listing</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- listing -->
	<section class="pt-6">
		<div class="container">
			<div class="row gutter-4">

				<!-- sidebar -->
				<aside class="col-lg-3 sidebar">

					<div class="widget">
						<span class="widget-collapse d-lg-none" data-toggle="collapse" data-target="#collapse-1"
							aria-expanded="false" aria-controls="collapse-1" role="button">Filter by Category</span>
						<div class="d-lg-block collapse" id="collapse-1">
							<span class="widget-title">Product by Filters </span>
							<div class="widget-content">
								<ul id="page-nav" class="nav flex-column nav-category">
									<li class="nav-item" id="LstSubscriptions">
										<asp:Literal ID="xlitSubscriptions" runat="server"></asp:Literal>
										<%--<a class="nav-link" data-toggle="collapse" href="#menu-2" role="button" aria-expanded="false"
											aria-controls="menu-2">Subscription</a>
										<div class="collapse" id="menu-2" data-parent="#page-nav">
											<div>
												<ul class="nav flex-column" >
													<li class="nav-item">
														<a class="nav-link" href="listing-sidebar.html#!">Two Person Farm To Fork</a>
													</li>
													<li class="nav-item">
														<a class="nav-link" href="listing-sidebar.html#!">Two Person Farm To Fork</a>
													</li>
												</ul>
											</div>
										</div>--%>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="widget">
						<span class="widget-collapse d-lg-none" data-toggle="collapse" data-target="#collapse-2"
							aria-expanded="false" aria-controls="collapse-2" role="button">Filter by Category</span>
						<div class="d-lg-block collapse" id="collapse-2">
							<span class="widget-title">Category</span>
							<div class="widget-content" id="LstCategories">
								<%--<div class="custom-control custom-checkbox">
									<input type="checkbox" checked="checked" class="custom-control-input" id="customCheck1">
									<label class="custom-control-label" for="customCheck1">All </label>
								</div>
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="customCheck1">
									<label class="custom-control-label" for="customCheck1">Colored Bell Peppers </label>
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
								--%>
							</div>
						</div>
					</div>

					<div class="widget">
						<span class="widget-collapse d-lg-none" data-toggle="collapse" data-target="#collapse-5"
							aria-expanded="false" aria-controls="collapse-5" role="button">Filter by Price</span>
						<div class="d-lg-block collapse" id="collapse-5">
							<span class="widget-title">Price</span>
							<div class="widget-content">
								<input type="text" id="txtPriceRange" class="rangeslider" name="Range Slider" value="" />
							</div>
						</div>
					</div>

				</aside>

				<!-- content -->
				<div class="col-lg-9" >
					<div class="row gutter-2 gutter-lg-3" id="divProductLst">
						<div class="col-6 col-md-4">
							<div class="product">
								<figure class="product-image">
									<a href="product.html">
										<img src="images/product-1.jpg" alt="Image">
									</a>
								</figure>
								<div class="product-meta">
									<h3 class="product-title"><a href="product.html">Garden Mix - Farm Fresh Salad Box </a></h3>
									<div class="product-price">
										<span>₹2,268</span>
										<span class="product-action">
											<a href="product.html">Add to cart</a>
										</span>
									</div>
									<a href="profile-wishlist.html" class="product-like"></a>
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
									<h3 class="product-title"><a href="product.html">Garden Mix - Farm Fresh Salad Box </a></h3>
									<div class="product-price">
										<span>₹2,268</span>
										<span class="product-action">
											<a href="product.html">Add to cart</a>
										</span>
									</div>
									<a href="profile-wishlist.html" class="product-like"></a>
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
									<h3 class="product-title"><a href="product.html">Garden Mix - Farm Fresh Salad Box </a></h3>
									<div class="product-price">
										<span>₹2,268</span>
										<span class="product-action">
											<a href="product.html">Add to cart</a>
										</span>
									</div>
									<a href="profile-wishlist.html" class="product-like"></a>
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
									<h3 class="product-title"><a href="product.html">Garden Mix - Farm Fresh Salad Box </a></h3>
									<div class="product-price">
										<span>₹2,268</span>
										<span class="product-action">
											<a href="product.html">Add to cart</a>
										</span>
									</div>
									<a href="profile-wishlist.html" class="product-like"></a>
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
									<h3 class="product-title"><a href="product.html">Garden Mix - Farm Fresh Salad Box </a></h3>
									<div class="product-price">
										<span>₹2,268</span>
										<span class="product-action">
											<a href="product.html">Add to cart</a>
										</span>
									</div>
									<a href="profile-wishlist.html" class="product-like"></a>
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
									<h3 class="product-title"><a href="product.html">Garden Mix - Farm Fresh Salad Box </a></h3>
									<div class="product-price">
										<span>₹2,268</span>
										<span class="product-action">
											<a href="product.html">Add to cart</a>
										</span>
									</div>
									<a href="profile-wishlist.html" class="product-like"></a>
								</div>
							</div>
						</div>


					</div>
					<div class="row">
						<div class="col">
							<nav class="d-inline-block">
								<ul class="pagination">
									<li class="page-item active"><a class="page-link" href="filters.html">1 <span
										class="sr-only">(current)</span></a></li>
									<li class="page-item" aria-current="page"><a class="page-link" href="filters.html">2</a>
									</li>
									<li class="page-item"><a class="page-link" href="filters.html">3</a></li>
									<li class="page-item"><a class="page-link" href="filters.html">4</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

</asp:Content>

