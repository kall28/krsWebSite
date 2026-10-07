<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="UserProfile, App_Web_userprofile.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.user-profile-1.0.js"></script>
	<div class="position-relative bg-gradient" style="height: 480px;">
		<div class="cs-shape cs-shape-bottom cs-shape-slant bg-secondary d-none d-lg-block">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 3000 260">
				<polygon fill="currentColor" points="0,257 0,260 3000,260 3000,0"></polygon>
			</svg>
		</div>
	</div>
	<!-- Page content-->
	<div class="container bg-overlay-content pb-4 mb-md-3" style="margin-top: -350px;">
		<div class="row">
			<asp:Literal ID="xlitUserDet" runat="server"></asp:Literal>
			<!-- Content-->
			<div class="col-lg-8">
				<div class="d-flex flex-column h-100 bg-light rounded-lg box-shadow-lg p-4">
					<div id="divProfile" style="display: none;" class="py-2 p-md-3">
						<!-- Title + Delete link-->
						<div class="d-sm-flex align-items-center justify-content-between pb-4 text-center text-sm-left">
							<h1 class="h3 mb-2 text-nowrap">Profile info</h1>
						</div>
						<!-- Content-->
						<div class="row">
							<%--<div class="col-sm-6">
								<div class="form-group">
									<label for="account-fn">First Name</label>
									<input class="form-control" type="text" id="account-fn" value="Amanda">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="account-ln">Last Name</label>
									<input class="form-control" type="text" id="account-ln" value="Wilson">
								</div>
							</div>--%>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="account-email">Email address</label>
									<input class="form-control" type="text" id="txtEmail" readonly="readonly" runat="server">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="account-username">Username</label>
									<div class="input-group">
										<div class="input-group-prepend"><span class="input-group-text">@</span></div>
										<input class="form-control" type="text" id="txtUsername" readonly="readonly" runat="server">
									</div>
								</div>
							</div>
							<%--<div class="col-sm-6">
								<div class="form-group">
									<label for="account-country">Country</label>
									<select class="custom-select" id="account-country">
										<option value>Select country</option>
										<option value="Argentina">Argentina</option>
										<option value="Belgium">Belgium</option>
										<option value="France">France</option>
										<option value="Germany">Germany</option>
										<option value="Madagascar">Madagascar</option>
										<option value="Spain">Spain</option>
										<option value="UK">United Kingdom</option>
										<option value="USA" selected>USA</option>
									</select>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="account-city">City</label>
									<input class="form-control" type="text" id="account-city" value="New York">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="account-address">Address Line</label>
									<input class="form-control" type="text" id="account-address" value="Some Cool Street, 22/1">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="account-zip">ZIP Code</label>
									<input class="form-control" type="text" id="account-zip">
								</div>
							</div
							<div class="col-sm-6">
								<div class="form-group">
									<label for="account-address">New Password</label>
									<input class="form-control" type="text" id="account-address" value="****">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="account-zip">Confirm Password</label>
									<input class="form-control" type="text" id="account-address" value="****">
								</div>
							</div>>--%>
							<%--<div class="col-12">
								<hr class="mt-2 mb-4">
								<div class="d-flex flex-wrap justify-content-between align-items-center">
									<div class="custom-control custom-checkbox d-block">
										<input class="custom-control-input" type="checkbox" id="show-email" checked>
										<label class="custom-control-label" for="show-email">Show my email to registered users</label>
									</div>
									<button class="btn btn-primary mt-3 mt-sm-0" type="button">
										<i class="fe-save font-size-lg mr-2"></i>Save changes</button>
								</div>
							</div>--%>
						</div>
					</div>

					<div id="divCurrentOdr" class="py-2 p-md-3">
						<!-- Title + Filters-->
						<div class="d-sm-flex align-items-center justify-content-between pb-2">
							<h1 class="h3 mb-3 text-center text-sm-left">Current Booking </h1>
						</div>
						<!-- Accordion with orders-->
						<div class="accordion" id="orders-accordion">
							<div id="divCurrentOdrList">
							</div>

						</div>
						<!-- Pagination-->
						<%--<nav style="display: none;" class="d-md-flex justify-content-between align-items-center text-center text-md-left pt-grid-gutter">
							<div class="d-md-flex align-items-center w-100">
								<span class="font-size-sm text-muted mr-md-3">Showing 5
                    of 13 orders</span>
								<div class="progress w-100 my-3 mx-auto mx-md-0" style="max-width: 10rem; height: 4px;">
									<div class="progress-bar" role="progressbar" style="width: 38%;" aria-valuenow="38"
										aria-valuemin="0" aria-valuemax="100">
									</div>
								</div>
							</div>
							<button class="btn btn-outline-primary btn-sm" type="button">Load more orders</button>
						</nav>--%>
					</div>
					<div id="divOdrHistory" style="display: none;" class="py-2 p-md-3">
						<!-- Title + Filters-->
						<div class="d-sm-flex align-items-center justify-content-between pb-2">
							<h1 class="h3 mb-3 text-center text-sm-left">Booking history</h1>
							<div style="display: none;" class="d-flex align-items-center mb-3">
								<label class="text-nowrap pr-1 mr-2 mb-0">Sort Bookings</label>
								<select class="form-control custom-select custom-select-sm" id="ddlOdrLstStatus" onchange="UserProfile.getOdrHistory();">
									<option value="0">All</option>
									<option value="1">Book</option>
									<option value="2">Canceled</option>
								</select>
							</div>
						</div>
						<!-- Accordion with orders-->
						<div class="accordion" id="orders-accordion1">
							<div id="divOdrHistoryList">
							</div>

						</div>
						<!-- Pagination-->
						<%--<nav style="display: none;"  class="d-md-flex justify-content-between align-items-center text-center text-md-left pt-grid-gutter">
							<div class="d-md-flex align-items-center w-100">
								<span class="font-size-sm text-muted mr-md-3">Showing 5
                    of 13 orders</span>
								<div class="progress w-100 my-3 mx-auto mx-md-0" style="max-width: 10rem; height: 4px;">
									<div class="progress-bar" role="progressbar" style="width: 38%;" aria-valuenow="38"
										aria-valuemin="0" aria-valuemax="100">
									</div>
								</div>
							</div>
							<button class="btn btn-outline-primary btn-sm" type="button">Load more orders</button>
						</nav>--%>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>

