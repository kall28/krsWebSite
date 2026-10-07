<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="rpt_RptOrderSearch, App_Web_rptordersearch.aspx.26acd4a4" %>

<%@ MasterType VirtualPath="~/masterpages/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../css/datatable/buttons.dataTables.min.css" rel="stylesheet" />
	<link href="../css/datatable/buttons.bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<%--<script src="../js/helpers/datatable/jquery.dataTables.min.js"></script>
	<script src="../js/helpers/datatable/dataTables.bootstrap.min.js"></script>
	<script src="../js/helpers/datatable/dataTables.buttons.min.js"></script>
	<script src="../js/helpers/datatable/buttons.bootstrap.min.js"></script>
	<script src="../js/helpers/datatable/jszip.min.js"></script>--%>
	<%--<script src="../js/helpers/datatable/pdfmake.min.js"></script>
	<script src="../js/helpers/datatable/vfs_fonts.js"></script>--%>
	<%--<script src="../js/helpers/datatable/buttons.html5.min.js"></script>--%>
	<script src="js/rptordersearch-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
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
											<option value="CCC">Credit Card</option>
											<option value="DBC">Debit Card</option>
											<option value="NTB">Net Banking</option>
											<option value="PPP">Post Paid</option>
											<option value="UPI">UPI</option>
											<option value="WAL">Wallet</option>
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
									<label class="col-sm-4 control-label" for="txtPayTransIdSearch">Pay Trans Id</label>
									<div class="col-sm-6">
										<input type="text" id="txtPayTransIdSearch" name="txtPayTransIdSearch" class="form-control input-sm" value="">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-4 control-label" for="txtOrderNoSearch">Order No</label>
									<div class="col-sm-6">
										<input type="text" id="txtOrderNoSearch" name="txtOrderNoSearch" class="form-control input-sm" value="">
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
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-4 control-label" for="ddlDelStatusSearch">Delivery Status</label>
									<div class="col-sm-8">
										<select id="ddlDelStatusSearch" class="form-control input-sm">
											<option value="100">All</option>
											<option value="0">Pending</option>
											<option value="1">Partially Delivered</option>
											<option value="2">Delivered</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-4 control-label" for="txtOrderIdSearch">Email</label>
									<div class="col-sm-8">
										<input type="text" id="txtEmailSearch" name="txtEmailSearch" class="form-control input-sm" value="">
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-4 control-label" for="txtMobileNoSearch">Mobile No</label>
									<div class="col-sm-8">
										<input type="text" id="txtMobileNoSearch" name="txtMobileNoSearch" class="form-control input-sm" value="">
									</div>
								</div>
							</div>
							<div class="col-sm-4">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
							</div>
							<div class="col-sm-6">
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
					<div class="block" id="divList">
						<%--<div class="row">
							<div class="col-sm-6">
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3">
										<button type="button" id="btnExport" class="btn btn-sm btn-primary"><i class="fa"></i>Export</button>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive">
								</div>
							</div>
						</div>--%>
					</div>
				</div>
			</div>
		</div>
		<!-- END All Products Title -->
		<!-- All Categories Content -->

		<!-- END All Products Content -->
	</div>
	<div id="divDataListL2" class="block full display-none">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnBackToListL2" class="btn btn-sm btn-warning"
					data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
			</div>
			<h2>
				<label id="lblTitlePL2" class="control-label"></label>
				&nbsp; Payment Details</h2>
		</div>
		<!-- END All Products Title -->
		<!-- All Categories Content -->
		<div class="table-responsive" id="divListL2">
		</div>
		<!-- END All Products Content -->
	</div>
	<div id="divDataListL3" class="block full display-none">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnBackToListL3" class="btn btn-sm btn-warning"
					data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
			</div>
			<h2>
				<label id="lblTitlePL3" class="control-label"></label>
				&nbsp; Payment Log</h2>
		</div>
		<!-- END All Products Title -->
		<!-- All Categories Content -->
		<div class="table-responsive" id="divListL3">
		</div>
		<!-- END All Products Content -->
	</div>
	<div id="divDataListL4" class="block full display-none">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnBackToListL4" class="btn btn-sm btn-warning"
					data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
			</div>
			<h2>
				<label id="lblTitlePL4" class="control-label"></label>
				&nbsp; Order Details</h2>
		</div>
		<!-- END All Products Title -->
		<!-- All Categories Content -->
		<div class="table-responsive" id="divListL4">
		</div>
		<!-- END All Products Content -->
	</div>
	<script>
		$(document).ready(function () {
			RPTOrderSearch.init();
		});
	</script>
</asp:Content>

