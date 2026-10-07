<%@ control language="C#" autoeventwireup="true" inherits="New_UserControls_wucSiteFooter, App_Web_wucsitefooter.ascx.6bb32623" %>

<footer class="modal-footer ftHdr" id="FootNav">
    <div id="myNavbar" class="collapse navbar-collapse footer">
        <ul id="fnav">
            <li class="cnecttus">About Us
   
                        <ul>
                            <li><a href="#" onclick="javascript: link_click('AU'); return false;">Profile</a></li>
                        </ul>
            </li>
            <li class="cnecttus">Help
   
                        <ul>
                            <li><a href="#" onclick="javascript:link_click('FAQs');return false;">FAQ</a></li>
                            <%--<li><a href="#" onclick="javascript:link_click('TFN');return false;">Toll free numbers</a></li>--%>
                            <%--<li><a href="#">Live chat</a></li>--%>
                        </ul>
            </li>
            <li class="cnecttus">Policies
   
                        <ul>
                            <li><a href="#" onclick="javascript:link_click('TNC');return false;">T&amp;C </a></li>
                            <li><a href="#" onclick="javascript:link_click('Policy');return false;">Privacy Policy</a></li>
                            <li><a href="#" onclick="javascript:link_click('Disclaimer');return false;">Disclaimer</a></li>
                        </ul>
            </li>
            <li class="cnecttus">Connect with us
   
                        <ul>
                            <li><a href="#" onclick="javascript:link_click('CU');return false;">Contact Us</a>
                            </li>
                        </ul>

            </li>
            <li class="pwrdLogo">
                <a href="#" target="_blank">
                    <img id="imgLogo" runat="server" src="~/images/ERFP_Logo.png" />
                </a>
            </li>
            <div class="clr"></div>
        </ul>
    </div>
    <a href="#" class="pwrdlogoMob" target="_blank">
        <img id="img1" runat="server" src="~/images/ERFP_Logo.png" />
    </a>
</footer>
