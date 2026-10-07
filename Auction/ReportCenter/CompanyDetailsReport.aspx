<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_ReportCenter_CompanyDetailsReport, App_Web_companydetailsreport.aspx.51bd485d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <script type="text/javascript">

        $(document).ready(function () {
            BindDatePicker();
            SetDataTablePaging("#tblList");
        });

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            BindDatePicker();
            SetDataTablePaging("#tblList");
        });

        function BindDatePicker() {
            $("#ContentPlaceHolder1_xtxtFromDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');
        }

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            $("#ContentPlaceHolder1_xtxtFromDate").datepicker({
                dateFormat: 'dd/mm/yy'
            });
            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                dateFormat: 'dd/mm/yy'
            });
            $("#ContentPlaceHolder1_xtxtlogedFromDate").datepicker({
                dateFormat: 'dd/mm/yy'
            });
            $("#ContentPlaceHolder1_xtxtlogedToDate").datepicker({
                dateFormat: 'dd/mm/yy'
            });
        });

        function validateSearch() {
            var msg = "";
            // $('#tblList').empty();
            if (!$("#ContentPlaceHolder1_xchkCategory").is(":checked")) {
                if (!$("#ContentPlaceHolder1_xchkCountry").is(":checked")) {
                    if (!$("#ContentPlaceHolder1_xchkState").is(":checked")) {
                        if (!$("#ContentPlaceHolder1_xchkCity").is(":checked")) {
                            if (!$("#ContentPlaceHolder1_xchkCreatedOn").is(":checked")) {
                                if (!$("#ContentPlaceHolder1_xchkPublish").is(":checked")) {
                                    if (!$("#ContentPlaceHolder1_xchkTNC").is(":checked")) {
                                        if (!$("#ContentPlaceHolder1_xChkIsDemo").is(":checked")) {
                                            ShowModalMsgBox("Renepay", "Please use filter for search.");
                                            //ShowModalMsgBox("Please use filter for search.");
                                            return false;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            if ($("#ContentPlaceHolder1_xchkCategory").is(":checked")) {
                if ($("#ContentPlaceHolder1_xddlCategory option:selected").index() <= 0) {
                    msg = "Please select category.";
                    ShowToolTip("#ContentPlaceHolder1_xddlCategory", msg);
                    return false;
                }
            }
            if ($("#ContentPlaceHolder1_xchkCountry").is(":checked")) {
                if ($("#ContentPlaceHolder1_xddlCountry option:selected").index() <= 0) {
                    msg = "Please select country.";
                    ShowToolTip("#ContentPlaceHolder1_xddlCountry", msg);
                    return false;
                }
            }
            if ($("#ContentPlaceHolder1_xchkState").is(":checked")) {
                if ($("#ContentPlaceHolder1_xtxtState").val() == '') {
                    msg = "Please enter state.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtState", msg);
                    return false;
                }
            }
            if ($("#ContentPlaceHolder1_xchkCity").is(":checked")) {
                if ($("#ContentPlaceHolder1_xtxtCity").val() == '') {
                    msg = "Please enter city.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtCity", msg);
                    return false;
                }
            }
            if ($("#ContentPlaceHolder1_xchkRegType").is(":checked")) {
                if ($("#ContentPlaceHolder1_xddlRegType option:selected").index() <= 0) {
                    msg = "Please select registration type.";
                    ShowToolTip("#ContentPlaceHolder1_xddlRegType", msg);
                    return false;
                }
            }
            if ($("#ContentPlaceHolder1_xchkCreatedOn").is(":checked")) {
                if (($("#ContentPlaceHolder1_xtxtFromDate").val() == '') && ($("#ContentPlaceHolder1_xtxtToDate").val() == '')) {
                    msg = "Please select From Date and To Date.";
                    ShowModalMsgBox("Error", msg);
                    return false;
                }
                else {
                    if ($("#ContentPlaceHolder1_xtxtFromDate").val() == '') {
                        msg = "Please select From Date.";
                        ShowToolTip("#ContentPlaceHolder1_xtxtFromDate", msg);
                        return false;
                    }
                    if ($("#ContentPlaceHolder1_xtxtToDate").val() == '') {
                        msg = "Please select To Date.";
                        ShowToolTip("#ContentPlaceHolder1_xtxtToDate", msg);
                        return false;
                    }
                }
            }
            if ($("#ContentPlaceHolder1_xchkLoginOn").is(":checked")) {
                if (($("#ContentPlaceHolder1_xtxtlogedFromDate").val() == '') && ($("#ContentPlaceHolder1_xtxtlogedToDate").val() == '')) {
                    msg = "Please select From Date and To Date.";
                    ShowModalMsgBox("Error", msg);
                    return false;
                }
                else {
                    if ($("#ContentPlaceHolder1_xtxtlogedFromDate").val() == '') {
                        msg = "Please select From Date.";
                        ShowToolTip("#ContentPlaceHolder1_xtxtlogedFromDate", msg);
                        return false;
                    }
                    if ($("#ContentPlaceHolder1_xtxtlogedToDate").val() == '') {
                        msg = "Please select To Date.";
                        ShowToolTip("#ContentPlaceHolder1_xtxtlogedToDate", msg);
                        return false;
                    }
                }
            }
            if (msg.length <= 0) {
                ShowProgress(true);
                return true;
            }

            return false;
        }

        function DownloadReport() {
            ShowProgress(true);
            $.ajax({
                url: strUrl + 'ReportCenter/CompanyDetailsReport.aspx/DownloadFile',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                //data: "{'rfpId':'" + rfpId + "'}",
                dataType: 'json',
                success: function (data) {
                    try {
                        var newData = data.d;
                        if (newData != "") {
                            window.open(strUrl + "Handlers/FileCreate.ashx?det=0/" + newData);
                        }
                        else {
                            ShowModalMsgBox("Error", "Invalid file parameter");
                        }
                        HideProgress();
                    }
                    catch (e) {
                        HideProgress();
                        ShowModalMsgBox("Error", e.Message);
                    }
                },
                error: function (data) {
                    HideProgress();
                    ShowModalMsgBox("Error", data);
                }
            });
            return true;
        }

        function ShowToolTip1(ctrl, content, position) {
            //$(ctrl).tooltip({ title: content, animation: true });
            $(ctrl).tooltip({ title: content, animation: true, placement: position });
            $(ctrl).tooltip("show");
            $(ctrl).blur(function () { $(ctrl).tooltip("destroy"); });
        }

    </script>


    <%--  <asp:UpdatePanel ID="xupnlSearch" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>
    <%--<div class="main purchaseOrder">--%>
    <div class="main supplier">        
        <div class="clmn1">
            <div class="row1">
                <div class="whiteBox supplier suppTable brdPink">
                    <div class="leftClmn">
                        <div  class="imw100p fl">
                            <asp:CheckBox ID="xchkCategory" runat="server" class="chkBx" />
                            <label style="vertical-align:middle">Category</label>                            
                            <div class="formRow1">
                            <div class="bgGrey imw100p fl">
                            <div class="styled-select fl selOrganization">  <%--class="styled-select fl selOrganization"--%>   <%--class="styled-select imw100p"--%>
                                <asp:DropDownList ID="xddlCategory" runat="server" ></asp:DropDownList>  <%--CssClass="imw100p"--%>
                            </div>
                            </div>
                            </div>                            
                        </div>                        
                        <br class="cl" />
                        <div class="immrt20">
                            <asp:CheckBox ID="xchkState" runat="server" class="chkBx" />
                            <label>State</label>
                            <asp:TextBox ID="xtxtState" runat="server" CssClass="selDate imw85p" MaxLength="30"></asp:TextBox>
                        </div>
                                
                    </div>

                    <div class="rightClmn righttbl">
                        <div class="imw48p fl">
                            <asp:CheckBox ID="xchkRegType" runat="server" class="chkBx" /> 
                            <label>Registration Type</label>                                 
                            <div class="formRow1">
                            <div class="bgGrey imw100p fl">
                            <div class="styled-select fl selOrganization">  
                                <asp:DropDownList ID="xddlRegType" runat="server">
                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                    <asp:ListItem Value="SLF">Self</asp:ListItem>
                                    <asp:ListItem Value="UPD">Uploaded</asp:ListItem>
                                    <asp:ListItem Value="PRM">Promotional</asp:ListItem>
                                    <asp:ListItem Value="UPD&PRM">Uploaded & Promotional</asp:ListItem>
                                </asp:DropDownList>
                            </div>                                 
                             </div>
                            </div>
                        </div>
                        <div class="imw48p fr">
                            <asp:CheckBox ID="xchkCountry" runat="server" class="chkBx" />
                            <label>Country</label>
                            <div class="formRow1">
                            <div class="bgGrey imw100p fl">
                            <div class="styled-select fl selOrganization">  
                            <%--<div  class="styled-select imw88p ">--%>
                                <asp:DropDownList ID="xddlCountry" runat="server">
                                </asp:DropDownList>
                            </div>
                            </div>
                            </div>
                        </div>
                        <br class="cl" />
                        <div class="immrt20">
                            <asp:CheckBox ID="xchkCity" runat="server" class="chkBx" />
                            <label>City</label>
                            <asp:TextBox ID="xtxtCity" runat="server" CssClass="selDate imw85p" MaxLength="30"></asp:TextBox>
                        </div>  

                    </div>
                    <br class="cl">
                    <br class="cl">

                    <div class="leftClmn">
                        <div class="imw48p fl">
                            <asp:CheckBox ID="xchkCreatedOn" runat="server" CssClass="fl chkBx" /><label class="fl">Registered On:</label>
                            <br class="cl">
                            <label class="fL">From date :</label>                            
                            <div class="formRow1">
                                        <div class="bgGrey fl">                                            
                                            <div  class="iconCal">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtFromDate" runat="server" CssClass="selDate icnCal" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                         </div></div>
                                            </div>
                        </div>
                        <div class="imw48p fr">
                            <label>&nbsp;</label>
                            <label>To Date :</label>                            
                            <div class="formRow1">
                                        <div class="bgGrey fl">                                            
                                            <div  class="iconCal">
                                                <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtToDate" runat="server" CssClass="selDate icnCal" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                             </div></div>
                                            </div>
                        </div>
                    </div>


                    <div class="rightClmn">
                        <div class="imw48p fl">
                            <asp:CheckBox ID="xchkLoginOn" runat="server" CssClass="chkBx" /><label>Log In On : </label>
                            <label class="fL" >From Date:</label>                            
                             <div class="formRow1">
                                        <div class="bgGrey fl">                                            
                                            <div  class="iconCal">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtlogedFromDate" runat="server" CssClass="selDate icnCal" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                         </div></div>
                                            </div>
                            
                        </div>
                        <div class="imw48p fr">
                            <label>&nbsp;</label>
                            <label class="fL">To Date:</label>                            
                             <div class="formRow1">
                                        <div class="bgGrey fl">                                            
                                            <div  class="iconCal">
                                                <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtlogedToDate" runat="server" CssClass="selDate icnCal" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                             </div></div>
                                            </div>
                        </div>
                    </div>





                <br />
                       
                              
                <br />
                    

                   <%-- <div class="leftClmn">  
                         <table style="width: 100%">
                             <tr>
                                 <td > <asp:CheckBox ID="xchkCreatedOn" runat="server" CssClass="fL" />
                                     <label class="fL" style="width: 50%">Registered On:</label>
                                 </td>                               

                             </tr>
                            <tr>
                                <td>
                             <div class="imw45p fl">
                                <label>From Date</label>
                                <asp:TextBox ID="xtxtFromDate" CssClass="icnCal" runat="server" autocomplete="off"></asp:TextBox>
                            </div>
                            <div class="imw45p immr0 fr">
                                <label>To Date</label>
                                <asp:TextBox ID="xtxtToDate" CssClass="icnCal" runat="server"></asp:TextBox>
                            </div>
                                    </td>
                                </tr>
                             </table>
                         </div>--%>

                <br />
                    

                    <%-- <div class="leftClmn"> 
                         <table ><tr><td> <asp:CheckBox ID="xchkLoginOn" runat="server" CssClass="fL" /><label class="fL">Log In On :</label></td></tr>
                             <tr>
                                 <td>
                            <div class="imw45p fl">
                                <label>From Date</label>
                                <asp:TextBox ID="xtxtlogedFromDate" CssClass="icnCal" runat="server" autocomplete="off"></asp:TextBox>
                            </div>
                            <div class="imw45p immr0 fr">
                                <label>To Date</label>
                                <asp:TextBox ID="xtxtlogedToDate" CssClass="icnCal" runat="server"></asp:TextBox>
                            </div>
                                     </td>
                                 </tr>
                             </table>
                         </div>--%>

                     <%--<br />--%>

                    <ul class="innerChkbx">
                        <li><asp:CheckBox ID="xchkPublish" runat="server" CssClass="fL chkBx" /><label>Published</label></li>
                        <li><asp:CheckBox ID="xchkLogedin" runat="server" CssClass="fL chkBx" /><label>Active</label></li>
                        <li><asp:CheckBox ID="xchkTNC" runat="server" CssClass="fL chkBx" /><label>TnC Accepted</label></li>
                        <li><asp:CheckBox ID="xChkIsDemo" runat="server" CssClass="fL chkBx" /><label>Demo</label></li>
                        <li><asp:CheckBox ID="xchkVerified" runat="server" CssClass="fL chkBx" /><label>Verified</label></li>                      
                    </ul>

                    
                    
                    <br />
                      <div class=" immrt20">                    
                            <asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnRed"  OnClientClick="javascript:if(!validateSearch()){return false;}" OnClick="btnSearch_click">Search</asp:LinkButton>
                            <asp:LinkButton ID="xlbtnAllReport" runat="server" Class="btnRed"  OnClick="btnAllReport_click">All</asp:LinkButton>
                            <asp:LinkButton ID="xlbtnDownload" runat="server" CssClass="btnRed" Visible="false" OnClientClick="javascript:DownloadReport();return false;">Export to Excel</asp:LinkButton>
                      </div>
                    <br /> <br />    
        </div>

     </div> 
            <br class="cl"/>             
            <asp:Literal ID="xlitList" runat="server"></asp:Literal>
             
            <br />
            <br />
        </div>

    </div>
    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
    <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
</asp:Content>

