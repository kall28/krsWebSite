<%@ page title="" language="C#" masterpagefile="~/Settings/SettingMaster.master" autoeventwireup="true" inherits="New_Settings_Default, App_Web_default.aspx.f634c32f" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderButton" Runat="Server">
    <div class="mainHead fl">
                        <asp:Literal ID="xlitCap" runat="server" Text="<span id='spnCap'>NOTIFICATIONS</span>"></asp:Literal>
                    </div>
    <ul class="rightBtn">
                    <li><a href="#" class="btnBlk">REFRESH</a></li>
                    <li><a href="#" class="btnBlk">DELETE</a></li>
                    <li><a href="#" class="btnBlk">BACK</a></li>
              	</ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">
    <table cellspacing="0" cellpadding="0" border="0" class="billInfo">
          <tbody>
            <tr>
              <th width="12%">Name</th>
              <th width="47%">&nbsp;</th>
              <th width="16%">Date</th>
            </tr>
            <tr>
              <td width="12%">Lorem Ipsum</td>
              <td width="47%">Lorem</td>
              <td width="16%">xxx</td>
            </tr>
            <tr>
              <td>Lorem Ipsum</td>
              <td>Lorem</td>
              <td>xxx</td>
            </tr>
            <tr>
              <td>Lorem Ipsum</td>
              <td>Lorem</td>
              <td>xxx</td>
            </tr>
          </tbody>
        </table>
</asp:Content>

