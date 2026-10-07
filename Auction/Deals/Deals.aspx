<%@ page language="C#" autoeventwireup="true" inherits="Deals_Deals, App_Web_deals.aspx.1c5f8e60" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../Styles/DealStyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    
        <div class="wrapper">
            <!--header start here-->
            <div class="header">
                <div class="headercont">
                    <div class="infi">
                        <a href="#">
                            <img src="../images/infi-logoDeal.png" width="206" height="128" alt="" /></a>
                    </div>
                    <div class="text">SME Community Buying
                       <span>Get amazing deals by harnessing the power of the community.</span>

                    </div>
                    
                    <div class="cart">
                        <a href="#">
                            <img src="../images/cart-logo.png" width="260" height="257" alt="" /></a>
                    </div>

                </div>

            </div>
            <!--header end here-->
            <!--main start here-->
            <div class="main">
                <p1>Save Big!</p1>
                <br>
                <p2>Exeperience the power of collective buying and collective saving.</p2>

                <div class="bookcont">
                    <label id="lblProd" runat="server"></label>
                </div>

                <div class="bookimg">
                    <img id="Prodimg" runat="server" width="412" height="467" alt="" />
                </div>

                <div class="greybg">
                    <p>
                        <label id="lblProdname" runat="server"></label>
                        <br />
                        <span>
                            <label id="lblMarketPrice" runat="server" style="display: inline-block; margin-bottom: 12px;"> </label>
                        </span>
                        <br />
                        <span>
                            <label id="lblOfferPrice" runat="server"></label>
                        </span>
                        <br />
                        <label id="lblDes" runat="server" style="font-size:16px;"></label>
                    </p>


                    <asp:Button ID="xlbtnPlaceOrder" runat="server" CssClass="btn" Text="PLACE YOUR ORDER" OnClick="xlbtnPlaceOrder_Click" />
                    <br />
                    <label id="lblStockMsg" runat="server" style="color: red"></label>
                </div>

            </div>
            <!--main end here-->
            <!--footer start here-->

            <div class="footer">
                <div class="footercont">
                    <div class="tc">
                        <div id="TnC" runat="server">
                        </div>
                    </div>
                    <asp:HiddenField ID="DealId" runat="server" />
                    <div class="infi-logo" style="display:none;">
                        <a href="#">
                            <img src="../images/footer-logo.png" width="185" height="110" alt="" /></a>
                    </div>
                </div>
            </div>
            <!--footer enf here-->
        </div>
        
    </form>
</body>
</html>
