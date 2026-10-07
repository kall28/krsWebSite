<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="FAQ, App_Web_faq.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<!-- breadcrumbs -->
	<section class="breadcrumbs separator-bottom">
		<div class="container">
			<div class="row">
				<div class="col">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('home');">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">FAQs</li>
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
				<div class="col">
					<h1>FAQs</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="">
		<div class="container">
			<div class="row gutter-2 gutter-md-4">
				<asp:Literal ID="xlitContent" runat="server"></asp:Literal>
				<%--<div class="col-md-8 col-lg-9">
					<div class="accordion accordion-minimal" id="accordion-1">
						<div class="card">
							<div class="card-header" id="heading-1-1">
								<h2 class="mb-0">
									<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse-1-1" aria-expanded="false" aria-controls="collapse-1-1">
										What is Hydroponics?
									</button>
								</h2>
							</div>

							<div id="collapse-1-1" class="collapse" aria-labelledby="heading-1-1" data-parent="#accordion-1">
								<div class="card-body">
									<p>
										Hydroponics is the growing of plants without soil. Plants are grown in inert mediums with the use of nutrient solutions
									</p>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="heading-1-2">
								<h2 class="mb-0">
									<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-1-2" aria-expanded="false" aria-controls="collapse-1-2">
										Can hydroponics be organic?
  
									</button>
								</h2>
							</div>
							<div id="collapse-1-2" class="collapse" aria-labelledby="heading-1-2" data-parent="#accordion-1">
								<div class="card-body">
									<p>
										There is a huge debate about the value of organic fertilizers/nutrients and methods within hydroponics. We use organics in hydroponics, and it can be done. Currently accepted organic fertilizer components are dependent upon organisms in the soil to convert the organic materials into a usable form for plants. In hydroponics we provide the minerals required for plant growth directly, completely eliminating the need for soil and soil organisms. The result is much higher growth rates and yields, and better crop quality than organic methods can achieve. Again, organics can be used with hydroponics but you must ensure that you are not “killing” off your organic nutrients/materials with synthetic products.
  
									</p>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="heading-1-3">
								<h2 class="mb-0">
									<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-1-3" aria-expanded="false" aria-controls="collapse-1-3">
										Why is growing with hydroponics better than growing in soil?
  
									</button>
								</h2>
							</div>
							<div id="collapse-1-3" class="collapse" aria-labelledby="heading-1-3" data-parent="#accordion-1">
								<div class="card-body">
									<p>
										Hydroponic produce is cleaner than soil grown produce, plus we have the ability to make any necessary adjustments to the nutrient solution for maximal growth and yield in the shortest amount of time.
  
									</p>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" id="heading-1-4">
								<h2 class="mb-0">
									<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse-1-4" aria-expanded="false" aria-controls="collapse-1-4">
										How does hydroponic produce taste in comparison with soil grown produce?
  
									</button>
								</h2>
							</div>
							<div id="collapse-1-4" class="collapse" aria-labelledby="heading-1-4" data-parent="#accordion-1">
								<div class="card-body">
									<p>
										While it can be more challenging, hydroponic produce frequently exceeds soil grown produce in terms of flavor and nutrition. This is because all of the nutrients required by the plant are immediately available when the plant needs them. This is also as we using organic elements in our hydro system, which help produce the same full-bodied flavors and aromas as soil grown produce.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>--%>
			</div>
		</div>
	</section>
</asp:Content>

