<%@ control language="C#" autoeventwireup="true" inherits="New_UserControls_wucUploadFileMultiple, App_Web_wucuploadfilemultiple.ascx.6bb32623" %>
<script src="<%=this.ResolveUrl("~/Scripts/AjaxFileupload.js") %>" type="text/javascript"></script>
<asp:HiddenField ID="xhdnPath" runat="server" Value="" />
<asp:HiddenField ID="xhdnFileName" runat="server" />
<div class="upload" id="divFile" runat="server">
</div>
<div id="divFileUpload" runat="server" class="upload">
    <asp:FileUpload ID="fileToUpload" runat="server" style="display:none;"/>
    <a href="#" class="uploCompLogo" id="lnkUpload" runat="server">
        <img id="imgLogo" runat="server" src="~/images/icn-upload.png" />
        <span><asp:Literal ID="xlitCap" runat="server">Upload File</asp:Literal></span>        
    </a>
    <div class="toolTip">
		    <a href="#" onclick="javascript:return false;">?
			    <div class="toolTipCont"><asp:Literal ID="xlitFileDet" runat="server"></asp:Literal></div>
		    </a>
        </div>
    <%--<a href="#" class="uploCompLogo" id="lnkUpload" runat="server">
        <img id="imgLogo" runat="server" src="~/images/upload-como-logo.jpg" />
        <span><asp:Literal ID="xlitCap" runat="server">Upload File</asp:Literal><br /><asp:Literal
        ID="xlitFileDet" runat="server"></asp:Literal></span>
    </a>--%>
    <%--<a id="lnkUpload" runat="server" class="img-upload"><span>Upload File<asp:Literal
        ID="xlitFileDet" runat="server"></asp:Literal></span></a>--%>
</div>
<asp:Literal ID="xlitScript" runat="server"></asp:Literal>