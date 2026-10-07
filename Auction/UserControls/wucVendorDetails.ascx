<%@ control language="C#" autoeventwireup="true" inherits="New_UserControls_wucVendorDetails, App_Web_wucvendordetails.ascx.6bb32623" %>
<script>
    //function ShowVendorDetails(vendorId) {

    function ShowVendorDetails(vendorId, entityId, BookmarkStatus) {
        $("#ContentPlaceHolder1_xctrlVendorDet_xhdnVendorId").val(vendorId);
        ShowProgress(true);
        $.ajax({
            //url: strUrl + 'Handlers/ViewDetails.ashx?VendorId=' + vendorId,
            url: strUrl + 'Handlers/ViewDetails.ashx?VendorId=' + vendorId + '&EntityId=' + entityId + '&BookmarkStatus=' + BookmarkStatus,
            type: 'POST',  // or get
            contentType: 'application/json; charset =utf-8',
            data: "{'VendorId':'" + vendorId + "'}",
            dataType: 'json',
            cache: false,
            success: function (data) {
                try {
                    ShowModalBoxAny('#divMsgBoxVendor', 'Vendor Details', data);
                    HideProgress();
                }
                catch (e) {
                }
            },
            error: function (data) {
            }
        });
    }

    function btnBookmarkclick(VendorId) {
        //ShowProgress(true);
        $.ajax({
            url: strUrl + 'Masters/AddSupplier.aspx/BookMarkSupp',
            type: 'POST',  // or get
            contentType: 'application/json; charset =utf-8',
            data: "{'VendorId':'" + VendorId + "'}",
            dataType: 'json',
            success: function (data) {
                var newData = data.d;
                if (newData != null) {
                    $("#btnBookmark").css({ 'display': "none" });
                    $("#lblBookmarked").css({ 'display': "block" })
                }
                else {

                }
            },
            error: function (data) {

            }
        });
    }

</script>
 <asp:HiddenField ID ="xhdnVendorId" runat="server" />
<div class="modal fade" id="divMsgBoxVendor" role="dialog">
   
    <div class="modal-dialog" style="width: 850px;">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" id="btnCloseTOP" runat="server" onclick="closeVendorDet();return false;">&times;</button>
                <h4 class="modal-title" id="msgHeaderVendor">Vendor details</h4>
            </div>
            <div class="modal-body">
                <p id="msgBodyVendor">
                   
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnCloseBottom" onclick="closeVendorDet();return false;">Close</button>
            </div>
        </div>
    </div>
</div>

<asp:Literal ID="xlitScript" runat="server"></asp:Literal>
