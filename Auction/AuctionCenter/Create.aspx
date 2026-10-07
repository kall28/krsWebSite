<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_AuctionCenter_Create, App_Web_create.aspx.aadda0d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>

        var tempId = 0;
        var SuppData = "";
        $(document).ready(function () {
            SetDataTablePaging("#tblList");
        })

        function Submit() {
            if (!$("#chkVendor input[type='checkbox']").is(":checked")) {
                ShowModalMsgBox("Error", "Please select atleast one supplier.");
                window.location = "Create.aspx";
                //ShowToolTip("#chkCompany", "Please Select Company.");
                return false;
            }
            else {
                $("#ContentPlaceHolder1_xbtnSubmitClick").click();
                $("#ContentPlaceHolder1_xhdnRFPId").val(tempId);
            }
        }
        function RFP_click(Id) {
            tempId = Id;
            ShowProgress(true);
            $("#ContentPlaceHolder1_xhdnRFPId").val(Id);
            $.ajax({
                type: 'POST',
                url: 'Create.aspx/RFPClick',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id':'" + Id.toString() + "'}",
                cache: false,
                success: function (msg) {
                    window.location = msg.d;
                },

                error: ShowError
            });
            HideProgress();
        }

        function ShowSuppPopUpBox(title, msg) {
            $("#SuppmsgHeader").html(title);
            $("#SuppmsgBody").html(msg);
            $("#divSuppMsgBox").modal();
        }

        function HideSuppPopUpBox() {
            $("#SuppmsgHeader").html('');
            $("#SuppmsgBody").html('');
            $("#divSuppMsgBox").modal('hide');
        }

        function ViewSupplier(Id) {
            //$("ContentPlaceHolder1_xctrlVendorDet").IsRFPSupp = true;
            ShowVendorDetails(Id);
            HideModalBox("#divSuppMsgBox");
        }

        function ShowSupplierList() {
            ShowModalBox("#divSuppMsgBox");
        }

        function RFPVendorDetails(Id, mode) {
            ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: strUrl + 'AuctionCenter/Create.aspx/ShowRFPVendorDetails',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id': '" + Id + "','mode': '" + mode + "'}",
                cache: false,
                success: function (msg) {
                    ShowModalReportBox("RFP Vendor Details", msg.d);
                    SetDataTablePaging('#tblRFPVendors');
                    HideProgress();
                },
                error: ShowError
            });
        }

    </script>
    <input type="hidden" id="xhdnRFPId" runat="server" />
    <asp:UpdatePanel ID="xUpdPnlRFPDet" runat="server">
        <ContentTemplate>
            <div class="row1 immrb20 whiteBox">
                <h2>Your valid RFPs</h2>
                <asp:Literal ID="xlitRFPDetails" runat="server"></asp:Literal>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <ctrl:VendorDetails ID='xctrlVendorDet' runat='server' Caption='View' />
    <asp:UpdatePanel ID="xUpdPnlRFPVendDet" runat="server">
        <ContentTemplate>
            <div class="row1 immrb20 whiteBox">
                <h2>Invite suppliers to QUOTE</h2>
                <div id="divVendorDet">
                </div>
                <asp:Literal ID="xlitRFPVendorList" runat="server"></asp:Literal>
                <asp:LinkButton class="btnBlk immrt20" ID="xlnkSubmit" runat="server"
                    OnClick="xbtnSubmit_Click" Visible="false">Submit</asp:LinkButton>
                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="modal fade" id="divSuppMsgBox" role="dialog">
        <div class="modal-dialog" style="width: 850px;">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <%--  data-dismiss="modal"--%>
                    <button type="button" class='close' data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="SuppmsgHeader"></h4>
                </div>
                <div class="modal-body">
                    <p id="SuppmsgBody"></p>
                </div>
                <div class="modal-footer">
                    <button id="btnSubmit" class="btnRed" type="button" onclick="javascript:Submit();">
                        Submit</button>
                    <button type="button" class='btnRed' data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

