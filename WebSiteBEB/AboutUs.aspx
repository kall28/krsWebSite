<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="AboutUs, App_Web_aboutus.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<!-- Page title-->
    <div class="page-title-overlap bg-darkBlack ">
        <div class="container d-lg-flex breadcrumbWrap">
            <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                        <li class="breadcrumb-item"><a class="text-nowrap" href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('home');"><i class="czi-home"></i>Home</a></li>
                        <li class="breadcrumb-item text-nowrap active" aria-current="page">About us</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <!-- Page Content-->
    <div class="container">
        <!-- Gallery + details-->
        <div class="bg-light box-shadow-lg rounded-lg ">
            <main class="container-fluid px-0">
                <!-- Row: Shop online-->
                <asp:Literal ID="xlitMainContent1" runat="server"></asp:Literal>
                <%--<section class="row no-gutters">
                    <div class="col-md-6 bg-position-center bg-size-cover bg-secondary"
                         style="min-height: 15rem; background-image: url(images/abt_01.jpg);">
                    </div>
                    <div class="col-md-6 p-5">
                        <div class="mx-auto py-lg-5" style="max-width: 35rem;">
                            <h2 class="h3 pb-3">Our Mission</h2>
                            <p class="font-size-sm pb-3 text-muted ">
                                As per 2017 census, there are over 4. 4 million Indian families living in USA which is 1.3% of the
                                country's total population. As data shows, in year 2000 the population was 1.6 million and in 2010 it
                                rose to 2.8 million. This fast-growing community has been visibly contributing towards the US economy
                                and its daily life. It’s a prosperous high-achieving ethnic group. Its second and third generations are
                                doing extremely well in Universities and in the job sector. However, as far as Indian literature is
                                concerned, we still need adequate representation in the American book market to disseminate our literary
                                genius and rich cultural heritage. BLACK EAGLE BOOKS aims to address these needs.
                                <br />
                                <br />
                                Another concern is, non-availability of books after few years of publication. Very valuable books are
                                not available in market because of traditional publishing process. Publishers print few editions, after
                                that they stop printing. In the process the book live only for certain years. Using the new POD (Print
                                on Demand) technology, book will always be available to buy.
                                <br />
                                <br />
                                In a nutshell, the goal of this program is to make our literature available to global readers and to
                                keep the book alive in the selling market for ever.
                            </p>

                        </div>
                    </div>
                </section>--%>
                <!-- Row: Delivery-->
                <asp:Literal ID="xlitMainContent2" runat="server"></asp:Literal>
                <%--<section class="row no-gutters">
                    <div class="col-md-6 bg-position-center bg-size-cover bg-secondary order-md-2"
                         style="min-height: 15rem; background-image: url(images/abt_02.jpg);">
                    </div>
                    <div class="col-md-6 px-3 px-md-5 py-5 order-md-1">
                        <div class="mx-auto py-lg-5" style="max-width: 35rem;">
                            <h2 class="h3 pb-3">Our History</h2>
                            <p class="font-size-sm pb-3 text-muted">
                                To propagate Odia literature in North America, an Odia literary journal “PRATISHRUTI” was started in
                                2012 in spite of multiple challenges. Between 2012 and 2018, four issues were published. In the process,
                                new writers and readers were created for Odia literature. Now “Pratishruti” is a part of BLACK EAGLE
                                BOOKS.
                            </p>
                        </div>
                    </div>
                </section>--%>
                <!-- Section: Team-->
                <hr class="hr pb-4 mb-3">
                <section class="container ">
                    <h2 class="h3 my-2">Our core team</h2>
                    <p class="font-size-sm text-muted">People behind your great shopping experience</p>
                    <asp:Literal ID="xlitTeamMain" runat="server"></asp:Literal>
                    <%--<section class="row no-gutters">
                        <div class="col-md-4 ">
                            <img class="card-img-top" src="images/team_01.jpg" alt="Post">
                        </div>
                        <div class="col-md-8 p-2 pl-5">
                            <div class="mx-auto">
                                <h2 class="h3 pb-3">Satya Pattanaik, Director-Global Operations</h2>
                                <p class="font-size-sm pb-3 text-muted ">
                                    Satya immigrated to USA on 21 October 1998 as an Information Technology professional. While
                                    studying in Ravenshaw College, his
                                    first poem was published in Istahar, October 1984 issue. His first short story was published in
                                    Katha, September 2017 issue. He has two poetry collections (Pashanara Prema Sangeeta, Bharat
                                    Bharati 2013 and Jharka Khola Thau, Paschima Publication 2019) and two translation collections
                                    (Kshudragalpara Mrutyu o anyanya biswa galpa, Paschima Publication, 2017 and Ama Nijara Mati o
                                    anyanya biswa kabita, Paschima Publication, 2017) to his credit. To propagate Odia literature in
                                    USA, he started an Odia journal “Pratishruti” in 2012, the last issue was subscribed by more than
                                    250 families in USA, creating a new readership in Odia literature). Collaborating with like-minded
                                    friends, he founded BLACK EAGLE BOOKS on 1 April, 2019 with a goal of propagating Indian
                                    literature globally and bringing out-of-print books back to business. He believes in the global
                                    presence of each literary work, he advocates on editing and translation. He has a dream – to see
                                    an Odia writer getting Nobel award in next 10-15-20 years. He is willing to collaborate such
                                    dreamers to make this happened. He has a goal of publishing 500 books in coming 5 years.
                                </p>
                            </div>
                        </div>
                    </section>--%>
                    <hr class="hr pb-4 mb-3">
                    <div class=" mt-md-2">
                        <!-- Entries grid-->
                        <div class="cz-masonry-grid" data-columns="4">
                            <!-- Entry-->
                            <asp:Literal ID="xlitTeamMembers" runat="server"></asp:Literal>
                            <!-- Entry-->
                            <%--<article class="grid-item">
                                <div class="card">
                                    <img class="card-img-top" src="images/team_02.jpg" alt="Post">
                                    <div class="card-body">
                                        <h2 class="h6 blog-entry-title">
                                            <a href="blog-single.html">Atul Bal, Director-India Operations</a>
                                        </h2>
                                        <p class="font-size-sm">
                                            A multi-talented personality, Atul is a brilliant short story writer, skilled cover designer,
                                            seasoned editor and an economics professor. He too believes that the literature should be
                                            expanded to beyond a geographic boundary.
                                        </p>
                                    </div>
                                </div>
                            </article>--%>
                            <!-- Entry-->
                            <%--<article class="grid-item">
                                <div class="card">
                                    <img class="card-img-top" src="images/team_03.jpg" alt="Post">
                                    <div class="card-body">
                                        <h2 class="h6 blog-entry-title">
                                            <a href="blog-single.html">Ashok Parida, Director-Products</a>
                                        </h2>
                                        <p class="font-size-sm">
                                            Ashok is Odisha’s top layout designer. He has expertise in all kind of DTP and designing software,
                                            printing requirement and overall trend in publishing industry. He works for Odia monthly –
                                            Kadambini. Before, he was working as a layout designer at news daily, Dharitri.
                                        </p>
                                    </div>
                                </div>
                            </article>--%>
                            <!-- Entry-->
                            <%--<article class="grid-item">
                                <div class="card">
                                    <img class="card-img-top" src="images/team_04.jpg" alt="Post">

                                    <div class="card-body">
                                        <h2 class="h6 blog-entry-title">
                                            <a href="blog-single.html">Janaki Ballav Pattanaik, Director- Planning</a>
                                        </h2>

                                    </div>
                                </div>
                            </article>
                            <!-- Entry-->
                            <article class="grid-item">
                                <div class="card">
                                    <img class="card-img-top" src="images/team_06.jpg" alt="Post">

                                    <div class="card-body">
                                        <h2 class="h6 blog-entry-title">
                                            <a href="blog-single.html">Bijay Ketan Pattanaik, Director- Technology</a>
                                        </h2>
                                    </div>
                                </div>
                            </article>--%>


                        </div>

                    </div>
                </section>
                <!-- Section: We are hiring-->

            </main>
        </div>
    </div>
</asp:Content>

