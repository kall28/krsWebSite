<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="cnt_MobAppContent, App_Web_mobappcontent.aspx.544592ef" %>
<%@ MasterType VirtualPath="~/masterpages/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<script src="../js/helpers/ckeditor/ckeditor.js"></script>
	<script src="js/cntmobpages-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<script src="js/cntmobpagepanels-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<script src="js/cntmobpageimgs-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<div id="divDataList" class="block full">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnAdd" href="javascript:void(0)" class="btn btn-sm btn-primary"
					data-toggle="Add Page" title="Add Page"><i class="fa fa-plus"></i></a>
			</div>
			<h2>Mobile App Pages</h2>
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
			<h2 id="headerEdit"><i class="fa fa-pencil"></i><strong>Tag</strong> Details</h2>
		</div>
		<!-- END General Data Title -->
		<!-- General Data Content -->
		<div class="form-horizontal form-bordered" onsubmit="return false;">
			<div id="divMessage">
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtName">Application</label>
				<div class="col-md-9">
					<label id="lblTitleMainEditP" class="control-label">Mobile App</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtName">Title</label>
				<div class="col-md-9">
					<input type="text" id="txtTitle" name="txtTitle" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtName">System Name</label>
				<div class="col-md-9">
					<input type="text" id="txtSysName" name="txtSysName" class="form-control" value="">
				</div>
			</div>			
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtMetaTags">Meta Tags</label>
				<div class="col-md-8">
					<textarea id="txtMetaTags" name="txtMetaTags"
						rows="8" class="form-control" placeholder="Enter Meta tags.."></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtHeaderScript">Header Scripts</label>
				<div class="col-md-8">
					<textarea id="txtHeaderScripts" name="txtHeaderScripts"
						rows="8" class="form-control" placeholder="Enter Header Script.."></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtFooterScript">Footer Scripts</label>
				<div class="col-md-8">
					<textarea id="txtFooterScripts" name="txtFooterScripts"
						rows="8" class="form-control" placeholder="Enter Footer Script.."></textarea>
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
				&nbsp;Page Panels</h2>
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
			<h2 id="headerEditL2"><i class="fa fa-pencil"></i><strong>Tag</strong> Details</h2>
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
								<div class="form-group">
									<label class="col-md-3 control-label" for="lblTitleMainEditPL2">Application</label>
									<div class="col-md-9">
										<label id="lblTitleMainEditPL2" class="control-label">Mobile App</label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="lblTitleEditP">Page</label>
									<div class="col-md-9">
										<label id="lblTitleEditP" class="control-label"></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtName">System Name</label>
									<div class="col-md-9">
										<input type="text" id="txtSysNameL2" name="txtSysNameL2" class="form-control" value="">
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtName">Title</label>
									<div class="col-md-9">
										<input type="text" id="txtTitleL2" name="txtTitleL2" class="form-control" value="">
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
						<div class="block-title">
							<h6>Panel Image (Optional)</h6>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<div class="col-md-12">
										<img id="imgPanelImage" alt="Panel Image"
											style="border: solid 1pt #808080; max-width: 100%; height: auto; display: block;" />
										<input type="file" class="upload" id="fileUplPanelImage" style="display: none;">
										<input type="hidden" id="hdnPanelImageFileName" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="block">
						<div class="block-title">
							<h6>Panel Content (Optional)</h6>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class='form-group'>
									<div class="col-md-12">
										<textarea id='txtDescriptionL2' name='txtDescriptionL2' class='ckeditor'></textarea>
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

	<div id="divDataListL3" class="block full display-none">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnAddL3" href="javascript:void(0)" class="btn btn-sm btn-primary"
					data-toggle="Add Image" title="Add Image"><i class="fa fa-plus"></i></a>
				<a id="btnBackToListL3" class="btn btn-sm btn-warning"
					data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
			</div>
			<h2>
				<label id="lblTitlePL3" class="control-label"></label>
				&nbsp;Page Images</h2>
		</div>
		<input type="hidden" id="hdnRefMainL3" />
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
			<h2 id="headerEditL3"><i class="fa fa-pencil"></i><strong>Tag</strong> Details</h2>
		</div>
		<!-- END General Data Title -->
		<!-- General Data Content -->
		<div class="form-horizontal" onsubmit="return false;">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<div id="divMessageL3">
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-md-3 control-label" for="lblTitleMainEditPL3">Application</label>
									<div class="col-md-9">
										<label id="lblTitleMainEditPL3" class="control-label">Mobile Apps</label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="lblTitleEditPL3">Page</label>
									<div class="col-md-9">
										<label id="lblTitleEditPL3" class="control-label"></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtName">Title</label>
									<div class="col-md-9">
										<input type="text" id="txtTitleL3" name="txtTitleL3" class="form-control" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtSysNameL3">System Name</label>
									<div class="col-md-9">
										<input type="text" id="txtSysNameL3" name="txtSysNameL3" class="form-control" value="">
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
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtDescriptionL3">Description</label>
									<div class="col-md-9">
										<input type="text" id="txtDescriptionL3" name="txtDescriptionL3" class="form-control" value="">
									</div>
								</div>
								<div class="block">
									<div class="block-title">
										<h6>Panel Image</h6>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<div class="col-md-12">
													<img id="imgPanelImageL3" alt="Panel Image"
														style="border: solid 1pt #808080; max-width: 100%; height: auto; display: block;" />
													<input type="file" class="upload" id="fileUplPanelImageL3" style="display: none;">
													<input type="hidden" id="hdnPanelImageFileNameL3" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="ddlClickModeEditL3">On Click Mode</label>
									<div class="col-md-9">
										<select id="ddlClickModeEditL3" class="form-control">
											<option value="0">Not Clickable</option>
											<option value="1">Internal Link</option>
											<option value="2">External Link</option>
											<option value="3">Email Link</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtClickActionL3">On Click Action</label>
									<div class="col-md-9">
										<input type="text" id="txtClickActionL3" name="txtClickActionL3" class="form-control" value="">
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
										<input type="hidden" id="hdnRefL3" />
										<button type="button" id="btnSubmitL3" class="btn btn-sm btn-primary"><i class="fa"></i>Submit</button>
										<button type="button" id="btnBackL3" class="btn btn-sm btn-warning"><i class="fa"></i>Back</button>
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
			CntMobPages.init();
			CKEDITOR.replace("txtDescriptionL2", { customConfig: WebNavHelper.getTextEditorBasicConfig() });
		});
	</script>
</asp:Content>

