<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_Masters_CountryCreate, App_Web_countrycreate.aspx.6044e34" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">

        function validateTextBox() {
            var ctrl = $("#ContentPlaceHolder1_xtxtCountryName");
            if (ctrl.val() == "") {
                ShowToolTip("#ContentPlaceHolder1_xtxtCountryName", "Please enter country name.");
                return false;
            }
            //                var ctrl = $("#ContentPlaceHolder1_txttwoleterIsoCode");
            //                if (ctrl.val() == "") 
            //                {
            //                    ShowToolTip("#ContentPlaceHolder1_txttwoleterIsoCode", "Please Enter TwoLeterIsoCode.");
            //                    return false;
            //                }
            //                var ctrl = $("#ContentPlaceHolder1_txtThreeLetterIsoCode");
            //                if (ctrl.val() == "") 
            //                {
            //                    ShowToolTip("#ContentPlaceHolder1_txtThreeLetterIsoCode", "Please Enter ThreeLetterIsoCode.");
            //                    return false;
            //                }
            ShowProgress(true);
            return true;
        }

    </script>

    <asp:UpdatePanel ID="xupnlCategory" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Literal ID="xlitScriptVal" runat="server"></asp:Literal>
            <div class="main supplier">
                <div class="topBlk">
                    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="Country Details" ></asp:Literal>
                    </div>
                </div>
                <br class="cl">

                <div class="clmn1">
                    <div class="row1">
                        <div class="whiteBox">
                            <div class="leftClmn">
                                Please fill the details for Country.
                                <br class="cl">
                                <br class="cl">
                                <asp:TextBox ID="xtxtCountryName" runat="server" CssClass="imw97p" placeholder="Country Name" ToolTip="Please enter country name" maxlength="30" autocomplete="off"></asp:TextBox>
                                <asp:TextBox ID="xtxttwoleterIsoCode" runat="server" CssClass="imw97p" placeholder="Two Letter Iso Code" ToolTip="Please enter two letter ISO code" maxlength="2" autocomplete="off"></asp:TextBox>
                                <asp:TextBox ID="xtxtThreeLetterIsoCode" runat="server" CssClass="imw97p" placeholder="Three Letter Iso Code" ToolTip="Please enter three letter ISO code" maxlength="3" autocomplete="off"></asp:TextBox>
                                <asp:TextBox ID="xtxtcurrency" runat="server" CssClass="imw97p" placeholder="Currency" ToolTip="Please enter currency" maxlength="3" autocomplete="off"></asp:TextBox>
                                <asp:TextBox ID="xtxttimeoffset" runat="server" CssClass="imw97p" placeholder="Time OffSet" ToolTip="Please enter Time OffSet" maxlength="10" autocomplete="off"></asp:TextBox>
                                <asp:TextBox ID="xtxtCountryCode" runat="server" CssClass="imw97p" placeholder="Country Code" ToolTip="Please enter Country Code" maxlength="3" autocomplete="off"></asp:TextBox>
                                    <br /><br />
                                    <div id="divchckPublish" class="chk" runat="server" visible="true">
                                        <label>Published</label>
                                        <asp:CheckBox ID="xchckPublish" runat="server" />
                                    </div>
                                    <br /><br />
                                    <label>IsVendor</label>
                                    <asp:CheckBox ID="xchkIsVendor" runat="server" />
                                    <br />
                                    <div class="grey-box bord-grey" id="divmsg" runat="server" visible="false">
                                            <strong>NOTE: </strong>You will receive a confirmation call from our representative,
                                            once we add all your requested details in our system.
                                    </div>
                                    <br class="cl">
                                    <asp:LinkButton ID="xlbtnSubmit" runat="server" CssClass="btnBlk"
                                        OnClick="UpdateDetails_click" OnClientClick="javascript:if(!validateTextBox()){ return false; }">Submit</asp:LinkButton>
                                    <asp:LinkButton ID="xbtnBack" runat="server" CssClass="btnBlk"
                                        OnClick="btnBack_click" OnClientClick="javascript:ShowProgress(true);">CANCEL</asp:LinkButton>

                            </div>
                            <div class="rightClmn">
                            </div>
                            <br class="cl">
                        </div>
                    </div>
                </div>
            </div>
            <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

