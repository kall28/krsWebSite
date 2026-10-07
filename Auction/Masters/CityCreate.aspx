<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Masters_CityCreate, App_Web_citycreate.aspx.6044e34" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        
        function validateTextBox() {
            if ($("#ContentPlaceHolder1_xddlCountry option:selected").index() <= 0) {                
                ShowToolTip($("#ContentPlaceHolder1_xddlCountry"), "Please select country");
            return false;
        }
            else if ($("#ContentPlaceHolder1_xddlState option:selected").index() <= 0) {                
                ShowToolTip($("#ContentPlaceHolder1_xddlState"), "Please select state");
            return false;
        }
        else if ($("#ContentPlaceHolder1_xtxtCityName").val() == "") {
            ShowToolTip("#ContentPlaceHolder1_xtxtCityName", "Please enter city name.");
                return false;
            }
            ShowProgress(true);
            return true;
        }
    </script>

    <asp:UpdatePanel ID="xupnlCity" runat="server">
        <ContentTemplate>
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
            <div class="main supplier">
                <div class="topBlk">
                    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="City Details" ></asp:Literal>
                    </div>
                </div>
                <br class="cl">

                <div class="clmn1">
                    <div class="row1">
                        <div class="whiteBox">
                            <div class="leftClmn">
                                    Please fill the details for City.
                                    <br class="cl">
                                    <br class="cl">
                                    <label>Select Country</label><br />
                                    <div class="styled-select fl selOrganization">
                                        <asp:DropDownList ID="xddlCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="xddlCountry_SelectedIndexChanged">
                                            <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <br class="cl">
                                    <br class="cl">
                                    <label>Select State</label><br />
                                    <div class="styled-select fl selOrganization">
                                        <asp:DropDownList ID="xddlState" runat="server">
                                            <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <br class="cl">
                                    <br class="cl">
                                    <label>City Name</label>
                                    <asp:TextBox ID="xtxtCityName" runat="server" CssClass="imw97p" ToolTip="Please enter city name" maxlength="30" autocomplete="off"></asp:TextBox>
                                <br class="cl">
                                    <br class="cl">
                                    <label>Abbreviation</label>
                                    <asp:TextBox ID="xtxtAbbreviation" runat="server" CssClass="imw97p" ToolTip="Please enter Abbreviation" maxlength="3" autocomplete="off"></asp:TextBox>
                                    <br /><br />
                                    <div id="divchckPublish" class="chk" runat="server" visible="true">
                                        <label>Published</label>
                                        <asp:CheckBox ID="xchckPublish" runat="server" />
                                    </div>
                                    <br />
                                    <div class="grey-box bord-grey" id="divmsg" runat="server" visible="false">
                                            <strong>NOTE: </strong>You will receive a confirmation call from our representative,
                                            once we add all your requested details in our system.
                                    </div>
                                    <br class="cl">
                                    <asp:LinkButton ID="xlbtnSubmit" runat="server" CssClass="btnBlk"
                                        OnClick="UpdateDetails_click" OnClientClick="javascript: return validateTextBox()">Submit</asp:LinkButton>
                                    <asp:LinkButton ID="xlbtnCancel" runat="server" CssClass="btnBlk"
                                        OnClick="btnBack_click" OnClientClick="javascript:ShowProgress(true);">CANCEL</asp:LinkButton>


                                        <%--<asp:LinkButton ID="UpdateDetails" runat="server" onserverclick="UpdateDetails_click" 
                                            OnClientClick="javascript: if (!validateTextBox()) { return false;}">Update</asp:LinkButton>--%>
                                        <%--<asp:LinkButton ID="Back" runat="server" OnClientClick="javascript: ShowProgress(true);" 
                                            onserverclick="btnBack_click">Back</asp:LinkButton>--%>

                            </div>
                            <div class="rightClmn">
                            </div>
                            <br class="cl">
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

