<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="rpt_RptOrderSummary, App_Web_rptordersummary.aspx.26acd4a4" %>

<%@ MasterType VirtualPath="~/masterpages/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../css/datatable/buttons.dataTables.min.css" rel="stylesheet" />
	<link href="../css/datatable/buttons.bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="../js/helpers/datatable/jquery.dataTables.min.js"></script>
	<script src="../js/helpers/datatable/dataTables.bootstrap.min.js"></script>
	<script src="../js/helpers/datatable/dataTables.buttons.min.js"></script>
	<script src="../js/helpers/datatable/buttons.bootstrap.min.js"></script>
	<script src="../js/helpers/datatable/jszip.min.js"></script>
	<%--<script src="../js/helpers/datatable/pdfmake.min.js"></script>
	<script src="../js/helpers/datatable/vfs_fonts.js"></script>--%>
	<script src="../js/helpers/datatable/buttons.html5.min.js"></script>
	<script src="js/web.comm.rpt.req-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<script src="js/rptordersummary-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<!-- All Categories Block -->
	<div id="divDataList" class="block full">
		<!-- All Products Title -->
		<div class="form-horizontal" onsubmit="return false;">
			<div class="row">
				<div class="col-sm-12">
					<div class="block">
						<div class="row">
							<div class="col-sm-8">
								<div class="form-group">
									<div class="col-sm-4">
										<select id="ddlDateParam" class="form-control input-sm">
											<option value="TRN">Transaction Date</option>
											<option value="DLE">Expected Delivery Date</option>
											<option value="DEL">Delivery Date</option>
										</select>
									</div>
									<div class="col-sm-8">
										<div class="input-group input-daterange" data-date-format="dd/mm/yyyy">
											<input type="text" id="txtFromDate" name="txtFromDate" class="form-control text-center input-datepicker-close input-sm" placeholder="From">
											<span class="input-group-addon"><i class="fa fa-angle-right"></i></span>
											<input type="text" id="txtToDate" name="txtToDate" class="form-control text-center input-datepicker-close input-sm" placeholder="To">
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-4 control-label" for="ddlAppSourceSearch">Application</label>
									<div class="col-sm-6">
										<select id="ddlAppSourceSearch" class="form-control input-sm">
											<option value="">All Applications</option>
											<option value="WEB">Website</option>
											<option value="MOB">Mobile Apps</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-4 control-label" for="ddlPaymentModeSearch">Pay Mode</label>
									<div class="col-sm-8">
										<select id="ddlPaymentModeSearch" class="form-control input-sm">
											<option value="">All Payment Modes</option>
											<option value="COD">Cash On Delivery</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-4 control-label" for="ddlPaymentStatusSearch">Pay Status</label>
									<div class="col-sm-8">
										<select id="ddlPaymentStatusSearch" class="form-control input-sm">
											<option value="100">All</option>
											<option value="0">Pending</option>
											<option value="1">Success</option>
											<option value="-1">Failed</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-4 control-label" for="ddlStatusSearch">Order Status</label>
									<div class="col-sm-8">
										<select id="ddlStatusSearch" class="form-control input-sm">
											<option value="100">All</option>
											<option value="0">Pending</option>
											<option value="2">Booked</option>
											<option value="-2">Failed</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-4 control-label" for="ddlDeliveryStatusSearch">Delivery Status</label>
									<div class="col-sm-8">
										<select id="ddlDeliveryStatusSearch" class="form-control input-sm">
											<option value="100">All</option>
											<option value="0">Pending</option>
											<option value="1">Partially Delivered</option>
											<option value="2">Delivered</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-4 control-label" for="ddlProductTypeSearch">Product Type</label>
									<div class="col-sm-8">
										<select id="ddlProductTypeSearch" class="form-control input-sm">
											<option value="">All</option>
											<option value="FRM">Farm Products</option>
											<option value="FRS">Farm Subscriptions</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3">
										<button type="button" id="btnSearch" class="btn btn-sm btn-primary"><i class="fa"></i>Search</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="table-responsive" id="divList">
					</div>
				</div>
			</div>
		</div>
		<!-- END All Products Title -->
		<!-- All Categories Content -->

		<!-- END All Products Content -->
	</div>
	<script>
		$(document).ready(function () {
			RPTOrderSummary.init();
		});
	</script>
</asp:Content>

