<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="masters_Services, App_Web_services.aspx.6044e34" %>

<%@ MasterType VirtualPath="~/masterpages/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/mstservices-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<!-- All Categories Block -->
	<div id="divDataList" class="block full">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnAdd" href="javascript:void(0)" class="btn btn-sm btn-primary"
					data-toggle="Add Service" title="Add Service"><i class="fa fa-plus"></i></a>
			</div>
			<h2><strong>All</strong> Service</h2>
		</div>
		<!-- END All Products Title -->
		<!-- All Categories Content -->
		<div class="table-responsive" id="divList">
		</div>
		<!-- END All Products Content -->
	</div>
	<!-- END All Products Block -->
	<div id="divDataEdit" class="block full display-none">
		<!-- General Data Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<%--<a id="btnSubmit" class="btn btn-sm btn-primary"
                    data-toggle="tooltip" title="Save" data-original-title="Save"><i class="fa fa-floppy-o"></i></a>--%>
				<a id="btnBackTop" class="btn btn-sm btn-warning"
					data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
			</div>
			<h2 id="headerEdit"><i class="fa fa-pencil"></i><strong>Service</strong> Details</h2>
		</div>
		<!-- END General Data Title -->
		<!-- General Data Content -->
		<div class="form-horizontal form-bordered" onsubmit="return false;">
			<div id="divMessage">
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtName">Title</label>
				<div class="col-md-9">
					<input type="text" id="txtTitle" name="txtTitle" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtCode">Code</label>
				<div class="col-md-3">
					<input type="text" id="txtCode" name="txtCode" class="form-control" value="" maxlength="3">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtDescription">Description</label>
				<div class="col-md-8">
					<textarea id="txtDescription" name="txtDescription"
						rows="8" class="form-control" placeholder="Enter Description.."></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Default?</label>
				<div class="col-md-9">
					<label class="switch switch-primary">
						<input type="checkbox" id="chkIsDefault" name="chkIsDefault"><span></span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">System?</label>
				<div class="col-md-9">
					<label class="switch switch-primary">
						<input type="checkbox" id="chkIsSystem" name="chkIsSystem"><span></span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Published?</label>
				<div class="col-md-9">
					<label class="switch switch-primary">
						<input type="checkbox" id="chkStatus" name="chkStatus" checked><span></span>
					</label>
				</div>
			</div>
			<div class="form-group form-actions">
				<div class="col-md-9 col-md-offset-3">
					<input type="hidden" id="hdnRef" />
					<button type="button" id="btnSubmit" class="btn btn-sm btn-primary"><i class="fa"></i>Submit</button>
					<button type="button" id="btnBack" class="btn btn-sm btn-warning"><i class="fa"></i>Back</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function () {
			MstServices.init();
		});
	</script>
</asp:Content>

