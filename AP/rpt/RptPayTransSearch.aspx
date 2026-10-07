<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="rpt_RptPayTransSearch, App_Web_rptpaytranssearch.aspx.26acd4a4" %>

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
	<script src="js/rptpaysearch-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
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
									<label class="col-sm-3 control-label">Transaction Dates</label>
									<div class="col-sm-8">
										<div class="input-group input-daterange" data-date-format="dd/mm/yyyy">
											<input type="text" id="txtFromDate" name="txtFromDate" class="form-control text-center input-datepicker-close" placeholder="From">
											<span class="input-group-addon"><i class="fa fa-angle-right"></i></span>
											<input type="text" id="txtToDate" name="txtToDate" class="form-control text-center input-datepicker-close" placeholder="To">
										</div>
									</div>
								</div>
							</div>	
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="ddlAppSourceSearch">Application Type</label>
									<div class="col-sm-8">
										<select id="ddlAppSourceSearch" class="form-control">
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
									<label class="col-sm-4 control-label" for="txtPayTransIdSearch">Pay Trans Id</label>
									<div class="col-sm-6">
										<input type="text" id="txtPayTransIdSearch" name="txtPayTransIdSearch" class="form-control input-sm" value="">
									</div>
								</div>								
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="ddlPaymentModeSearch">Payment Mode</label>
									<div class="col-sm-8">
										<select id="ddlPaymentModeSearch" class="form-control">
											<option value="">All Payment Modes</option>
											<option value="CCC">Credit Card</option>
											<option value="OVO">OVO Wallet</option>
											<option value="DKU">Doku Wallet</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="ddlPaymentStatusSearch">Payment Status</label>
									<div class="col-sm-8">
										<select id="ddlPaymentStatusSearch" class="form-control">
											<option value="100">All</option>
											<option value="0">Pending</option>
											<option value="1">Success</option>
											<option value="-1">Failed</option>
											<option value="-11">Scheduled Failed</option>
											<option value="-2">Reversed</option>
											<option value="-3">Void</option>
											<option value="-4">Scheduled Refund</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">		
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="txtOrderIdSearch">Order Id</label>
									<div class="col-sm-6">
										<input type="text" id="txtOrderIdSearch" name="txtOrderIdSearch" class="form-control" value="">
									</div>
								</div>								
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="txtOrderNoSearch">Order No</label>
									<div class="col-sm-6">
										<input type="text" id="txtOrderNoSearch" name="txtOrderNoSearch" class="form-control" value="">
									</div>
								</div>								
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-4 control-label" for="ddlStatusSearch">Records</label>
									<div class="col-sm-8">
										<select id="ddlNoOfRecordsSearch" class="form-control input-sm">
											<option value="0">All</option>
											<option value="10">Top 10</option>
											<option value="50">Top 50</option>
											<option value="100">Top 100</option>
											<option value="200">Top 200</option>
											<option value="500">Top 500</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="ddlServiceCodeSearch">Application Type</label>
									<div class="col-sm-8">
										<select id="ddlServiceCodeSearch" class="form-control">
											<option value="">All Services</option>
											<option value="MOV">Movies</option>
											<option value="EVN">Events</option>
										</select>
									</div>
								</div>				
							</div>
							<div class="col-sm-4">
															
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
	<div id="divDataListL2" class="block full display-none">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnBackToListL2" class="btn btn-sm btn-warning"
					data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
			</div>
			<h2>
				<label id="lblTitlePL2" class="control-label"></label>
				&nbsp; Payment Log</h2>
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
				&nbsp; Booking Log</h2>
		</div>
		<!-- END All Products Title -->
		<!-- All Categories Content -->
		<div class="table-responsive" id="divListL3">
		</div>
		<!-- END All Products Content -->
	</div>
	<div id="divDataEdit" class="block full display-none">
		<!-- General Data Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<%--<a id="btnSubmit" class="btn btn-sm btn-primary"
                    data-toggle="tooltip" title="Save" data-original-title="Save"><i class="fa fa-floppy-o"></i></a>--%>
				<a id="btnBackTopL2" class="btn btn-sm btn-warning"
					data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
			</div>
			<h2 id="headerEdit"><i class="fa fa-pencil"></i><strong></strong>Refund Details</h2>
		</div>
		<!-- END General Data Title -->
		<!-- General Data Content -->
		<div class="form-horizontal" onsubmit="return false;">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<div id="divMessage">
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-md-3 control-label" for="lblTitleMainEdit">Pay Trans Id</label>
									<div class="col-md-9">
										<label id="lblPayTransId" class="control-label"></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtOrderId">Order Id</label>
									<div class="col-md-9">
										<label id="lblOrderId" class="control-label"></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtRemark">Remark</label>
									<div class="col-md-8">
										<textarea id="txtRemark" name="txtRemark"
											rows="8" class="form-control" placeholder="Enter Remark.."></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">Process Bank refund?</label>
									<div class="col-md-8">
										<label class="switch switch-primary">
											<input type="checkbox" id="chkProcessRefund" name="chkProcessRefund" checked><span></span>
										</label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">Send Instruction to the customer?</label>
									<div class="col-md-8">
										<label class="switch switch-primary">
											<input type="checkbox" id="chkSendInstructionToCustomer" name="chkSendInstructionToCustomer" checked><span></span>
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="block">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group form-actions">
									<div class="col-md-9 col-md-offset-3">
										<input type="hidden" id="hdnRef" />
										<input type="hidden" id="hdnRefConfig" />
										<button type="button" id="btnSubmit" class="btn btn-sm btn-primary"><i class="fa"></i>Submit</button>
										<button type="button" id="btnBack" class="btn btn-sm btn-warning"><i class="fa"></i>Back</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function () {
			RPTPaySearch.init();
		});
	</script>
</asp:Content>

