<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="AuthorDetails, App_Web_authordetails.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.author-details-1.0.js"></script>
	<!-- Page Title-->
	<div class="page-title-overlap bg-darkBlack ">
		<div class="container d-lg-flex breadcrumbWrap">
			<div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
						<li class="breadcrumb-item"><a class="text-nowrap" href="javascript:void(0)" id="lnkBCHome"><i class="czi-home"></i>Home</a></li>
						<li class="breadcrumb-item text-nowrap">
                            <a href="javascript:void(0)" id="lnkBCAuthors">Authors</a>
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
        <!-- Gallery + details-->
        <div class="bg-light box-shadow-lg rounded-lg ">
            <div class="order-lg-1 pr-lg-4 text-center text-lg-left p-2">
                <h1 class="h3 pt-3 pl-3">About Author</h1>
            </div>
            <div class="px-lg-3">
                <div class="row justify-content-between">
                    <!-- Product gallery-->
                    <div class="col-lg-5 pr-lg-0 ">
                        <div class="cz-product-gallery">
                            <div class="cz-preview order-sm-2">
                                <asp:Literal ID="xlitAuthorImg" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div>
                    <!-- Product details-->
                    <div class="col-md-6 px-3 px-md-5 py-5">
                        <div class="mx-auto py-lg-5" style="max-width: 35rem;">
                            <h2 class="h3 pb-3">
								<asp:Literal ID="xlitAuthorTitle" runat="server"></asp:Literal>
                            </h2>
                            <p class="font-size-sm pb-3 text-muted">
                                <asp:Literal ID="xlitAuthorDesc" runat="server"></asp:Literal>
                            </p>
							<%--<a class="btn btn-primary btn-shadow" href="shop-grid-ls.html">View products</a>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container py-5 my-md-3">
        <h2 class="h3 text-center pb-4">Books</h2>
        <div class="cz-carousel cz-controls-static cz-controls-outside">
            <div class="cz-carousel-inner"
                 data-carousel-options="{&quot;items&quot;: 1, &quot;controls&quot;: true, &quot;nav&quot;: false, &quot;autoHeight&quot;: true, &quot;autoWidth&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2, &quot;gutter&quot;: 18},&quot;768&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 20}, &quot;1100&quot;:{&quot;items&quot;:4, &quot;gutter&quot;: 30}}}">
                <asp:Literal ID="xlitAuthorProdLst" runat="server"></asp:Literal>
            </div>
        </div>
    </div>	
</asp:Content>

