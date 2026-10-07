<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="rpt_RptUserSearch, App_Web_rptusersearch.aspx.26acd4a4" %>

<%@ MasterType VirtualPath="~/masterpages/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
	<script src="js/web.comm.mov.req-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<script src="js/rptusersearch-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<!-- All Categories Block -->
	<div id="divDataList" class="block full">
		<!-- All Products Title -->
		<div class="form-horizontal" onsubmit="return false;">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<div class="row">
							<div class="col-md-8">
								<div class="form-group">
									<label class="col-md-3 control-label">
										<input type='checkbox' id='chkregDates' name='chkregDates'>Registration Date
									</label>
									<div class="col-md-8">
										<div class="input-group input-daterange" data-date-format="dd/mm/yyyy">											
											<input type="text" id="txtFromDate" name="txtFromDate" class="form-control text-center input-datepicker-close" placeholder="From">
											<span class="input-group-addon"><i class="fa fa-angle-right"></i></span>
											<input type="text" id="txtToDate" name="txtToDate" class="form-control text-center input-datepicker-close" placeholder="To">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtNameSearch">Name</label>
									<div class="col-md-9">
										<input type="text" id="txtNameSearch" name="txtNameSearch" class="form-control" value="">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtOrderNoSearch">Email</label>
									<div class="col-md-9">
										<input type="text" id="txtEmailSearch" name="txtEmailSearch" class="form-control" value="">
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtMobileNoSearch">Mobile No</label>
									<div class="col-md-9">
										<input type="text" id="txtMobileNoSearch" name="txtMobileNoSearch" class="form-control" value="">
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<div class="col-md-9 col-md-offset-3">
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
	</div>
	<script>
		$(document).ready(function () {
			RPTUserSearch.init();
		});
	</script>
</asp:Content>

