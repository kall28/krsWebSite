<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="PrivacyPolicy, App_Web_privacypolicy.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<!-- breadcrumbs -->
	<div class="page-title-overlap bg-darkBlack ">
		<div class="container d-lg-flex breadcrumbWrap">
			<div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
						<li class="breadcrumb-item"><a class="text-nowrap" href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('home');"><i class="czi-home"></i>Home</a></li>
						<li class="breadcrumb-item text-nowrap active" aria-current="page">Privacy Policy</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="bg-light box-shadow-lg rounded-lg ">
			<div class="order-lg-1 pr-lg-4 text-center text-lg-left">
				<h1 class="h3 mb-0 py-3 pl-4">Privacy Policy</h1>
			</div>
			<section class="row no-gutters">
				<div class="col-md-6 p-5">
					<asp:Literal ID="xlitContent" runat="server"></asp:Literal>
				</div>
			</section>
		</div>
	</div>
</asp:Content>

