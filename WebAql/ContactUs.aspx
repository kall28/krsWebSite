<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="ContactUs, App_Web_contactus.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.contact-1.0.js"></script>
	<!-- welcome -->
	<section class="hero">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-md-6">
					<h1 class="font-weight-light"><b class="d-block">Get in touch!</b> </h1>
				</div>
			</div>
			<div class="row gutter-4">
				<div class="col-md-5 col-lg-4">
					<asp:Literal ID="xlitContactAdd" runat="server"></asp:Literal>
					<%--<span class="eyebrow">Find us</span>
					<p class="lead my-1 text-dark">
						Aqua Leaf Farms, Mankoli, </br>
								Upper Thane, Mumbai - 421302

					</p>--%>
					<%--<a href="contact.html#!" class="eyebrow underline action">Get Routes</a>--%>
				</div>
				<div class="col-md-5 col-lg-4">
					<asp:Literal ID="xlitContactDet" runat="server"></asp:Literal>
					<%--<span class="eyebrow">Contact Us</span>
					<p class="lead my-1 text-dark">
						Phone: +91 9819778206<br>
						Email: <a href="mailto:info@aqualeaf.in">info@aqualeaf.in</a>
					</p>--%>
					<!-- <a href="contact.html#!" class="eyebrow underline action">contact@webuildthemes.com</a> -->
				</div>
				<div class="col-md-5 col-lg-4">
					<span class="eyebrow">Follow Us</span>
					<nav class="nav nav-icons mt-1">
						<a class="nav-link" href="https://www.facebook.com/aqualeaffarms/" target="_blank"><i
							class="icon-facebook-o"></i></a>
						<a class="nav-link" href="https://www.instagram.com/aqualeaf.farms/" target="_blank"><i
							class="icon-instagram"></i></a>
					</nav>
				</div>
			</div>
		</div>
	</section>


	<!-- map -->
	<section class="py-0">
		<div id="map" class="vh-50"></div>
		<script>
			function initMap() {
				// Styles a map in night mode.
				var map = new google.maps.Map(document.getElementById('map'), {
					center: { lat: 19.2262486, lng: 73.0442682 },
					zoom: 12,
					disableDefaultUI: true,
					styles: [
						{
							"elementType": "geometry",
							"stylers": [
								{
									"color": "#f5f5f5"
								}
							]
						},
						{
							"elementType": "labels.icon",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"elementType": "labels.text.fill",
							"stylers": [
								{
									"color": "#616161"
								}
							]
						},
						{
							"elementType": "labels.text.stroke",
							"stylers": [
								{
									"color": "#f5f5f5"
								}
							]
						},
						{
							"featureType": "administrative.land_parcel",
							"elementType": "labels.text.fill",
							"stylers": [
								{
									"color": "#bdbdbd"
								}
							]
						},
						{
							"featureType": "poi",
							"elementType": "geometry",
							"stylers": [
								{
									"color": "#eeeeee"
								}
							]
						},
						{
							"featureType": "poi",
							"elementType": "labels.text.fill",
							"stylers": [
								{
									"color": "#757575"
								}
							]
						},
						{
							"featureType": "poi.park",
							"elementType": "geometry",
							"stylers": [
								{
									"color": "#e5e5e5"
								}
							]
						},
						{
							"featureType": "poi.park",
							"elementType": "labels.text.fill",
							"stylers": [
								{
									"color": "#9e9e9e"
								}
							]
						},
						{
							"featureType": "road",
							"elementType": "geometry",
							"stylers": [
								{
									"color": "#ffffff"
								}
							]
						},
						{
							"featureType": "road.arterial",
							"elementType": "labels.text.fill",
							"stylers": [
								{
									"color": "#757575"
								}
							]
						},
						{
							"featureType": "road.highway",
							"elementType": "geometry",
							"stylers": [
								{
									"color": "#dadada"
								}
							]
						},
						{
							"featureType": "road.highway",
							"elementType": "labels.text.fill",
							"stylers": [
								{
									"color": "#616161"
								}
							]
						},
						{
							"featureType": "road.local",
							"elementType": "labels.text.fill",
							"stylers": [
								{
									"color": "#9e9e9e"
								}
							]
						},
						{
							"featureType": "transit.line",
							"elementType": "geometry",
							"stylers": [
								{
									"color": "#e5e5e5"
								}
							]
						},
						{
							"featureType": "transit.station",
							"elementType": "geometry",
							"stylers": [
								{
									"color": "#eeeeee"
								}
							]
						},
						{
							"featureType": "water",
							"elementType": "geometry",
							"stylers": [
								{
									"color": "#c9c9c9"
								}
							]
						},
						{
							"featureType": "water",
							"elementType": "labels.text.fill",
							"stylers": [
								{
									"color": "#9e9e9e"
								}
							]
						}
					]
				});

				var pin = 'images/pin.png';

				var marker = new google.maps.Marker({
					position: map.getCenter(),
					icon: pin,
					map: map
				});
			}
		</script>
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABPvuHKiY7TaTOrCsHYs2u-3OJkfn9Xd8&callback=initMap"
			async defer></script>
	</section>



	<!-- contact form -->
	<section>
		<div class="container">
			<div class="row gutter-4">
				<div class="col-lg-4">
					<h2 class="font-weight-light"><b>Email box for enquiry</b> </h2>
					<p>We don't spam. Promise!</p>
				</div>
				<div class="col-lg-8 pl-lg-5">
					<div class="row gutter-2">
						<div class="form-group col-md-6">
							<label for="inputName">Your Name</label>
							<input type="text" class="form-control" id="txtFBFullName" placeholder="" maxlength="100">
						</div>
						<div class="form-group col-md-6">
							<label for="inputEmail">Your Email</label>
							<input type="email" class="form-control" id="txtFBEmail" placeholder="" maxlength="100">
						</div>
						<div class="form-group col-md-6">
							<label for="inputEmail">Your Contact Number</label>
							<input type="email" class="form-control" id="txtFBContactNo" placeholder="" maxlength="10">
						</div>
						<div class="form-group col-12">
							<label for="inputNameSecond">Subject</label>
							<input type="text" class="form-control" id="txtFBSubject" placeholder="" maxlength="200">
						</div>
						<div class="form-group col-12">
							<label for="inputTextarea">Message</label>
							<textarea class="form-control" id="txtFBMessage" rows="3" maxlength="500">

							</textarea>
						</div>
						<div class="col-12">
							<div class="custom-control custom-switch mb-2">
								<input type="checkbox" class="custom-control-input" id="chkFBSubscribe" checked>
								<label class="custom-control-label text-muted" for="customSwitch1">
									Subscribe me to weekly newsletter</label>
							</div>
						</div>
						<div class="col-12">
							<a href="javascript:void(0)" id="btnFBSubmit" class="btn btn-primary mt-2">Send Message</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>

