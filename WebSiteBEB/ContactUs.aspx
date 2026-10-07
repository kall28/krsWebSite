<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="ContactUs, App_Web_contactus.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.contact-1.0.js"></script>
	<div class="page-title-overlap bg-darkBlack ">
		<div class="container d-lg-flex breadcrumbWrap">
			<div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
						<li class="breadcrumb-item"><a class="text-nowrap" href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('home');"><i class="czi-home"></i>Home</a></li>
						<li class="breadcrumb-item text-nowrap active" aria-current="page">Contact Us</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
	<!-- Page Content-->
	<!-- Contact detail cards-->
	<div class="container">
		<div class="bg-light box-shadow-lg rounded-lg ">
			<div class="order-lg-1 pr-lg-4 text-center text-lg-left">
				<h1 class="h3 mb-0 py-3 pl-4">Contact Us</h1>
			</div>
			<section class="container-fluid pt-grid-gutter">
				<div class="row">
					<div class="col-xl-4 col-md-6 mb-grid-gutter">
						<a class="card" href="#map" data-scroll>
							<div class="card-body text-center">
								<i class="czi-location h3 mt-2 mb-4 text-primary"></i>
								<h3 class="h6 mb-2">Address</h3>
								<asp:Literal ID="xlitContactAdd" runat="server"></asp:Literal>
								<%--<p class="font-size-sm text-muted">
									396 Lillian Blvd, Holbrook, NY 11741, USA
								</p>--%>
								<div class="font-size-sm text-primary">
									Click to see map<i class="czi-arrow-right align-middle ml-1"></i>
								</div>
							</div>
						</a>
					</div>
					<div class="col-xl-4 col-md-6 mb-grid-gutter">
						<div class="card">
							<div class="card-body text-center">
								<i class="czi-phone h3 mt-2 mb-4 text-primary"></i>
								<h3 class="h6 mb-3">Phone numbers</h3>
								<asp:Literal ID="xlitContactDet" runat="server"></asp:Literal>
								<%--<ul class="list-unstyled font-size-sm mb-0">
									<li>
										<span class="text-muted mr-1">For customers:</span><a class="nav-link-style"
											href="tel:+108044357260">+1 (080) 44 357 260</a>
									</li>
									<li class="mb-0">
										<span class="text-muted mr-1">Tech support:</span><a class="nav-link-style"
											href="tel:+100331697720">+1 00 33 169 7720</a>
									</li>
								</ul>--%>
							</div>
						</div>
					</div>
					<div class="col-xl-4 col-md-6 mb-grid-gutter">
						<div class="card">
							<div class="card-body text-center">
								<i class="czi-mail h3 mt-2 mb-4 text-primary"></i>
								<h3 class="h6 mb-3">Email addresses</h3>
								<asp:Literal ID="xlitContactEmail" runat="server"></asp:Literal>
								<%--<ul class="list-unstyled font-size-sm mb-0">
									<li>
										<span class="text-muted mr-1">For customers:</span><a class="nav-link-style"
											href="mailto:+108044357260">customer@example.com</a>
									</li>
									<li class="mb-0">
										<span class="text-muted mr-1">Tech support:</span><a class="nav-link-style"
											href="mailto:support@example.com">support@example.com</a>
									</li>
								</ul>--%>
							</div>
						</div>
					</div>
				</div>
			</section>

		</div>
	</div>

	<!-- Split section: Map + Contact form-->
	<div class="container-fluid px-0" id="map">
		<div class="row no-gutters">
			<div class="col-lg-6 iframe-full-height-wrap">
				<iframe class="iframe-full-height" width="600" height="250"
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d53357.14257194912!2d-73.07268695801845!3d40.78017062807504!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89e8483b8bffed93%3A0x53467ceb834b7397!2s396+Lillian+Blvd%2C+Holbrook%2C+NY+11741%2C+USA!5e0!3m2!1sen!2sua!4v1558703206875!5m2!1sen!2sua"></iframe>
			</div>
			<div class="col-lg-6 px-4 px-xl-5 py-5 border-top">
				<h2 class="h4 mb-4">Drop us a line</h2>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="cf-name">Your name:&nbsp;<span class="text-danger">*</span></label>
							<input class="form-control" type="text" id="txtFBFullName" placeholder="" required>
							<div class="invalid-feedback">Please fill in you name!</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="cf-email">Email address:&nbsp;<span class="text-danger">*</span></label>
							<input class="form-control" type="email" id="txtFBEmail" placeholder="" required>
							<div class="invalid-feedback">Please provide valid email address!</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="cf-phone">Your phone:&nbsp;<span class="text-danger">*</span></label>
							<input class="form-control" type="text" id="txtFBContactNo" placeholder="" required>
							<div class="invalid-feedback">Please provide valid phone number!</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="cf-subject">Subject:</label>
							<input class="form-control" type="text" id="txtFBSubject"
								placeholder="Provide short title of your request">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="cf-message">Message:&nbsp;<span class="text-danger">*</span></label>
					<textarea class="form-control" id="txtFBMessage" rows="6" placeholder="Please describe in detail your request"
						required></textarea>
					<div class="invalid-feedback">Please write a message!</div>
				</div>
				<button class="btn btn-primary" type="button" id="btnFBSubmit">Send message</button>
			</div>
		</div>
	</div>
</asp:Content>

