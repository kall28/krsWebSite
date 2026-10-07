<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="masters_Locations, App_Web_locations.aspx.6044e34" %>

<%@ MasterType VirtualPath="~/masterpages/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/mstcountries-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<script src="js/mststates-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<script src="js/mstcities-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<!-- All Categories Block -->
	<div id="divDataList" class="block full">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnAdd" href="javascript:void(0)" class="btn btn-sm btn-primary"
					data-toggle="Add Country" title="Add Country"><i class="fa fa-plus"></i></a>
			</div>
			<h2><strong>All</strong> Countries</h2>
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
			<h2 id="headerEdit"><i class="fa fa-pencil"></i><strong>Country</strong> Details</h2>
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
				<label class="col-md-3 control-label" for="txtISOCode">ISO Code</label>
				<div class="col-md-3">
					<input type="text" id="txtISOCode" name="txtISOCode" class="form-control" value="" maxlength="2">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtISOCodeNum">ISO Code (Numeric)</label>
				<div class="col-md-3">
					<input type="text" id="txtISOCodeNum" name="txtISOCodeNum" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtTimeOffset">Time Offset</label>
				<div class="col-md-3">
					<input type="text" id="txtTimeOffset" name="txtTimeOffset" class="form-control" value="">
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

	<div id="divDataListL2" class="block full display-none">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnAddL2" href="javascript:void(0)" class="btn btn-sm btn-primary"
					data-toggle="Add Province" title="Add State/Province"><i class="fa fa-plus"></i></a>
				<a id="btnBackToList" class="btn btn-sm btn-warning"
					data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
			</div>
			<h2>
				<label id="lblTitlePL2" class="control-label"></label>
				&nbsp; States/Provinces</h2>
		</div>
		<!-- END All Products Title -->
		<!-- All Categories Content -->
		<div class="table-responsive" id="divListL2">
		</div>
		<!-- END All Products Content -->
	</div>
	<!-- END All Products Block -->

	<div id="divDataEditL2" class="block full display-none">
		<!-- General Data Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<%--<a id="btnSubmit" class="btn btn-sm btn-primary"
                    data-toggle="tooltip" title="Save" data-original-title="Save"><i class="fa fa-floppy-o"></i></a>--%>
				<a id="btnBackTopL2" class="btn btn-sm btn-warning"
					data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
			</div>
			<h2 id="headerEditL2"><i class="fa fa-pencil"></i><strong>State/Provinces</strong> Details</h2>
		</div>
		<!-- END General Data Title -->
		<!-- General Data Content -->
		<div class="form-horizontal form-bordered" onsubmit="return false;">
			<div id="divMessageL2">
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="lblTitleEditP">Country</label>
				<div class="col-md-9">
					<label id="lblTitleEditPL2" class="control-label"></label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtName">Title</label>
				<div class="col-md-9">
					<input type="text" id="txtTitleL2" name="txtTitle" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtCodeL2">Code</label>
				<div class="col-md-3">
					<input type="text" id="txtCodeL2" name="txtCodeL2" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Published?</label>
				<div class="col-md-9">
					<label class="switch switch-primary">
						<input type="checkbox" id="chkStatusL2" name="chkStatus" checked><span></span>
					</label>
				</div>
			</div>
			<div class="form-group form-actions">
				<div class="col-md-9 col-md-offset-3">
					<input type="hidden" id="hdnRefL2" />
					<button type="button" id="btnSubmitL2" class="btn btn-sm btn-primary"><i class="fa"></i>Submit</button>
					<button type="button" id="btnBackL2" class="btn btn-sm btn-warning"><i class="fa"></i>Back</button>
				</div>
			</div>
		</div>
	</div>

	<div id="divDataListL3" class="block full display-none">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnAddL3" href="javascript:void(0)" class="btn btn-sm btn-primary"
					data-toggle="Add City" title="Add City"><i class="fa fa-plus"></i></a>
				<a id="btnBackToListL3" class="btn btn-sm btn-warning"
					data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
			</div>
			<h2>
				<label id="lblTitlePL3" class="control-label"></label>
				&nbsp; Cities</h2>
		</div>
		<!-- END All Products Title -->
		<!-- All Categories Content -->
		<div class="table-responsive" id="divListL3">
		</div>
		<!-- END All Products Content -->
	</div>
	<!-- END All Products Block -->

	<div id="divDataEditL3" class="block full display-none">
		<!-- General Data Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<%--<a id="btnSubmit" class="btn btn-sm btn-primary"
                    data-toggle="tooltip" title="Save" data-original-title="Save"><i class="fa fa-floppy-o"></i></a>--%>
				<a id="btnBackTopL3" class="btn btn-sm btn-warning"
					data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
			</div>
			<h2 id="headerEditL3"><i class="fa fa-pencil"></i><strong>City</strong> Details</h2>
		</div>
		<!-- END General Data Title -->
		<!-- General Data Content -->
		<div class="form-horizontal form-bordered" onsubmit="return false;">
			<div id="divMessageL3">
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="lblTitleEditPL3">Country</label>
				<div class="col-md-9">
					<label id="lblTitleEditPL3" class="control-label"></label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="lblTitleEditPL2L3">State</label>
				<div class="col-md-9">
					<label id="lblTitleEditPL2L3" class="control-label"></label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtTitleL3">Title</label>
				<div class="col-md-9">
					<input type="text" id="txtTitleL3" name="txtTitleL3" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtCodeL3">Code</label>
				<div class="col-md-3">
					<input type="text" id="txtCodeL3" name="txtCodeL3" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtTimeOffsetL2">Time Offset</label>
				<div class="col-md-3">
					<input type="text" id="txtTimeOffsetL3" name="txtTimeOffsetL3" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtLatitudeL3">Latitude</label>
				<div class="col-md-3">
					<input type="text" id="txtLatitudeL3" name="txtLatitudeL3" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtLongitudeL3">Longitude</label>
				<div class="col-md-3">
					<input type="text" id="txtLongitudeL3" name="txtLongitudeL3" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Published?</label>
				<div class="col-md-9">
					<label class="switch switch-primary">
						<input type="checkbox" id="chkStatusL3" name="chkStatus" checked><span></span>
					</label>
				</div>
			</div>
			<div class="form-group form-actions">
				<div class="col-md-9 col-md-offset-3">
					<input type="hidden" id="hdnRefL3" />
					<button type="button" id="btnSubmitL3" class="btn btn-sm btn-primary"><i class="fa"></i>Submit</button>
					<button type="button" id="btnBackL3" class="btn btn-sm btn-warning"><i class="fa"></i>Back</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function () {
			MstCountries.init();
		});
	</script>
</asp:Content>

