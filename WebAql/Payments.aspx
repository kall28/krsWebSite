<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="Payments, App_Web_payments.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.pay-1.0.js"></script>
	<!-- breadcrumbs -->
	<section class="breadcrumbs separator-bottom">
		<div class="container">
			<div class="row">
				<div class="col">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('home');">Home</a></li>
							<li class="breadcrumb-item"><a href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('products');">Shop</a></li>
							<li class="breadcrumb-item active" aria-current="page">Payment</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>

	<!-- hero -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<h1>Payment</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="no-overflow pt-0">
		<div class="container">
			<div class="row gutter-4 justify-content-between">
				<div class="col-lg-8">
					<div class="row align-items-end mb-2">
						<div class="col-md-6">
							<h2 class="h3 mb-0">Address</h2>
						</div>
						<div class="col-md-6 text-md-right">
							<a href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('checkout')" class="eyebrow unedrline action">Change Address</a>
						</div>
					</div>
					<!-- addresses -->
					<div class="row">
						<asp:Literal ID="xlitDeliveryAdd" runat="server"></asp:Literal>
					</div>
					<!-- payment -->
					<div class="row align-items-end mb-2">
						<div class="col-md-6">
							<h2 class="h3 mb-0">Payment</h2>
						</div>
					</div>
					<div class="row gutter-1 mb-6">
						<div class="col-12 pb-1">
							<ul class="nav nav-tabs lavalamp" id="payTab" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" id="cod-tab" data-toggle="tab" href="#cod-tab-content" role="tab"
										aria-controls="payTabContent" aria-selected="true">Cash On Delivery</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="cc-tab" data-toggle="tab" href="#cc-tab-content" role="tab"
										aria-controls="payTabContent" aria-selected="false">Credit/Debit Card</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="nb-tab" data-toggle="tab" href="#nb-tab-content" role="tab"
										aria-controls="payTabContent" aria-selected="false">Netbanking</a>
								</li>
							</ul>
						</div>
						<div class="col-12">
							<div class="tab-content" id="payTabContent">
								<div class="tab-pane fade show active" id="cod-tab-content" role="tabpanel" aria-labelledby="cod-tab-content">
									<div class="row gutter-1">
										<div class="col-md-4">
											<a href="javascript:void(0)" id="lnkPlaceOrderCOD" class="btn btn-block btn-primary">Place Order</a>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="cc-tab-content" role="tabpanel" aria-labelledby="cc-tab-content">
									<div class="row gutter-1">
										<h6 class="h6 mb-0">Comming Soon</h6>
									</div>
								</div>
								<div class="tab-pane fade" id="nb-tab-content" role="tabpanel" aria-labelledby="nb-tab-content">
									<div class="row gutter-1">
										<h6 class="h6 mb-0">Comming Soon</h6>
									</div>
								</div>
							</div>
						</div>
						<%--<div class="col-12">
							<div class="custom-control custom-switch mb-2">
								<input type="checkbox" class="custom-control-input" id="customSwitch1">
								<label class="custom-control-label text-muted" for="customSwitch1">
									Billing address same as delivery.</label>
							</div>
						</div>--%>
					</div>

					<%--<!-- shipping -->
					<div class="row align-items-end mb-2">
						<div class="col-md-6">
							<h2 class="h3 mb-0"><span class="text-muted">03.</span> Shipping</h2>
						</div>
					</div>
					<div class="row gutter-1">
						<div class="col-md-6">
							<div class="custom-control custom-choice">
								<input type="radio" name="choice-shipping" class="custom-control-input" id="choice-shipping-1">
								<label class="custom-control-label text-dark" for="choice-shipping-1">
									<span class="d-flex justify-content-between mb-1 eyebrow">Standard <span
										class="text-muted">Free</span></span>
									Estimated 10-20 days shipping. Lorem Ipsum is simply dummy text of the printing and typesetting.
               
								</label>
								<span class="choice-indicator"></span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="custom-control custom-choice">
								<input type="radio" name="choice-shipping" class="custom-control-input" id="choice-shipping-2">
								<label class="custom-control-label text-dark" for="choice-shipping-2">
									<span class="d-flex justify-content-between mb-1 eyebrow">Express <span
										class="text-muted">₹49</span></span>
									Estimated 10-20 days shipping. Lorem Ipsum is simply dummy text of the printing and typesetting.
               
								</label>
								<span class="choice-indicator"></span>
							</div>
						</div>
					</div>--%>
				</div>
				<aside class="col-lg-4" id="divOrderSummary">
					<asp:Literal ID="xlitOrderSummary" runat="server"></asp:Literal>
					<%--<div class="row">
						<!-- order preview -->
						<div class="col-12">
							<div class="card card-data bg-light">
								<div class="card-header py-2 px-3">
									<div class="row align-items-center">
										<div class="col">
											<h3 class="fs-18 mb-0">Your Cart</h3>
										</div>
										<div class="col text-right">
											<a href="cart.html" class="underline eyebrow">Edit</a>
										</div>
									</div>
								</div>
								<div class="card-body">
									<ul class="list-group list-group-line">
										<li class="list-group-item d-flex justify-content-between text-dark align-items-center">Garden Mix - Farm Fresh Salad Box x1
                     
											<span>₹240</span>
										</li>
										<li class="list-group-item d-flex justify-content-between text-dark align-items-center">Garden Mix - Farm Fresh Salad Box x1
                     
											<span>₹132</span>
										</li>
										<li class="list-group-item d-flex justify-content-between text-dark align-items-center">Garden Mix - Farm Fresh Salad Box x2
                     
											<span>₹46</span>
										</li>
									</ul>
								</div>
							</div>
						</div>

						<!-- order summary -->
						<div class="col-12 mt-1">
							<div class="card card-data bg-light">
								<div class="card-header py-2 px-3">
									<div class="row align-items-center">
										<div class="col">
											<h3 class="fs-18 mb-0">Order Summary</h3>
										</div>
									</div>
								</div>
								<div class="card-body">
									<ul class="list-group list-group-minimal">
										<li class="list-group-item d-flex justify-content-between align-items-center">Subtotal
                     
											<span>₹418</span>
										</li>
										<li class="list-group-item d-flex justify-content-between align-items-center">Shipping
                     
											<span>Free</span>
										</li>
										<li class="list-group-item d-flex justify-content-between align-items-center">Discount
                     
											<span>-25%</span>
										</li>
									</ul>
								</div>
								<div class="card-footer py-2">
									<ul class="list-group list-group-minimal">
										<li class="list-group-item d-flex justify-content-between align-items-center text-dark fs-18">Total
                     
											<span>₹313,5</span>
										</li>
									</ul>
								</div>
							</div>
						</div>

						<!-- place order -->
						<div class="col-12 mt-1">
							<a href="CheckOut.aspx" class="btn btn-primary btn-lg btn-block">Place Order</a>
						</div>

					</div>--%>
				</aside>
			</div>
		</div>
	</section>
</asp:Content>

