<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="cnt_News, App_Web_news.aspx.544592ef" %>

<%@ MasterType VirtualPath="~/masterpages/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="../js/helpers/ckeditor/ckeditor.js"></script>
	<script src="js/cntnews-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<!-- All Categories Block -->
	<div id="divDataList" class="block full">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnAdd" href="javascript:void(0)" class="btn btn-sm btn-primary"
					data-toggle="Add News" title="Add News"><i class="fa fa-plus"></i></a>
			</div>
			<h2><strong>All</strong> News</h2>
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
			<h2 id="headerEdit"><i class="fa fa-pencil"></i><strong>News</strong> Details</h2>
		</div>
		<!-- END General Data Title -->
		<!-- General Data Content -->
		<div class="form-horizontal form-bordered" onsubmit="return false;">
			<div id="divMessage">
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtTitle">Title</label>
				<div class="col-md-9">
					<input type="text" id="txtTitle" name="txtTitle" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtAuthorTitle">Author Name</label>
				<div class="col-md-9">
					<input type="text" id="txtAuthorTitle" name="txtAuthorTitle" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtShortDescription">Short Description</label>
				<div class="col-md-8">
					<textarea id="txtShortDescription" name="txtShortDescription"
						rows="8" class="form-control" placeholder="Enter Short Description.."></textarea>
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
				<label class="col-md-3 control-label" for="txtPublishDate">Publish Date</label>
				<div class="col-md-3">
					<input type="text" id="txtPublishDate" name="txtPublishDate"
						class="form-control input-datepicker-close" data-date-format="dd/mm/yyyy" placeholder="dd/mm/yyyy">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtPublishDate">Publish Time</label>
				<div class="col-md-3">
					<div class="input-group bootstrap-timepicker">
						<input type="text" id="txtPublishTime" name="txtPublishTime" class="form-control input-timepicker24">
						<span class="input-group-btn">
							<a href="javascript:void(0)" class="btn btn-primary"><i class="fa fa-clock-o"></i></a>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Dispaly Dates</label>
				<div class="col-md-8">
					<div class="input-group input-daterange" data-date-format="dd/mm/yyyy">
						<input type="text" id="txtFromDate" name="txtFromDate" class="form-control text-center input-datepicker-close" placeholder="From">
						<span class="input-group-addon"><i class="fa fa-angle-right"></i></span>
						<input type="text" id="txtToDate" name="txtToDate" class="form-control text-center input-datepicker-close" placeholder="To">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Thumbnail Image</label>
				<div class="col-md-9">
					<img id="imgThumbnailImage" alt="Thumbnail Image" style="border: solid 1pt #808080; width: 100px; height: 50px; display: block;" />
					<input type="file" class="upload" id="fileUplThubnail" style="display: none;">
					<input type="hidden" id="hdnThumbnailFileName" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Thumbnail Image (Mobile)</label>
				<div class="col-md-9">
					<img id="imgThumbnailImageMob" alt="Mobile Apps Thumbnail Image" style="border: solid 1pt #808080; width: 100px; height: 50px; display: block;" />
					<input type="file" class="upload" id="fileUplThubnailMob" style="display: none;">
					<input type="hidden" id="hdnThumbnailFileNameMob" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Banner Image</label>
				<div class="col-md-9">
					<img id="imgBannerImage" alt="Banner" style="border: solid 1pt #808080; width: 100px; height: 50px; display: block;" />
					<input type="file" class="upload" id="fileUplBanner" style="display: none;">
					<input type="hidden" id="hdnBannerFileName" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtPublishURL">Publish URL</label>
				<div class="col-md-8">
					<textarea id="txtPublishURL" name="txtPublishURL"
						rows="8" class="form-control" placeholder="Enter Publish URL.."></textarea>
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
			CntNews.init();
			CKEDITOR.replace("txtDescription", { customConfig: WebNavHelper.getTextEditorBasicConfig() });
		});
	</script>
</asp:Content>

