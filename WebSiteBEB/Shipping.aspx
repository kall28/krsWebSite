<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="Shipping, App_Web_shipping.aspx.cdcab7d2" %>
<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<script src="js/web.shipping-1.0.js"></script>
	<!-- Page Title-->
    <div class="page-title-overlap bg-darkBlack">
        <div class="container d-lg-flex justify-content-between ">
            <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                        <li class="breadcrumb-item"><a class="text-nowrap" href="javascript:void(0)" id="lnkBCHome"><i class="czi-home"></i>Home</a></li>
                        <li class="breadcrumb-item text-nowrap">
                            <a href="javascript:void(0)" id="lnkBCShop">Book Shop</a>
                        </li>
                        <li class="breadcrumb-item text-nowrap active" aria-current="page">Shipping</li>
                    </ol>
                </nav>
            </div>
            <div class="order-lg-1 pr-lg-4 text-center text-lg-left">
                <h1 class="h3 text-light mb-0">Shipping</h1>
            </div>
        </div>
    </div>
	<!-- Page Content-->
    <div class="container pb-5 mb-2 mb-md-4">
        <div class="row">
            <section class="col-lg-8">
                <!-- Steps-->
                <div class="steps steps-light pt-2 pb-3 mb-5">
                    <a class="step-item active" href="javascript:void(0)" id="lnkCartNavCart">
                        <div class="step-progress"><span class="step-count">1</span></div>
                        <div class="step-label"><i class="czi-cart"></i>Cart</div>
                    </a><a class="step-item active" href="javascript:void(0)" id="lnkCartNavDetails">
                        <div class="step-progress"><span class="step-count">2</span></div>
                        <div class="step-label"><i class="czi-user-circle"></i>Your details</div>
                    </a><a class="step-item active current" href="javascript:void(0)">
                        <div class="step-progress"><span class="step-count">3</span></div>
                        <div class="step-label"><i class="czi-package"></i>Shipping</div>
                    </a><a class="step-item" href="javascript:void(0)">
                        <div class="step-progress"><span class="step-count">4</span></div>
                        <div class="step-label"><i class="czi-card"></i>Payment</div>
                    <%--</a><a class="step-item" href="javascript:void(0)">
                        <div class="step-progress"><span class="step-count">4</span></div>
                        <div class="step-label"><i class="czi-check-circle"></i>Review</div>
                    </a>--%>
                </div>
                <!-- Shipping methods table-->
                <h2 class="h6 pb-3 mb-2">Choose shipping method</h2>
                <div class="table-responsive" id="divShippingMethod">
                    <%--<table class="table table-hover font-size-sm border-bottom">
                        <thead>
                            <tr>
                                <th class="align-middle"></th>
                                <th class="align-middle">Shipping method</th>
                                <th class="align-middle">Delivery time</th>
                                <th class="align-middle">Handling fee</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="custom-control custom-radio mb-4">
                                        <input class="custom-control-input" type="radio" id="courier" name="shipping-method" checked>
                                        <label class="custom-control-label" for="courier"></label>
                                    </div>
                                </td>
                                <td class="align-middle"><span class="text-dark font-weight-medium">Courier</span><br><span class="text-muted">All addresses (default zone), United States &amp; Canada</span></td>
                                <td class="align-middle">2 - 4 days</td>
                                <td class="align-middle">$26.50</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="custom-control custom-radio mb-4">
                                        <input class="custom-control-input" type="radio" id="local" name="shipping-method">
                                        <label class="custom-control-label" for="local"></label>
                                    </div>
                                </td>
                                <td class="align-middle"><span class="text-dark font-weight-medium">Local Shipping</span><br><span class="text-muted">All addresses (default zone), United States &amp; Canada</span></td>
                                <td class="align-middle">up to one week</td>
                                <td class="align-middle">$10.00</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="custom-control custom-radio mb-4">
                                        <input class="custom-control-input" type="radio" id="flat" name="shipping-method">
                                        <label class="custom-control-label" for="flat"></label>
                                    </div>
                                </td>
                                <td class="align-middle"><span class="text-dark font-weight-medium">Flat Rate</span><br><span class="text-muted">All addresses (default zone)</span></td>
                                <td class="align-middle">5 - 7 days</td>
                                <td class="align-middle">$33.85</td>
                            </tr>

                        </tbody>
                    </table>--%>
                </div>

                <!-- Navigation (desktop)-->
                <div class="d-none d-lg-flex pt-4 mt-3">
                    <div class="w-50 pr-3">
                        <a class="btn btn-secondary btn-block" href="javascript:void(0)" id="lnkBackToDetails">
                            <i class="czi-arrow-left mt-sm-0 mr-1"></i><span class="d-none d-sm-inline">Back to Addresses</span><span class="d-inline d-sm-none">Back</span>
                        </a>
                    </div>
                    <div class="w-50 pl-2">
                        <a class="btn btn-primary btn-block" href="javascript:void(0)" id="lnkProceed">
                            <span class="d-none d-sm-inline">Proceed to Payment</span><span class="d-inline d-sm-none">Next</span><i class="czi-arrow-right mt-sm-0 ml-1"></i>
                        </a>
                    </div>
                </div>
            </section>
            <!-- Sidebar-->
            <aside class="col-lg-4 pt-4 pt-lg-0">
                <div class="cz-sidebar-static rounded-lg box-shadow-lg ml-lg-auto">   
                    <asp:Literal ID="xlitOrderSummary" runat="server"></asp:Literal>
                </div>
            </aside>
        </div>
        <!-- Navigation (mobile)-->
        <div class="row d-lg-none">
            <div class="col-lg-8">
                <div class="d-flex pt-4 mt-3">
                    <div class="w-50 pr-3">
                        <a class="btn btn-secondary btn-block" href="javascript:void(0)" id="lnkBackToDetailsMob">
                            <i class="czi-arrow-left mt-sm-0 mr-1"></i><span class="d-none d-sm-inline">Back to Addresses</span><span class="d-inline d-sm-none">Back</span>
                        </a>
                    </div>
                    <div class="w-50 pl-2">
                        <a class="btn btn-primary btn-block" href="javascript:void(0)" id="lnkProceedMob">
                            <span class="d-none d-sm-inline">Proceed to Payment</span><span class="d-inline d-sm-none">Next</span><i class="czi-arrow-right mt-sm-0 ml-1"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

