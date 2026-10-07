<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_OfferCenter_PreNegotiatedDealProcess, App_Web_prenegotiateddealprocess.aspx.3dacc91e" %>
<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main dashboard">
    <div class="topBlk">
      
      <%--<div class="mainHead fl" id="divCap" runat="server">Current pre-negotiated deals on Renepay</div>--%>
        <div class="mainHead fl" id="divCap" runat="server">Pre-negotiated Deals</div>
      <br class="cl">
    </div>
    <div class="whiteBox">
      <div class="dealHdr">
        <div class="dealImg"><img id="DealImg" runat="server" src="images/prod-02.jpg" alt=""/></div>
        <div class="dealCont">
          <h3><asp:Label ID="lblqty" runat="server" Text="0"></asp:Label>
              <asp:Label ID="lblprod" runat="server" Text="product"></asp:Label> @ Rs 
              <asp:Label ID="lblprice" runat="server" Text="0"></asp:Label>
              <asp:Label ID="lbleach" runat="server" Text=" each" Visible ="true"></asp:Label>
          </h3><br>


          <%--<ul class="dealForm">--%>
            <ul>
            <li>
                <b>Brand : </b><asp:Label ID="lblBrand" runat="server" Text=""></asp:Label>
            </li>
            <li>
               <b> Delivery Days : </b><asp:Label ID="lblDelivery" runat="server" Text="0"></asp:Label>
            </li>
            <li>
                <b>Product Specification : </b><asp:Label ID="lblSpecification" runat="server" Text=""></asp:Label>
            </li>
                <li>
                <b>Valid Till : </b><asp:Label ID="lblValidityDate" runat="server"></asp:Label>
            </li>
          </ul>
            <asp:LinkButton ID="lnkbtnBuyNow" runat="server" CssClass="btnBlk" OnClick="lnkbtnBuyNow_Click">Buy Now</asp:LinkButton>
        </div>
        <label id="lblTermsCondition" runat="server"></label>
        <div class="cl"></div>
        <p class="cap" id="pCap" runat="server" visible="false">You might also be interested in</p>
        <hr>
        <ul class="prod-slide" id="RelDealProd" runat="server">
        </ul>
        <div>
        	
        </div>
      </div>
      <br class="cl">
    </div>
  </div>
</asp:Content>

