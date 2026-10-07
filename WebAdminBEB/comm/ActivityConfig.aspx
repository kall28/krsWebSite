<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="comm_ActivityConfig, App_Web_activityconfig.aspx.c93392d6" %>

<%@ MasterType VirtualPath="~/masterpages/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.comm.cmn.req-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<script src="js/comactivityconfig-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<script src="js/comactivityconfigdet-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>

	<div id="divDataList" class="block full">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnAdd" href="javascript:void(0)" class="btn btn-sm btn-primary"
					data-toggle="Add Activity" title="Add Activity"><i class="fa fa-plus"></i></a>
			</div>
			<h2>Activity</h2>
		</div>
		<input type="hidden" id="hdnRefMain" />
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
			<h2 id="headerEdit"><i class="fa fa-pencil"></i><strong>Activity</strong> Config</h2>
		</div>
		<!-- END General Data Title -->
		<!-- General Data Content -->
		<div class="form-horizontal form-bordered" onsubmit="return false;">
			<div id="divMessage">
			</div>
			<%--<div class="form-group">
				<label class="col-md-3 control-label" for="txtName">Application</label>
				<div class="col-md-9">
					<label id="lblTitleMainEditP" class="control-label">Website</label>
				</div>
			</div>--%>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label" for="txtName">Title</label>
						<div class="col-md-9">
							<input type="text" id="txtTitle" name="txtTitle" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label" for="txtCode">Code</label>
						<div class="col-md-9">
							<input type="text" id="txtCode" name="txtCode" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label" for="txtCode">Type Code</label>
						<div class="col-md-9">
							<input type="text" id="txtTypeCode" name="txtCode" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label" for="txtDescription">Description</label>
						<div class="col-md-9">
							<input type="text" id="txtDescription" name="txtDescription" class="form-control" value="">
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
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label" for="ddlMessageTypeCodeEdit">Message Type Code</label>
						<div class="col-md-9">
							<select id="ddlMessageTypeCodeEdit" name="ddlMessageTypeCodeEdit" class="select-chosen"></select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label" for="ddlLogTypeEdit">Log Type</label>
						<div class="col-md-9">
							<select id="ddlLogTypeEdit" name="ddlLogTypeEdit" class="select-chosen"></select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Mark As Default?</label>
						<div class="col-md-9">
							<label class="switch switch-primary">
								<input type="checkbox" id="chkIsDefault" name="chkIsDefault" checked><span></span>
							</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Encrypt Log?</label>
						<div class="col-md-9">
							<label class="switch switch-primary">
								<input type="checkbox" id="chkEncryptLog" name="chkEncryptLog" checked><span></span>
							</label>
						</div>
					</div>

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
	<!-- END All Products Block -->
	<div id="divDataListL2" class="block full display-none">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnAddL2" href="javascript:void(0)" class="btn btn-sm btn-primary"
					data-toggle="Add Page" title="Add Page"><i class="fa fa-plus"></i></a>
				<a id="btnBackToListL2" class="btn btn-sm btn-warning"
					data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
			</div>
			<h2>
				<label id="lblTitlePL2" class="control-label"></label>
				&nbsp;Activity Details</h2>
		</div>
		<input type="hidden" id="hdnRefMainL2" />
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
			<h2 id="headerEditL2"><i class="fa fa-pencil"></i><strong></strong>Details</h2>
		</div>
		<!-- END General Data Title -->
		<!-- General Data Content -->
		<div class="form-horizontal" onsubmit="return false;">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<div id="divMessageL2">
						</div>
						<div class="row">
							<div class="col-md-6">
								<%--<div class="form-group">
									<label class="col-md-3 control-label" for="lblTitleMainEditPL2">Application</label>
									<div class="col-md-9">
										<label id="lblTitleMainEditPL2" class="control-label">Website</label>
									</div>
								</div>--%>
								<div class="form-group">
									<label class="col-md-3 control-label" for="lblTitleEditP">Page</label>
									<div class="col-md-9">
										<label id="lblTitleEditP" class="control-label"></label>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label" for="ddlCommTypeCodeEdit">Message Type Code</label>
									<div class="col-md-9">
										<select id="ddlCommTypeCodeEdit" name="ddlCommTypeCodeEdit" class="select-chosen"></select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtTheamCodeEdit">Theam Code</label>
									<div class="col-md-9">
										<input type="text" id="txtTheamCodeEdit" name="txtTheamCodeEdit" class="form-control" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtTemplateCode">Template Code</label>
									<div class="col-md-9">
										<input type="text" id="txtTemplateCode" name="txtTemplateCode" class="form-control" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="ddlCommProcessModeEdit">Process Mode</label>
									<div class="col-md-9">
										<select id="ddlCommProcessModeEdit" name="ddlCommProcessModeEdit" class="select-chosen"></select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtSenderName">Sender Name</label>
									<div class="col-md-9">
										<input type="text" id="txtSenderName" name="txtSenderName" class="form-control" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtSenderEmail">Sender Email</label>
									<div class="col-md-9">
										<input type="text" id="txtSenderEmail" name="txtSenderEmail" class="form-control" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtMessageCC">Message CC</label>
									<div class="col-md-9">
										<input type="text" id="txtMessageCC" name="txtMessageCC" class="form-control" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtMessageBCC">Message BCC</label>
									<div class="col-md-9">
										<input type="text" id="txtMessageBCC" name="txtMessageBCC" class="form-control" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">Notify?</label>
									<div class="col-md-9">
										<label class="switch switch-primary">
											<input type="checkbox" id="chkNotifyL2" name="chkNotifyL2" checked><span></span>
										</label>
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
							</div>
						</div>
					</div>

					<div class="block">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group form-actions">
									<div class="col-md-9 col-md-offset-3">
										<input type="hidden" id="hdnRefL2" />
										<button type="button" id="btnSubmitL2" class="btn btn-sm btn-primary"><i class="fa"></i>Submit</button>
										<button type="button" id="btnBackL2" class="btn btn-sm btn-warning"><i class="fa"></i>Back</button>
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
			ComActivityConfig.init();
		});
	</script>
</asp:Content>

