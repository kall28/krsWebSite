<%@ page title="" language="C#" masterpagefile="~/masterpages/SitePageMaster.master" autoeventwireup="true" inherits="ecomm_FarmProducts, App_Web_farmproducts.aspx.61bc9349" %>
<%@ MasterType VirtualPath="~/masterpages/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<script src="js/web.comm.ecm.req-1.0.js"></script>
    <script src="../js/web.comm.file-1.0.js"></script>
    <script src="js/ecmfrmprods-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
    <script src="js/ecmfrmprodinfo-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
    <script src="js/ecmfrmprodtags-1.0.js?version=<%= WebScriptHelper.getTime() %>"></script>
    <!-- All Categories Block -->
    <div id="divDataList" class="block full">
        <!-- All Products Title -->
        <div class="block-title">
            <div class="block-options pull-right">
                <a href="javascript:void(0)" onclick="javascript:EcmFarmProds.add()"
                    class="btn btn-sm btn-primary"
                    data-toggle="Add Product Details" title="Add Product Details"><i class="fa fa-plus"></i></a>
            </div>
            <h2><strong>All</strong> Products</h2>
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
            <h2 id="headerEdit"><i class="fa fa-pencil"></i><strong>Product</strong> Details</h2>
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
                                    <label class="col-md-3 control-label" for="txtWeight">Weight (gms):</label>
                                    <div class="col-md-8">
                                        <input type="text" id="txtWeight" name="txtWeight" class="form-control" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtPrice">Price:</label>
                                    <div class="col-md-8">
                                        <input type="text" id="txtPrice" name="txtPrice" class="form-control" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtDiscount">Discount:</label>
                                    <div class="col-md-8">
                                        <input type="text" id="txtDiscount" name="txtDiscount" class="form-control" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtOrderPrice">Order Price:</label>
                                    <div class="col-md-8">
                                        <input type="text" id="txtOrderPrice" name="txtOrderPrice" class="form-control" value="">
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
                                    <label class="col-md-3 control-label">Inventory?</label>
                                    <div class="col-md-9">
                                        <label class="switch switch-primary">
                                            <input type="checkbox" id="chkManageInventory" name="chkManageInventory" checked><span></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtStockQty">Stock Qty:</label>
                                    <div class="col-md-8">
                                        <input type="text" id="txtStockQty" name="txtStockQty" class="form-control" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="txtMinStockQty">Min. Stock Qty:</label>
                                    <div class="col-md-8">
                                        <input type="text" id="txtMinStockQty" name="txtMinStockQty" class="form-control" value="">
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
            <h2 id="headerEditL2"><i class="fa fa-pencil"></i><strong>Product</strong> - Additional Details</h2>
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
            <h2 id="headerEditL3"><i class="fa fa-pencil"></i><strong>Product</strong> - Tags</h2>
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
    <script>
        $(document).ready(function () {
			EcmFarmProds.init();
        });
	</script>
</asp:Content>

