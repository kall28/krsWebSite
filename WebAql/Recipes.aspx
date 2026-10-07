<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="Recipes, App_Web_recipes.aspx.cdcab7d2" %>
<%@ MasterType  VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<!-- hero -->
    <section class="hero hero-small">
        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <h1>Recipes</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('home');">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Recipes</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </section>


    <!-- blog -->
    <section class="pt-0">
        <div class="container">
            <div class="row masonry gutter-1">
                <asp:Literal ID="xlitList" runat="server"></asp:Literal>
               <%-- <div class="col-md-6 col-lg-4">
                    <article class="card card-equal card-scale equal-150 text-white">
                        <div class="image image-overlay" style="background-image: url(images/product-1.jpg)"></div>
                        <a href="post.html">
                            <div class="card-header">
                                <span class="eyebrow mb-1">Category</span>
                                <h3 class="card-title w-75 fs-26">Recepie 1</h3>
                            </div>
                            <div class="card-footer text-right">
                                <span class="btn btn-ico btn-rounded btn-white"><i class="icon-chevron-right"></i></span>
                            </div>
                        </a>
                    </article>
                </div>
                <div class="col-md-6 col-lg-4">
                    <article class="card card-equal card-scale text-white">
                        <div class="image image-overlay" style="background-image: url(images/product-1.jpg)"></div>
                        <a href="post.html">
                            <div class="card-header">
                                <span class="eyebrow mb-1">Category</span>
                                <h3 class="card-title w-75 fs-26">Recepie 2</h3>
                            </div>
                            <div class="card-footer text-right">
                                <span class="btn btn-ico btn-rounded btn-white"><i class="icon-chevron-right"></i></span>
                            </div>
                        </a>
                    </article>
                </div>
                <div class="col-md-6 col-lg-4">
                    <article class="card card-equal card-scale equal-150 text-white">
                        <div class="image image-overlay" style="background-image: url(images/product-1.jpg)"></div>
                        <a href="post.html">
                            <div class="card-header">
                                <span class="eyebrow mb-1">Category</span>
                                <h3 class="card-title w-75 fs-26">Recepie 3</h3>
                            </div>
                            <div class="card-footer text-right">
                                <span class="btn btn-ico btn-rounded btn-white"><i class="icon-chevron-right"></i></span>
                            </div>
                        </a>
                    </article>
                </div>
                <div class="col-md-6 col-lg-4">
                    <article class="card card-equal card-scale equal-150 text-white">
                        <div class="image image-overlay" style="background-image: url(images/product-1.jpg)"></div>
                        <a href="post.html">
                            <div class="card-header">
                                <span class="eyebrow mb-1">Category</span>
                                <h3 class="card-title w-75 fs-26">The Best Street Style From Broklyn's 2016</h3>
                            </div>
                            <div class="card-footer text-right">
                                <span class="btn btn-ico btn-rounded btn-white"><i class="icon-chevron-right"></i></span>
                            </div>
                        </a>
                    </article>
                </div>
                <div class="col-md-6 col-lg-4">
                    <article class="card card-equal card-scale text-white">
                        <div class="image image-overlay" style="background-image: url(images/product-1.jpg)"></div>
                        <a href="post.html">
                            <div class="card-header">
                                <span class="eyebrow mb-1">Category</span>
                                <h3 class="card-title w-75 fs-26">Recepie 4</h3>
                            </div>
                            <div class="card-footer text-right">
                                <span class="btn btn-ico btn-rounded btn-white"><i class="icon-chevron-right"></i></span>
                            </div>
                        </a>
                    </article>
                </div>
                <div class="col-md-6 col-lg-4">
                    <article class="card card-equal card-scale text-white">
                        <div class="image image-overlay" style="background-image: url(images/product-1.jpg)"></div>
                        <a href="post.html">
                            <div class="card-header">
                                <span class="eyebrow mb-1">Category</span>
                                <h3 class="card-title w-75 fs-26">Recepie 5</h3>
                            </div>
                            <div class="card-footer text-right">
                                <span class="btn btn-ico btn-rounded btn-white"><i class="icon-chevron-right"></i></span>
                            </div>
                        </a>
                    </article>
                </div>--%>
            </div>
            <div class="row">
                <div class="col">
                    <%--<nav class="d-inline-block">
                        <ul class="pagination">
                            <li class="page-item active"><a class="page-link" href="post.html">1 <span class="sr-only">(current)</span></a></li>
                            <li class="page-item" aria-current="page"><a class="page-link" href="post.html">2</a></li>
                            <li class="page-item"><a class="page-link" href="post.html">3</a></li>
                            <li class="page-item"><a class="page-link" href="post.html">4</a></li>
                        </ul>
                    </nav>--%>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

