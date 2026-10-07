<%@ page title="" language="C#" masterpagefile="~/Admin/Module.master" autoeventwireup="true" inherits="Content_DataSync, App_Web_datasync.aspx.4ba1f20c" %>

<%@ MasterType VirtualPath="~/Admin/Module.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="xcthMain" runat="Server">
    <script type="text/javascript">
        function ValidateForm(mode) {
            //            if ($("#ctl00_xcthMain_xdllDataProvider").prop("selectedIndex") == 0) {
            //                alert("Please select DataProvider.")
            //                return false;
            //            }
            //            if ($("#ctl00_xcthMain_xddlTransactionType").prop("selectedIndex") == 0) {
            //                alert("Please select TransactionType.")
            //                return false;
            //            }
            //            if ($("#ctl00_xcthMain_xddlBranchId").prop("selectedIndex") == 0) {
            //                alert("Please select Branch.")
            //                return false;
            //            }
            //            if ($("#ctl00_xcthMain_xddlCity").prop("selectedIndex") == 0) {
            //                alert("Please select City.")
            //                return false;
            //            }
            //            if ($("#ctl00_xcthMain_xddlCompany").prop("selectedIndex") == 0) {
            //                alert("Please select Company.")
            //                return false;
            //            }
            //            if ($("#ctl00_xcthMain_xddlMultiplex").prop("selectedIndex") == 0) {
            //                alert("Please select Multiplex.")
            //                return false;
            //            }
            //            if (mode == 'N') {

            //                if (!IsAlphabet($("#ctl00_xcthMain_xtxtCityID"), "City ID")) { return false; }
            //                if (!IsAlphabet($("#ctl00_xcthMain_xtxtCityName"), "City Name")) { return false; }
            //            }

            //            if (!IsAlphabet($("#ctl00_xcthMain_xtxtCityName"), "City Name")) { return false; }


            if (!confirm("Do you want to save record?")) { return false; }
            ShowProcessingPanel();
            return true;
        }
    </script>
    <asp:UpdatePanel ID="xupnlDataView" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="divView" runat="server">
                <table width="100%" cellpadding="2" cellspacing="2">
                    <tr>
                        <td style="padding-left: 50px;">
                            <asp:Button ID="xbtnSync" runat="server" CommandName="sync" OnCommand="action_command"
                                class="button" Text="Session Data Sync" OnClientClick="javascript:ShowProcessingPanel();" />
                            <asp:Button ID="xbtnRefresh" runat="server" CommandName="refresh" OnCommand="action_command"
                                class="button" Text="Refresh" OnClientClick="javascript:ShowProcessingPanel();" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="xupnlMsg" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Literal ID="xlitScriptView" runat="server"></asp:Literal>
                            <asp:GridView ID="xgrdViewData" runat="server" AutoGenerateColumns="False" Width="90%"
                                PageSize="50" GridLines="Both" AllowPaging="true" OnPageIndexChanging="xgrdViewData_PageIndexChanging">
                                <HeaderStyle CssClass="gridHeader" />
                                <RowStyle CssClass="gridRow" />
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            Sr. No.
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%# Convert.ToString(Container.DisplayIndex + 1) + "." %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Screen No" DataField="ScreenId" />
                                    <asp:BoundField HeaderText="Screen" DataField="ScreenName" />
                                    <asp:BoundField HeaderText="Cinema Class" DataField="ClassName" />
                                    <asp:TemplateField HeaderText="Movie">
                                        <ItemStyle />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "MovieName") + " (" + DataBinder.Eval(Container.DataItem, "Rating") + ")"%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Show Time" DataField="ShowTime" />
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
                                <asp:Literal ID="xlitCinemaInfo" runat="server"></asp:Literal>
                                <tr>
                                    <td colspan="4" align="center">
                                        <asp:Literal ID="xlitScriptEdit" runat="server"></asp:Literal>
                                        <asp:Button ID="xbtnUpdate" runat="server" CommandName="save" OnCommand="action_command"
                                            class="button" Text="Save" OnClientClick="javascript:ShowProcessingPanel();" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
