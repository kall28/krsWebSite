<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="Payments, App_Web_payments.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.pay-1.0.js"></script><!-- Page Title-->
    <div class="page-title-overlap bg-darkBlack">
        <div class="container d-lg-flex justify-content-between ">
            <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                        <li class="breadcrumb-item"><a class="text-nowrap" href="javascript:void(0)" id="lnkBCHome"><i class="czi-home"></i>Home</a></li>
                        <li class="breadcrumb-item text-nowrap">
                            <a href="javascript:void(0)" id="lnkBCShop">Book Shop</a>
                        </li>
                        <li class="breadcrumb-item text-nowrap active" aria-current="page">Payment</li>
                    </ol>
                </nav>
            </div>
            <div class="order-lg-1 pr-lg-4 text-center text-lg-left">
                <h1 class="h3 text-light mb-0">Payment</h1>
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
                    </a><a class="step-item active" href="javascript:void(0)" id="lnkCartNavShipping">
                        <div class="step-progress"><span class="step-count">3</span></div>
                        <div class="step-label"><i class="czi-package"></i>Shipping</div>
                    </a><a class="step-item active current" href="javascript:void(0)">
                        <div class="step-progress"><span class="step-count">4</span></div>
                        <div class="step-label"><i class="czi-card"></i>Payment</div>
                    </a>
                    <%--<a class="step-item" href="javascript:void(0)">
                        <div class="step-progress"><span class="step-count">4</span></div>
                        <div class="step-label"><i class="czi-check-circle"></i>Review</div>
                    </a>--%>
                </div>
                <!-- Client details-->
                <div class="bg-secondary rounded-lg px-4 pt-4 pb-2">
                    <div class="row">
                        <div class="col-sm-12">
                            <h4 class="h6">Shipping to:</h4>
                            <asp:Literal ID="xlitDeliveryAdd" runat="server"></asp:Literal>
                            <%--<ul class="list-unstyled font-size-sm">
                                <li><span class="text-muted">Client:&nbsp;</span>Susan Gardner</li>
                                <li><span class="text-muted">Address:&nbsp;</span>44 Shirley Ave. West Chicago, IL 60185, USA</li>
                                <li><span class="text-muted">Phone:&nbsp;</span>+1 (808) 764 554 330</li>
                            </ul>--%>
                        </div>                        
                    </div>
                </div>
                <!-- Payment methods accordion-->
                <br />
                <h2 class="h6 pb-3 mb-2">Choose payment method</h2>
                <div class="accordion mb-2" id="payment-method" role="tablist">
					<div class="card">
                        <div class="card-header" role="tab">
                            <h3 class="accordion-heading"><a href="#cod" data-toggle="collapse"><i class="czi-card font-size-lg mr-2 mt-n1 align-middle"></i>Cash On Delivery<span class="accordion-indicator"></span></a></h3>
                        </div>
                        <div class="collapse show" id="cod" data-parent="#payment-method" role="tabpanel">
                            <div class="card-body">
                                <div class="interactive-credit-card row">
                                    <div class="col-sm-6">
                                        <button class="btn btn-outline-primary btn-block mt-0" type="submit" id="btnPlaceOrderCOD">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab">
                            <h3 class="accordion-heading"><a href="#card" data-toggle="collapse"><i class="czi-card font-size-lg mr-2 mt-n1 align-middle"></i>Pay with Credit Card<span class="accordion-indicator"></span></a></h3>
                        </div>
                        <div class="collapse" id="card" data-parent="#payment-method" role="tabpanel">
                            <div class="card-body">
                                <p>Comming Soon</p>
                                <%--<p class="font-size-sm">We accept following credit cards:&nbsp;&nbsp;<img class="d-inline-block align-middle" src="images/cards.png" style="width: 187px;" alt="Cerdit Cards"></p>
                                <div class="card-wrapper"></div>--%>
                                <%--<div class="interactive-credit-card row">
                                    <div class="form-group col-sm-6">
                                        <input class="form-control" type="text" name="number" placeholder="Card Number" required>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <input class="form-control" type="text" name="name" placeholder="Full Name" required>
                                    </div>
                                    <div class="form-group col-sm-3">
                                        <input class="form-control" type="text" name="expiry" placeholder="MM/YY" required>
                                    </div>
                                    <div class="form-group col-sm-3">
                                        <input class="form-control" type="text" name="cvc" placeholder="CVC" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <button class="btn btn-outline-primary btn-block mt-0" type="submit">Submit</button>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab">
                            <h3 class="accordion-heading"><a class="collapsed" href="#paypal" data-toggle="collapse"><i class="czi-paypal mr-2 align-middle"></i>Pay with PayPal<span class="accordion-indicator"></span></a></h3>
                        </div>
                        <div class="collapse" id="paypal" data-parent="#payment-method" role="tabpanel">
                            <div class="card-body font-size-sm">
                                <p>Comming Soon</p>
                                <%--<p><span class='font-weight-medium'>PayPal</span> - the safer, easier way to pay</p>
                                <div class="row" method="post">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <input class="form-control" type="email" placeholder="E-mail" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <input class="form-control" type="password" placeholder="Password" required>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="d-flex flex-wrap justify-content-between align-items-center">
                                            <a class="nav-link-style" href="checkout-payment.html#">Forgot password?</a>
                                            <button class="btn btn-primary" type="submit">Log In</button>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab">
                            <h3 class="accordion-heading"><a class="collapsed" href="#points" data-toggle="collapse"><i class="czi-gift mr-2"></i>Redeem Reward Points<span class="accordion-indicator"></span></a></h3>
                        </div>
                        <div class="collapse" id="points" data-parent="#payment-method" role="tabpanel">
                            <div class="card-body">
                                <p>Comming Soon</p>
                                <%--<p>You currently have<span class="font-weight-medium">&nbsp;384</span>&nbsp;Reward Points to spend.</p>
                                <div class="custom-control custom-checkbox d-block">
                                    <input class="custom-control-input" type="checkbox" id="use_points">
                                    <label class="custom-control-label" for="use_points">Use my Reward Points to pay for this order.</label>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Navigation (desktop)-->
                <div class="d-none d-lg-flex pt-4 mt-3">
                    <div class="w-50 pr-3">
                        <a class="btn btn-secondary btn-block" href="javascript:void(0)" id="lnkBackToShipping">
                            <i class="czi-arrow-left mt-sm-0 mr-1"></i><span class="d-none d-sm-inline">Back to Shipping</span><span class="d-inline d-sm-none">Back</span>
                        </a>
                    </div>
                    <%--<div class="w-50 pl-2">
                        <a class="btn btn-primary btn-block" href="javascript:void(0)" id="lnkProceed">
                            <span class="d-none d-sm-inline">Proceed to Payment</span><span class="d-inline d-sm-none">Next</span><i class="czi-arrow-right mt-sm-0 ml-1"></i>
                        </a>
                    </div>--%>
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
                        <a class="btn btn-secondary btn-block" href="javascript:void(0)" id="lnkBackToShippingMob">
                            <i class="czi-arrow-left mt-sm-0 mr-1"></i><span class="d-none d-sm-inline">Back to Shipping</span><span class="d-inline d-sm-none">Back</span>
                        </a>
                    </div>
                    <%--<div class="w-50 pl-2">
                        <a class="btn btn-primary btn-block" href="javascript:void(0)" id="lnkProceedMob">
                            <span class="d-none d-sm-inline">Proceed to Payment</span><span class="d-inline d-sm-none">Next</span><i class="czi-arrow-right mt-sm-0 ml-1"></i>
                        </a>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>	
</asp:Content>

