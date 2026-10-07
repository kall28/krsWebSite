<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="RecipeDetails, App_Web_recipedetails.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<!-- hero -->
	<section class="hero pb-5">
		<asp:Literal ID="xlitBanner" runat="server"></asp:Literal>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10 col-lg-8 text-white">
					<!-- <span class="eyebrow decorated mb-1">New collection</span> -->
					<h1 class="mb-2">
						<asp:Literal ID="xlitTitle" runat="server"></asp:Literal>
					</h1>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('home');">Home</a></li>
							<li class="breadcrumb-item"><a href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('recipes');">Recipe</a></li>
							<li class="breadcrumb-item active" aria-current="page">Recipe Details</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- / hero -->

	<section class="pt-5">
		<article class="container">
			<!-- paragraph -->
			<div class="row justify-content-center">
				<div class="col-md-10 col-lg-8 recipWrap">
					<asp:Literal ID="xlitDetails" runat="server"></asp:Literal>
				</div>
			</div>

			<%--<!-- carousel -->
            <div class="row justify-content-center">
                <div class="col-md-10 col-lg-8">
                    <div class="owl-carousel text-center" data-nav="true">
                        <figure class="card card-equal equal-50">
                            <span class="image" style="background-image: url(images/product-1.jpg)"></span>
                        </figure>
                        <figure class="card card-equal equal-50">
                            <span class="image" style="background-image: url(images/product-2.jpg)"></span>
                        </figure>
                    </div>
                </div>
            </div>--%>


			<!-- blockquote -->
			<!-- list group -->
			<%--<div class="row justify-content-center">
				<div class="col-md-10 col-lg-8">
					<div class="row">
						<div class="col-md-8">
							<ul class="list-group">
								<li class="list-group-item d-flex align-items-center">
									<i class="icon-check fs-22 text-primary"></i>
									<span>Hand luggage safety room.</span>
								</li>
								<li class="list-group-item d-flex align-items-center">
									<i class="icon-check fs-22 text-primary"></i>
									<span>Book library available</span>
								</li>
								<li class="list-group-item d-flex align-items-center">
									<i class="icon-check fs-22 text-primary"></i>
									<span>Fast check-in included</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>--%>
		</article>
	</section>
</asp:Content>

