<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="cnt_WebImages, App_Web_webimages.aspx.544592ef" %>

<%@ MasterType VirtualPath="~/masterpages/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/cntwebimages-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<div id="divDataList" class="block full">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnAdd" href="javascript:void(0)" class="btn btn-sm btn-primary"
					data-toggle="Add Image" title="Add Image"><i class="fa fa-plus"></i></a>
			</div>
			<h2>Common Images</h2>
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
			<h2 id="headerEdit"><i class="fa fa-pencil"></i><strong>Image</strong> Details</h2>
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
									<label class="col-md-3 control-label" for="txtName">Title</label>
									<div class="col-md-9">
										<input type="text" id="txtTitle" name="txtTitle" class="form-control" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtSysName">Sys Name</label>
									<div class="col-md-9">
										<input type="text" id="txtSysName" name="txtSysName" class="form-control" value="" maxlength="10">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtDescription">Description</label>
									<div class="col-md-9">
										<input type="text" id="txtDescription" name="txtDescription" class="form-control" value="">
									</div>
								</div>
								<%--<div class="form-group">
									<label class="col-md-3 control-label">Published?</label>
									<div class="col-md-9">
										<label class="switch switch-primary">
											<input type="checkbox" id="chkStatus" name="chkStatus" checked><span></span>
										</label>
									</div>
								</div>--%>
							</div>
							<div class="col-md-6">
								<div class="block">
									<div class="block-title">
										<h6>Image</h6>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<div class="col-md-12">
													<img id="imgPanelImage" alt="Click to select image"
														style="border: solid 1pt #808080; max-width: 100%; height: auto; display: block;" />
													<input type="file" class="upload" id="fileUplPanelImage" style="display: none;">
													<input type="hidden" id="hdnPanelImageFileName" />
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<div class="col-md-12">
													<textarea id="txtFullPath" name="txtFullPath"
														rows="3" class="form-control"></textarea>
													<%--<label id="lblFullPath"></label>--%>
													<%--<input type="text" id="txtFullPath" name="txtFullPath" class="form-control" value="">--%>
												</div>
											</div>
										</div>
									</div>
								</div>
								<%--<div class="form-group">
									<label class="col-md-3 control-label" for="ddlClickModeEdit">On Click Mode</label>
									<div class="col-md-9">
										<select id="ddlClickModeEdit" class="form-control">
											<option value="0">Not Clickable</option>
											<option value="1">Internal Link</option>
											<option value="2">External Link</option>
											<option value="3">Email Link</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="txtClickAction">On Click Action</label>
									<div class="col-md-9">
										<input type="text" id="txtClickAction" name="txtClickAction" class="form-control" value="">
									</div>
								</div>--%>
							</div>
						</div>
					</div>
					<div class="block">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group form-actions">
									<div class="col-md-9 col-md-offset-3">
										<input type="hidden" id="hdnRef" />
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
			CntWebImages.init();
		});
	</script>
</asp:Content>

