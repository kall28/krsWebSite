<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Dashboard, App_Web_dashboard.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Styles/morris.css" rel="stylesheet" />
    <script src="Scripts/morris.min.js"></script>
    <script src="Scripts/raphael-min.js"></script>
    <script src="Scripts/jQuery.circleProgressBar.min.js"></script>
    <script>

        var FMon, SMon, TMon;

        $(function Process() {
            $('.percent').percentageLoader({
                valElement: 'p',
                strokeWidth: 30,
                bgColor: '#d9d9d9',
                ringColor: '#d53f3f',
                textColor: '#2C3E50',
                fontSize: '14px',
                fontWeight: 'bold'
            });
        });

        function GetGraphList(FistMon, SecMon, ThrdMonth) {
            FMon = FistMon;
            SMon = SecMon;
            TMon = ThrdMonth;
            $.ajax({
                url: 'Dashboard.aspx/GetGraph',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                //data: "{'Id':'" + Id + "'}",
                dataType: 'json',
                success: function (data) {
                    var GraphList = data.d;
                    if (GraphList != null) {
                        Graph(FMon, SMon, TMon, GraphList);
                    }
                    else {
                        //alert(newData.ErrDesc);
                    }
                },
                error: function (data) {

                }
            });
        }

        function Graph(FistMon, SecMon, ThrdMonth, GraphList) {
            //alert();
            var FistMonRFP = 0;
            var FistMonAUC = 0;
            var FistMonPO = 0;
            var SecMonRFP = 0;
            var SecMonAUC = 0;
            var SecMonPO = 0;
            var ThrdMonthRFP = 0;
            var ThrdMonthAUC = 0;
            var ThrdMonthPO = 0;
            for (var lstGrph = 0; lstGrph < GraphList.length; lstGrph++) {
                //alert(GraphList[lstGrph]);
                switch (GraphList[lstGrph].TableType) {
                    case "chart":
                        switch (GraphList[lstGrph].Type) {
                            case "R":
                                FistMonRFP = GraphList[lstGrph].No;
                                break;
                            case "A":
                                FistMonAUC = GraphList[lstGrph].No;
                                break;
                            case "P":
                                FistMonPO = GraphList[lstGrph].No;
                                break;
                        }
                        break;
                    case "chart1":
                        switch (GraphList[lstGrph].Type) {
                            case "R":
                                SecMonRFP = GraphList[lstGrph].No;
                                break;
                            case "A":
                                SecMonAUC = GraphList[lstGrph].No;
                                break;
                            case "P":
                                SecMonPO = GraphList[lstGrph].No;
                                break;
                        }
                        break;
                    case "chart2":
                        switch (GraphList[lstGrph].Type) {
                            case "R":
                                ThrdMonthRFP = GraphList[lstGrph].No;
                                break;
                            case "A":
                                ThrdMonthAUC = GraphList[lstGrph].No;
                                break;
                            case "P":
                                ThrdMonthPO = GraphList[lstGrph].No;
                                break;
                        }
                        break;
                }
            }
            Morris.Bar({
                element: 'morris-bar-chart',
                data: [{
                    y: FistMon.toString(),
                    a: FistMonRFP,
                    b: FistMonAUC,
                    c: FistMonPO,
                }, {
                    y: SecMon.toString(),
                    a: SecMonRFP,
                    b: SecMonAUC,
                    c: SecMonPO
                }, {
                    y: ThrdMonth.toString(),
                    a: ThrdMonthRFP,
                    b: ThrdMonthAUC,
                    c: ThrdMonthPO
                }],
                xkey: 'y',
                ykeys: ['a', 'b', 'c'],
                labels: ['RFPs', 'Negotiations', 'POs'],
                hideHover: 'auto',
                resize: true,
                ymax: 20,
                barColors: ['#ce2127', '#1f77b4', '#2ca02c']
                //barColors: ['#ce2127', '#f1c1c1', '#a5a5a5']
            });
        }

        function ShowRFP(RFPCode) {
            var RFPId = RFPCode.split('/');
            $.ajax({
                url: 'Dashboard.aspx/ShowRFP',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'RFPId':'" + RFPId[1] + "'}",
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "0") {
                            window.location = newData;
                        }
                        else {
                            //alert(newData.ErrDesc);
                        }
                    }
                    catch (e) { //alert(e.Message); 
                    }
                },
                error: function (data) {

                }
            });
        }

        function ShowAUC(AUCCode) {
            var AUCId = AUCCode.split('/');
            $.ajax({
                url: 'Dashboard.aspx/ShowAUC',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'AUCId':'" + AUCId[2] + "'}",
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "0") {
                            window.location = newData;
                        }
                        else {
                            //alert(newData.ErrDesc);
                        }
                    }
                    catch (e) { //alert(e.Message); 
                    }
                },
                error: function (data) {

                }
            });
        }

    </script>
    <div class="main dashboard">
        <div class="btn-filter btnfliter">View Notifications</div>
        <div class="divBlockAll"></div>
        <div class="clmn1">
            <h2 id="h2Header" runat="server">
                <img src="images/icon-boost.png" class="boostIcn" /><span id="DashHeader" runat="server">Boost your sales and grow your business</span> </h2>

            <div class="row1">
                <%--<div class="innerBlk">
                    <h3>respond to rfps</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    <img src="images/icon-purchase-order.png">
                    <br class="cl">
                    <div class="itemTotal">
                        <div class="liveRpf"><span>0</span>Live RFPs</div>
                        <div class="totalRpf"><span>0</span>Live RFPs</div>
                    </div>
                </div>
                <div class="innerBlk">
                    <h3>Participate in a<br>
                        negoTiation </h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    <img src="images/icon-chat.png">
                    <br class="cl">
                    <div class="itemTotal">
                        <div class="liveRpf"><span>0</span>Live RFPs</div>
                        <div class="totalRpf"><span>0</span>Live RFPs</div>
                    </div>
                </div>
                <div class="innerBlk immr0">
                    <h3>raise an invoice</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    <img src="images/icon-creat-rpf.png">
                    <br class="cl">
                    <div class="itemTotal">
                        <div class="liveRpf"><span>0</span>Live RFPs</div>
                        <div class="totalRpf"><span>0</span>Live RFPs</div>
                    </div>
                </div>--%>
                <asp:Literal ID="xlitRow1" runat="server"></asp:Literal>
                <br class="cl" />
            </div>
            <div class="row2">
                <%--<div class="whiteBox imw27p fl immr23 newOrder dashBuyer comingBg" id="divOrder" runat="server" visible="false">
                    <h2>Your Deals</h2>
                        <div id="order" runat="server">

                        </div>
                </div>--%>
                <%--<div class="whiteBox imw18p fl immr23">
                    <h2>Live RFP</h2>
                    <img src="images/timer.jpg"/>
                </div>
                <div class="whiteBox imw18p fl">
                    <h2>Live Auction</h2>
                    <img src="images/timer.jpg"/>
                </div>--%>
                <asp:Literal ID="xlitRow2" runat="server"></asp:Literal>
                <br class="cl" />
            </div>
            <div class="row3">
                <%--<div class="whiteBox imw45p fl immr23">
                    <h2>Your Revenue this month</h2>
                    <div class="panel-body">
                        <div id="morris-bar-chart"></div>
                    </div>
                    <script src="Scripts/morris-data.js"></script>
                </div>--%>
                <%--<div class="whiteBox imw45p fl">
                    <h2>Pre-negotiated deals <a href="#" class="fr">
                        <img src="images/more-dotted.png"/></a></h2>
                    <div class="prodList">
                        <img src="images/product.jpg"/>
                        <div class="prodDetail">
                            <h3><span>25 Headsets</span>@ Rs 1000 each</h3>
                            <p>Brand: HP | Original Price: Rs 1600</p>
                        </div>
                        <br class="cl"/>
                    </div>
                    <div class="prodList imbrd0">
                        <img src="images/product.jpg"/>
                        <div class="prodDetail">
                            <h3><span>25 Headsets</span>@ Rs 1000 each</h3>
                            <p>Brand: HP | Original Price: Rs 1600</p>
                        </div>
                        <br class="cl"/>
                    </div>
                </div>--%>
                <asp:Literal ID="xlitGraph" runat="server"></asp:Literal>
                <asp:Literal ID="xlitRow3" runat="server"></asp:Literal>
                <br class="cl" />
            </div>
            <div class="row4" id="divPayment" runat="server">
                <%--<div class="whiteBox imw45p fl immr23">
                    <h2>To Do’s <a href="#" class="fr">
                        <img src="images/icon-edit.png" /></a></h2>
                    <div class="pagi">
                        <a href="#" class="fr">
                            <img src="images/right-arrow.png" /></a>
                        <a href="#" class="fr">
                            <img src="images/left-arrow.png" /></a>
                        <br class="cl">
                    </div>
                    <ul class="todos">
                        <li>
                            <input type="checkbox" name="vehicle" value="Bike">
                            <label>Lorem Ipsum</label></li>
                        <li>
                            <input type="checkbox" name="vehicle" value="Bike" />
                            <label>Lorem Ipsum</label></li>
                        <li>
                            <input type="checkbox" name="vehicle" value="Bike" />
                            <label>Lorem Ipsum</label></li>
                        <li>
                            <input type="checkbox" name="vehicle" value="Bike" />
                            <label>Lorem Ipsum</label></li>
                        <li>
                            <input type="checkbox" name="vehicle" value="Bike" />
                            <label>Lorem Ipsum</label></li>
                    </ul>

                </div>
                <div class="whiteBox imw45p fl">
                    <h2>Chats</h2>
                    <ul class="chats">
                        <li>
                            <img src="images/user.png" />
                            <p><span>Lorem Ipsum</span>Lorem Ipsum is simply dummy text of the printing. </p>
                        </li>
                        <li>
                            <img src="images/user.png" />
                            <p><span>Lorem Ipsum</span>Lorem Ipsum is simply dummy text of the printing. </p>
                        </li>
                        <li>
                            <img src="images/user.png" />
                            <p><span>Lorem Ipsum</span>Lorem Ipsum is simply dummy text of the printing. </p>
                        </li>
                    </ul>
                </div>--%>
                <%--<div class="whiteBox">--%>
                <asp:Literal ID="xlitPayment" runat="server"></asp:Literal>
                <%--</div>--%>
                <br class="cl" />
            </div>
            <div class="row4">
                <%--<div class="whiteBox imw45p fl immr23 infoBlk">
                    <h2>Did you know? </h2>
                    <p class="txtCopy">Renepay work best when you procure for large annual quantities:larger the quantity.higher the savings.</p>
                    <div>
                        <img src="images/icon-arrow-dollar.jpg" />
                    </div>
                </div>
                <div class="whiteBox imw45p fl infoBlk">
                    <h2>Why should you complete your <span style="color: red;">profile?</span> </h2>
                    <ul class="listBullet">
                        <li>It helps you to get a comprehensive range of service of Renepay.</li>
                        <li>you attract supplier that understand you requirement.</li>
                    </ul>
                    <img src="images/icon-user.jpg" />
                </div>--%>
                <asp:Literal ID="xlitRow4" runat="server"></asp:Literal>
                <br class="cl" />
            </div>
            <br />
            <br />
        </div>

        <div class="clmn2 srh-filter divSlide">
            <div class="whiteBox fl">
                <h2>Notifications</h2>
                <ul class="nitify">
                    <li id="liRFPNfty">
                        <asp:LinkButton ID="xlnkbtnRFP" runat="server" Text="RFPs" OnClick="xlnkbtnRFP_Click"></asp:LinkButton></li>
                    <li id="liAUCNfty">
                        <asp:LinkButton ID="xlnkbtnNegotiations" runat="server" Text="Negotiations" OnClick="xlnkbtnNegotiations_Click"></asp:LinkButton></li>
                    <li id="liPONfty">
                        <asp:LinkButton ID="xlnkbtnPO" runat="server" Text="POs" OnClick="xlnkbtnPO_Click"></asp:LinkButton></li>
                    <li id="liOTHNfty">
                        <asp:LinkButton ID="xlnkbtnOthers" runat="server" Text="Others" OnClick="xlnkbtnOthers_Click"></asp:LinkButton></li>
                    <%--<li>Payments</li>--%>
                </ul>
                <br />
                <br />
                <h2 style="display: none">Profile Strength<br />
                    <p style="display: none">Complete your profile to get more from renepay.</p>
                </h2>
                <%--  <div class="percent" style="width:150px;height:150px;">
		            <p style="display:none;">80%</p>
	            </div>
                <script>
                    $(function () {
                        $('.percent').percentageLoader({
                            valElement: 'p',
                            strokeWidth: 30,
                            bgColor: '#d9d9d9',
                            ringColor: '#d53f3f',
                            textColor: '#2C3E50',
                            fontSize: '14px',
                            fontWeight: 'bold'
                        });

                    });
                </script>--%>
                <asp:Literal ID="lxitProfile" runat="server" Visible="false"></asp:Literal>
                <%--<img class="graph" src="images/profile-completed-image.jpg">
                <img class="graph" src="images/infi-verified.jpg">--%>
                <br />
                <br />
                <%--<h2>Auction Feeds</h2>
                <p class="aucHead">Insights</p>
                <br>
                <ul class="manage" >
                    <li>Weekly Sales<a class="fr" href="#"><img src="images/icn-uparrow.png"></a><span class="fr">43</span></li>
                    <li>Weekly Profits<a class="fr" href="#"><img src="images/icn-dwnarrow.png"></a><span class="fr">43</span></li>
                    <li class="imbrd0">Monthly Visits<a class="fr" href="#"><img src="images/icn-uparrow.png"></a><span class="fr">143</span></li>
                </ul>--%>
                <br />
                <br />
            </div>
        </div>
        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
        <%--<ctrl:SiteFooter ID="xctrlFooter" runat="server" />--%>
    </div>
    <%-- <asp:UpdatePanel ID="xupnlSupplier" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>
    <%--<div class="modal fade" id="divAddtionalConfirm" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" id="btnClose" runat="server" class="close"
                                onclick="javascript:link_click('H');">
                                &times;</button>
                            <h4 class="modal-title" id="H1" runat="server">Renepay</h4>
                        </div>
                        <div class="modal-body">
                            <p id="pRegMsg" runat="server">
                                Do you want to add additional user. 
                            </p>
                            <p>
                                <input type="checkbox" id="chckIsAddUser" runat="server"/> Don't show this message again.
                            </p>
                        </div>
                        <div class="modal-footer">
                            <a class="btnRed" href="#" id="lnkIsAddUser" runat="server" target="_blank" onserverclick="lnkIsAddUser_click"
                                >OK</a>
                            <a class="btnRed" href="#" id="lnkNext" runat="server"
                                onclick="javascript: return false;" >ADD ADDITIONAL USERS</a>
                        </div>
                    </div>
                </div>

            </div>
            <asp:Literal ID="xlitAdditionalUsr" runat="server"></asp:Literal>--%>
    <%--</ContentTemplate>
        </asp:UpdatePanel>--%>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.btnfliter').click(function () {
                $('.divSlide').addClass('HotelMoveLeft');
                $('.divSlide').show();
                $('.divBlockAll').css('display', 'block');
                $('.divBlockAll').show();
                $('.divSlide').stop().animate({ 'marginLeft': '0px' }, 1000);
                return false;
            });
            $('.divBlockAll').click(function () {
                $('.divBlockAll').hide();
                $('.divSlide').stop().animate({ 'marginLeft': '-768px' }, 200);

            });

        });

    </script>
     <div id="divhomeSticky" class="helpBlk helpSlide newUI helpBlkH homeStickyClosed">
        <div class="chatBlk">
            <div class="panel-group" id="Div2">
                <ctrl:Feedback ID="xFeedbackH" runat="server" 
                    Data_Parent="chataccordion" IsCollapsed="false"
                    IsHomeBanner="true"></ctrl:Feedback>
            </div>
        </div>
    </div>
</asp:Content>
