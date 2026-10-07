<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="ent_Authors, App_Web_authors.aspx.99947c25" %>
<%@ MasterType VirtualPath ="~/masterpages/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<script src="../js/web.comm.file-1.0.js"></script>
    <script src="js/entauthor-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
    <script src="js/ententityinfo-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
    <script src="js/ententitytag-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
    <!-- All Categories Block -->
    <div id="divDataList" class="block full">
        <!-- All Products Title -->
        <div class="block-title">
            <div class="block-options pull-right">
                <a href="javascript:void(0)" onclick="javascript:EntAuthor.add()"
                    class="btn btn-sm btn-primary"
                    data-toggle="Add Author Details" title="Add Author"><i class="fa fa-plus"></i></a>
            </div>
            <h2><strong>All</strong> Authors</h2>
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
            <h2 id="headerEdit"><i class="fa fa-pencil"></i><strong>Author</strong> Details</h2>
        </div>
        <!-- END General Data Title -->
        <!-- General Data Content -->
        <div class="form-horizontal" onsubmit="return false;">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <div id="divMessage">
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Thumbnail Image</label>
                            <div class="col-md-9">
                                <img id="imgThumbnailImage" alt="Thumbnail Image" style="border: solid 1pt #808080; width: 150px; height: 150px; display: block;" />
                                <input type="file" class="upload" id="fileUplThubnail" style="display: none;">
                                <input type="hidden" id="hdnThumbnailFileName" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="txtName">Title</label>
                            <div class="col-md-9">
                                <input type="text" id="txtTitle" name="txtTitle" class="form-control" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="txtDescription">Short Description</label>
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
            </div>
        </div>
    </div>
    <div id="divDataEditL2" class="block full display-none">
        <!-- General Data Title -->
        <div class="block-title">
            <div class="block-options pull-right">
                <%--<a id="btnSubmit" class="btn btn-sm btn-primary"
                    data-toggle="tooltip" title="Save" data-original-title="Save"><i class="fa fa-floppy-o"></i></a>--%>
                <a id="btnBackL2" class="btn btn-sm btn-warning"
                    data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
            </div>
            <h2 id="headerEditL2"><i class="fa fa-pencil"></i><strong>Author</strong> - Additional Details</h2>
        </div>
        <!-- END General Data Title -->
        <!-- General Data Content -->
        <div class="form-horizontal" onsubmit="return false;">
            <div class="row">
                <div class="col-md-12" id="divFormEditL2">
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
            <h2 id="headerEditL3"><i class="fa fa-pencil"></i><strong>Book</strong> - Tags</h2>
        </div>
        <!-- END General Data Title -->
        <!-- General Data Content -->
        <div class="form-horizontal form-bordered" onsubmit="return false;">
            <div class="row">
                <div class="col-md-12" id="divFormEditL3">
                </div>
            </div>
        </div>
    </div>
</asp:Content>

