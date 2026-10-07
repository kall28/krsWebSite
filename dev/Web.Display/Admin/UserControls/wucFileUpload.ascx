<%@ control language="C#" autoeventwireup="true" inherits="UserControls_wucFileUpload, App_Web_wucfileupload.ascx.f1b43d4f" %>
<table>
    <tr>
        <td>
            <asp:Label ID="xlblUploadedFileName" runat="server" ForeColor="#996600"></asp:Label>
            <asp:HiddenField ID="xhdnNewFileName" runat="server" Value="" />
        </td>
    </tr>
    <tr>
        <td align="left">
            <asp:Image ID="xImgUploaded" Visible="true" runat="server" />            
        </td>
    </tr>
    <tr>
        <td>
            <asp:FileUpload ID="xFileUpload" runat="server" />
            <asp:Button ID="xbtnUpload" runat="server" CausesValidation="false" Text="Upload Image"
                OnClick="xbtnUpload_Click" />            
            <asp:Literal id="xlitUploadedMsg" runat="server"></asp:Literal>
        </td>
    </tr>
</table>
