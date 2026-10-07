<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Masters_AddSupplier, App_Web_addsupplier.aspx.6044e34" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script>
        $(document).ready(function () {
            //BindPaging('tblList');
        });

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            //BindPaging('tblList');
            //BindPaging('tblVerifyList');
            //$('#tblList').DataTable({
            //    responsive: true
            //});
            //$('#tblVerifyList').DataTable({
            //    responsive: true
            //});
        });

        function lnkbtnRegister_Click() {
            if ($("#ContentPlaceHolder1_xtxtName").val() == "") {
                $("#ContentPlaceHolder1_xtxtName").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtName"), "Please enter name.", "bottom");
                return false;
            }
            if ($("#ContentPlaceHolder1_xtxtEmail").val() == "") {
                $("#ContentPlaceHolder1_xtxtEmail").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtEmail"), "Please enter email address", "bottom");
                return false;
            }
            else if (!validateEmail($("#ContentPlaceHolder1_xtxtEmail").val())) {
                $("#ContentPlaceHolder1_xtxtEmail").focus();
                ShowToolTip("#ContentPlaceHolder1_xtxtEmail", "Please enter valid email address", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xddlCat option:selected").index() <= 0) {
                $("#ContentPlaceHolder1_xddlCat").focus();
                ShowToolTip("#ContentPlaceHolder1_xddlCat", "Please Select Category", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtFirstName").val() == "") {
                $("#ContentPlaceHolder1_xtxtFirstName").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtFirstName"), "Please Enter Contact Name.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtMobileNo").val() == "") {
                $("#ContentPlaceHolder1_xtxtMobileNo").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMobileNo"), "Please Enter MobileNo.", "bottom");
                return false;
            }
            else if ($("#ContentPlaceHolder1_xtxtMobileNo").val().length < 10) {
                $("#ContentPlaceHolder1_xtxtMobileNo").focus();
                ShowToolTip($("#ContentPlaceHolder1_xtxtMobileNo"), "Please Enter valid MobileNo .", "bottom");
                return false;
            }

            ShowProgress();
            return true;
        }

        function SetOrder(VendorId) {
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'Masters/AddSupplier.aspx/SetOrder',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'VendorId':'" + VendorId + "'}",
                dataType: 'json',
                success: function (data) {
                    var newData = data.d;
                    if (newData != null) {
                        window.location = newData;
                    }
                    else {
                        //alert(newData.ErrDesc);
                    }
                },
                error: function (data) {

                }
            });
        }

        function BookMarkSupp(VendorId) {
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'Masters/AddSupplier.aspx/BookMarkSupp',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'VendorId':'" + VendorId + "'}",
                dataType: 'json',
                success: function (data) {
                    var newData = data.d;
                    if (newData != null) {
                        window.location = newData;
                    }
                    else {
                        //alert(newData.ErrDesc);
                    }
                },
                error: function (data) {

                }
            });
        }

        function xddlSupplierType_Change(Type) {
            //var Type = $("#ContentPlaceHolder1_xddlSupplierType").val();
            if (Type == "VS") {
                //$("#ContentPlaceHolder1_DivSuppList").show();
                //$("#ContentPlaceHolder1_DivAddSupp").hide();
                $("#ContentPlaceHolder1_DivVerifySuppList").show();
                $("#ContentPlaceHolder1_DivAddSupp").hide();
                $("#lnkVS").addClass("act");
                $("#lnkOS").removeClass("act");
            }
            else {
                $("#ContentPlaceHolder1_DivAddSupp").show();
                $("#ContentPlaceHolder1_DivVerifySuppList").hide();
                $("#lnkVS").removeClass("act");
                $("#lnkOS").addClass("act");
            }
            return false;
        }

        function InviteMore() {
            $("#ContentPlaceHolder1_DivAddSupp").show();
            $("#ContentPlaceHolder1_DivVerifySuppList").hide();

            $("#ContentPlaceHolder1_xtxtEmail").val("");
            $("#ContentPlaceHolder1_xtxtName").val("");
            $("#ContentPlaceHolder1_xtxtFirstName").val("");
            $("#ContentPlaceHolder1_xtxtMobileNo").val("");
            $('#ContentPlaceHolder1_xddlCat').val('0');

            HideModalBox('#divConfirm');
        }
    </script>

    <script>
        //accordian faq
        $(document).ready(function () {
            var selectIds = $('#panel1,#panel2,#panel3');
            $(function ($) {
                selectIds.on('show.bs.collapse hidden.bs.collapse', function () {
                    $(this).prev().find('.glyphicon').toggleClass('glyphicon-plus glyphicon-minus');
                })
            });
        });
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
    <asp:UpdatePanel ID="xupnlSupplier" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="clmn1 imw100p fl">
                    <div class="row1">
                        <div class="whiteBox brdPink">
                            <!--<asp:Literal ID="Literal1" runat="server" Text="<h2>Bookmark as Preferred suppliers</h2>"></asp:Literal>-->
                            <h2>Bookmark as Preferred suppliers</h2>
                            <br class="cl" />
                            <br class="cl" />
                            <div class="formRow1 txtCenter imw100p newBtns">
                                <a href="#" id="lnkVS" onclick="return xddlSupplierType_Change('VS')" class="btnRed immr10 act">Renepay  verified suppliers</a>
                                <a href="#" id="lnkOS" onclick="return xddlSupplierType_Change('OS')" class="btnRed">Invite my own supplier</a>
                                <%--<div class="imw100p fl bgGrey">
                                <div class="styled-select selOrganization imw100p">
                                    <asp:DropDownList ID="xddlSupplierType" runat="server" onchange="return xddlSupplierType_Change()">
                                        <asp:ListItem Text="Renepay  verified suppliers" Value="VS" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Invite my own supplier" Value="IS"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>--%>
                            </div>
                            <br class="cl" />

                            <br class="cl" />
                            <div id="DivVerifySuppList" runat="server">
                                <div class="buyRegis">
                                    <div class="formRow">
                                        <div class="formRow1 addSupp">
                                            <div class="imw49p fl immr10">
                                                <asp:TextBox ID="xtxtSuppName" placeholder="Supplier Name" runat="server"
                                                    autocomplete="off" CssClass="imw100p" onkeydown="IsCharacter(event);"></asp:TextBox>
                                            </div>
                                            <div id="divCategory" runat="server" class="imw49p fl bgGrey " visible="false">
                                                <div class="styled-select selOrganization imw100p">
                                                    <asp:DropDownList ID="xddlCategory" runat="server" AutoPostBack="false">
                                                        <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="imw49p fl bgGrey immr0">
                                                <div class="styled-select selOrganization imw100p">
                                                    <asp:DropDownList ID="xddlState" runat="server" AutoPostBack="false">
                                                        <asp:ListItem Text=" Select " Value="0"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="txtCenter">
                                                <div class="formRow1" style="width:100%;">
                                                    <asp:LinkButton ID="xlnkSearch" runat="server" CssClass="btnRed immrt10"
                                                        OnClick="xlnkSearch_Click" OnClientClick="javascript:ShowProgress();">
                                                                SEARCH</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <br class="cl" />
                                    <asp:Literal ID="xlitSupplierList" runat="server"></asp:Literal>
                                </div>
                            </div>

                            <div id="DivAddSupp" runat="server" style="display: none;">
                                <div class="buyRegis">
                                    <div class="formRow">
                                        <label>Company Name</label>
                                        <div class="formRow1">
                                            <asp:TextBox ID="xtxtName" runat="server" CssClass="imw100p" placeholder="Company Name"
                                                onkeypress="return RestrictText(event);" ondrop="return false;" autocomplete="off"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="formRow">
                                        <label>Email ID</label>
                                        <div class="formRow1">
                                            <asp:TextBox ID="xtxtEmail" runat="server" CssClass="imw100p" placeholder="Email Id"
                                                MaxLength="50" autocomplete="off"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="formRow">
                                        <label>Category</label>
                                        <div class="formRow1">
                                            <div class="imw100p fl bgGrey">
                                                <div class="styled-select selOrganization imw90p">
                                                    <asp:DropDownList ID="xddlCat" runat="server" AutoPostBack="false">
                                                        <asp:ListItem Text=" Select Category " Value="0"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="formRow">
                                        <label>Contact Name</label>
                                        <div class="formRow1">
                                            <asp:TextBox ID="xtxtFirstName" runat="server" CssClass="imw100p" placeholder="Contact Name"
                                                ondrop="return false;" onkeydown="return IsCharacter(event);" autocomplete="off"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="formRow">
                                        <label>Mobile Number</label>
                                        <div class="formRow1">
                                            <asp:TextBox ID="xtxtMobileNo" runat="server" CssClass="imw100p" placeholder="Mobile Number"
                                                MaxLength="10" onkeydown="return IsNumeric(event);" autocomplete="off"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="formRow">
                                        <label></label>
                                        <div class="formRow1">
                                            <asp:LinkButton ID="xlnkbtnRegister" runat="server" CssClass="btnRed immrt10"
                                                OnClientClick="javascript: return lnkbtnRegister_Click();"
                                                OnClick="xlnkbtnRegister_Click">ADD</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <br class="cl">
                                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
                                <asp:Literal ID="xlitscrCat" runat="server"></asp:Literal>

                            </div>

                            <div class="clmn1" id="DivBookmarkSupp" runat="server">
                                <asp:Literal ID="xlitBookmarklist" runat="server"></asp:Literal>
                                <br class="cl" />
                                <br class="cl" />
                            </div>

                        </div>
                    </div>

                </div>
            <div class="modal fade" id="divConfirm" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="btnClose" runat="server" class="close"
                                onclick="javascript:link_click('H');">
                                &times;</button>
                            <h4 class="modal-title" id="H1">Invited Supplier!</h4>
                        </div>
                        <div class="modal-body">
                            <p id="pRegMsg" runat="server">
                                Our team will contact your invited supplier shortly and tag them as your preferred supplier once they register on Renepay.
                            </p>
                        </div>
                        <div class="modal-footer">
                            <a class="btnRed" href="#" id="lnkAddSupplier1" runat="server" onclick="InviteMore();"
                                visible="false">INVITE MORE SUPPLIERS</a>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

