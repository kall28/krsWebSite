<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="OrderStatus, App_Web_orderstatus.aspx.cdcab7d2" %>

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
							<li class="breadcrumb-item active" aria-current="page">
                                <asp:Literal ID="xlitBCTitle" runat="server"></asp:Literal>
							</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>

    <asp:Literal ID="xlitOrderStatus" runat="server"></asp:Literal>

	<%--<section>
        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <h1>Confirmation</h1>
                </div>
            </div>
        </div>
    </section>
    <section class="no-overflow pt-0">
        <div class="container">
            <div class="card py-3 mt-sm-3">
                <div class="card-body text-center">
                    <h2 class="h4 pb-1">Thank you for your order!</h2>
                    <p class="font-size-sm mb-2">Your order has been placed and will be processed as soon as possible.</p>
                    <p class="font-size-sm mb-2">
                        Make sure you make note of your order number, which is <span class="font-weight-medium">34VB5540K83.</span>
                    </p>
                    <p class="font-size-sm">
                        You will be receiving an email shortly with confirmation of your order. <u>
                            You can
                            now:
                        </u>
                    </p><a class="btn btn-secondary mt-3 mr-3" href="shop-grid-ls.html">Go back shopping</a><a class="btn btn-primary mt-3" href="index.html"><i class="czi-location"></i>&nbsp;Track order</a>
                </div>
            </div>
        </div>
    </section>--%>


</asp:Content>

