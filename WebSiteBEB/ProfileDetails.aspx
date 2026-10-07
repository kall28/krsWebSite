<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="ProfileDetails, App_Web_profiledetails.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.comm.add-1.0.js"></script>
	<script src="js/web.profiledet-1.0.js"></script>
    <input type ="hidden" id="hdnRefAdd" />
	<div class="page-title-overlap bg-darkBlack">
        <div class="container d-lg-flex justify-content-between ">
            <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                        <li class="breadcrumb-item"><a class="text-nowrap" href="javascript:void(0)" id="lnkBCHome"><i class="czi-home"></i>Home</a></li>
                        <li class="breadcrumb-item text-nowrap">
                            <a href="javascript:void(0)" id="lnkBCAccount">Account</a>
                        </li>
                        <li class="breadcrumb-item text-nowrap active" aria-current="page">Profile</li>
                    </ol>
                </nav>
            </div>
            <div class="order-lg-1 pr-lg-4 text-center text-lg-left">
                <h1 class="h3 text-light mb-0" id="hdrCaption">Profile info</h1>
            </div>
        </div>
    </div>
	<div class="container pb-5 mb-2 mb-md-3">
        <div class="row">
            <!-- Sidebar-->
            <aside class="col-lg-4 pt-4 pt-lg-0">
                <div class="cz-sidebar-static rounded-lg box-shadow-lg px-0 pb-0 mb-5 mb-lg-0">
                    <div class="px-4 mb-4" id="divProfileDetails">
                        <%--<div class="media align-items-center">
                            <div class="img-thumbnail rounded-circle position-relative" style="width: 6.375rem;">
                                <img class="rounded-circle" src="images/avatar.jpg" alt="Susan Gardner">
                            </div>
                            <div class="media-body pl-3">
                                <h3 class="font-size-base mb-0">Bijay Ketan</h3><span class="text-accent font-size-sm">bijay@gmail.com</span>
                            </div>
                        </div>--%>
                    </div>
                    <div class="bg-secondary px-4 py-3">
                        <h3 class="font-size-sm mb-0 text-muted">Dashboard</h3>
                    </div>
                    <ul class="list-unstyled mb-0">
                        <li class="border-bottom mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3" 
                                href="javascript:void(0)" id="lnkNavOrders" name="lnkNavProfile">
                                <i class="czi-bag opacity-60 mr-2"></i>Orders
								<%--<span class="font-size-sm text-muted ml-auto">1</span>--%>
                            </a>
                        </li>
                        <li class="border-bottom mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3"
                               href="javascript:void(0)" id="lnkNavWishlist" name="lnkNavProfile">
                                <i class="czi-heart opacity-60 mr-2"></i>Wishlist
								<%--<span class="font-size-sm text-muted ml-auto">3</span>--%>
                            </a>
                        </li>
                        <%--<li class="mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3"
                               href="account-tickets.html">
                                <i class="czi-help opacity-60 mr-2"></i>Support tickets<span class="font-size-sm text-muted ml-auto">1</span>
                            </a>
                        </li>--%>
                    </ul>
                    <div class="bg-secondary px-4 py-3">
                        <h3 class="font-size-sm mb-0 text-muted">Account settings</h3>
                    </div>
                    <ul class="list-unstyled mb-0">
                        <li class="border-bottom mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3 active"
                               href="javascript:void(0)" id="lnkNavProfileInfo" name="lnkNavProfile">
                                <i class="czi-user opacity-60 mr-2"></i>Profile info
                            </a>
                        </li>
                        <li class="border-bottom mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3"
                               href="javascript:void(0)" id="lnkNavAddresses" name="lnkNavProfile">
                                <i class="czi-location opacity-60 mr-2"></i>Addresses
                            </a>
                        </li>
                        <%--<li class="mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3"
                               href="account-payment.html"><i class="czi-card opacity-60 mr-2"></i>Payment methods</a>
                        </li>--%>
                        <%--<li class="d-lg-none border-top mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3"
                               href="account-signin.html"><i class="czi-sign-out opacity-60 mr-2"></i>Sign out</a>
                        </li>--%>
                    </ul>
                </div>
            </aside>

            <!-- Orders  -->
            <section class="col-lg-8" id="secOrders" name="secTabs">
                <!-- Toolbar-->
                <div class="d-flex justify-content-between align-items-center pt-lg-2 pb-4 pb-lg-5 mb-lg-3">
                    <div class="form-inline">
                        <label class="text-light opacity-75 text-nowrap mr-2 d-none d-lg-block" for="order-sort">Sort orders:</label>
                        <select class="form-control custom-select" id="order-sort">
                            <option>All</option>
                            <option>Delivered</option>
                            <option>In Progress</option>
                            <option>Delayed</option>
                            <option>Canceled</option>
                        </select>
                    </div><a class="btn btn-primary btn-sm d-none d-lg-inline-block" href="javascript:void(0)" id="lnkProfileSignOutOrd"><i class="czi-sign-out mr-2"></i>Sign out</a>
                </div>
                <!-- Orders list-->
                <div class="table-responsive font-size-md" id="divOrderlst">
                    
                </div>
                <hr class="pb-4">
                <!-- Pagination-->
                <%--<nav class="d-flex justify-content-between pt-2" aria-label="Page navigation">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="account-orders.html#"><i class="czi-arrow-left mr-2"></i>Prev</a></li>
                    </ul>
                    <ul class="pagination">
                        <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 5</span></li>
                        <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link">1<span class="sr-only">(current)</span></span></li>
                        <li class="page-item d-none d-sm-block"><a class="page-link" href="account-orders.html#">2</a></li>
                        <li class="page-item d-none d-sm-block"><a class="page-link" href="account-orders.html#">3</a></li>
                        <li class="page-item d-none d-sm-block"><a class="page-link" href="account-orders.html#">4</a></li>
                        <li class="page-item d-none d-sm-block"><a class="page-link" href="account-orders.html#">5</a></li>
                    </ul>
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="account-orders.html#" aria-label="Next">Next<i class="czi-arrow-right ml-2"></i></a></li>
                    </ul>
                </nav>--%>
            </section>

            <!-- Wishlist  -->
            <section class="col-lg-8" id="secWishlist" name="secTabs">
                <!-- Toolbar-->
                <div class="d-none d-lg-flex justify-content-between align-items-center pt-lg-3 pb-4 pb-lg-5 mb-lg-3">
                    <h6 class="font-size-base text-light mb-0">List of items you added to wishlist:</h6>
                    <a class="btn btn-primary btn-sm" href="javascript:void(0)" id="lnkProfileSignOutWish"><i class="czi-sign-out mr-2"></i>Sign out</a>
                </div>
                <!-- Wishlist-->
                <div id="divWishlst">

                </div>
                <!-- Item-->
                <%--<div class="d-sm-flex justify-content-between mt-lg-4 mb-4 pb-3 pb-sm-2 border-bottom">
                    <div class="media media-ie-fix d-block d-sm-flex text-center text-sm-left">
                        <a class="d-inline-block mx-auto mr-sm-4" href="shop-single-v1.html" style="width: 10rem;">
                            <img src="images/book_01.png" alt="Product">
                        </a>
                        <div class="media-body pt-2">
                            <h3 class="product-title font-size-base mb-2"><a href="shop-single-v1.html">Abujha Pakshira Geeta</a></h3>
                            <div class="font-size-sm"><span class="text-muted mr-2">By:</span>Rabi Satapathy</div>
                            <div class="font-size-lg text-accent pt-2">$79.<small>50</small></div>
                        </div>
                    </div>
                    <div class="pt-2 pl-sm-3 mx-auto mx-sm-0 text-center">
                        <button class="btn btn-outline-danger btn-sm" type="button"><i class="czi-trash mr-2"></i>Remove</button>
                    </div>
                </div>
                <!-- Item-->
                <div class="d-sm-flex justify-content-between mt-lg-4 mb-4 pb-3 pb-sm-2 border-bottom">
                    <div class="media media-ie-fix d-block d-sm-flex text-center text-sm-left">
                        <a class="d-inline-block mx-auto mr-sm-4" href="shop-single-v1.html" style="width: 10rem;">
                            <img src="images/book_01.png" alt="Product">
                        </a>
                        <div class="media-body pt-2">
                            <h3 class="product-title font-size-base mb-2"><a href="shop-single-v1.html">Abujha Pakshira Geeta</a></h3>
                            <div class="font-size-sm"><span class="text-muted mr-2">By:</span>Rabi Satapathy</div>
                            <div class="font-size-lg text-accent pt-2">$79.<small>50</small></div>
                        </div>
                    </div>
                    <div class="pt-2 pl-sm-3 mx-auto mx-sm-0 text-center">
                        <button class="btn btn-outline-danger btn-sm" type="button"><i class="czi-trash mr-2"></i>Remove</button>
                    </div>
                </div>--%>
            </section>

            <!-- Profile  -->
            <section class="col-lg-8" id="secProfileInfo" name="secTabs">
                <!-- Toolbar-->
                <div class="d-none d-lg-flex justify-content-between align-items-center pt-lg-3 pb-4 pb-lg-5 mb-lg-3">
                    <h6 class="font-size-base text-light mb-0">Update you profile details below:</h6><a class="btn btn-primary btn-sm" href="javascript:void(0)" id="lnkProfileSignOut"><i class="czi-sign-out mr-2"></i>Sign out</a>
                </div>
                <!-- Profile form-->                
                    <div class="bg-secondary rounded-lg p-4 mb-4">
                        <%--<div class="media align-items-center">
                            <img src="img/shop/account/avatar.jpg" width="90" alt="Susan Gardner">
                            <div class="media-body pl-3">
                                <button class="btn btn-light btn-shadow btn-sm mb-2" type="button">
                                    <i class="czi-loading mr-2"></i>Change avatar
                                </button>
                                <div class="p mb-0 font-size-ms text-muted">Upload JPG, GIF or PNG image. 300 x 300 required.</div>
                            </div>
                        </div>--%>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtFirstName">First Name</label>
                                <input class="form-control" type="text" id="txtFirstName" runat="server" value="">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtLastName">Last Name</label>
                                <input class="form-control" type="text" id="txtLastName" runat="server" value="">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="account-email">Email Address</label>
                                <input class="form-control" type="email" id="txtEmail" runat="server" value="" disabled>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="account-phone">Phone Number</label>
                                <input class="form-control" type="text" id="txtMobileNo" runat="server" value="" required>
                            </div>
                        </div>
						<div class="col-12">
                            <hr class="mt-2 mb-3">
                            <div class="d-flex flex-wrap justify-content-between align-items-center">
                                <div class="custom-control custom-checkbox d-block">
                                    <input class="custom-control-input" type="checkbox" id="subscribe_me" checked>
                                    <label class="custom-control-label" for="subscribe_me">Subscribe me to Newsletter</label>
                                </div>
                                <button class="btn btn-primary mt-3 mt-sm-0" type="button" id="btnProfileSubmit">Update profile</button>
                            </div>
                        </div>
					</div>
					<div class="row">
						<div class="col-sm-12 mt-2 mb-3">
							<h3 class="font-size-md mb-0 text-muted">Change Password</h3>
						</div>
						<div class="col-sm-12">
                            <div class="form-group">
                                <label for="account-pass">Old Password</label>
                                <div class="password-toggle">
                                    <input class="form-control" type="password" id="txtCPPwd">
                                    <label class="password-toggle-btn">
                                        <input class="custom-control-input" type="checkbox"><i class="czi-eye password-toggle-indicator"></i><span class="sr-only">Show password</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="account-pass">New Password</label>
                                <div class="password-toggle">
                                    <input class="form-control" type="password" id="txtCPNewPwd">
                                    <label class="password-toggle-btn">
                                        <input class="custom-control-input" type="checkbox"><i class="czi-eye password-toggle-indicator"></i><span class="sr-only">Show password</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="account-confirm-pass">Confirm Password</label>
                                <div class="password-toggle">
                                    <input class="form-control" type="password" id="txtCPNewPwdCrfm">
                                    <label class="password-toggle-btn">
                                        <input class="custom-control-input" type="checkbox"><i class="czi-eye password-toggle-indicator"></i><span class="sr-only">Show password</span>
                                    </label>
                                </div>
                            </div>
                        </div>      
						<div class="col-12">
                            <hr class="mt-2 mb-3">
                            <div class="d-flex flex-wrap justify-content-between align-items-center">                                
                                <button class="btn btn-primary mt-3 mt-sm-0" type="button" id="btnCPSubmit">Update password</button>
                            </div>
                        </div>
                    </div>                
            </section>

			<!-- Addresses  -->
            <section class="col-lg-8" id="secAddresses" name="secTabs">
                <!-- Toolbar-->
                <div class="d-none d-lg-flex justify-content-between align-items-center pt-lg-3 pb-4 pb-lg-5 mb-lg-4">
                    <h6 class="font-size-base text-light mb-0">List of your registered addresses:</h6>
					<a class="btn btn-primary btn-sm" href="javascript:void(0);" id="lnkProfileSignOutAdd"><i class="czi-sign-out mr-2"></i>Sign out</a>
                </div>
                <!-- Addresses list-->
                <div class="table-responsive font-size-md" id="divAddresses">
                    <%--<table class="table table-hover mb-0">
                        <thead>
                            <tr>
                                <th>Address</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="py-3 align-middle">396 Lillian Blvd, Holbrook, NY 11741, USA<span class="align-middle badge badge-info ml-2">Primary</span></td>
                                <td class="py-3 align-middle">
                                    <a class="nav-link-style mr-2" href="account-address.html#" data-toggle="tooltip" title="Edit"><i class="czi-edit"></i></a><a class="nav-link-style text-danger" href="account-address.html#" data-toggle="tooltip" title="Remove">
                                        <div class="czi-trash"></div>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td class="py-3 align-middle">769, Industrial, West Chicago, IL 60185, USA</td>
                                <td class="py-3 align-middle">
                                    <a class="nav-link-style mr-2" href="account-address.html#" data-toggle="tooltip" title="Edit"><i class="czi-edit"></i></a><a class="nav-link-style text-danger" href="account-address.html#" data-toggle="tooltip" title="Remove">
                                        <div class="czi-trash"></div>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td class="py-3 align-middle">514 S. Magnolia St. Orlando, FL 32806, USA</td>
                                <td class="py-3 align-middle">
                                    <a class="nav-link-style mr-2" href="account-address.html#" data-toggle="tooltip" title="Edit"><i class="czi-edit"></i></a><a class="nav-link-style text-danger" href="account-address.html#" data-toggle="tooltip" title="Remove">
                                        <div class="czi-trash"></div>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>--%>
                </div>
                <hr class="pb-4">
                <div class="text-sm-right"><a class="btn btn-primary" href="javascript:void(0)" id="lnkAddAddress">Add new address</a></div>
            </section>
            
        </div>
    </div>

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
	<div class="needs-validation modal fade" id="modAddress" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add a new address</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="address-fn">First name</label>
                                <input class="form-control" type="text" id="txtModFirstName" required>
                                <div class="invalid-feedback">Please fill in you first name!</div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="address-ln">Last name</label>
                                <input class="form-control" type="text" id="txtModLastName" required>
                                <div class="invalid-feedback">Please fill in you last name!</div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="address-company">Company</label>
                                <input class="form-control" type="text" id="txtModCompanyName">
                            </div>
                        </div>
						<div class="col-sm-6">
                            <div class="form-group">
                                <label for="address-line1">Address Line 1</label>
                                <input class="form-control" type="text" id="txtModAddress1" required>
                                <div class="invalid-feedback">Please fill in your address!</div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="address-line2">Address Line 2</label>
                                <input class="form-control" type="text" id="txtModAddress2">
                            </div>
                        </div>
						<div class="col-sm-6">
                            <div class="form-group">
                                <label for="address-ln">Street</label>
                                <input class="form-control" type="text" id="txtModStreet" required>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
						<div class="col-sm-6">
                            <div class="form-group">
                                <label for="address-ln">Landmark</label>
                                <input class="form-control" type="text" id="txtModLandmark" required>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="address-country">Country</label>
                                <select class="custom-select" id="ddlModCountry" required>
                                    <option value="0">Select country</option>
                                </select>
                                <div class="invalid-feedback">Please select your country!</div>
                            </div>
                        </div>
						<div class="col-sm-6">
                            <div class="form-group">
                                <label for="address-country">State/Province</label>
                                <select class="custom-select" id="ddlModState" required>
                                    <option value="0">Select state/Province</option>
                                </select>
                                <div class="invalid-feedback">Please select state/province!</div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="address-country">City</label>
                                <select class="custom-select" id="ddlModCity" required>
                                    <option value="0">Select state/Province</option>
                                </select>
                                <div class="invalid-feedback">Please select state/province!</div>
                            </div>
                        </div>                        
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="address-zip">ZIP code</label>
                                <select class="custom-select" id="ddlModPincode" required>
                                    <option value="0">Select state/Province</option>
                                </select>
                                <div class="invalid-feedback">Please add your ZIP code!</div>
                            </div>
                        </div>
                        <div class="col-12">
                            <%--<div class="custom-control custom-checkbox">
                                <input class="custom-control-input" type="checkbox" id="address-primary">
                                <label class="custom-control-label" for="address-primary">Make this address primary</label>
                            </div>--%>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">                    
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                    <button class="btn btn-primary btn-shadow" type="button" id="btnModSaveAddress">Save</button>
                </div>
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

