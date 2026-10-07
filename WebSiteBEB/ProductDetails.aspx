<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="ProductDetails, App_Web_productdetails.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.prod-details-1.0.js"></script>
	<!-- Page Title-->
	<div class="page-title-overlap bg-darkBlack ">
		<div class="container d-lg-flex breadcrumbWrap">
			<div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
						<li class="breadcrumb-item"><a class="text-nowrap" href="javascript:void(0)" id="lnkBCHome"><i class="czi-home"></i>Home</a></li>
						<li class="breadcrumb-item text-nowrap">
							<a href="javascript:void(0)" id="lnkBCShop">Book Shop</a>
						</li>
						<li class="breadcrumb-item text-nowrap active" aria-current="page">
							<asp:Literal ID="xlitBCTitle" runat="server"></asp:Literal>
						</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
	<!-- Page Content-->
	<div class="container">
		<asp:Literal ID="xlitProdDet" runat="server"></asp:Literal>
		<!-- Gallery + details-->
		<div class="bg-light box-shadow-lg rounded-lg ">
			<div class="order-lg-1 pr-lg-4 text-center text-lg-left p-2">
				<h1 class="h3 pt-3 pl-3">
					<asp:Literal ID="xlitProdTitle" runat="server"></asp:Literal>
				</h1>
			</div>
			<div class="px-lg-3">
				<div class="row">
					<!-- Product gallery-->
					<div class="col-lg-5 pr-lg-0 ">
						<div class="cz-product-gallery">
							<div class="cz-preview order-sm-2">
								<div class="cz-preview-item active" id="first">
									<asp:Literal ID="xlitProdImg" runat="server"></asp:Literal>
								</div>
							</div>
						</div>
					</div>
					<!-- Product details-->
					<div class="col-lg-7 pt-4 pt-lg-0">
						<div class="product-details ml-auto pb-3">
							<div class="mb-3">
								<span class="h3 font-weight-normal text-accent mr-1">
									<asp:Literal ID="xlitProdOrderPrice" runat="server"></asp:Literal>
								</span>
								<del class="text-muted font-size-lg mr-3">
									<asp:Literal ID="xlitProdPrice" runat="server"></asp:Literal>
								</del>
							</div>
							<div class="font-size-sm mb-4">
								<span class="text-heading font-weight-medium mr-1">By:
									<asp:Literal ID="xlitProdEntity" runat="server"></asp:Literal>
								</span>
							</div>
							<!-- <form class="mb-grid-gutter" method="post" > -->

							<div class="form-group d-flex align-items-center">
								<asp:Literal ID="xlitProdAddToCart" runat="server"></asp:Literal>
								<%--<select class="custom-select mr-3" style="width: 5rem;"id="ddlProdQty">
									<option value="1" selected>1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
								<button class="btn btn-primary " type="button" id="btnProdAdd">
									<i class="czi-cart font-size-lg mr-2"></i>Add to Cart                               
								</button>--%>
							</div>
							<asp:Literal ID="xlitProdAddToWishlist" runat="server"></asp:Literal>
							<!-- </form> -->
							<!-- Product panels-->
							<div class="accordion mb-4" id="productPanels">
								<div class="card">
									<div class="card-header">
										<h3 class="accordion-heading">
											<a href="#productInfo" role="button" data-toggle="collapse"
												aria-expanded="true" aria-controls="productInfo">
												<i class="czi-announcement text-muted font-size-lg align-middle mt-n1 mr-2"></i>About Book                                               
												<span class="accordion-indicator"></span>
											</a>
										</h3>
									</div>
									<div class="collapse show" id="productInfo" data-parent="#productPanels">
										<div class="card-body">
											<div class="font-size-sm ">
												<asp:Literal ID="xlitProdDesc" runat="server"></asp:Literal>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header">
										<h3 class="accordion-heading">
											<a href="#productDetl" role="button" data-toggle="collapse"
												aria-expanded="true" aria-controls="productInfo">
												<i class="czi-announcement text-muted font-size-lg align-middle mt-n1 mr-2"></i>
												Product Detail<span class="accordion-indicator"></span>
											</a>
										</h3>
									</div>
									<div class="collapse " id="productDetl" data-parent="#productPanels">
										<div class="card-body">
											<ul class="font-size-sm pl-4">
												<li>ISBN-13:
													<asp:Literal ID="xlitISBN13" runat="server"></asp:Literal>
												</li>
												<li>Publisher:
													<asp:Literal ID="xlitPublisher" runat="server"></asp:Literal></li>
												<li>ISBN-10:
													<asp:Literal ID="xlitISBN10" runat="server"></asp:Literal></li>
												<li>Publisher Date:
													<asp:Literal ID="xlitPublishedDate" runat="server"></asp:Literal></li>
											</ul>
											<!-- <h6 class="font-size-sm mb-2">Art. No.</h6>
                                            <ul class="font-size-sm pl-4 mb-0">
                                              <li>183260098</li>
                                            </ul> -->
										</div>
									</div>
								</div>
							</div>
							<%--<!-- Sharing-->
							<h6 class="d-inline-block align-middle font-size-base my-2 mr-2">Share:</h6>
							<a class="share-btn sb-twitter mr-2 my-2" href="shop-single-v1.html#">
								<i class="czi-twitter"></i>Twitter
                            </a>
							<a class="share-btn sb-instagram mr-2 my-2"	href="shop-single-v1.html#">
								<i class="czi-instagram"></i>Instagram
							</a>
							<a class="share-btn sb-facebook my-2" href="shop-single-v1.html#">
								<i class="czi-facebook"></i>Facebook
							</a>--%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container py-5 my-md-3">
        <h2 class="h3 text-center pb-4">You may also like</h2>
        <div class="cz-carousel cz-controls-static cz-controls-outside">
            <div class="cz-carousel-inner"
                 data-carousel-options="{&quot;items&quot;: 1, &quot;controls&quot;: true, &quot;nav&quot;: false, &quot;autoHeight&quot;: true, &quot;autoWidth&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2, &quot;gutter&quot;: 18},&quot;768&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 20}, &quot;1100&quot;:{&quot;items&quot;:4, &quot;gutter&quot;: 30}}}">
                <asp:Literal ID="xlitRelatedProdLst" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
</asp:Content>

