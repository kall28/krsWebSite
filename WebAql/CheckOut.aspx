<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="CheckOut, App_Web_checkout.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.comm.add-1.0.js"></script>
	<script src="js/web.checkout-1.0.js"></script>
	<!-- breadcrumbs -->
	<section class="breadcrumbs separator-bottom">
		<div class="container">
			<div class="row">
				<div class="col">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('home');">Home</a></li>
							<li class="breadcrumb-item"><a href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('products');">Shop</a></li>
							<li class="breadcrumb-item active" aria-current="page">Checkout</li>
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
					<h1>Checkout</h1>
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
							<a href="javascript:void(0)" class="eyebrow unedrline action" >Manage Addresses</a>
						</div>
					</div>
					<!-- addresses -->
					<div class="row gutter-2" id="divAddresses">
						<%--<div class="col-md-6">
							<div class="card card-data">
								<div class="card-header card-header-options">
									<div class="row align-items-center">
										<div class="col">
											<h3 class="card-title">Address 1</h3>
										</div>
										<div class="col text-right">
											<div class="dropdown">
												<button id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false" type="button" class="btn btn-lg btn-secondary btn-ico">
													<i
														class="icon-more-vertical"></i>
												</button>
												<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
													<li>
														<a class="dropdown-item" data-toggle="modal" data-target="#editAddress">Edit</a>
													</li>
													<li>
														<a class="dropdown-item" data-toggle="modal" data-target="#alert">Delete</a>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body w-75">
									<h5 class="eyebrow text-muted">Where</h5>
									<p class="card-text">
										1620 East Ayre Str
                Suite M3115662
                Wilmington, DE 19804
                United States
									</p>
									<h5 class="eyebrow text-muted">To</h5>
									<p class="card-text">Michael Doe</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card card-data">
								<div class="card-header card-header-options">
									<div class="row align-items-center">
										<div class="col">
											<h3 class="card-title">Address 2</h3>
										</div>
										<div class="col text-right">
											<div class="dropdown">
												<button id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false" type="button" class="btn btn-lg btn-secondary btn-ico">
													<i class="icon-more-vertical"></i>
												</button>
												<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
													<li>
														<a class="dropdown-item" data-toggle="modal" data-target="#editAddress">Edit</a>
													</li>
													<li>
														<a class="dropdown-item" data-toggle="modal" data-target="#alert">Delete</a>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body w-75">
									<h5 class="eyebrow text-muted">Michael Doe</h5>
									<p class="card-text">
										1620 East Ayre Str
										Suite M3115662
										Wilmington, DE 19804
										United States
									</p>
									<p class="card-text">
										<a href="#" class="btn btn-primary">Select Address</a>
									</p>
								</div>
							</div>
						</div>--%>
					</div>
					<div class="row">
						<div class="col">
							<h3>Add New Address</h3>
						</div>
					</div>
					<div class="row gutter-1">
						<div class="col-6 col-md-6">
							<div class="form-group">
								<label for="txtNewStreet">First Name</label>
								<input id="txtNewFirstName" type="text" class="form-control" placeholder="">
							</div>
						</div>
						<div class="col-6 col-md-6">
							<div class="form-group">
								<label for="txtNewStreet">Last Name</label>
								<input id="txtNewLastName" type="text" class="form-control" placeholder="">
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="cardNumber">Address</label>
								<input id="txtNewAddress1" type="text" class="form-control" placeholder="">
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="cardNumber"></label>
								<input id="txtNewAddress2" type="text" class="form-control" placeholder="">
							</div>
						</div>
						<div class="col-6 col-md-6">
							<div class="form-group">
								<label for="txtNewStreet">Street</label>
								<input id="txtNewStreet" type="text" class="form-control" placeholder="">
							</div>
						</div>
						<div class="col-6 col-md-6">
							<div class="form-group">
								<label for="txtNewStreet">Landmark</label>
								<input id="txtNewLandmark" type="text" class="form-control" placeholder="">
							</div>
						</div>
						<div class="col-6 col-md-3">
							<div class="form-group">
								<label for="city">Country</label>
								<input id="txtNewCountry" type="text" class="form-control" value="India" disabled>
							</div>
						</div>
						<div class="col-6 col-md-3">
							<div class="form-group">
								<label for="city">State</label>
								<input id="txtNewState" type="text" class="form-control" value="Maharashtra" disabled>
							</div>
						</div>
						<div class="col-6 col-md-3">
							<div class="form-group">
								<label for="city">City</label>
								<input id="txtNewCity" type="text" class="form-control" value="Mumbai" disabled>
							</div>
						</div>
						<div class="col-6 col-md-3">
							<div class="form-group">
								<label for="cardNumber2">Area</label>
								<select class="custom-select" id="ddlArea">
                                    <option selected>Select Area</option>
                                </select>
							</div>
						</div>
						<div class="col-12">
							<a href="javascript:void(0)" id="lnkAddAddress" class="btn btn-primary">Add</a>
						</div>
					</div>
					<!-- payment -->
					<%--<div class="row align-items-end mb-2">
						<div class="col-md-6">
							<h2 class="h3 mb-0"><span class="text-muted">02.</span> Payment</h2>
						</div>
						<div class="col-md-6 text-md-right">
							<a class="eyebrow unedrline action" data-toggle="modal" data-target="#payments">My payment methods</a>
						</div>
					</div>
					<div class="row gutter-1 mb-6">
						<div class="col-12 pb-1">
							<ul class="nav nav-tabs lavalamp" id="myTab" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" id="home-tab" data-toggle="tab" href="checkout.html#home" role="tab"
										aria-controls="home" aria-selected="true">Credit/Debit Card</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="profile-tab" data-toggle="tab" href="checkout.html#profile" role="tab"
										aria-controls="profile" aria-selected="false">Netbanking</a>
								</li>
							</ul>
						</div>
						<div class="col-12">
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
									<div class="row gutter-1">
										<div class="form-group col-12">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text" id="basic-addon1"><i class="icon-credit-card"></i></span>
												</div>
												<input type="tel" class="form-control" placeholder="Card Number" aria-label="Username"
													aria-describedby="basic-addon1">
											</div>
										</div>
										<div class="form-group col-md-6">
											<label for="nameOnCard">Name on Card</label>
											<input type="text" class="form-control" id="nameOnCard" placeholder="">
										</div>
										<div class="form-group col-md-3">
											<label for="month">Month</label>
											<input type="date" class="form-control" id="month">
										</div>
										<div class="form-group col-md-3">
											<label for="cvv">CVV</label>
											<input type="password" class="form-control" id="cvv" placeholder="">
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
									<div class="row gutter-1">
										<div class="form-group col-md-8">
											<input type="email" class="form-control" id="mail" placeholder="Email">
										</div>
										<div class="form-group col-md-4">
											<a href="checkout.html#!" class="btn btn-block btn-secondary">Pay with paypal</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="custom-control custom-switch mb-2">
								<input type="checkbox" class="custom-control-input" id="customSwitch1">
								<label class="custom-control-label text-muted" for="customSwitch1">
									Billing address same as
                  delivery.</label>
							</div>
						</div>
					</div>--%>

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

