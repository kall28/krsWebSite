<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="ecomm_Books, App_Web_books.aspx.61bc9349" %>
<%@ MasterType VirtualPath="~/masterpages/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<script src="js/web.comm.ecm.req-1.0.js"></script>
    <script src="../js/web.comm.file-1.0.js"></script>
    <script src="js/ecmbooks-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
    <script src="js/ecmbookinfo-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
    <script src="js/ecmbooktags-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
    <!-- All Categories Block -->
    <div id="divDataList" class="block full">
        <!-- All Products Title -->
        <div class="block-title">
            <div class="block-options pull-right">
                <a href="javascript:void(0)" onclick="javascript:EcmBook.add()"
                    class="btn btn-sm btn-primary"
                    data-toggle="Add Book Details" title="Add Book Details"><i class="fa fa-plus"></i></a>
            </div>
            <h2><strong>All</strong> Books</h2>
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
            <h2 id="headerEdit"><i class="fa fa-pencil"></i><strong>Book</strong> Details</h2>
        </div>
        <!-- END General Data Title -->
        <!-- General Data Content -->
        <div class="form-horizontal form-bordered" onsubmit="return false;">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <div id="divMessage">
                        </div>
                        <div class="row">
                            <div class="col-md-6">
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
                                    <label class="col-md-3 control-label" for="ddlCategoryEdit">Category</label>
                                    <div class="col-md-9">
                                        <select id="ddlCategoryEdit" name="ddlCategoryEdit" class="select-chosen"
                                            data-placeholder="Choose Category.." style="width: 250px;">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtAuthorNameEdit">Author</label>
                                    <div class="col-md-9">
                                        <div class="input-group">
                                            <input type="text" id="txtAuthorNameEdit" name="txtAuthorNameEdit" 
                                                class="form-control" value="" disabled>
                                            <span class="input-group-addon"><a href="#" class="btn btn-xs btn-primary" 
                                                onclick="EcmBook.searchModal();return false;">Select</a></span>
                                        </div>
                                        <input type="hidden" id="hdntxtAuthorRefEdit" name="hdntxtAuthorRefEdit" class="form-control" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtMarketPrice">Market Price</label>
                                    <div class="col-md-8">
                                        <input type="text" id="txtMarketPrice" name="txtMarketPrice" class="form-control" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtPrice">Price</label>
                                    <div class="col-md-8">
                                        <input type="text" id="txtPrice" name="txtPrice" class="form-control" value="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtDescription">Short Description</label>
                                    <div class="col-md-8">
                                        <textarea id="txtDescription" name="txtDescription"
                                            rows="8" class="form-control" placeholder="Enter Description.."></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtPublishedDate">Published Date</label>
                                    <div class="col-md-8">
                                        <input type="text" id="txtPublishedDate" name="txtPublishedDate"
                                            class="form-control input-datepicker" data-date-format="dd/mm/yyyy"
                                            placeholder="dd/mm/yyyy">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Available?</label>
                                    <div class="col-md-9">
                                        <label class="switch switch-primary">
                                            <input type="checkbox" id="chkIsAvailable" name="chkIsAvailable" checked><span></span>
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
                            </div>
                        </div>
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
    <div id="divDataEditL2" class="block full display-none">
        <!-- General Data Title -->
        <div class="block-title">
            <div class="block-options pull-right">
                <%--<a id="btnSubmit" class="btn btn-sm btn-primary"
                    data-toggle="tooltip" title="Save" data-original-title="Save"><i class="fa fa-floppy-o"></i></a>--%>
                <a id="btnBackL2" class="btn btn-sm btn-warning"
                    data-toggle="tooltip" title="Back" data-original-title="Back"><i class="fa fa-arrow-left"></i></a>
            </div>
            <h2 id="headerEditL2"><i class="fa fa-pencil"></i><strong>Book</strong> - Additional Details</h2>
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
    <div id="divModalSel" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h2 class="modal-title">Select Author</h2>
                </div>
                <!-- END Modal Header -->

                <!-- Modal Body -->
                <div class="modal-body">
                    <div class="table-responsive" id="divModalSelList">
                    </div>
                </div>
                <!-- END Modal Body -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

