<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="Cart, App_Web_cart.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.cart-1.0.js"></script>
	<!-- hero -->
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<h1>Your Cart</h1>
				</div>
			</div>
		</div>
	</section>


	<section class="pt-0">
		<div class="container">
			<div class="row mb-1 d-none d-lg-flex">
				<div class="col-lg-8">
					<div class="row pr-6">
						<div class="col-lg-6"><span class="eyebrow">Product</span></div>
						<div class="col-lg-2 text-center"><span class="eyebrow">Price</span></div>
						<div class="col-lg-2 text-center"><span class="eyebrow">Quantity</span></div>
						<div class="col-lg-2 text-center"><span class="eyebrow">Total</span></div>
					</div>
				</div>
			</div>
			<div class="row gutter-2 gutter-lg-4 justify-content-end" ">
				<div class="col-lg-8 cart-item-list" id="divCartItems">

				</div>
				<div class="col-lg-4" id="divCartSummary">
					
				</div>
			</div>
		</div>
	</section>



</asp:Content>

