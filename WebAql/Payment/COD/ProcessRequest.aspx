<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePGMaster.master" autoeventwireup="true" inherits="Payment_COD_ProcessRequest, App_Web_processrequest.aspx.b3720c88" %>
<%@ MasterType VirtualPath="~/MasterPage/SitePGMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<script>
		function onScriptLoad() {
			CommonHelper.showProgress();
			RequestHelper.post({
				url: WebNavHelper.getBaseUrl() + "Payment/COD/ProcessRequest.aspx/ProcessResponse",
				data: ""
			}).then(result => {
				window.location = WebNavHelper.getBaseUrl() + result.DataObject;
			}).catch(error => {
				window.location = WebNavHelper.getBaseUrl() + "ErrorPage.aspx";
				//CommonHelper.hideProgress();
				//CommonHelper.showErrorMessage("Sign In Error", error.message, null);
			});
		}

		$(document).ready(function () {
			onScriptLoad();
		});
	</script>
</asp:Content>

