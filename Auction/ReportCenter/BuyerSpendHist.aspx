<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="ReportCenter_BuyerSpendHist, App_Web_buyerspendhist.aspx.51bd485d" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />

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

    <%--Start link for [accordion]--%>
    <script src="../Scripts/jquery.slicknav.js"></script>
    <%------------------------ End ---------------------%>

    <script type="text/javascript">

        $(document).ready(function () {
            BindDatePicker();
        });

        function BindDatePicker() {
            var d = new Date();
            var y = d.getFullYear();

            $("#ContentPlaceHolder1_xtxtFromDate").datepicker({
                dateFormat: 'dd/mm/yy',
                //minDate: '01/01/' + y,
                //maxDate: '31/12/' + y,
            });

            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                dateFormat: 'dd/mm/yy',
                //minDate: '01/01/' + y,
                //maxDate: '31/12/' + y,
            });

            $("#ContentPlaceHolder1_xtxtFromDateDownload").datepicker({
                dateFormat: 'dd/mm/yy',
            });

            $("#ContentPlaceHolder1_xtxtToDateDownload").datepicker({
                dateFormat: 'dd/mm/yy',
            });

            $("#ContentPlaceHolder1_xtxtFromDateNew").datepicker({
                dateFormat: 'dd/mm/yy',
            });

            $("#ContentPlaceHolder1_xtxtToDateNew").datepicker({
                dateFormat: 'dd/mm/yy',
            });
            $("#ContentPlaceHolder1_xtxtFromDateNew1").datepicker({
                dateFormat: 'dd/mm/yy',
            });

            $("#ContentPlaceHolder1_xtxtToDateNew1").datepicker({
                dateFormat: 'dd/mm/yy',
            });
        }

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            BindDatePicker();
        });
        
        function ValidateSearch() {
            var msg = "";
            if (($("#ContentPlaceHolder1_xtxtFromDate").val() == '') && ($("#ContentPlaceHolder1_xtxtToDate").val() == '')) {
                msg = "Please select From Date and To Date.";
                ShowModalMsgBox("Error", msg);
                return false;
            }
            else {
                if ($("#ContentPlaceHolder1_xtxtFromDate").val() == '') {
                    msg = "Please select From Date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtFromDate", msg, "top");
                    return false;
                }
                if ($("#ContentPlaceHolder1_xtxtToDate").val() == '') {
                    msg = "Please select To Date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtToDate", msg, "top");
                    return false;
                }
            }
            if (msg.length <= 0) {
                Accordian();
                return true;
            }
            return false;
        }

        function ValidateSearchDownload() {
            var msg = "";
            if (($("#ContentPlaceHolder1_xtxtFromDateDownload").val() == '') && ($("#ContentPlaceHolder1_xtxtToDateDownload").val() == '')) {
                msg = "Please select From Date and To Date.";
                ShowModalMsgBox("Error", msg);
                return false;
            }
            else {
                if ($("#ContentPlaceHolder1_xtxtFromDateDownload").val() == '') {
                    msg = "Please select From Date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtFromDateDownload", msg, "top");
                    return false;
                }
                if ($("#ContentPlaceHolder1_xtxtToDateDownload").val() == '') {
                    msg = "Please select To Date.";
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
                url: strUrl + 'ReportCenter/BuyerSpendHist.aspx/DownloadReport',
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

        function ValidateSearchTopSupp() {
            var msg = "";
            if (($("#ContentPlaceHolder1_xtxtFromDateNew").val() == '') && ($("#ContentPlaceHolder1_xtxtToDateNew").val() == '')) {
                msg = "Please select From Date and To Date.";
                ShowModalMsgBox("Error", msg);
                return false;
            }
            else {
                if ($("#ContentPlaceHolder1_xtxtFromDateNew").val() == '') {
                    msg = "Please select From Date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtFromDateNew", msg, "top");
                    return false;
                }
                if ($("#ContentPlaceHolder1_xtxtToDateNew").val() == '') {
                    msg = "Please select To Date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtToDateNew", msg, "top");
                    return false;
                }
            }
            if (msg.length <= 0) {
                DownloadTopSupplierReport();
                return true;
            }
            return false;
        }

        function DownloadTopSupplierReport() {
            var fromdate = $("#ContentPlaceHolder1_xtxtFromDateNew").val();
            var todate = $("#ContentPlaceHolder1_xtxtToDateNew").val();
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/BuyerSpendHist.aspx/DownloadTopSupplierReport',
                type: 'POST',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: "{'fromDate' : '" + fromdate + "','todate' : '" + todate + "'}",
                cache: false,
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det=0/" + newData);
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
                    ShowModalMsgBox("Error", data);
                }
            });
            return true;
        }

        function ValidateSearchActivityRpt() {
            var msg = "";
            if (($("#ContentPlaceHolder1_xtxtFromDateNew1").val() == '') && ($("#ContentPlaceHolder1_xtxtToDateNew1").val() == '')) {
                msg = "Please select From Date and To Date.";
                ShowModalMsgBox("Error", msg);
                return false;
            }
            else {
                if ($("#ContentPlaceHolder1_xtxtFromDateNew1").val() == '') {
                    msg = "Please select From Date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtFromDateNew1", msg, "top");
                    return false;
                }
                if ($("#ContentPlaceHolder1_xtxtToDateNew1").val() == '') {
                    msg = "Please select To Date.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtToDateNew1", msg, "top");
                    return false;
                }
            }
            if (msg.length <= 0) {
                DownloadActivityRpt();
                return true;
            }
            return false;
        }

        function DownloadActivityRpt() {
            var fromdate = $("#ContentPlaceHolder1_xtxtFromDateNew1").val();
            var todate = $("#ContentPlaceHolder1_xtxtToDateNew1").val();
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/BuyerSpendHist.aspx/DownloadActivityRpt',
                type: 'POST',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: "{'fromDate' : '" + fromdate + "','todate' : '" + todate + "'}",
                cache: false,
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det=0/" + newData);
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
                    ShowModalMsgBox("Error", data);
                }
            });
            return true;
        }

        function getCheckedCustomerParam() {
            var selected = [];
            $('div#ContentPlaceHolder1_DivSearch input[type=checkbox]').each(function () {
                if ($(this).is(":checked")) {
                    selected.push($(this).attr('value'));
                }
            });
            return selected;
        }

        function DownloadCustomerReport() {
            var fromdate = $("#ContentPlaceHolder1_xtxtFromDate").val();
            var todate = $("#ContentPlaceHolder1_xtxtToDate").val();
            var select = [];
            select = getCheckedCustomerParam();
            var dataToPass = { arr: select };
            var jsonTxt = JSON.stringify(dataToPass);
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/BuyerSpendHist.aspx/DownloadCustomerFile',
                type: 'POST',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                //data: jsonTxt,
                data: "{ 'arr' : '" + select + "','fromDate' : '" + fromdate + "','todate' : '" + todate + "'}",
                cache: false,
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det=0/" + newData);
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
                    ShowModalMsgBox("Error", data);
                }
            });
            return true;
        }        


        //****************************** Start change for Graph *******************************************

        function GetGraphList() {
            Accordian();
            ShowProgress();

            $.ajax({
                url: 'BuyerSpendHist.aspx/GetGraph',
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
                url: 'BuyerSpendHist.aspx/GetGraph',
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
                url: 'BuyerSpendHist.aspx/GetGraph',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'Id':'3'}",
                dataType: 'json',
                success: function (data) {
                    var GraphList = data.d;
                    if (GraphList != null) {
                        GraphSpendByCategory(GraphList);
                    }
                    else {
                        //alert(newData.ErrDesc);
                    }
                },
                error: function (data) {
                }
            });
            HideProgress();
        }

        function Graph(GraphList) {

            if (GraphList.length > 0) {
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
                    var ForthQtrthAmt = 0;

                    var FistQtr = 'Jan-March';
                    var SecQtr = 'April-June';
                    var ThrdQtr = 'July-Sep';
                    var ForthQtr = 'Oct-Dec';

                    if (GraphList != null) {
                        for (var lstGrph = 0; lstGrph < GraphList.length; lstGrph++) {
                            switch (GraphList[lstGrph].Month) {
                                case 3:
                                    FistQtrAmt = GraphList[lstGrph].Amount;
                                    break;
                                case 6:
                                    SecQtrAmt = GraphList[lstGrph].Amount;
                                    break;
                                case 9:
                                    ThrdQtrthAmt = GraphList[lstGrph].Amount;
                                    break;
                                case 12:
                                    ForthQtrthAmt = GraphList[lstGrph].Amount;
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
                        }, {
                            y: ForthQtr.toString(),
                            a: ForthQtrthAmt
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

        function GraphSavingMonthByMonth(GraphList) {

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
            var total = 0;

            if (GraphList.length > 0) {
                var lstrGrphT = 0;
                for (lstrGrphT = 0; lstrGrphT < GraphList.length; lstrGrphT++) {
                    total += GraphList[lstrGrphT].Amount;
                }

                var category;
                var lstrGrph = 0;
                for (lstrGrph = 0 ; lstrGrph < 2 ; lstrGrph++) {
                    switch (lstrGrph) {
                        case 0:
                            category = "Total Spend";
                            break;
                        case 1:
                            category = "Monthly";
                            break;
                    }
                    if (str != '') {
                        str = ',';
                    }
                    else {
                        str = '';
                    }

                    str = str + '{ "name" : "' + category + '","values" : ' + Janmth + Febmth + Mrcmth + Aprmth + Maymth + Junmth + Julmth + Augmth + Sepmth + Octmth + Novmth + Decmth;
                    var lstGrph = 0;
                    for (lstGrph = 0; lstGrph < GraphList.length; lstGrph++) {
                        switch (GraphList[lstGrph].Month) {
                            case 1:
                                if (lstrGrph == 0) {
                                    str = str.replace('[["Jan", 0],', '[["Jan", ' + (total - GraphList[lstGrph].Amount) + '],');
                                }
                                else {
                                    str = str.replace('[["Jan", 0],', '[["Jan", ' + GraphList[lstGrph].Amount + '],');
                                }
                                break;
                            case 2:
                                if (lstrGrph == 0) {
                                    str = str.replace('["Feb", 0],', '["Feb", ' + (total - GraphList[lstGrph].Amount) + '],');
                                }
                                else {
                                    str = str.replace('["Feb", 0],', '["Feb", ' + GraphList[lstGrph].Amount + '],');
                                }
                                break;
                            case 3:
                                if (lstrGrph == 0) {
                                    str = str.replace('["March", 0],', '["March", ' + (total - GraphList[lstGrph].Amount) + '],');
                                }
                                else {
                                    str = str.replace('["March", 0],', '["March", ' + GraphList[lstGrph].Amount + '],');
                                }
                                break;
                            case 4:
                                if (lstrGrph == 0) {
                                    str = str.replace('["Apr", 0],', '["Apr", ' + (total - GraphList[lstGrph].Amount) + '],');
                                }
                                else {
                                    str = str.replace('["Apr", 0],', '["Apr", ' + GraphList[lstGrph].Amount + '],');
                                }
                                break;
                            case 5:
                                if (lstrGrph == 0) {
                                    str = str.replace('["May", 0],', '["May", ' + (total - GraphList[lstGrph].Amount) + '],');
                                }
                                else {
                                    str = str.replace('["May", 0],', '["May", ' + GraphList[lstGrph].Amount + '],');
                                }
                                break;
                            case 6:
                                if (lstrGrph == 0) {
                                    str = str.replace('["Jun", 0],', '["Jun", ' + (total - GraphList[lstGrph].Amount) + '],');
                                }
                                else {
                                    str = str.replace('["Jun", 0],', '["Jun", ' + GraphList[lstGrph].Amount + '],');
                                }
                                break;
                            case 7:
                                if (lstrGrph == 0) {
                                    str = str.replace('["July", 0],', '["July", ' + (total - GraphList[lstGrph].Amount) + '],');
                                }
                                else {
                                    str = str.replace('["July", 0],', '["July", ' + GraphList[lstGrph].Amount + '],');
                                }
                                break;
                            case 8:
                                if (lstrGrph == 0) {
                                    str = str.replace('["Aug", 0],', '["Aug", ' + (total - GraphList[lstGrph].Amount) + '],');
                                }
                                else {
                                    str = str.replace('["Aug", 0],', '["Aug", ' + GraphList[lstGrph].Amount + '],');
                                }
                                break;
                            case 9:
                                if (lstrGrph == 0) {
                                    str = str.replace('["Sep", 0],', '["Sep", ' + (total - GraphList[lstGrph].Amount) + '],');
                                }
                                else {
                                    str = str.replace('["Sep", 0],', '["Sep", ' + GraphList[lstGrph].Amount + '],');
                                }
                                break;
                            case 10:
                                if (lstrGrph == 0) {
                                    str = str.replace('["Oct", 0],', '["Oct", ' + (total - GraphList[lstGrph].Amount) + '],');
                                }
                                else {
                                    str = str.replace('["Oct", 0],', '["Oct", ' + GraphList[lstGrph].Amount + '],');
                                }
                                break;
                            case 11:
                                if (lstrGrph == 0) {
                                    str = str.replace('["Nov", 0],', '["Nov", ' + (total - GraphList[lstGrph].Amount) + '],');
                                }
                                else {
                                    str = str.replace('["Nov", 0],', '["Nov", ' + GraphList[lstGrph].Amount + '],');
                                }
                                break;
                            case 12:
                                if (lstrGrph == 0) {
                                    str = str.replace('["Dec", 0]]}', '["Dec", ' + (total - GraphList[lstGrph].Amount) + ']]}');
                                }
                                else {
                                    str = str.replace('["Dec", 0]]}', '["Dec", ' + GraphList[lstGrph].Amount + ']]}');
                                }
                                break;
                        }

                    }
                    strF += str;
                }
                strF += ']}';
                var obj = JSON.parse(strF);
                $('#savingchart').barChart(obj);
            }



            //$('#savingchart').barChart({
            //    "height": 500,
            //    "bars": [
            //        {
            //            "name": 'Total Spend',
            //            "values": [['jan', (100-45)], ['feb', (100-33)], ['march', 100], ['april', 100], ['may', 100], ['june', 100], ['july', 100], ['Aug', 100], ['Sept', 100], ['Oct', 100], ['Nov', 100], ['Dec', 100]]
            //        }, {
            //            "name": 'Monthly',
            //            "values": [['jan', 45], ['feb', 33], ['march', 49], ['april', 25], ['may', 29], ['june', 12], ['july', 29], ['Aug', 19], ['Sept', 69], ['Oct', 79], ['Nov', 90], ['Dec', 59]]
            //        }
            //    ]
            //});
        }

        function GraphSpendByCategory(GraphList) {

            if (GraphList.length > 0) {

                //var strF = '{ "header": { "title": { "text": "Spend By Category" }},"data": { "content": ['
                var strF = '{"data": { "content": ['

                var lstrGrphT = 0;
                if (GraphList.length > 0) {
                    for (lstrGrphT = 0; lstrGrphT < GraphList.length; lstrGrphT++) {
                        strF += '{ "label": "' + GraphList[lstrGrphT].Type + '", "value": ' + GraphList[lstrGrphT].Amount + ' }';
                        if ((lstrGrphT + 1) != GraphList.length) {
                            strF += ',';
                        }
                    }
                }
                strF += ']}}';

                var obj = JSON.parse(strF);

                var pie = new d3pie("pie", obj);
            }
        }

        //******************************** End Change for Graph ********************************************

        //*********************** Start for Accordion *******************

        function Accordian() {
            $(document).ready(function () {
                $(".accordion_container h3").each(function () {
                    $(this).append("<span class='plusminus'>+</span>");
                    $(this)
                .nextUntil("h3")
                .wrapAll("<div class='new'></div>");
                });
                $(".new").hide();
                $('.accordion_container h3').click(function () {
                    if ($('.new').is(':visible')) {
                        $(".new").slideUp(300);
                        $(".plusminus").text('+');
                    }
                    else {
                        $(this).next(".new").slideDown(300);
                        $(this).children(".plusminus").text('-');
                    }
                });
            });
        }

        //************************ End for Accordion *******************

    </script>


    <asp:UpdatePanel ID="xupnlReport" runat="server" UpdateMode="Conditional">
        <ContentTemplate>            
            <div class="main supplier">

                <div class="topBlk">
                    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="Buyer Reports"></asp:Literal>
                    </div>
                      <ul class="rightBtn">
                          <asp:LinkButton ID="xlbtnback" runat="server" CssClass="btnBlk fR" OnClientClick="javascript:ShowProgress(true);link_click('D')">Close</asp:LinkButton>
                     </ul>
                    <br class="cl">
                </div>

                <div class="clmn1">
                 <div class="row1">            
            
                <div class="whiteBox">
                    <%--<h5>View your spend History</h5>--%>
                    <table style="width:100%;"><tr>
                        <td style="width:33%;"><div class="imw100p fl">
                            <label>From Date</label>
                            <asp:TextBox ID="xtxtFromDate" CssClass="icnCal" runat="server" autocomplete="off" ReadOnly="false"></asp:TextBox>                                         
                        </div></td>
                        <td style="width:33%;"><div class="imw100p fl">
                            <label>To Date</label>
                            <asp:TextBox ID="xtxtToDate" CssClass="icnCal" runat="server" ReadOnly="false"></asp:TextBox>   
                        </div></td>
                        <td style="width:33%; text-align:right;"><div class="imw100p fl">
                            <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnBlk" OnClick="xlbtnSearch_Click" OnClientClick="javascript:if(!(ValidateSearch())){return false;}">Search</asp:LinkButton>        <%--;javascript:BindDownloadDates();--%>
                        </td>
                    </tr></table>
                    <br class="cl" />

                </div>

                <div class="whiteBox">
                    <div class="leftClmn">
                        <asp:Literal ID="xlitGraph" runat="server"></asp:Literal>
                    </div>
                    <div class="rightClmn">
                        Spend By Category
                        <div id="pie"></div>
                    </div>

                    <br class="cl">

                    
                            Spend by month by category
                            <div class='panel-body'>
                            <div id='morris-bar-chart'>
                                <div id="chart" ></div>
                            </div>
                            </div>

                    <br class="cl">

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
                            <button id="btnDownload" type="button" value="Download" class="btnBlk immrt30" onclick="javascript:if(!(ValidateSearchDownload())){return false;}">Download</button>
                        </td>
                    </tr></table>
                    <br class="cl">
                </div>

                 <br class="cl">  

                <div class="accordion_container divbuyer" id="divtopsupplier" runat="server" >
                     <h3>Top Suppliers</h3>
                 <div class="whiteBox" id="divData" runat="server" >                                                      
                                    <asp:Literal ID="xlitList" runat="server"></asp:Literal>                           
                            <br class="cl">                            
                     <table style="width:100%;"><tr>
                        <td style="width:33%;"><div class="imw100p fl">
                            <label>From Date</label>
                            <asp:TextBox ID="xtxtFromDateNew" CssClass="icnCal" runat="server" autocomplete="off" ></asp:TextBox>                                         
                        </div></td>
                        <td style="width:33%;"><div class="imw100p fl">
                            <label>To Date</label>
                            <asp:TextBox ID="xtxtToDateNew" CssClass="icnCal" runat="server" ReadOnly="false"></asp:TextBox>                           
                        </div></td>
                        <td style="width:33%; text-align:right;"><div class="imw100p fl">
                            <asp:LinkButton ID="xlbtnDwnldTopSuppliers" runat="server" CssClass="btnBlk" OnClientClick="javascript:if(!(ValidateSearchTopSupp())){return false;}">Download</asp:LinkButton>
                        </td>
                    </tr></table>
                         </div>
                 <br class="cl">                   
                 <asp:Literal ID="xlitScript" runat="server"></asp:Literal>                            
                 </div>
                <br class="cl">  
                
                 <br class="cl">  
                  <div class="accordion_container divbuyer" id="divtrackyouractivity" runat="server" >
                     <h3>Track Your Activity</h3>
                 <div class="whiteBox" id="div2" runat="server" >                                                      
                                    <asp:Literal ID="xlitlistActivity" runat="server"></asp:Literal>                           
                     <table style="width:100%;"><tr>
                        <td style="width:33%;"><div class="imw100p fl">
                            <label>From Date</label>
                            <asp:TextBox ID="xtxtFromDateNew1" CssClass="icnCal" runat="server" autocomplete="off" ReadOnly="false"></asp:TextBox>                                                                  
                        </div></td>
                        <td style="width:33%;"><div class="imw100p fl">
                            <label>To Date</label>
                            <asp:TextBox ID="xtxtToDateNew1" CssClass="icnCal" runat="server" ReadOnly="false"></asp:TextBox>   
                        </div></td>
                        <td style="width:33%; text-align:right;"><div class="imw100p fl">
                            <asp:LinkButton ID="xlbtnDwnldActivityRpt" runat="server" CssClass="btnBlk" OnClientClick="javascript:if(!(ValidateSearchActivityRpt())){return false;}">Download</asp:LinkButton>
                        </td>
                    </tr></table>
                     <br class="cl" />                    
                         </div>
                      <asp:Literal ID="xlitScript2" runat="server"></asp:Literal>                            
                 </div>

                 <br class="cl">
                     
                     <div class="accordion_container divbuyer" id="BuildYourReports" runat="server" >
                         <h3>Build your reports</h3>
                   <div id="DivSearch" class="whiteBox supplier reports" runat="server">                    
                     <div class="leftClmn">
                    <ul>
                        <li>                            
                            <input type="checkbox" value="RFP No" id="xchkRFP" class="fL chkBx" /><label for="xchkRFP">RFP N0</label></li>
                        <li>                            
                            <input type="checkbox" value="RFP Close Date" id="xchkEndDate" class="fL chkBx" /><label for="xchkEndDate">RFP CLOSE DATE</label></li>
                        <li>                            
                            <input type="checkbox" value="Product Description" id="xcheckProduct" class="fL chkBx" /><label for="xcheckProduct">PRODUCT DESCRIPTION</label></li>
                        <li>                            
                            <input type="checkbox" value="Qty" id="xchkQty" class="fL chkBx" /><label for="xchkQty">QTY</label></li>
                        <li>                            
                            <input type="checkbox" value="Category" id="xchkCategory" class="fL chkBx" /><label for="xchkCategory">CATEGORY</label></li>
                        <li>                            
                            <input type="checkbox" value="Highest Quote" id="xchkHighQuote" class="fL chkBx" /><label for="xchkHighQuote">HIGHEST QUOTE RECEIVED</label></li>
                        <li>                            
                            <input type="checkbox" value="RFP Status" id="xchkRFPStatus" class="fL chkBx" /><label for="xchkRFPStatus">RFP STATUS</label></li>
                        <li>                            
                            <input type="checkbox" value="Lowest Quote" id="xChkLowestQuote" class="fL chkBx" /><label for="xChkLowestQuote">LOWEST QUOTE RECEIVED</label></li>
                        </ul>
                         </div>
                     <div class="rightClmn">
                    <ul>
                        <li>                            
                            <input type="checkbox" value="Winning Supplier" id="xchkWinningSupp" class="fL chkBx" /><label for="xchkWinningSupp">WINNING SUPPLIER</label></li>
                        <li>
                            <input type="checkbox" value="PO Date" id="xchkPODate" class="fL chkBx" /><label for="xchkPODate">PO DATE</label></li>                            
                        <li>
                            <input type="checkbox" value="PO No" id="xchkPOId" class="fL chkBx" /><label for="xchkPOId">PO NO</label></li>                            
                        <li>
                            <input type="checkbox" value="PO Amt" id="xchkPOAmt" class="fL chkBx" /><label for="xchkPOAmt">PO AMOUNT</label></li>                            
                        <li>
                            <input type="checkbox" value="Invoice No" id="xchkInvoiceNo" class="fL chkBx" /><label for="xchkInvoiceNo">INVOICE NO</label></li>                                                        
                        <li>
                            <input type="checkbox" value="Invoice Amt" id="xchkInvoiceAmt" class="fL chkBx" /><label for="xchkInvoiceAmt">INVOICE AMOUNT</label></li>                                                        
                        <li>
                            <input type="checkbox" value="Payment Type" id="xchkkPayType" class="fL chkBx" /><label for="xchkkPayType">PAYMENT TYPE</label></li>                                                                                    
                        <li>
                            <input type="checkbox" value="Payment Date" id="xchkPayDate" class="fL chkBx" /><label for="xchkPayDate">PAYMENT DATE</label></li>                                                                                                                
                    </ul>                            
                      </div>                                      
                    <asp:LinkButton ID="xlbtnDwnldCustomerRpt" runat="server" CssClass="btnBlk" OnClientClick="javascript:if(!(DownloadCustomerReport())){return false;}">Download</asp:LinkButton>                  
                </div>
                     </div>                     
                     
                   

                 </div>
                 </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>
