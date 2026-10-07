<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="ErrorPage, App_Web_errorpage.aspx.cdcab7d2" %>

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
							<li class="breadcrumb-item active" aria-current="page">Error</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>

	<!-- hero -->
	<section class="no-overflow pt-0">
        <div class="container">
            <div class="card py-3 mt-sm-3">
                <div class="card-body text-center">
                    <h2 class="h4 pb-1">Error!</h2>
                    <p class="font-size-sm mb-2">
						<asp:Literal ID="xlitMessage" runat="server"></asp:Literal>
                    </p>
					<a class="btn btn-primary mt-3 mr-3" href="javascript:void(0);" onclick="WebNavHelper.redirectToPageMain('home');"> home</a>					
                </div>
            </div>
        </div>
    </section>
</asp:Content>

