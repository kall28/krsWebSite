<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="ReportCenter_SupplierSalesHistory, App_Web_suppliersaleshistory.aspx.51bd485d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%--Start link for [sales month by month]--%>
    <link href="../Styles/morris.css" rel="stylesheet" />
    <script src="../Scripts/morris.min.js"></script>
    <script src="../Scripts/raphael-min.js"></script>
    <%------------------------ End ---------------------%>

    <%--Start link for [sales by month by category]--%>

    <link href="../Styles/barchart.css" rel="stylesheet" />
    <%--<script src="../Scripts/jquery-2.2.0.min.js" type="text/javascript"></script>--%>
    <script src="../Scripts/barchart.jquery.js" type="text/javascript"></script>
    <script src="../Scripts/json2.js" type="text/javascript"></script>
    <%------------------------ End ---------------------%>

    <%--Start link for [Top Clients Pie Chart]--%>
    <script src="../Scripts/PieChart/d3.min.js" type="text/javascript"></script>
    <script src="../Scripts/PieChart/d3pie.js" type="text/javascript"></script>
    <%--<script src="../Scripts/PieChart/jquery.js" type="text/javascript"></script>--%>
    <%------------------------ End ---------------------%>

    <%--Start link for [Date]--%>
    <script src="../Scripts/plugins/tinymce_4.1.9/tinymce/js/tinymce/tinymce.min.js" type="text/javascript"></script>
    <script src="../Scripts/TimePicker/jquery.ui.timepicker.js"></script>
    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <link href="../Scripts/TimePicker/jquery.ui.timepicker.css?v=0.3.3" rel="stylesheet" />
    <%------------------------ End ---------------------%>

    <script>

        function ValidateSearch() {
            var msg = "";
            if (($("#ContentPlaceHolder1_xtxtFromDateDownload").val() == '') && ($("#ContentPlaceHolder1_xtxtToDateDownload").val() == '')) {
                msg = "Please select From Date and To Date.";
                ShowModalMsgBox("Error", msg);
                return false;
            }
            else {
                if ($("#ContentPlaceHolder1_xtxtFromDateDownload").val() == '') {
                    msg = "Please select from date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtFromDateDownload", msg, "top");
                    return false;
                }
                if ($("#ContentPlaceHolder1_xtxtToDateDownload").val() == '') {
                    msg = "Please select to date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtToDateDownload", msg, "top");
                    return false;


                }
            }
            if (msg.length <= 0) {
                DownloadReport();
                return true;
            }
            return false;
        }

        function DownloadReport() {
            var fromdate = $("#ContentPlaceHolder1_xtxtFromDateDownload").val();
            var todate = $("#ContentPlaceHolder1_xtxtToDateDownload").val();
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/SupplierSalesHistory.aspx/DownloadReport',
                type: 'POST',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                //data: jsonTxt,
                data: "{ 'fromDate' : '" + fromdate + "','todate' : '" + todate + "'}",
                cache: false,

                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det=3/" + newData);
                        }
                        else {
                            ShowMessageBox("Invalid file parameter");
                        }
                        HideProgress(true);

                    }
                    catch (e) {
                        HideProgress(true);
                        ShowModalMsgBox("Error", e.message);

                    }
                },
                error: function (data) {
                    ShowModalMsgBox("Error", data.d);
                }
            });
            return true;
        }

        $(document).ready(function () {
            BindDatePicker();
        });

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            BindDatePicker();
            BindClockPicker();
        });

        function BindDatePicker() {

            var d = new Date();
            var y = d.getFullYear();

            $("#ContentPlaceHolder1_xtxtStartDate").datepicker({
                dateFormat: 'dd/mm/yy',
                minDate: '01/01/' + y,
                maxDate: '31/12/' + y,
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtEndDate").datepicker({
                dateFormat: 'dd/mm/yy',
                minDate: '01/01/' + y,
                maxDate: '31/12/' + y,
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtFromDateDownload").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtToDateDownload").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');
        }

        function BindClockPicker() {
            $('#ContentPlaceHolder1_xtxtStartTime').timepicker({
                showPeriodLabels: false
            });
            $('#ContentPlaceHolder1_xtxtEndTime').timepicker({
                showPeriodLabels: false
            });
        }

        function GetGraphList(Supvalue, Totalval) {
            //Supvalue = 20;
            //Totalval = 60;
            var strF = '{ "header": { "title": { "text": "" }},"data": { "content": [{ "label": "Total Count", "value": ' + Totalval + ' },{ "label": "Supplier", "value": ' + Supvalue + ' }]}}';
            //var strF = '{ "header": { "title": { "text": "A Very Simple Pie" }},"data": { "content": [{ "label": "Total Count", "value": 451020727 },{ "label": "Supplier", "value": 180640 }]}}';
            //var strF = '{ "header": { "title": { "text": "A Very Simple Pie" }},"data": { "content": [{ "label": "Total Count", "value": 451020727 },{ "label": "Supplier", "value": 180640 }]}}';

            var obj = JSON.parse(strF);

            var pie = new d3pie("pie", obj);



            $.ajax({
                url: 'SupplierSalesHistory.aspx/GetGraph',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'Id':'0'}",
                dataType: 'json',
                success: function (data) {
                    var GraphList = data.d;
                    if (GraphList != null) {
                        Graph(GraphList);
                    }
                    else {
                        //alert(newData.ErrDesc);
                    }
                },
                error: function (data) {
                }
            });

            $.ajax({
                url: 'SupplierSalesHistory.aspx/GetGraph',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'Id':'1'}",
                dataType: 'json',
                success: function (data) {
                    var GraphList = data.d;
                    if (GraphList != null) {
                        GraphByMonthByCategory(GraphList);
                    }
                    else {
                        //alert(newData.ErrDesc);
                    }
                },
                error: function (data) {
                }
            });

            $.ajax({
                url: 'SupplierSalesHistory.aspx/GetGraphTopClient',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                //data: "{'Id':'2'}",
                dataType: 'json',
                success: function (data) {
                    $("#divTopClient").html(data.d);
                },
                error: function (data) {
                }
            });

            

        }

        function Graph(GraphList) {
            if (GraphList.length > 0)
                {
                    if (GraphList[0].Type == 'MTH') {
                        var FistMonAmt = 0;
                        var SecMonAmt = 0;
                        var ThrdMonthAmt = 0;
                        var FrthMonthAmt = 0;
                        var FithMonthAmt = 0;
                        var SxthMonthAmt = 0;

                        var FistMon = 'Jan';
                        var SecMon = 'Feb';
                        var ThrdMonth = 'March';
                        var FrthMonth = 'April';
                        var FithMonth = 'May';
                        var SxthMonth = 'June';

                        if (GraphList != null) {
                            for (var lstGrph = 0; lstGrph < GraphList.length; lstGrph++) {
                                switch (GraphList[lstGrph].Month) {
                                    case 1:
                                        FistMonAmt = GraphList[lstGrph].Amount;
                                        break;
                                    case 2:
                                        SecMonAmt = GraphList[lstGrph].Amount;
                                        break;
                                    case 3:
                                        ThrdMonthAmt = GraphList[lstGrph].Amount;
                                        break;
                                    case 4:
                                        FrthMonthAmt = GraphList[lstGrph].Amount;
                                        break;
                                    case 5:
                                        FithMonthAmt = GraphList[lstGrph].Amount;
                                        break;
                                    case 6:
                                        SxthMonthAmt = GraphList[lstGrph].Amount;
                                        break;
                                }
                            }
                            //FistMonAmt = 10;
                            //SecMonAmt = 15;
                            //ThrdMonthAmt = 20;
                            //FrthMonthAmt = 25;
                            //FithMonthAmt = 30;
                            //SxthMonthAmt = 35;
                        }

                        Morris.Bar({
                            element: 'morris-bar-chart',
                            data: [{
                                y: FistMon.toString(),
                                a: FistMonAmt
                            }, {
                                y: SecMon.toString(),
                                a: SecMonAmt
                            }, {
                                y: ThrdMonth.toString(),
                                a: ThrdMonthAmt
                            }, {
                                y: FrthMonth.toString(),
                                a: FrthMonthAmt
                            }, {
                                y: FithMonth.toString(),
                                a: FithMonthAmt
                            }, {
                                y: SxthMonth.toString(),
                                a: SxthMonthAmt
                            }],
                            xkey: 'y',
                            ykeys: ['a'],
                            labels: ['Amount'],
                            hideHover: 'auto',
                            resize: true,
                            ymax: 100000,
                            barColors: ['#ce2127']
                            //barColors: ['#ce2127', '#1f77b4', '#2ca02c']
                            //barColors: ['#ce2127', '#f1c1c1', '#a5a5a5']
                        });
                    }
                    else if (GraphList[0].Type == 'QTR') {
                        var FistQtrAmt = 0;
                        var SecQtrAmt = 0;
                        var ThrdQtrthAmt = 0;

                        var FistQtr = 'Jan-April';
                        var SecQtr = 'May-Aug';
                        var ThrdQtr = 'Sep-Dec';

                        if (GraphList != null) {
                            for (var lstGrph = 0; lstGrph < GraphList.length; lstGrph++) {
                                switch (GraphList[lstGrph].Month) {
                                    case 4:
                                        FistQtrAmt = GraphList[lstGrph].Amount;
                                        break;
                                    case 8:
                                        SecQtrAmt = GraphList[lstGrph].Amount;
                                        break;
                                    case 12:
                                        ThrdQtrthAmt = GraphList[lstGrph].Amount;
                                        break;
                                }
                            }
                        }

                        Morris.Bar({
                            element: 'morris-bar-chart',
                            data: [{
                                y: FistQtr.toString(),
                                a: FistQtrAmt
                            }, {
                                y: SecQtr.toString(),
                                a: SecQtrAmt
                            }, {
                                y: ThrdQtr.toString(),
                                a: ThrdQtrthAmt
                            }],
                            xkey: 'y',
                            ykeys: ['a'],
                            labels: ['Amount'],
                            hideHover: 'auto',
                            resize: true,
                            ymax: 500000,
                            barColors: ['#ce2127']
                        });
                    }
                }
        }

        function GraphByMonthByCategory(GraphList) {

            var str = '';
            var strF = '{"height": 500, "bars": [';
            var Janmth = '[["Jan", 0],';
            var Febmth = '["Feb", 0],';
            var Mrcmth = '["March", 0],';
            var Aprmth = '["Apr", 0],';
            var Maymth = '["May", 0],';
            var Junmth = '["Jun", 0],';
            var Julmth = '["July", 0],';
            var Augmth = '["Aug", 0],';
            var Sepmth = '["Sep", 0],';
            var Octmth = '["Oct", 0],';
            var Novmth = '["Nov", 0],';
            var Decmth = '["Dec", 0]]}';

            if (GraphList.length > 0) {
                var category;
                var lstrGrph = 0;

                for (lstrGrph = 0; lstrGrph < GraphList.length; lstrGrph++) {
                    var t = GraphList[lstrGrph].Type;
                    if (category != t) {
                        category = t;

                        if (str != '') {
                            str = ',';
                        }
                        else {
                            str = '';
                        }


                        str = str + '{ "name" : "' + GraphList[lstrGrph].Type + '","values" : ' + Janmth + Febmth + Mrcmth + Aprmth + Maymth + Junmth + Julmth + Augmth + Sepmth + Octmth + Novmth + Decmth;
                        var lstGrph = 0;
                        for (lstGrph = 0; lstGrph < GraphList.length; lstGrph++) {
                            var tt = GraphList[lstGrph].Type;
                            //if (category = tt) {str1.localeCompare(str2)
                            var n = category.localeCompare(tt);
                            if (n == 0) {
                                //var cs = GraphList[lstGrph].Month;
                                switch (GraphList[lstGrph].Month) {
                                    case 1:
                                        str = str.replace('[["Jan", 0],', '[["Jan", ' + GraphList[lstGrph].Amount + '],');
                                        break;
                                    case 2:
                                        str = str.replace('["Feb", 0],', '["Feb", ' + GraphList[lstGrph].Amount + '],');
                                        break;
                                    case 3:
                                        str = str.replace('["March", 0],', '["March", ' + GraphList[lstGrph].Amount + '],');
                                        break;
                                    case 4:
                                        str = str.replace('["Apr", 0],', '["Apr", ' + GraphList[lstGrph].Amount + '],');
                                        break;
                                    case 5:
                                        str = str.replace('["May", 0],', '["May", ' + GraphList[lstGrph].Amount + '],');
                                        break;
                                    case 6:
                                        str = str.replace('["Jun", 0],', '["Jun", ' + GraphList[lstGrph].Amount + '],');
                                        break;
                                    case 7:
                                        str = str.replace('["July", 0],', '["July", ' + GraphList[lstGrph].Amount + '],');
                                        break;
                                    case 8:
                                        str = str.replace('["Aug", 0],', '["Aug", ' + GraphList[lstGrph].Amount + '],');
                                        break;
                                    case 9:
                                        str = str.replace('["Sep", 0],', '["Sep", ' + GraphList[lstGrph].Amount + '],');
                                        break;
                                    case 10:
                                        str = str.replace('["Oct", 0],', '["Oct", ' + GraphList[lstGrph].Amount + '],');
                                        break;
                                    case 11:
                                        str = str.replace('["Nov", 0],', '["Nov", ' + GraphList[lstGrph].Amount + '],');
                                        break;
                                    case 12:
                                        str = str.replace('["Dec", 0]]}', '["Dec", ' + GraphList[lstGrph].Amount + ']]}');
                                        break;
                                }
                            }
                        }
                        strF += str;
                    }
                }
                strF += ']}';

                var obj = JSON.parse(strF);
                $('#chart').barChart(obj);
            }

            //var str = '{"height": 500, "bars": [{ "name": "Cat - 1",' +
            //        '"values": [["jan", 40], ["feb", 30], ["march", 15], ["april", 75], ["may", 129], ["june", 12], ["july", 29], ["Aug", 19], ["Sept", 69], ["Oct", 79], ["Nov", 90], ["Dec", 59]]' +
            //    '}, {' +
            //        '"name": "Cat - 2",' +
            //        '"values": [["jan", 45], ["feb", 33], ["march", 49], ["april", 25], ["may", 29], ["june", 12], ["july", 29], ["Aug", 19], ["Sept", 69], ["Oct", 79], ["Nov", 90], ["Dec", 59]]' +
            //    '}, {' +
            //        '"name": "Cat - 3",' +
            //        '"values": [["jan", 45], ["feb", 33], ["march", 49], ["april", 25], ["may", 29], ["june", 12], ["july", 29], ["Aug", 19], ["Sept", 69], ["Oct", 79], ["Nov", 90], ["Dec", 59]]' +
            //    '} ] }';

            //$('#chart').barChart({
            //    "height": 500,
            //    "bars": [
            //        {
            //            "name": 'Cat - 1',
            //            "values": [['jan', 40], ['feb', 30], ['march', 15], ['april', 75], ['may', 129], ['june', 12], ['july', 29], ['Aug', 19], ['Sept', 69], ['Oct', 79], ['Nov', 90], ['Dec', 59]]
            //        }, {
            //            "name": 'Cat - 2',
            //            "values": [['jan', 45], ['feb', 33], ['march', 49], ['april', 25], ['may', 29], ['june', 12], ['july', 29], ['Aug', 19], ['Sept', 69], ['Oct', 79], ['Nov', 90], ['Dec', 59]]
            //        }, {
            //            "name": 'Cat - 3',
            //            "values": [['jan', 45], ['feb', 33], ['march', 49], ['april', 25], ['may', 29], ['june', 12], ['july', 29], ['Aug', 19], ['Sept', 69], ['Oct', 79], ['Nov', 90], ['Dec', 59]]
            //        }
            //    ]
            //});
        }

    </script>        

    <div class="main supplier">
        <div class="topBlk">
            <div class="mainHead fl">
                <asp:Literal ID="xlitCap" runat="server" Text="Supplier Sales Report"></asp:Literal>
            </div>
            <ul class="rightBtn"><li>
                            <asp:LinkButton ID="xbtnCancel" runat="server" CssClass="btnBlk" OnClick="btnBack_click">Close</asp:LinkButton>
                        </li></ul>
            <br class="cl">
        </div>
        <div class="clmn1">
            <div class="row1">

                <div class="whiteBox">
                    <table style="width:100%"><tr>
                        <td style="width:33%"><div class="imw100p fl">
                            <label>From Date</label>
                            <asp:TextBox ID="xtxtStartDate" CssClass="icnCal" runat="server" autocomplete="off"></asp:TextBox>
                        </div></td>
                        <td style="width:33%"><div class="imw100p immr0 fr" >
                            <label>To Date</label>
                            <asp:TextBox ID="xtxtEndDate" CssClass="icnCal" runat="server"></asp:TextBox>
                        </div></td>
                        <td style="width:34%; text-align:right;">
                            <asp:LinkButton ID="lnkbtnSearch" runat="server" class="btnBlk immrt30" OnClick="lnkbtnSearch_Click">Search</asp:LinkButton>
                        </td>
                    </tr></table>
                        <br class="cl">
                </div>
                <br class="cl">

                <div class="whiteBox">
                    <div class="leftClmn">
                        <asp:Literal ID="xlitGraph" runat="server"></asp:Literal>
                    </div>       
                    <div class="rightClmn">

                        <div class='whiteBox imw90p fl immr23 dashBuyer imh435'>
                            <h2>Sales by Month by Category</h2>
                            <div class='panel-body'>
                            <div id='morris-bar-chart'>
                                <div id="chart" ></div>
                            </div>
                            </div></div>
                    </div>
                    <br class="cl">
                </div>

                <div class="whiteBox">
                    <div class='whiteBox imw90p fl immr23 dashBuyer imh435'>
                        <h2>Sales Opportunity</h2>
                        <div id="divTopClient" class="imw48p" style="float:left;">
                        </div>
                        <div id="pie"></div>
                    </div>

                    <br class="cl">
                </div>

                <div class="whiteBox">
                    <h2>Looking to download previous history:</h2>
                    <table style="width:100%"><tr>
                        <td style="width:33%"><div class="imw100p fl">
                            <label>From Date</label>
                            <asp:TextBox ID="xtxtFromDateDownload" CssClass="icnCal" runat="server" autocomplete="off"></asp:TextBox>
                        </div></td>
                        <td style="width:33%"><div class="imw100p immr0 fr" >
                            <label>To Date</label>
                            <asp:TextBox ID="xtxtToDateDownload" CssClass="icnCal" runat="server"></asp:TextBox>
                        </div></td>
                        <td style="width:34%; text-align:right;">
                            <button id="btnDownload" type="button" value="Download" class="btnBlk immrt30" onclick="javascript:if(!(ValidateSearch())){return false;}">Download</button>
                        </td>
                    </tr></table>
                        <br class="cl">
                </div>

            </div>
        </div>
    </div>

</asp:Content>

