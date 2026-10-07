<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="ProfileDetails, App_Web_profiledetails.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.comm.add-1.0.js"></script>
	<script src="js/web.profiledet-1.0.js"></script>
	<!-- hero -->
	<section class="hero hero-small bg-purple text-white">
		<div class="container">
			<div class="row gutter-2 gutter-md-4 align-items-end">
				<div class="col-md-6 text-center text-md-left">
					<h1 class="mb-0"><span id="spnUserName" runat="server"></span></h1>
					<span class="text-muted" id="spnNationality" runat="server"></span>
				</div>
				<div class="col-md-6 text-center text-md-right">
					<a href="javascript:void(0)" id="lnkProfileSignOut" class="btn btn-sm btn-outline-white">Sign out</a>
				</div>
			</div>
		</div>
	</section>
	<!-- listing -->
	<section class="pt-5">
		<div class="container">
			<div class="row gutter-4 justify-content-between">
				<!-- sidebar -->
				<aside class="col-lg-3">
					<div class="nav nav-pills flex-column lavalamp" role="tablist">
						<a class="nav-link" data-toggle="tab" href="#" id="lnkProfileTab" role="tab" aria-controls="divProfiledet"
							aria-selected="true">Profile</a>
						<a class="nav-link" data-toggle="tab" href="#" id="lnkOrdersTab" role="tab" aria-controls="divOrderlst"
							aria-selected="false">Orders</a>
						<a class="nav-link" data-toggle="tab" href="#" id="lnkSubsTab" role="tab" aria-controls="divSublst"
							aria-selected="false">Subscriptions</a>
						<a class="nav-link" data-toggle="tab" href="#" id="lnkAddressTab" role="tab" aria-controls="divAddresslst"
							aria-selected="false">Addresses</a>
						<a class="nav-link" data-toggle="tab" href="#" id="lnkWishlstTab" role="tab" aria-controls="divWishlst"
							aria-selected="false">Wishlist</a>
					</div>
				</aside>
				<!-- / sidebar -->

				<!-- content -->
				<div class="col-lg-9">
					<div class="row">
						<div class="col">
							<div class="tab-content" id="myTabContent">
								<!-- profile -->
								<div class="tab-pane fade" id="divProfiledet" role="tabpanel" aria-labelledby="divProfiledet">
									<div class="row mb-2">
										<div class="col-12">
											<h3>Personal Data</h3>
										</div>
									</div>
									<div class="row gutter-1">
										<div class="col-md-6">
											<div class="form-group">
												<label for="txtFirstName">First Name</label>
												<input type="text" id="txtFirstName" runat="server" class="form-control" placeholder="First name" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="txtLastName">Last Name</label>
												<input id="txtLastName" runat="server" type="text" class="form-control" placeholder="Last name" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="txtEmail">Email</label>
												<input id="txtEmail" runat="server" type="text" class="form-control" placeholder="Email" disabled />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="txttxtPhone">Mobile No</label>
												<input id="txtMobileNo" runat="server" type="text" class="form-control" placeholder="Mobile No" disabled />
											</div>
										</div>
										<div class="col-md-12 mt-2">
											<a href="javascript:void(0);" id="lnkProfileSubmit" class="btn btn-primary">Save Changes</a>
										</div>
									</div>
									<div class="row mb-2 mt-6">
										<div class="col-12">
											<h3>Password</h3>
										</div>
									</div>
									<div class="row gutter-1">
										<div class="col-12">
											<div class="form-group">
												<label for="txtCPPwd">Old Password</label>
												<input id="txtCPPwd" type="password" class="form-control" placeholder="Password">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="txtCPNewPwd">New Password</label>
												<input id="txtCPNewPwd" type="password" class="form-control" placeholder="Password">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="txtCPNewPwdCrfm">Retype New Password</label>
												<input id="txtCPNewPwdCrfm" type="password" class="form-control" placeholder="Password">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<a href="javascript:void(0);" id="lnkCPSubmit" class="btn btn-primary">Submit</a>
										</div>
									</div>
								</div>

								<!-- orders -->
								<div class="tab-pane fade" id="divOrderlst" role="tabpanel" aria-labelledby="divOrderlst">
									
								</div>

								<!-- Subscription -->
                                <div class="tab-pane fade" id="divSublst" role="tabpanel" aria-labelledby="divSubLst">
                                    <%--<div class="row">
                                        <div class="col">
                                            <h3 class="mb-0">Subscription</h3>
                                             <span class="eyebrow">1 Entry</span> 
                                        </div>
                                    </div>
                                    <div class="row gutter-2 mb-6">
                                        <div class="col-md-6">
                                            <div class="card card-data">
                                                <div class="card-header card-header-options">
                                                    <div class="row align-items-center">
                                                        <div class="col">
                                                            <h3 class="card-title pt-2 pb-2">
                                                                1 Box per week 3 Months (10% Off)
                                                            </h3>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="card-body w-75">
                                                    <h5 class="eyebrow text-muted">Paymeny Method</h5>
                                                    <p class="card-text"> Credit Card</p>
                                                    <h5 class="eyebrow text-muted">Subscription End Date </h5>
                                                    <p class="card-text"><b>$7.00</b> Subscription on 04/14/2021</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="card card-data">
                                                <div class="card-header card-header-options">
                                                    <div class="row align-items-center">
                                                        <div class="col">
                                                            <h3 class="card-title pt-2 pb-2">
                                                                1 Box per week 3 Months (10% Off)
                                                            </h3>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="card-body w-75">
                                                    <h5 class="eyebrow text-muted">Paymeny Method</h5>
                                                    <p class="card-text"> Credit Card</p>
                                                    <h5 class="eyebrow text-muted">Subscription End Date </h5>
                                                    <p class="card-text"><b>$7.00</b> Subscription on 04/14/2021</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>--%>
                                </div>

								<!-- addresses -->
								<div class="tab-pane fade" id="divAddresslst" role="tabpanel" aria-labelledby="divAddresslst">
									<div class="row">
										<div class="col">
											<h3 class="mb-0">Addresses</h3>
											<%--<span class="eyebrow">2 Entry</span>--%>
										</div>
									</div>
									<div class="row gutter-2" id="divAddresses">
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
										<div class="col-md-6">
											<div class="form-group">
												<label for="cardNumber">Address</label>
												<input id="txtNewAddress1" type="text" class="form-control" placeholder="">
											</div>
										</div>
										<div class="col-md-6">
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
												<select class="custom-select" id="ddlNewArea">
													<option selected>Select Area</option>
												</select>
											</div>
										</div>
										<div class="col-12">
											<a href="javascript:void(0)" id="lnkAddAddress" class="btn btn-primary">Add</a>
										</div>
									</div>
								</div>

								<!-- wishlist -->
								<div class="tab-pane fade" id="divWishlst" role="tabpanel" aria-labelledby="divWishlst">
									<%--<div class="row">
										<div class="col">
											<h3 class="mb-0">Wishlist</h3>
											<span class="eyebrow">3 Product</span>
										</div>
									</div>
									<div class="row gutter-2">
										<div class="col-md-6 col-lg-4">
											<div class="product">

												<figure class="product-image">
													<a href="profile.html#!" class="btn btn-ico btn-rounded btn-white"><i class="icon-x"></i></a>
													<a href="product.html">
														<img src="images/product-1.jpg" alt="Image">
														<img src="images/product-2.jpg" alt="Image">
													</a>
												</figure>
												<div class="product-meta">
													<h3 class="product-title"><a href="profile.html#!">Garden Mix - Farm Fresh Salad Box x1 </a>
													</h3>
													<div class="product-price">
														<span>₹2,268</span>
														<span class="product-action">
															<a href="cart.html">Add to cart</a>
														</span>
													</div>
													<a href="profile.html#!" class="product-like"></a>
												</div>
											</div>
										</div>
										<div class="col-md-6 col-lg-4">
											<div class="product">

												<figure class="product-image">
													<a href="profile.html#!" class="btn btn-ico btn-rounded btn-white"><i class="icon-x"></i></a>
													<a href="product.html">
														<img src="images/product-1.jpg" alt="Image">
														<img src="images/product-2.jpg" alt="Image">
													</a>
												</figure>
												<div class="product-meta">
													<h3 class="product-title"><a href="profile.html#!">Garden Mix - Farm Fresh Salad Box x1 </a>
													</h3>
													<div class="product-price">
														<span>₹2,268</span>
														<span class="product-action">
															<a href="cart.html">Add to cart</a>
														</span>
													</div>
													<a href="profile.html#!" class="product-like"></a>
												</div>
											</div>
										</div>
										<div class="col-md-6 col-lg-4">
											<div class="product">

												<figure class="product-image">
													<a href="profile.html#!" class="btn btn-ico btn-rounded btn-white"><i class="icon-x"></i></a>
													<a href="product.html">
														<img src="images/product-1.jpg" alt="Image">
														<img src="images/product-2.jpg" alt="Image">
													</a>
												</figure>
												<div class="product-meta">
													<h3 class="product-title"><a href="profile.html#!">Garden Mix - Farm Fresh Salad Box x1 </a>
													</h3>
													<div class="product-price">
														<span>₹2,268</span>
														<span class="product-action">
															<a href="cart.html">Add to cart</a>
														</span>
													</div>
													<a href="cart.html" class="product-like"></a>
												</div>
											</div>
										</div>
									</div>--%>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- / content -->

			</div>

		</div>
	</section>
	<!-- modal Orders -->
	<div class="modal sidebar fade" id="orderDetail" tabindex="-1" role="dialog" aria-labelledby="orderDetailLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="paymentsLabel">My Order</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<aside class="col-lg-12">
						<div class="row" id="divOdrSummary">
							
						</div>
					</aside>
				</div>
			</div>
		</div>
	</div>

	<!-- listing -->

	<!-- modal Edit Address-->
	<div class="modal sidebar fade" id="editAddress" tabindex="-1" role="dialog" aria-labelledby="addressLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addressLabel">Edit Address</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row gutter-3">
						<div class="row gutter-1 mb-2">
							<input type="hidden" id="hdnRef" />
							<div class="form-group col-md-6">
								<label for="firstName">First Name</label>
								<input type="text" class="form-control" id="txtEditFirstName" placeholder="">
							</div>
							<div class="form-group col-md-6">
								<label for="lastName">Last Name</label>
								<input type="text" class="form-control" id="txtEditLastName" placeholder="">
							</div>
							<div class="form-group col-md-6">
								<label for="address">Address</label>
								<input type="text" class="form-control" id="txtEditAddress1" placeholder="">
							</div>
							<div class="form-group col-md-6">
								<label for="address"></label>
								<input type="text" class="form-control" id="txtEditAddress2" placeholder="">
							</div>
							<div class="form-group col-md-6">
								<label for="address">Street</label>
								<input type="text" class="form-control" id="txtEditStreet" placeholder="">
							</div>
							<div class="form-group col-md-6">
								<label for="address">Landmark</label>
								<input type="text" class="form-control" id="txtEditLandmark" placeholder="">
							</div>
							<div class="form-group col-md-6">
								<label for="country">Country</label>
								<input type="text" class="form-control" id="txtEditCountry" placeholder="" value="India" disabled>
							</div>
							<div class="form-group col-md-6">
								<label for="city">City</label>
								<input type="text" class="form-control" id="txtEditState" placeholder="" value="Maharashtra" disabled>
							</div>
							<div class="form-group col-md-6">
								<label for="postcode">City</label>
								<input type="text" class="form-control" id="txtEditCity" placeholder="" value="Mumbai" disabled>
							</div>
							<div class="form-group col-md-6">
								<label for="cardNumber2">Area</label>
								<select class="custom-select" id="ddlEditArea">
									<option selected>Select Area</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<button type="button" id="btnEditAddress" class="btn btn-primary">Update</button>
			</div>
		</div>
	</div>
	<!-- alert delete -->
	<div class="modal fade" id="modDelAdd" tabindex="-1" role="dialog" aria-labelledby="alertLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Do you want to Delete this address?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="btnHdrAlert">
						<input type="hidden" id="hdnRefDel" />
						<button type="button" class="btn" id="btnModDelAddNo">No</button>
						<button type="button" class="btn btn-primary" id="btnModDelAddYes">Yes</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>

