<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="RFPCenter_CompanyList, App_Web_companylist.aspx.f5f1fac" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function GetCompany(Id) {
            ShowProgress();
            $.ajax({
                type: 'POST',
                url: 'CompanyList.aspx/GetCompany',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id':'" + Id + "'}",
                cache: false,
                success: function (msg) {
                    if (msg.d == "0") {
                        window.location = "Create.aspx";
                        HideProgress();
                    }
                    else { ShowModalBox("Error", msg.d); }
                },
                error: ShowError
            });
        }
    </script>
    <div id="divCompanyList" runat="server" >
        <div class="topBlk">
            <div class="mainHead fl">
                <h2>Please select buyer to create RFP</h2>
            </div>
            <ul class="rightBtn">
                <asp:LinkButton ID="xlnkbtnClose" runat="server" class="btnBlk"
                    >Close</asp:LinkButton>
                <%--OnClick="xlnkbtnClose_Click"--%>
            </ul>
            <br class="cl" />
        </div>
        <asp:Literal ID="xlitList" runat="server"></asp:Literal>
        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>

