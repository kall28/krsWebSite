<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_AuctionCenter_SetBid, App_Web_setbid.aspx.aadda0d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <link href="../Scripts/TimePicker/jquery.ui.timepicker.css?v=0.3.3" rel="stylesheet" />
    <script src="../Scripts/TimePicker/jquery.ui.timepicker.js"></script>
    <%--<link href="../Styles/clockpicker.css" rel="stylesheet" />
    <script src="../Scripts/clockpicker.js"></script>--%>
    <asp:UpdatePanel ID="xupnlAuction" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <script>
                //$(document).ready(function () {
                //    BindDatePicker();
                //});
                //Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
                //    BindDatePicker();
                //});

                //function BindDatePicker() {
                //    $("#ContentPlaceHolder1_xtxtStartDate").datepicker({
                //        dateFormat: 'dd/mm/yy',

                //    });
                //    $("#ContentPlaceHolder1_xtxtEndDate").datepicker({
                //        dateFormat: 'dd/mm/yy',
                //    });
                //}
                $(document).ready(function () {
                    BindDatePicker();
                });

                Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
                    BindDatePicker();
                    BindClockPicker();
                });

                function BindDatePicker() {
                    var d = new Date();
                    var day = d.getDate();
                    $("#ContentPlaceHolder1_xtxtStartDate").datepicker({
                        dateFormat: 'dd/mm/yy',
                        minDate: d,
                    }).attr('readonly', 'true');

                    $("#ContentPlaceHolder1_xtxtEndDate").datepicker({
                        dateFormat: 'dd/mm/yy',
                        minDate: d,
                    }).attr('readonly', 'true');
                }

                function BindClockPicker() {
                    $('#ContentPlaceHolder1_xtxtStartTime').timepicker({
                        showPeriodLabels: false
                    });
                    $('#ContentPlaceHolder1_xtxtEndTime').timepicker({
                        showPeriodLabels: false
                    });
                    //var input = $('#contentplaceholder1_xtxtstarttime').clockpicker({
                    //    placement: 'top',
                    //    autoclose: true
                    //}).attr('readonly', 'true');

                    //var input = $('#contentplaceholder1_xtxtendtime').clockpicker({
                    //    placement: 'top',
                    //    autoclose: true
                    //}).attr('readonly', 'true');
                }
                function ViewMore(Id) {
                    var rfpId = Id;//$("#ContentPlaceHolder1_xhdnRFPId").val();
                    $.ajax({
                        url: strUrl + 'AuctionCenter/SetBid.aspx/ViewMore',
                        type: 'POST',  // or get
                        contentType: 'application/json; charset =utf-8',
                        data: "{'rfpId':'" + rfpId + "'}",
                        dataType: 'json',
                        success: function (data) {
                            try {
                                var newData = data.d;
                                if (newData != "") {
                                    //$("#divLiveDet").attr('style', 'display:none;');
                                    //$("#ContentPlaceHolder1_divViewMore").attr('style', 'display:block;');
                                    //$("#ContentPlaceHolder1_divViewMore").html(newData);
                                    ShowModalReportBox("RFP Details", newData);
                                }
                                else {
                                    //alert(newData.ErrDesc);
                                }
                            }
                            catch (e) { //alert(e.Message); 
                            }
                        },
                        error: function (data) {
                            //alert(data);
                        }
                    });
                }
                function lnkbtnRegister_Click() {
                    var msg = "";
                    if (!$("#chkVendor input[type='checkbox']").is(":checked")) {
                        ShowModalMsgBox("Error", "Please select atleast one supplier.");
                        //ShowToolTip("#chkCompany", "Please Select Company.");
                        return false;
                    }
                    //if (($("#ContentPlaceHolder1_xtxtStartDate").val() == '') && ($("#ContentPlaceHolder1_xtxtEndDate").val() == '')) {
                    //    msg = "Please select Start Date and End Date.";
                    //    //ShowToolTip("#ContentPlaceHolder1_xtxtStartDate", msg, "bottom");
                    //    ShowModalMsgBox("Error", msg);
                    //    return false;
                    //}
                    //else {
                    if ($("#ContentPlaceHolder1_xtxtStartDate").val() == '') {
                        msg = "Please select Start Date.";
                        //ShowModalMsgBox("Error", msg);
                        ShowToolTip($("#ContentPlaceHolder1_xtxtStartDate"), msg, "bottom");
                        return false;
                    }
                    if ($("#ContentPlaceHolder1_xtxtEndDate").val() == '') {
                        msg = "Please select End Date.";
                        //ShowModalMsgBox("Error", msg);
                        ShowToolTip($("#ContentPlaceHolder1_xtxtEndDate"), msg, "bottom");
                        return false;
                    }
                    //  }

                    //if (($("#ContentPlaceHolder1_xtxtStartTime").val() == '') && ($("#ContentPlaceHolder1_xtxtEndTime").val() == '')) {
                    //    msg = "Please Enter Start Time and End Time.";
                    //    ShowModalMsgBox("Error", msg);
                    //    return false;
                    //}
                    //else {
                    if ($("#ContentPlaceHolder1_xtxtStartTime").val() == '') {
                        msg = "Please Enter Start Time.";
                        //ShowModalMsgBox("Error", msg);
                        ShowToolTip($("#ContentPlaceHolder1_xtxtStartTime"), msg, "bottom");
                        return false;
                    }
                    if ($("#ContentPlaceHolder1_xtxtEndTime").val() == '') {
                        msg = "Please select End Time.";
                        //ShowModalMsgBox("Error", msg);
                        ShowToolTip($("#ContentPlaceHolder1_xtxtEndTime"), msg, "bottom");
                        return false;
                    }
                    // }
                    ShowProgress();
                    return true;
                }

                function ViewSupplier(Id, entityid, bookmarkstatus) {
                    //$("ContentPlaceHolder1_xctrlVendorDet").IsRFPSupp = true;
                    ShowVendorDetails(Id, entityid, bookmarkstatus);
                    //  HideModalBox("#divSuppMsgBox");
                }

                function HideConfrm() {
                    ShowProgress();
                    HideModalBox("#divConfirm");
                }

                function RFP_click(Id) {
                    $.ajax({
                        type: 'POST',
                        url: 'SetBid.aspx/RFP_click',
                        contentType: 'application/json; charset=utf-8',
                        data: "{'rfpId':'" + Id + "'}",
                        dataType: 'json',
                        cache: false,
                        success: function (msg) {
                            if (msg.d != null) {
                                window.location.href = msg.d;
                            }
                        },
                        error: ShowError
                    });
                }
            </script>

            <script>

                //accordian chat
                $(document).ready(function () {
                    var selectIds = $('#chatpanel1,#chatpanel2');
                    $(function ($) {
                        selectIds.on('show.bs.collapse hidden.bs.collapse', function () {
                            $(this).prev().find('.glyphicon').toggleClass('glyphicon-plus glyphicon-minus');
                        })
                    });
                });
            </script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('.btnHelper').click(function () {
                        $('.helpSlide').addClass('HelpMoveRight');
                        $('.helpSlide').show();
                        $('.helpBlockAll').css('display', 'block');
                        $('.helpBlockAll').show();
                        $('.helpSlide').stop().animate({ 'marginRight': '0px' }, 1000);
                        return false;
                    });
                    $('.helpBlockAll').click(function () {
                        $('.helpBlockAll').hide();
                        $('.helpSlide').stop().animate({ 'marginRight': '-768px' }, 200);

                    });

                });
            </script>
            <ctrl:VendorDetails ID='xctrlVendorDet' runat='server' Caption='View' />
            <div class="newCol1 imw30p immr15">
                <div class="innerBxhead bgGrey">
                    RFP Details <a href="#" class="fr">
                        <img src="../images/icn-rfp1.png" /></a>
                </div>
                <div class="innerBxbody brdGrey whiteBox">
                    <ul class="manage">
                        <asp:Literal ID="xlitBidDetails" runat="server"></asp:Literal>
                    </ul>
                </div>
            </div>

            <div class="newCol2 imw42p fr">
                <div class="innerBxhead bgRed">
                    Select Supplier <a href="#" class="fr">
                        <img src="../images/icn-rfp1.png" /></a>
                </div>
                <div class='innerBxbody brdGrey whiteBox'>
                    <div class="buyRegis">

                        <%--<h3>
                                <lable id="xlblMidelHeader" runat="server">Set Quote</lable>
                            </h3>--%>

                        <asp:UpdatePanel ID="xuplnSuppliers" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Literal ID="xlitVendorList" runat="server"></asp:Literal>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <%--<div class="formRow">
                                <label></label>
                                <div class="formRow1">
                                    
                                </div>
                            </div>--%>
                        <div class="formRow">
                            <label>Negotiation Deadline</label>
                            <div class="formRow1">
                                <div class="imw48p fl">
                                    <div class="iconCal">
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                        <asp:TextBox placeholder="Start Date" ID="xtxtStartDate" CssClass="icnCal imw100p immrb20" runat="server" autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="iconTime">
                                        <i class="fa fa-clock-o" aria-hidden="true"></i>
                                        <asp:TextBox ID="xtxtStartTime" placeholder="Start Time" CssClass="icnTime imw100p" runat="server" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="imw48p fr">
                                    <div class="iconCal">
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                        <asp:TextBox ID="xtxtEndDate" placeholder="End Date" CssClass="icnCal imw100p immrb20" runat="server" autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="iconTime">
                                        <i class="fa fa-clock-o" aria-hidden="true"></i>
                                        <asp:TextBox ID="xtxtEndTime" placeholder="End Time" CssClass="icnTime imw100p" runat="server" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script>
                            BindClockPicker();
                        </script>
                        <div class="formRow">
                            <label></label>
                            <div class="formRow1">
                                <asp:LinkButton ID="xlnkbtnStartAuction" class="btnRed" runat="server"
                                    OnClick="xlnkbtnSubmit_Click" OnClientClick="javascript: return lnkbtnRegister_Click();"> CREATE </asp:LinkButton>
                                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <br class="cl" />
                    </div>
                </div>
            </div>
            <!--help panel start here-->
            <div class="btn-help btnHelper">
                <img src="../images/icn-help.png" />
            </div>
            <div class="helpBlockAll"></div>
            <div class="fr helpBlk helpBlkInn srh-help helpSlide">
                <!-- faq start here -->
                <ctrl:FAQ ID="xFAQ" runat="server" />
                <!-- faq end here -->
                <!-- chat start here -->
                <div class="chatBlk">
                    <div class="panel-group" id="chataccordionRenepay">
                        <ctrl:Feedback ID="xFBK" runat="server" Data_Parent="chataccordionRenepay" />
                    </div>
                </div>
                <!-- chat end here -->
            </div>
            <!--help panel end here-->
            <div class="modal fade" id="divConfirm" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="btnClose" runat="server" class="close" onserverclick="btnClose_Click"
                                onclick="HideConfrm();">
                                &times;</button>
                            <h4 class="modal-title" id="H1">Negotiation Confirmation</h4>
                        </div>
                        <div class="modal-body">
                            <p id="pRegMsg" runat="server">
                            </p>
                        </div>
                        <div class="modal-footer" style="display: none;">
                            <a class="btnRed" href="#" id="lnkNext" runat="server"
                                onclick="javascript:link_click('RFPD'); return false;">CLOSE</a>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

