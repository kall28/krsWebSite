<%@ page language="C#" autoeventwireup="true" inherits="Campaign_SGCampaign, App_Web_sgcampaign.aspx.c1567390" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Campaign: Renepay SG</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <%--Start Link For Top-Bottom scroll--%>
    <link href="Scroll/style.css" rel="stylesheet" />
    <script src="Scroll/jquery-1.3.2.js"></script>
    <script src="Scroll/scroll-startstop.events.jquery.js"></script>
    <%--End Link For Top-Bottom scroll--%>

    <link href="css/main.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-ui-1.11.2.custom/external/jquery/jquery.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/common-2.1.js"></script>
    <style>
        .modal-header
        {
        }
    </style>
</head>
<body>

    <%--Start Script For Top-Bottom scroll--%>

    <script>
        var offset = 220;
        var duration = 500;
        jQuery(window).scroll(function () {
            if (jQuery(this).scrollTop() < offset) {
                jQuery('#nav_down').fadeIn(duration);
                $('#nav_down').stop().animate({ 'opacity': '1' });
            } else {
                jQuery('#nav_down').fadeOut(duration);
            }

        });




        $(function () {
            var $elem = $('#content');

            //$('#nav_up').fadeIn('slow');
            $('#nav_down').fadeIn('slow');

            $(window).bind('scrollstart', function () {
                $('#nav_up,#nav_down').stop().animate({ 'opacity': '0.2' });
            });
            $(window).bind('scrollstop', function () {
                $('#nav_up,#nav_down').stop().animate({ 'opacity': '1' });
            });

            $('#nav_down').click(
                function (e) {
                    $('html, body').animate({ scrollTop: $elem.height() }, 900);

                    $('#nav_down').stop().animate({ 'opacity': '0.0' });        //new line
                }
            );
        });
        </script>

    <%--End Script For Top-Bottom scroll--%>


    <script>
        function btnSubmit_Click() {

            if ($("#xtxtSupplierName").val() == "") {
                $("#xtxtSupplierName").focus();
                ShowToolTip($("#xtxtSupplierName"), "Please enter supplier name.", "bottom");
                return false;
            }
            else if ($("#xtxtBusinessName").val() == "") {
                $("#xtxtBusinessName").focus();
                ShowToolTip($("#xtxtBusinessName"), "Please enter business name.", "bottom");
                return false;
            }
            else if ($("#xtxtAddress").val() == "") {
                $("#xtxtAddress").focus();
                ShowToolTip($("#xtxtAddress"), "Please enter address.", "bottom");
                return false;
            }
            else if ($("#xtxtMobileNo").val() == "") {
                $("#xtxtMobileNo").focus();
                ShowToolTip($("#xtxtMobileNo"), "Please enter mobile no.", "bottom");
                return false;
            }
            else if ($("#xtxtEmail").val() == "") {
                $("#xtxtEmail").focus();
                ShowToolTip($("#xtxtEmail"), "Please enter email id.", "bottom");
                return false;
            }
            else if (!validateEmail($("#xtxtEmail").val())) {
                $("#xtxtEmail").focus();
                ShowToolTip($("#xtxtEmail"), "Please enter Valid Email Address", "bottom");
                return false;
            }
            else if ($("#xtxtBRNNumber").val() == "") {
                $("#xtxtBRNNumber").focus();
                ShowToolTip($("#xtxtBRNNumber"), "Please enter BRN number.", "bottom");
                return false;
            }
            else if ($("#ddlCategory").val() == "0") {
                $("#ddlCategory").focus();
                ShowToolTip($("#ddlCategory"), "Please select category.", "bottom");
                return false;
            }
            else if ($("#ddlCategory").val() == "11" && $("#xtxtSubCategory").val() == "") {
                $("#xtxtSubCategory").focus();
                ShowToolTip($("#xtxtSubCategory"), "Please enter category.", "bottom");
                return false;
            }
            else if ($("#ddlCategory").val() != "11" && $("#ddlCategory").val() != "0" && $("#xddlSubCategory").val() == "0") {
                $("#xddlSubCategory").focus();
                ShowToolTip($("#xddlSubCategory"), "Please select subcategory.", "bottom");
                return false;
            }

            RegSubmit();
            //return true;
        }

        function RegSubmit() {

            var strSupplierName = $("#xtxtSupplierName").val();
            var strBusinessName = $("#xtxtBusinessName").val();
            var strAddress = $("#xtxtAddress").val();
            var strMobileNo = $("#xtxtMobileNo").val();
            var strEmail = $("#xtxtEmail").val();
            var strBRNNumber = $("#xtxtBRNNumber").val();
            var strCategory = $("#ddlCategory option:selected").text();
            var strSubCategory = $("#ddlCategory").val() == "11" ?
                $("#xtxtSubCategory").val() : $("#xddlSubCategory option:selected").text();

            $.ajax({
                //url: strUrl + 'SGCampaign.aspx/Submit',
                url: 'SGCampaign.aspx/Submit',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'strSupplierName':'" + strSupplierName + "','strBusinessName':'"
                    + strBusinessName + "','strAddress':'" + strAddress + "','strMobileNo':'"
                    + strMobileNo + "','strEmail':'" + strEmail + "','strBRNNumber':'"
                    + strBRNNumber + "', 'strCategory':'" + strCategory + "', 'strSubCategory':'"
                    + strSubCategory + "'}",
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData == "0") {
                            //ShowModalBox("#divMsg");
                            
                            $("#xtxtSupplierName").val('');
                            $("#xtxtBusinessName").val('');
                            $("#xtxtAddress").val('');
                            $("#xtxtMobileNo").val('');
                            $("#xtxtEmail").val('');
                            $("#xtxtBRNNumber").val('');
                            $("#ddlCategory").val('0');
                            $("#divsubcatddl").css('display', 'inline');
                            $("#divsubcattxt").css('display', 'none');
                            $('#xddlSubCategory').find('option').remove();
                            $('#xddlSubCategory').append('<option value="0">Select Subcategory</option>');
                            $("#xtxtSubCategory").val('');
                            window.location = 'http://renepay.com/Campaign/pop-thank-you.aspx';
                            //window.location = 'http://localhost:50438/Campaign/pop-thank-you.aspx';
                        }
                    }
                    catch (e) { //alert(e.Message); 
                    }
                },
                error: function (data) {
                }
            });
        }

        var subCatList = [{ 'id': 1, 'name': 'CONTRACTUAL STAFFING' }, { 'id': 1, 'name': 'MANPOWER MANAGEMENT' },
            { 'id': 2, 'name': 'CATERING SERVICES' }, { 'id': 2, 'name': 'CLEANING EQUIPMENT' }, { 'id': 2, 'name': 'HOUSEKEEPING' },
            { 'id': 2, 'name': 'HOUSEKEEPING MATERIALS' }, { 'id': 2, 'name': 'MAINTENANCE SERVICES' },
            { 'id': 2, 'name': 'OFFICE TRANSPORT' }, { 'id': 2, 'name': 'SECURITY SERVICES' },
            { 'id': 3, 'name': 'AUDIT & FINANCE' }, { 'id': 3, 'name': 'PAYROLL SERVICES' },
            { 'id': 4, 'name': 'AIR FREIGHT' }, { 'id': 4, 'name': 'COURIER SERVICES' },
            { 'id': 4, 'name': 'FREIGHT FORWARDING SERVICES' }, { 'id': 4, 'name': 'FREIGHT MANAGEMENT' },
            { 'id': 4, 'name': 'TRANSPORTATION SERVICES' }, { 'id': 4, 'name': 'WAREHOUSING AND DISTRIBUTION' },
            { 'id': 5, 'name': 'IT EQUIPMENT' }, { 'id': 5, 'name': 'IT HARDWARE' }, { 'id': 5, 'name': 'LAPTOPS' },
            { 'id': 5, 'name': 'NETWORKING SOLUTIONS' }, { 'id': 5, 'name': 'OFFICE AUTOMATION' },
            { 'id': 5, 'name': 'SUPPORT & MAINTENANCE' }, { 'id': 5, 'name': 'SYSTEM & SOFTWARE SERVICES' },
            { 'id': 6, 'name': 'ADVERTISING SERVICES' }, { 'id': 6, 'name': 'CORPORATE EVENTS' },
            { 'id': 6, 'name': 'DESIGNING' }, { 'id': 6, 'name': 'EVENT MANAGEMENT' },
            { 'id': 6, 'name': 'WEB DEVELOPMENT' }, { 'id': 7, 'name': 'DRINKING WATER' },
            { 'id': 7, 'name': 'PACKAGE' }, { 'id': 7, 'name': 'PACKAGING MACHINE' },
            { 'id': 7, 'name': 'TREATMENT EQUIPMENT' }, { 'id': 8, 'name': 'OFFICE STATIONERY' },
            { 'id': 8, 'name': 'PAPER' }, { 'id': 8, 'name': 'CARTRIDGES' },
            { 'id': 8, 'name': 'PRINTING SOLUTIONS' }, { 'id': 9, 'name': 'CONSTRUCTION & INFRASTRUCTURE' },
            { 'id': 9, 'name': 'CONSTRUCTION EQUIPMENT' }, { 'id': 9, 'name': 'CONSULTANT' },
            { 'id': 9, 'name': 'INTERIOR DESIGNING' }, { 'id': 9, 'name': 'LEASING & SELLING' },
            { 'id': 10, 'name': 'COMMUNICATION SYSTEM' }, { 'id': 10, 'name': 'NETWORKING PRODUCTS' },
            { 'id': 10, 'name': 'TELECOM EQUIPMENT' }, { 'id': 10, 'name': 'TELECOM HARDWARE' },
            { 'id': 10, 'name': 'TELECOMMUNICATION & NETWORKING SERVICES' }, { 'id': 11, 'name': 'OTHER' }
        ];

        function cat_change(ctrl) {
            if ($(ctrl).val() == '11') {
                $("#divsubcatddl").css('display', 'none');
                $("#divsubcattxt").css('display', 'inline');
            }
            else {                
                $("#divsubcatddl").css('display', 'inline');
                $("#divsubcattxt").css('display', 'none');

                $('#xddlSubCategory').find('option').remove();
                $('#xddlSubCategory').append('<option value="0">Select Subcategory</option>')

                for (var i = 0; i < subCatList.length; i++) {
                    if ($(ctrl).val() == subCatList[i].id) {
                        $('#xddlSubCategory').append('<option value="' + (i + 1) + '">' + subCatList[i].name + '</option>');
                    }
                }
            }
        }

    </script>

    <form id="form1" runat="server">
        <%--<div class="renLanding">id="content" class="content"--%>
        <div id="content" class="renLanding content">
            <img src="images/landing-img1.jpg" class="landImg" />
            <div class="landInfo">
                <h2>Renepay brings you unparalleled business advantages.</h2>
                <ul>
                    <li>
                        <img src="images/landing-icon1.png" /><p>
                            Reduced<br>
                            payment risks
                        </p>
                    </li>
                    <li>
                        <img src="images/landing-icon2.png" /><p>
                            Lower cost of<br>
                            acquisition
                        </p>
                    </li>
                    <li>
                        <img src="images/landing-icon3.png" /><p>
                            Zero<br>
                            registration fees
                        </p>
                    </li>
                    <li>
                        <img src="images/landing-icon4.png" /><p>
                            Higher probability<br>
                            of winning
                        </p>
                    </li>
                    <li>
                        <img src="images/landing-icon5.png" /><p>
                            Visibility with over<br>
                            20,000 corporates
                        </p>
                    </li>
                </ul>
            </div>
            <div id="divRegistration" class="landForm">
                <h2>Register for Free</h2>
                <div class="form">
                    <div class="row">
                        <div class="imw50p fl">
                            <asp:TextBox ID="xtxtSupplierName" class="imw100p" onkeypress="return RestrictText(event);" placeholder="Name of Supplier" MaxLength="100" runat="server"></asp:TextBox>
                        </div>
                        <div class="imw50p fr">
                            <asp:TextBox ID="xtxtBusinessName" placeholder="Business Name" onkeypress="return RestrictText(event);" MaxLength="100" runat="server" class="imw100p"></asp:TextBox>
                        </div>
                        <br class="clr">
                    </div>
                    <div class="row">
                        <div class="imw50p fl">
                            <%--<input type="text" id="txtAddress" maxlength="100" placeholder="Address" name="fname" class="imw100p">--%>
                            <asp:TextBox ID="xtxtAddress" class="imw100p" placeholder="Address" MaxLength="200" runat="server"></asp:TextBox>
                        </div>
                        <div class="imw50p fieldMob fr">
                            <%--<input placeholder="Phone number" maxlength="8" id="txtMobileNo" type="text" name="fname" class="imw100p" />--%>
                            <asp:TextBox ID="xtxtMobileNo" class="imw100p" placeholder="Mobile No" onkeydown="IsNumeric(event);" MaxLength="8" runat="server"></asp:TextBox>
                            <label>+65</label>
                        </div>
                        <br class="clr">
                    </div>
                    <div class="row">
                        <div class="imw50p fl">
                            <%--<input type="text" id="txtEmail" maxlength="50" placeholder="Email id" name="fname" class="imw100p">--%>
                            <asp:TextBox ID="xtxtEmail" class="imw100p" placeholder="Email" MaxLength="50" runat="server"></asp:TextBox>
                        </div>
                        <div class="imw50p fr">
                            <%--<input type="text" id="txtBRNNumber" maxlength="50" placeholder="BRN number" name="fname" class="imw100p">--%>
                            <asp:TextBox ID="xtxtBRNNumber" class="imw100p" onkeypress="return RestrictText(event);" placeholder="BRN Number" MaxLength="10" runat="server"></asp:TextBox>
                        </div>
                        <br class="clr">
                    </div>
                    <div class="row">
                        <div class="imw50p fl">
                            <select id="ddlCategory" onchange="cat_change(this)">
                                <option value="0">Select Category</option>
                                <option value="1">CONTINGENT LABOR</option>
                                <option value="2">FACILITY MANAGEMENT</option>
                                <option value="3">FINANCIAL SERVICES</option>
                                <option value="4">FREIGHT</option>
                                <option value="5">IT HARDWARE & CONSUMABLES</option>
                                <option value="6">MARKETING SERVICES</option>
                                <option value="7">MINERAL WATER</option>
                                <option value="8">PRINT & STATIONERY</option>
                                <option value="9">REAL ESTATE SERVICES</option>
                                <option value="10">TELECOM EQUIPMENT</option>
                                <option value="11">OTHER</option>
                            </select>
                        </div>
                        <div class="imw50p fr">
                            <div id="divsubcatddl">
                            <select id="xddlSubCategory">
                                <option value="0">Select Subcategory</option>
                            </select>
                            </div>
                            <div id="divsubcattxt" style="display:none;">
                            <asp:TextBox ID="xtxtSubCategory" class="imw100p" onkeypress="return RestrictText(event);" 
                                placeholder="Enter Category" MaxLength="50" runat="server"></asp:TextBox>
                            <%--<input id="txtSubCategory" type="text" placeholder="Sub Category"  class="imw100p" />--%>
                            </div>
                        </div>
                        <br class="clr">
                    </div>
                    <div class="btnBlk">
                        <button type="button" id="btnSubmit" runat="server"
                            class="subBtn" onclick="javascript: btnSubmit_Click();">
                            Submit</button>
                    </div>
                </div>
            </div>
            <div class="footer">
                <p class="fl">Payments made exclusively through Visa Commercial Cards.</p>
                <div class="footLogo">
                <a href="#">
                    <img width="120" src="images/logo-renepay.png"></a>
                <a href="#" class="lastLogo">
                    <img width="90" src="images/wire-card-logo.png"></a>
                    </div>
            </div>
        </div>

        <%--<div style="display:none;"  class="nav_up" id="nav_up"></div>--%>
		<div style="display:none;" class="nav_down" id="nav_down"></div>


        
    </form>
</body>
</html>
<script type="text/javascript"> _linkedin_data_partner_id = "26717";</script>
<script type="text/javascript">
    (function () {
        var s = document.getElementsByTagName("script")[0];
        var b = document.createElement("script"); b.type = "text/javascript"; b.async = true;
        b.src = "https://snap.licdn.com/li.lms-analytics/insight.min.js"; s.parentNode.insertBefore(b, s);
    })();
</script>
<!-- Facebook Pixel Code -->
<script>
    !function (f, b, e, v, n, t, s) {
        if (f.fbq) return; n = f.fbq = function () {
            n.callMethod ?
            n.callMethod.apply(n, arguments) : n.queue.push(arguments)
        }; if (!f._fbq) f._fbq = n;
        n.push = n; n.loaded = !0; n.version = '2.0'; n.queue = []; t = b.createElement(e); t.async = !0;
        t.src = v; s = b.getElementsByTagName(e)[0]; s.parentNode.insertBefore(t, s)
    }(window,
    document, 'script', 'https://connect.facebook.net/en_US/fbevents.js');

    fbq('init', '598666067002763');
    fbq('track', "PageView");</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=598666067002763&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o),
        m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-84932539-1', 'auto');
    ga('send', 'pageview');

</script>



