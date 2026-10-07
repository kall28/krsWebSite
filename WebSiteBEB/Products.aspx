<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="Products, App_Web_products.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">	﻿
	<script src="js/web.prod-1.0.js"></script>
	<!-- Page Title-->
    <div class="page-title-overlap bg-darkBlack">
        <div class="container d-lg-flex justify-content-between ">
            <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                        <li class="breadcrumb-item"><a class="text-nowrap" href="javascript:void(0)" id="lnkBCHome"><i class="czi-home"></i>Home</a></li>
                        <li class="breadcrumb-item text-nowrap active" aria-current="page">Bookshop</li>
                    </ol>
                </nav>
            </div>
            <div class="order-lg-1 pr-lg-4 text-center text-lg-left">
                <h1 class="h3 text-light mb-0">Filter </h1>
            </div>
        </div>
    </div>
    <!-- Page Content-->
    <div class="container pb-5 mb-2 mb-md-4">
        <div class="row">
            <!-- Sidebar-->
            <aside class="col-lg-4">
                <!-- Sidebar-->
                <div class="cz-sidebar rounded-lg box-shadow-lg" id="shop-sidebar">
                    <div class="cz-sidebar-header box-shadow-sm">
                        <button class="close ml-auto" type="button" data-dismiss="sidebar" aria-label="Close">
                            <span class="d-inline-block font-size-xs font-weight-normal align-middle">Close sidebar</span><span class="d-inline-block align-middle ml-2" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="cz-sidebar-body">
                        <!-- Categories-->
                        <div class="widget widget-categories mb-3 pb-3 ">
                            <h3 class="widget-title">Categories</h3>
                            <div class="accordion mt-n1" id="shop-categories">
                                <!-- Shoes-->
                                <div class="card border-bottom">
                                    <div class="card-header">
                                        <h3 class="accordion-heading">
                                            <a class="collapsed" href="#shoes" role="button"
                                               data-toggle="collapse" aria-expanded="false" aria-controls="shoes">
                                                Language<span class="accordion-indicator"></span>
                                            </a>
                                        </h3>
                                    </div>
                                    <div class="collapse" id="shoes" data-parent="#shop-categories">
                                        <div class="card-body">
                                            <asp:Literal ID="xlitFilterLanguages" runat="server"></asp:Literal>
                                            <%--<div class="widget widget-links cz-filter">
                                                <ul class="widget-list cz-filter-list pt-1" data-simplebar data-simplebar-auto-hide="false">
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">English</span><span class="font-size-xs text-muted ml-3">247</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">Hindi</span><span class="font-size-xs text-muted ml-3">156</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">Odia</span><span class="font-size-xs text-muted ml-3">310</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                                <!-- Clothing-->
                                <div class="card border-bottom">
                                    <div class="card-header">
                                        <h3 class="accordion-heading">
                                            <a href="#clothing" role="button" data-toggle="collapse"
                                               aria-expanded="true" aria-controls="clothing">
                                                Category<span class="accordion-indicator"></span>
                                            </a>
                                        </h3>
                                    </div>
                                    <div class="collapse show" id="clothing" data-parent="#shop-categories">
                                        <div class="card-body">
                                            <asp:Literal ID="xlitFilterCategories" runat="server"></asp:Literal>
                                            <%--<div class="widget widget-links cz-filter">
                                                <div class="input-group-overlay input-group-sm mb-2">
                                                    <input class="cz-filter-search form-control form-control-sm appended-form-control" type="text"
                                                           placeholder="Search">
                                                    <div class="input-group-append-overlay">
                                                        <span class="input-group-text">
                                                            <i class="czi-search"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                                <ul class="widget-list cz-filter-list pt-1" style="height: 12rem;" data-simplebar
                                                    data-simplebar-auto-hide="false">

                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">Autobiography</span><span class="font-size-xs text-muted ml-3">87</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">Culture</span><span class="font-size-xs text-muted ml-3">87</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">Fiction</span><span class="font-size-xs text-muted ml-3">87</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">History</span><span class="font-size-xs text-muted ml-3">87</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">Memoir</span><span class="font-size-xs text-muted ml-3">87</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">Mythology</span><span class="font-size-xs text-muted ml-3">87</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">Non-Fiction</span><span class="font-size-xs text-muted ml-3">87</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">Novel</span><span class="font-size-xs text-muted ml-3">87</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">Poetry</span><span class="font-size-xs text-muted ml-3">87</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">Science</span><span class="font-size-xs text-muted ml-3">87</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">Short Story </span><span class="font-size-xs text-muted ml-3">87</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">Translation</span><span class="font-size-xs text-muted ml-3">87</span>
                                                        </a>
                                                    </li>
                                                    <li class="widget-list-item cz-filter-item">
                                                        <a class="widget-list-link d-flex justify-content-between align-items-center"
                                                           href="shop-grid-ls.html#">
                                                            <span class="cz-filter-item-text">
                                                                Travelog (1)
                                                            </span><span class="font-size-xs text-muted ml-3">87</span>
                                                        </a>
                                                    </li>

                                                </ul>
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Price range-->
                        <%--<div class="widget mb-2 pb-2">
                            <h3 class="widget-title">Price</h3>
                            <div class="cz-range-slider" data-start-min="250" data-start-max="680" data-min="0" data-max="1000"
                                 data-step="1">
                                <div class="cz-range-slider-ui"></div>
                                <div class="d-flex pb-1">
                                    <div class="w-50 pr-2 mr-2">
                                        <div class="input-group input-group-sm">
                                            <div class="input-group-prepend"><span class="input-group-text">$</span></div>
                                            <input class="form-control cz-range-slider-value-min" type="text">
                                        </div>
                                    </div>
                                    <div class="w-50 pl-2">
                                        <div class="input-group input-group-sm">
                                            <div class="input-group-prepend"><span class="input-group-text">$</span></div>
                                            <input class="form-control cz-range-slider-value-max" type="text">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </aside>
            <!-- Content  -->
            <section class="col-lg-8">
                <!-- Toolbar-->
                <div class="d-flex justify-content-center justify-content-sm-between align-items-center pt-2 pb-4 pb-sm-5">
                    <div class="d-flex flex-wrap">
                        <div class="form-inline flex-nowrap mr-3 mr-sm-4 pb-3">
                            <label class="text-light opacity-75 text-nowrap mr-2 d-none d-sm-block" for="sorting">Sort by:</label>
                            <select class="form-control custom-select" id="ddlSorting">
                                <option value="0">Published Date</option>
                                <option value="1">A - Z Order</option>
                                <option value="2">Z - A Order</option>
                            </select>
                            <span class="font-size-sm text-light opacity-75 text-nowrap ml-2 d-none d-md-block" id="spnNoOfProducts">
                                
                            </span>
                        </div>
                    </div>
                    <%--<div class="d-flex pb-3">
                        <a class="nav-link-style nav-link-light mr-3" href="shop-grid-ls.html#">
                            <i class="czi-arrow-left"></i>
                        </a><span class="font-size-md text-light">1 / 5</span><a class="nav-link-style nav-link-light ml-3" href="shop-grid-ls.html#"><i class="czi-arrow-right"></i></a>
                    </div>--%>
                    <!-- <div class="d-none d-sm-flex pb-3"><a
                        class="btn btn-icon nav-link-style bg-light text-dark disabled opacity-100 mr-2"
                        href="shop-grid-ls.html#"><i class="czi-view-grid"></i></a><a
                        class="btn btn-icon nav-link-style nav-link-light" href="shop-list-ls.html"><i
                          class="czi-view-list"></i></a></div> -->
                </div>
                <!-- Products grid-->
                <div class="row mx-n2" id="divProductLst">
                    <%--<!-- Product-->
                    <div class="col-md-4 col-sm-6 px-2 mb-4">
                        <div class="card product-card">
                            <div class="product-card-actions d-flex align-items-center">
                                <button class="btn-wishlist btn-sm" type="button" data-toggle="tooltip" data-placement="left"
                                        title="Add to wishlist">
                                    <i class="czi-heart"></i>
                                </button>
                            </div><a class="card-img-top d-block overflow-hidden" href="shop-single-v2.html">
                                <img src="images/book_01.png"
                                     alt="Product">
                            </a>
                            <div class="card-body py-2">
                                <h3 class="product-title font-size-sm">
                                    <a href="shop-single-v2.html">
                                        Treasure Walks
                                    </a>
                                </h3>
                                <!-- <a class="product-meta d-block font-size-xs pb-1" href="#">By: Prasanta
                                  Behera</a> -->
                                <div class="d-flex justify-content-between cardPricHdr">
                                    <div class="product-price"><span class="text-accent">$19.<small>00</small></span></div>

                                    <button class="btn btn-primary btn-sm mb-2" type="button" data-toggle="toast" data-target="#cart-toast">
                                        <i class="czi-cart font-size-sm mr-1"></i>ADD
                                    </button>

                                </div>
                            </div>
                            <div class="card-body card-body-hidden">

                                <div class="text-center">
                                    <a class="nav-link-style font-size-ms" href="#quick-view"
                                       data-toggle="modal"><i class="czi-eye align-middle mr-1"></i>Quick view</a>
                                </div>
                            </div>
                        </div>
                        <hr class="d-sm-none">
                    </div>
                    <!-- Product-->
                    <div class="col-md-4 col-sm-6 px-2 mb-4">
                        <div class="card product-card">
                            <div class="product-card-actions d-flex align-items-center">
                                <button class="btn-wishlist btn-sm" type="button" data-toggle="tooltip" data-placement="left"
                                        title="Add to wishlist">
                                    <i class="czi-heart"></i>
                                </button>
                            </div><a class="card-img-top d-block overflow-hidden" href="shop-single-v2.html">
                                <img src="images/book_01.png"
                                     alt="Product">
                            </a>
                            <div class="card-body py-2">
                                <h3 class="product-title font-size-sm">
                                    <a href="shop-single-v2.html">
                                        Treasure Walks
                                    </a>
                                </h3>
                                <!-- <a class="product-meta d-block font-size-xs pb-1" href="#">By: Prasanta
                                  Behera</a> -->
                                <div class="d-flex justify-content-between cardPricHdr">
                                    <div class="product-price"><span class="text-accent">$19.<small>00</small></span></div>

                                    <button class="btn btn-primary btn-sm mb-2" type="button" data-toggle="toast" data-target="#cart-toast">
                                        <i class="czi-cart font-size-sm mr-1"></i>ADD
                                    </button>

                                </div>
                            </div>
                            <div class="card-body card-body-hidden">

                                <div class="text-center">
                                    <a class="nav-link-style font-size-ms" href="#quick-view"
                                       data-toggle="modal"><i class="czi-eye align-middle mr-1"></i>Quick view</a>
                                </div>
                            </div>
                        </div>
                        <hr class="d-sm-none">
                    </div>
                    <!-- Product-->
                    <div class="col-md-4 col-sm-6 px-2 mb-4">
                        <div class="card product-card">
                            <div class="product-card-actions d-flex align-items-center">
                                <button class="btn-wishlist btn-sm" type="button" data-toggle="tooltip" data-placement="left"
                                        title="Add to wishlist">
                                    <i class="czi-heart"></i>
                                </button>
                            </div><a class="card-img-top d-block overflow-hidden" href="shop-single-v2.html">
                                <img src="images/book_01.png"
                                     alt="Product">
                            </a>
                            <div class="card-body py-2">
                                <h3 class="product-title font-size-sm">
                                    <a href="shop-single-v2.html">
                                        Treasure Walks
                                    </a>
                                </h3>
                                <!-- <a class="product-meta d-block font-size-xs pb-1" href="#">By: Prasanta
                                  Behera</a> -->
                                <div class="d-flex justify-content-between cardPricHdr">
                                    <div class="product-price"><span class="text-accent">$19.<small>00</small></span></div>

                                    <button class="btn btn-primary btn-sm mb-2" type="button" data-toggle="toast" data-target="#cart-toast">
                                        <i class="czi-cart font-size-sm mr-1"></i>ADD
                                    </button>

                                </div>
                            </div>
                            <div class="card-body card-body-hidden">

                                <div class="text-center">
                                    <a class="nav-link-style font-size-ms" href="#quick-view"
                                       data-toggle="modal"><i class="czi-eye align-middle mr-1"></i>Quick view</a>
                                </div>
                            </div>
                        </div>
                        <hr class="d-sm-none">
                    </div>
                    <!-- Product-->
                    <div class="col-md-4 col-sm-6 px-2 mb-4">
                        <div class="card product-card">
                            <div class="product-card-actions d-flex align-items-center">
                                <button class="btn-wishlist btn-sm" type="button" data-toggle="tooltip" data-placement="left"
                                        title="Add to wishlist">
                                    <i class="czi-heart"></i>
                                </button>
                            </div><a class="card-img-top d-block overflow-hidden" href="shop-single-v2.html">
                                <img src="images/book_01.png"
                                     alt="Product">
                            </a>
                            <div class="card-body py-2">
                                <h3 class="product-title font-size-sm">
                                    <a href="shop-single-v2.html">
                                        Treasure Walks
                                    </a>
                                </h3>
                                <!-- <a class="product-meta d-block font-size-xs pb-1" href="#">By: Prasanta
                                  Behera</a> -->
                                <div class="d-flex justify-content-between cardPricHdr">
                                    <div class="product-price"><span class="text-accent">$19.<small>00</small></span></div>

                                    <button class="btn btn-primary btn-sm mb-2" type="button" data-toggle="toast" data-target="#cart-toast">
                                        <i class="czi-cart font-size-sm mr-1"></i>ADD
                                    </button>

                                </div>
                            </div>
                            <div class="card-body card-body-hidden">

                                <div class="text-center">
                                    <a class="nav-link-style font-size-ms" href="#quick-view"
                                       data-toggle="modal"><i class="czi-eye align-middle mr-1"></i>Quick view</a>
                                </div>
                            </div>
                        </div>
                        <hr class="d-sm-none">
                    </div>--%>
                </div>
                <hr class="my-3">
                <!-- Pagination-->
                <%--<nav class="d-flex justify-content-between pt-2" aria-label="Page navigation">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="shop-grid-ls.html#">
                                <i class="czi-arrow-left mr-2"></i>Prev
                            </a>
                        </li>
                    </ul>
                    <ul class="pagination">
                        <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 5</span></li>
                        <li class="page-item active d-none d-sm-block" aria-current="page">
                            <span class="page-link">
                                1<span class="sr-only">(current)</span>
                            </span>
                        </li>
                        <li class="page-item d-none d-sm-block"><a class="page-link" href="shop-grid-ls.html#">2</a></li>
                        <li class="page-item d-none d-sm-block"><a class="page-link" href="shop-grid-ls.html#">3</a></li>
                        <li class="page-item d-none d-sm-block"><a class="page-link" href="shop-grid-ls.html#">4</a></li>
                        <li class="page-item d-none d-sm-block"><a class="page-link" href="shop-grid-ls.html#">5</a></li>
                    </ul>
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="shop-grid-ls.html#" aria-label="Next">
                                Next<i class="czi-arrow-right ml-2"></i>
                            </a>
                        </li>
                    </ul>
                </nav>--%>
            </section>
        </div>
    </div>
</asp:Content>

