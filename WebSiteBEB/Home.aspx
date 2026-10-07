<%@ page title="" language="C#" masterpagefile="~/MasterPage/SiteMaster.master" autoeventwireup="true" inherits="Home, App_Web_home.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPage" runat="Server">
	<script src="js/web.home-1.0.js"></script>

	<!-- Page Content-->
    <!-- Hero (Banners + Slider)-->
    <section class=" ">
        <div class="container py-xl-2">
            <div class="row">
                <!-- Slider     -->
                <div class="col-xl-12 order-xl-2">
                    <div class="cz-carousel">
                        <div class="cz-carousel-inner"
                             data-carousel-options="{&quot;items&quot;: 1, &quot;controls&quot;: false, &quot;loop&quot;: true, &quot;autoplay&quot;:true}">
                            <div>
                                <div class="row align-items-center">
                                    <div class="col-xl-12 order-md-2">
                                        <img class="d-block mx-auto" src="images/img-01.png"
                                             alt="VR Collection">
                                    </div>
                                    <!-- <div
                                      class="banContHdr col-lg-5 col-md-6 offset-lg-1 order-md-1 pt-4 pb-md-4 text-center text-md-left">
                                      <h2 class="font-weight-light pb-1 from-bottom">World of music with</h2>
                                      <h1 class="display-4 from-bottom delay-1">Headphones</h1>
                                      <h5 class="font-weight-light pb-3 from-bottom delay-2">Choose between top brands</h5><a
                                        class="btn btn-primary btn-shadow scale-up delay-4" href="shop-grid-ls.html">Shop Now<i
                                          class="czi-arrow-right ml-2 mr-n1"></i></a>
                                    </div> -->
                                </div>
                            </div>
                            <div>
                                <div class="row align-items-center">
                                    <div class="col-xl-12 order-md-2">
                                        <img class="d-block mx-auto" src="images/ban_01.jpg"
                                             alt="VR Collection">
                                    </div>
                                    <%--<div class="banContHdr col-lg-5 col-md-6 ml-5 order-md-1 pt-4 pb-md-4 text-center text-md-left">
                                        <h2 class="font-weight-light pb-1 from-bottom">World of books </h2>
                                        <h1 class="display-6 from-bottom delay-1">Buy, Sell, Donate & Publish</h1>
                                        <!-- <h5 class="font-weight-light pb-3 from-bottom delay-2">y</h5> -->
                                        <a class="btn btn-primary btn-shadow scale-up delay-4" href="shop-grid-ls.html">
                                            Shop Now<i class="czi-arrow-right ml-2 mr-n1"></i>
                                        </a>
                                    </div>--%>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Products grid (Trending products)-->
    <div class="sechHdr container ">
        <div class="searchCol">
            <asp:Literal ID="xlitFilterLanguages" runat="server"></asp:Literal>
        </div>
        <div class="searchCol ">
            <asp:Literal ID="xlitFilterCategories" runat="server"></asp:Literal>
        </div>
    </div>
    <section class="container ">
        <!-- Heading-->
        <div class="d-flex flex-wrap justify-content-between align-items-center  pb-2 mb-2">
            <h2 class="h3 mb-0 pt-3 mr-2">New Arrival</h2>
            <div class="pt-3">
                <a id="lnkHomeNewArrivalLoadMore" class="btn btn-outline-accent btn-sm" href="javascript:void(0)">
                    More Books<i class="czi-arrow-right ml-1 mr-n1"></i>
                </a>
            </div>
        </div>
        <!-- Grid-->
        <div class="row pt-2 mx-n2" id="divNewProduct">
            
        </div>
    </section>
    <!-- product 2 -->
    <section class="container">
        <!-- Heading-->
        <div class="d-flex flex-wrap justify-content-between align-items-center pt-1 pb-1 mb-1">
            <div class="bookTag">
                <a href="javascript:void(0)" class="h3 mb-0 mr-2 active">Best Selling Books</a>
            </div>
            <div class="">
                <a id="lnkHomeBestSellingLoadMore" class="btn btn-outline-accent btn-sm" href="javascript:void(0)">
                    More Books<i class="czi-arrow-right ml-1 mr-n1"></i>
                </a>
            </div>
        </div>
        <!-- Grid-->
        <div class="row pt-2 mx-n2" id="divBestProduct">
            
        </div>
    </section>

    <!-- Blog + Instagram info cards-->
    <%--<section class="container-fluid px-0 mb-3">
        <div class="row no-gutters">
            <div class="col-md-4">
                <a class="card border-0 rounded-0 text-decoration-none py-md-4 bg-faded-primary"
                   href="blog-list-sidebar.html">
                    <div class="card-body text-center">
                        <i class="czi-edit h3 mt-2 mb-4 text-primary"></i>
                        <h3 class="h5 mb-1">
                            Academic Books
                        </h3>
                        <p class="text-muted font-size-sm"> Shop Now</p>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a class="card border-0 rounded-0 text-decoration-none py-md-4 bg-faded-accent" href="#">
                    <div class="card-body text-center">
                        <i class="czi-instagram h3 mt-2 mb-4 text-accent"></i>
                        <h3 class="h5 mb-1">
                            Publish Books
                        </h3>
                        <p class="text-muted font-size-sm">Online</p>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a class="card border-0 rounded-0 text-decoration-none py-md-4 bg-faded-success" href="#">
                    <div class="card-body text-center">
                        <i class="czi-instagram h3 mt-2 mb-4 text-accent"></i>
                        <h3 class="h5 mb-1">
                            Paperback
                            Books
                        </h3>
                        <p class="text-muted font-size-sm">Publish</p>
                    </div>
                </a>
            </div>
        </div>
    </section>--%>

    <!-- author page -->
    <section class="container-fluid  py-4 bg-faded-info">
        <div class="container">
            <!-- Heading-->
            <div class="d-flex flex-wrap justify-content-between align-items-center pt-1 pb-2 mb-2">
                <div class="h3 mb-0  mr-2 active mainHead">Author Best Selling</div>
                <div class="">
                    <a id="lnkHomeAllAuthors" class="btn btn-outline-accent btn-sm" href="javascript:void(0)">
                        All Authors<i class="czi-arrow-right ml-1 mr-n1"></i>
                    </a>
                </div>
            </div>
            <!-- Grid-->
            <div class="row mx-n2" id="divAuthorDet">
                
            </div>
            <!-- Product-->
        </div>
    </section>
</asp:Content>

