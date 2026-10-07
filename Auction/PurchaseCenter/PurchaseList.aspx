<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_PurchaseCenter_PurchaseList, App_Web_purchaselist.aspx.750f10e" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        $(document).ready(function () {
            BindPaging('tblList');
        });
        $(document).ready(function () {
            //BindPaging('tblListnew');
            BindPaging('tblListAuc');
        });



        function vender_onchange(ctrl, id) {
            var val = ctrl.value.split('|');
            $("#tdAmt" + id).html(val[1]);
            //$("#tdAmt" + id).html(val[0]);
        }

        function RaisePO(Id) {
            var strId = Id.split('|');
            var strkey = strId[1];
            var val = $("#ddlVendorlist" + strId[0]).val().split('|');
            ShowProgress();
            $("#ContentPlaceHolder1_xhdnId").val(Id);
            $("#ContentPlaceHolder1_xhdnSuppId").val(val[0]);
            $("#ContentPlaceHolder1_btnShow").click();
        }

        $(document).ready(function () {
            $('#collapseOne').on('hidden.bs.collapse', function () {
                //setclass("#col1", 'glyphicon-chevron-up', 'glyphicon-chevron-down');
                setclass($("#col1"), 'glyphicon glyphicon-plus', 'glyphicon glyphicon-minus');
            });
            $('#collapseOne').on('shown.bs.collapse', function () {
                //setclass("#col1", 'glyphicon-chevron-down', 'glyphicon-chevron-up');
                setclass($("#col1"), 'glyphicon glyphicon-minus', 'glyphicon glyphicon-plus');
            });

            $('#collapseTwo').on('hidden.bs.collapse', function () {
                //setclass("#col2", 'glyphicon-chevron-up', 'glyphicon-chevron-down');
                setclass("#col2", 'glyphicon glyphicon-plus', 'glyphicon glyphicon-minus');
            });
            $('#collapseTwo').on('shown.bs.collapse', function () {
                //setclass("#col2", 'glyphicon-chevron-down', 'glyphicon-chevron-up');
                setclass("#col2", 'glyphicon glyphicon-minus', 'glyphicon glyphicon-plus');
            });

        });
        function setclass(control, addclass, removeclass) {
            $(control).addClass(addclass);
            $(control).removeClass(removeclass);
        }

        function BindDet(Type) {
            $("#ContentPlaceHolder1_xhdnPOType").val(Type);
        }

    </script>
    <style>
        #accordion .glyphicon-minus, .glyphicon-plus {
            color: #333;
            font-family: "Glyphicons Halflings";
            font-style: normal;
            margin-right: 10px;
        }

        #accordion .panel-default > .panel-heading {
            border-color: #fff;
            color: #e4a823;
            border-radius: 0;
            background: #fff; /* Old browsers */
        }

        #accordion h5 {
            font-size: 15px;
        }

        #accordion .panel-title {
            font-size: 18px;
            /*color : #fff;*/
        }
    </style>



    <asp:UpdatePanel ID="xupnlPurchase" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="topBlk topBlkInn" style="display: none">
                <ul class="rightBtn">
                    <li id="liRFP" runat="server" visible="false">
                        <asp:LinkButton class="btnBlk" ID="xlnkbtnRFP" runat="server" 
                            OnClientClick="javascript:ShowProgress(true);"
                            OnClick="xlnkbtnRFP_Click">Create PO from closed RFP</asp:LinkButton>
                    </li>
                    <li id="liAuction" runat="server">
                        <asp:LinkButton class="btnBlk" ID="xlnkbtnAUC" runat="server"
                            OnClientClick="javascript:ShowProgress(true);"
                            OnClick="xlnkbtnAUC_Click">Create PO from closed negotiation</asp:LinkButton>
                    </li>
                </ul>
                <br class="cl">
            </div>
            <div class="clmn1">
                <div class="row1" style="display: none">
                    <div class="whiteBox immrt10">
                        <%--<asp:Literal ID="xlitPOList" runat="server"></asp:Literal>--%>
                    </div>
                </div>

                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" onclick="BindDet('R');">
                                    <i id="col1" class="glyphicon glyphicon-plus"></i>Create PO From Closed RFP</a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                                <asp:UpdatePanel ID="xupnlRFPList" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="whiteBox immrt10">
                                            <asp:Literal ID="xlitRFPList" runat="server"></asp:Literal>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" onclick="BindDet('A');">
                                    <i id="col2" class="glyphicon glyphicon-plus"></i>Create PO From Closed Negotiation
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                <asp:UpdatePanel ID="xupnlNegotiationList" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="whiteBox immrt10">
                                            <asp:Literal ID="xlitAuctionList" runat="server"></asp:Literal>
                                        </div>
                                        <br class="cl" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>

                    </div>
                </div>
                <asp:HiddenField ID="xhdnId" runat="server" />
                <asp:HiddenField ID="xhdnSuppId" runat="server" />
                <asp:HiddenField ID="xhdnPOType" runat="server" />
                <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Style="display: none;" Value="show" />
                <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

