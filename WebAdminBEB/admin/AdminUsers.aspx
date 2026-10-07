<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="admin_AdminUsers, App_Web_adminusers.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/masterpages/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.comm.adm.req-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<script src="js/admusers-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<script src="js/admusermenus-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
	<!-- All Categories Block -->
	<div id="divDataList" class="block full">
		<!-- All Products Title -->
		<div class="block-title">
			<div class="block-options pull-right">
				<a id="btnAdd" href="javascript:void(0)" class="btn btn-sm btn-primary"
					data-toggle="Add Admin User" title="Add Admin User"><i class="fa fa-plus"></i></a>
			</div>
			<h2><strong>All</strong> Admin Users</h2>
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
			<h2 id="headerEdit"><i class="fa fa-pencil"></i><strong>Admin User</strong> Details</h2>
		</div>
		<!-- END General Data Title -->
		<!-- General Data Content -->
		<div class="form-horizontal form-bordered" onsubmit="return false;">
			<div id="divMessage">
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="ddlRoleEdit">Role</label>
				<div class="col-md-6">
					<select id="ddlRoleEdit" class="form-control">
					</select>
					<label id="lblRoleEdit" class="control-label"></label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtName">First Name</label>
				<div class="col-md-6">
					<input type="text" id="txtFirstName" name="txtFirstName" class="form-control" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtLastName">Last Name</label>
				<div class="col-md-6">
					<input type="text" id="txtLastName" name="txtLastName" class="form-control" value="" maxlength="30">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="txtEmail">Email</label>
				<div class="col-md-6">
					<input type="text" id="txtEmail" name="txtEmail" class="form-control" value="" maxlength="100">
				</div>
			</div>
			<%--<div class="form-group">
				<label class="col-md-3 control-label" for="txtMobileNo">Mobile No</label>
				<div class="col-md-6">
					<input type="text" id="txtMobileNo" name="txtMobileNo" class="form-control" value="" maxlength="30">
				</div>
			</div>	--%>		
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

	<div id="divDataEditL2" class="block full display-none">
        <!-- General Data Title -->
        <div class="block-title">
            <div class="block-options pull-right">
                <a id="btnSubmitL2" class="btn btn-sm btn-primary"
                    data-toggle="tooltip" title="Save" data-original-title="Save"><i class="fa fa-floppy-o"></i></a>
                <a id="btnBackL2" class="btn btn-sm btn-warning"
                    data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
            </div>
            <h2 id="headerEditL2"><i class="fa fa-pencil"></i><strong>User</strong> - Rights</h2>
        </div>
        <!-- END General Data Title -->
        <!-- General Data Content -->
        <div class="form-horizontal form-bordered" onsubmit="return false;">
            <div class="row">
                <div class="col-md-12" id="divFormEditL2">
                </div>
            </div>
        </div>
    </div>
	<script>
		$(document).ready(function () {
			AdmUsers.init();
		});
	</script>
</asp:Content>

