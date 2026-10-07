<%@ page language="C#" autoeventwireup="true" inherits="_Display, App_Web_display.aspx.cdcab7d2" %>

<html>
<head runat="server">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title></title>
	<link href="Styles/main-2.1.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form id="form1" runat="server">
		<asp:HiddenField ID="xhdnTerminalNo" runat="server" Value="0" />
		<asp:HiddenField ID="xhdnPageNo" runat="server" Value="0" />
		<asp:ScriptManager ID="xScrMgr" runat="server">
			<Scripts>
				<asp:ScriptReference Path="~/Scripts/jquery-1.11.1.min.js" />
				<asp:ScriptReference Path="~/Scripts/app-1.0.common.js" />
				<asp:ScriptReference Path="~/Scripts/app-1.1.webReq.js" />
			</Scripts>
		</asp:ScriptManager>
		<div class="Digi_wrap" id="divData" runat="server">
		</div>
		<div class="footer">
			<div class="digi_setLegend">
				<ul>
					<li><span class="colBgWht"></span>
						Available Seats
					</li>
					<li>
						<span class="colBgYelow"></span>
						Sold Fast
					</li>
					<li>
						<span class="colBgRed"></span>
						Sold out
					</li>
				</ul>
			</div>
			<div class="logoTx">Play Cinemas</div>
		</div>
	</form>
	<script>
		startTime();
	</script>
</body>
</html>
