<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="Authors, App_Web_authors.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.author-1.0.js"></script>
	<!-- Page Title-->
	<div class="page-title-overlap bg-darkBlack ">
		<div class="container d-lg-flex breadcrumbWrap">
			<div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
						<li class="breadcrumb-item">
							<a class="text-nowrap" href="javascript:void(0)" id="lnkBCHome">
								<i class="czi-home"></i>Home
                            </a>
						</li>
						<li class="breadcrumb-item text-nowrap active" aria-current="page">Authors</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="bg-light box-shadow-lg rounded-lg ">
			<div class="order-lg-1 pr-lg-4 text-center text-lg-left p-2">
				<h2 class="text-center pt-3 pt-md-2 pb-4">Authors</h2>
			</div>
			<section class="container ">
				<div class="cs-masonry-filterable mb-3">
					<ul class="cs-masonry-filters nav nav-tabs justify-content-center mt-2 pb-4">
						<li class="nav-item"><a class="nav-link active" href="#" data-group="all">All</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="a">A</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="b">B</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="c">C</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="d">D</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="e">E</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="f">F</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="g">G</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="h">H</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="i">I</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="j">J</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="k">K</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="l">L</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="m">M</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="n">N</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="o">O</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="p">P</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="q">Q</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="r">R</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="s">S</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="t">T</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="u">U</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="v">V</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="w">W</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="x">X</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="y">Y</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-group="z">Z</a></li>
					</ul>
					<div class="cs-masonry-grid" data-columns="4" id="divAuthorLst">
						<asp:Literal ID="xlitAuthorList" runat="server"></asp:Literal>						
					</div>
				</div>
				<!-- <div class="text-center"><a class="btn btn-primary" href="demo-creative-agency.html#">See More
                        Projects</a></div> -->
			</section>
		</div>
	</div>	
	<script src="js/gallary.min.js"></script>
</asp:Content>
	

