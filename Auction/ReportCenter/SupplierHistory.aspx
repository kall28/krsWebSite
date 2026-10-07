<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="ReportCenter_SupplierHistory, App_Web_supplierhistory.aspx.51bd485d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%--Start link for [sales by month by category]--%>

    <%--<link href="../Styles/barchart.css" rel="stylesheet" />--%>
    <%--<script src="../Scripts/jquery-2.2.0.min.js" type="text/javascript"></script>--%>
    <%--<script src="../Scripts/barchart.jquery.js" type="text/javascript"></script>--%>
    <%--<script src="../Scripts/json2.js" type="text/javascript"></script>--%>

    <link href="../Styles/morris.css" rel="stylesheet" />
    <script src="../Scripts/morris.min.js"></script>
    <script src="../Scripts/raphael-min.js"></script>
    <%------------------------ End ---------------------%>

    <script>

        function GetGraphList() {
            
            $.ajax({
                url: 'SupplierHistory.aspx/GetGraph',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                //data: "{'Id':'0'}",
                dataType: 'json',
                success: function (data) {
                    var GraphList = data.d;
                    if (GraphList != null) {
                        SpendHistory(GraphList);
                    }
                    else {
                        //alert(newData.ErrDesc);
                    }
                },
                error: function (data) {
                }
            });
        }

        function SpendHistory(GraphList) {

            var FirstLowP = 0;
            var SecondLowP = 0;
            var ThirdLowP = 0;

            var FirstYourP = 0;
            var SecondYourP = 0;
            var ThirdYourP = 0;

            var FirstHighestP = 0;
            var SecondHighestP = 0;
            var ThirdHighestP = 0;

            var lstGrph = 0;
            for (lstGrph = 0; lstGrph < GraphList.length; lstGrph++) {
                switch (lstGrph) {
                    case 0:
                        ThirdHighestP = GraphList[lstGrph].MaxBid;
                        ThirdYourP = GraphList[lstGrph].BidAmount;
                        ThirdLowP = GraphList[lstGrph].MinBid;
                        break;
                    case 1:
                        SecondHighestP = GraphList[lstGrph].MaxBid;
                        SecondYourP = GraphList[lstGrph].BidAmount;
                        SecondLowP = GraphList[lstGrph].MinBid;
                        break;
                    case 2:
                        FirstHighestP = GraphList[lstGrph].MaxBid;
                        FirstYourP = GraphList[lstGrph].BidAmount;
                        FirstLowP = GraphList[lstGrph].MinBid;
                        break;
                }
            }

            Morris.Bar({
                element: 'morris-bar-chart',
                data: [{
                    y: 'RFP1',
                    a: FirstLowP,
                    b: FirstYourP,
                    c: FirstHighestP,
                }, {
                    y: 'RFP2',
                    a: SecondLowP,
                    b: SecondYourP,
                    c: SecondHighestP
                }, {
                    y: 'RFP3',
                    a: ThirdLowP,
                    b: ThirdYourP,
                    c: ThirdHighestP
                }],
                xkey: 'y',
                ykeys: ['a', 'b', 'c'],
                labels: ['Lowest Price', 'Your Price', 'Height Price'],
                hideHover: 'auto',
                resize: true,
                ymax: 200000,
                barColors: ['#ce2127', '#1f77b4', '#2ca02c']
                //barColors: ['#ce2127', '#f1c1c1', '#a5a5a5']
            });

            //$('#chart').barChart({
            //    "height": 300,
            //    "bars": [
            //        {
            //            "name": 'Lowest Price',
            //            "values": [['RFP 3', ThirdLowP], ['RFP 2', SecondLowP], ['RFP 1', FirstLowP]]
            //        }, {
            //            "name": 'Your Price',
            //            "values": [['RFP 3', ThirdYourP], ['RFP 2', SecondYourP], ['RFP 1', FirstYourP]]
            //        }, {
            //            "name": 'Height Price',
            //            "values": [['RFP 3', ThirdHighestP], ['RFP 2', SecondHighestP], ['RFP 1', FirstHighestP]]
            //        }
            //    ]
            //});
        }

        //function SpendHistory(GraphList) {

        //    var FirstLowP = 0;
        //    var SecondLowP = 0;
        //    var ThirdLowP = 0;

        //    var FirstYourP = 0;
        //    var SecondYourP = 0;
        //    var ThirdYourP = 0;

        //    var FirstHighestP = 0;
        //    var SecondHighestP = 0;
        //    var ThirdHighestP = 0;

        //    var lstGrph = 0;
        //    for (lstGrph = 0; lstGrph < GraphList.length; lstGrph++) {
        //        switch (lstGrph) {
        //            case 0:
        //                ThirdHighestP = GraphList[lstGrph].MaxBid;
        //                ThirdYourP = GraphList[lstGrph].BidAmount;
        //                ThirdLowP = GraphList[lstGrph].MinBid;
        //                break;
        //            case 1:
        //                SecondHighestP = GraphList[lstGrph].MaxBid;
        //                SecondYourP = GraphList[lstGrph].BidAmount;
        //                SecondLowP = GraphList[lstGrph].MinBid;
        //                break;
        //            case 2:
        //                FirstHighestP = GraphList[lstGrph].MaxBid;
        //                FirstYourP = GraphList[lstGrph].BidAmount;
        //                FirstLowP = GraphList[lstGrph].MinBid;
        //                break;
        //        }
        //    }

        //    $('#chart').barChart({
        //        "height": 300,
        //        "bars": [
        //            {
        //                "name": 'Lowest Price',
        //                "values": [['RFP 3', ThirdLowP], ['RFP 2', SecondLowP], ['RFP 1', FirstLowP]]
        //            }, {
        //                "name": 'Your Price',
        //                "values": [['RFP 3', ThirdYourP], ['RFP 2', SecondYourP], ['RFP 1', FirstYourP]]
        //            }, {
        //                "name": 'Height Price',
        //                "values": [['RFP 3', ThirdHighestP], ['RFP 2', SecondHighestP], ['RFP 1', FirstHighestP]]
        //            }
        //        ]
        //    });
        //}

    </script>        

    <div class="main supplier">
        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="Your Pricing"></asp:Literal>
            </div>
            <ul class="rightBtn"><li>
                <asp:LinkButton ID="xbtnCancel" runat="server" CssClass="btnBlk" OnClick="btnBack_click">Close</asp:LinkButton>
            </li></ul>
            <br class="cl">
        </div>
        <div class="clmn1">
            <div class="row1">
                <div class='whiteBox'>
                    <div class='whiteBox imw42p'>
                            <h2>A sample to show how competitive you are</h2>
                            <div class='panel-body'>
                            <div id='morris-bar-chart'>
                                <div id="chart" ></div>
                            </div>
                            </div></div>
                </div>
                <%--<div class="whiteBox ">
                            <div class='panel-body'>
                            <div id='morris-bar-chart' class="imw45p">
                                <div id="chart" ></div>
                            </div>
                            </div>
                    <br class="cl">
                </div>--%>
            </div>
        </div>
    </div>

</asp:Content>

