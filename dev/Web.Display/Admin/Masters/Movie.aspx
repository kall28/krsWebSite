<%@ page title="" language="C#" masterpagefile="~/Admin/Module.master" autoeventwireup="true" inherits="Masters_Movie, App_Web_movie.aspx.2eb59593" %>

<%@ MasterType VirtualPath="~/Admin/Module.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/app-1.1.Date.js" language="javascript" type="text/javascript"></script>
    <script>
        function ValidateForm(mode) {
//            if ($("#ctl00_xcthMain_xdllCountryId").prop("selectedIndex") == 0) {
//                alert("Please select Country.")
//                return false;
//            }
//            if ($("#ctl00_xcthMain_xdllStateId").prop("selectedIndex") == 0) {
//                alert("Please select State.")
//                return false;
//            }

//            if (mode == 'N') {

//                if (!IsAlphabet($("#ctl00_xcthMain_xtxtCityID"), "City ID")) { return false; }
//                if (!IsAlphabet($("#ctl00_xcthMain_xtxtCityName"), "City Name")) { return false; }
//            }
//          
//            if (!IsAlphabet($("#ctl00_xcthMain_xtxtCityName"), "City Name")) { return false; }
          

            if (!confirm("Do you want to save record?")) { return false; }
            ShowProcessingPanel();
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content28" ContentPlaceHolderID="xcthMain" runat="Server">
    <asp:UpdatePanel ID="xupnlDataView" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="divView" runat="server">
                <table width="100%" cellpadding="2" cellspacing="2">
                    <tr>
                        <td style="padding-right: 25px; text-align: right;">
                            <asp:Button runat="server" ID="xbtnNew" Text="Add New" OnCommand="action_command"
                                CommandName="new" OnClientClick="javascript:ShowProcessingPanel();" Visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:GridView ID="xgrdViewData" runat="server" AutoGenerateColumns="False" Width="90%"
                                GridLines="Both" AllowPaging="true" OnPageIndexChanging="xgrdViewData_PageIndexChanging"
                                PageSize="10">
                                <HeaderStyle CssClass="gridHeader" />
                                <RowStyle CssClass="gridRow" />
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            Sr. No.
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%# Convert.ToString((xgrdViewData.PageSize * xgrdViewData.PageIndex)+Container.DisplayIndex + 1) + "." %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="HOPK" DataField="HOPK" />
                                    <asp:BoundField HeaderText="Movie Name" DataField="MovieName" />
                                    <asp:BoundField HeaderText="Movie Rating" DataField="Rating" />
                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <asp:Image ID="ximgMovie" runat="server" ImageUrl='<%# "~/Gallery/Movies/Thumbnail/" + DataBinder.Eval(Container.DataItem,"HOPK") + ".jpg" %> ' Width="70" Height="100" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="xbtnEdit" runat="server" Text="Edit" OnCommand="action_command" CommandName="editdata"
                                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"HOPK") %> ' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="xupnlDataEdit" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="divEdit" runat="server" style="border: solid 1pt #F4F0CB; padding: 10px;
                display: none; text-align: center;">
                <table width="100%">
                    <tr>
                        <td style="padding: 2px 0px 2px 10px; font-weight: bold; text-align: left; background-color: #B3A580;
                            color: White;">
                            <asp:Literal ID="xlitCap" runat="server"></asp:Literal>
                            <asp:HiddenField ID="xhdnEditId" runat="server" Visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table cellpadding="4" cellspacing="4">
                                <tr>
                                    <td>
                                    </td>
                                    <td colspan="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Movie Name:</b>
                                    </td>
                                    <td>
                                        <asp:Literal ID="xlitMovieName" runat="server" ></asp:Literal>
                                    </td>
                                </tr>                             
                                <tr>
                                    <td valign="top"><b>Thumbnail:</b></td>
                                    <td>
                                        <ctrl:FileUpload ID="xFileupload" runat="server" UploadImageType="MovieThumbnail"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <asp:Literal ID="xlitScriptEdit" runat="server"></asp:Literal>
                                        <asp:Button ID="xbtnUpdate" runat="server" CommandName="save" OnCommand="action_command"
                                            Text="Save" Visible="false" />
                                        <asp:Button ID="xbtnCancel" runat="server" CommandName="cancel" OnCommand="action_command"
                                            Text="Back" OnClientClick="javascript:if (!confirm('Do you want to cancel and go back?')) { return false; };ShowProcessingPanel();" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="xFileupload" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="xupnlMsg" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%--  </ContentTemplate> </asp:UpdatePanel>--%>
</asp:Content>
