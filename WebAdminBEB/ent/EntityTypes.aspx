<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="ent_EntityTypes, App_Web_entitytypes.aspx.99947c25" %>
<%@ MasterType VirtualPath="~/masterpages/SitePageMaster.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<script src="js/web.comm.ecm.req-1.0.js"></script>
    <script src="js/ententitytype-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
    <script src="js/ententitytypeinfo-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
    <script src="js/ententitytypetagtypes-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
    <!-- All Categories Block -->
    <div id="divDataList" class="block full">
        <!-- All Products Title -->
        <div class="block-title">
            <div class="block-options pull-right">
                <a id="btnAdd" href="javascript:void(0)" class="btn btn-sm btn-primary"
                    data-toggle="Add Entity Type" title="Add Entity Type"><i class="fa fa-plus"></i></a>
            </div>
            <h2><strong>All</strong> Entity Types</h2>
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
            <h2 id="headerEdit"><i class="fa fa-pencil"></i><strong>Entity Type </strong>Details</h2>
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
                <div class="col-md-9">
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
                    data-toggle="Add Tag" title="Add Tag"><i class="fa fa-plus"></i></a>
                <a id="btnBackToList" class="btn btn-sm btn-warning"
                    data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
            </div>
            <h2><label id="lblTitleP" class="control-label"></label> - Info Types</h2>
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
            <h2 id="headerEditL2"><i class="fa fa-pencil"></i><strong>Info</strong> Details</h2>
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
                                    <label class="col-md-3 control-label" for="txtName">Product Type</label>
                                    <div class="col-md-9">
                                        <input type="text" id="txtTitleEditP" name="txtTitleEditP" class="form-control" value="" disabled>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtCodeL2">Code</label>
                                    <div class="col-md-9">
                                        <input type="text" id="txtCodeL2" name="txtCodeL2" class="form-control" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtTitleL2">Title</label>
                                    <div class="col-md-9">
                                        <input type="text" id="txtTitleL2" name="txtTitleL2" class="form-control" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtDescriptionL2">Description</label>
                                    <div class="col-md-8">
                                        <textarea id="txtDescriptionL2" name="txtDescriptionL2"
                                            rows="8" class="form-control" placeholder="Enter Description.."></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="ddlInfoTypeL2">Content Type</label>
                                    <div class="col-md-9">
                                        <select id="ddlInfoTypeL2" name="ddlInfoTypeL2" class="form-control" size="1">
                                            <option value="NTC">Normal Text Content</option>
                                            <option value="LTC">Large Text Content</option>
                                            <option value="NUM">Numeric Value</option>
                                            <option value="MON">Money</option>
                                            <option value="ERF">Entity Reference</option>
                                        </select>
                                    </div>
                                </div>                                
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtMaxLengthL2">Maxlength</label>
                                    <div class="col-md-9">
                                        <input type="text" id="txtMaxLengthL2" name="txtMaxLengthL2" class="form-control" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtSortOrderL2">Sort Order</label>
                                    <div class="col-md-9">
                                        <input type="text" id="txtSortOrderL2" name="txtSortOrderL2" class="form-control" value="">
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
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="divDataEditL3" class="block full display-none">
        <!-- General Data Title -->
        <div class="block-title">
            <div class="block-options pull-right">
                <a id="btnSubmitL3" class="btn btn-sm btn-primary"
                    data-toggle="tooltip" title="Save" data-original-title="Save"><i class="fa fa-floppy-o"></i></a>
                <a id="btnBackL3" class="btn btn-sm btn-warning"
                    data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
            </div>
            <h2 id="headerEditL3"><i class="fa fa-pencil"></i><strong>Entity Type</strong> - Tag Types</h2>
        </div>
        <!-- END General Data Title -->
        <!-- General Data Content -->
        <div class="form-horizontal" onsubmit="return false;">
            <div class="row">
                <div class="col-md-12">
                    <div class='form-group'>
                        <div class='col-md-12' id="divFormEditL3">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

