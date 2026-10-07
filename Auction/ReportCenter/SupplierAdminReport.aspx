<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="New_ReportCenter_SupplierAdminReport, App_Web_supplieradminreport.aspx.51bd485d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    
    <script type="text/javascript">

        function DownloadReport() {
            ShowProgress(true);
            var WithCategories = false;
            var RepeatDet = false;

            if ($("#ContentPlaceHolder1_xrdbCategory").prop("checked")) {
                WithCategories = true;
            }
            if ($("#ContentPlaceHolder1_xrdbRepeatDet").prop("checked")) {
                RepeatDet = true;
            }

            $.ajax({
                url: strUrl + 'ReportCenter/SupplierAdminReport.aspx/DownloadFile',
                type: 'POST',  // or get
                contentType: 'application/json; charset =utf-8',
                data: "{'WithCategories':'" + WithCategories + "', 'RepeatDet' : '" + RepeatDet + "'}",
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

        $(document).ready(function () {
            BindDatePicker();
        });

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            BindDatePicker();
        });

        function BindDatePicker() {
            $("#ContentPlaceHolder1_xtxtFromDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');

            $("#ContentPlaceHolder1_xtxtToDate").datepicker({
                dateFormat: 'dd/mm/yy',
            }).attr('readonly', 'true');
        }

        function ShowToolTip(ctrl, content, position) {
            //$(ctrl).tooltip({ title: content, animation: true });
            $(ctrl).tooltip({ title: content, animation: true, placement: position });
            $(ctrl).tooltip("show");
            $(ctrl).blur(function () { $(ctrl).tooltip("destroy"); });
        }

        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });

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
                            if (!$("#ContentPlaceHolder1_xchkRegType").is(":checked")) {
                                if (!$("#ContentPlaceHolder1_xchkCreatedOn").is(":checked")) {
                                    if (!$("#ContentPlaceHolder1_xchkLoginOn").is(":checked")) {
                                        if (!$("#ContentPlaceHolder1_xchkPublish").is(":checked")) {
                                            if (!$("#ContentPlaceHolder1_xchkTNC").is(":checked")) {
                                                if (!$("#ContentPlaceHolder1_xChkIsDemo").is(":checked")) {
                                                    if (!$("#ContentPlaceHolder1_xchkVerified").is(":checked")) {
                                                        if (!$("#ContentPlaceHolder1_xChkActive").is(":checked")) {
                                                            if (!$("#ContentPlaceHolder1_xChkNonAvtive").is(":checked")) {
                                                                ShowModalMsgBox("Renepay", "Please use filter for search.");
                                                                return false;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            //if ($("#ContentPlaceHolder1_xchkCategory").is(":checked")) {
            //    if ($("#ContentPlaceHolder1_xddlCategory option:selected").index() <= 0) {
            //        msg = "Please select category.";
            //        ShowToolTip("#ContentPlaceHolder1_xddlCategory", msg, "top");
            //        return false;
            //    }
            //}
            if ($("#ContentPlaceHolder1_xchkCountry").is(":checked")) {
                if ($("#ContentPlaceHolder1_xddlCountry option:selected").index() <= 0) {
                    msg = "Please select country.";
                    ShowToolTip("#ContentPlaceHolder1_xddlCountry", msg, "top");
                    return false;
                }
            }
            if ($("#ContentPlaceHolder1_xchkState").is(":checked")) {
                if ($("#ContentPlaceHolder1_xtxtState").val() == '') {
                    msg = "Please enter state.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtState", msg, "top");
                    return false;
                }
            }
            if ($("#ContentPlaceHolder1_xchkCity").is(":checked")) {
                if ($("#ContentPlaceHolder1_xtxtCity").val() == '') {
                    msg = "Please enter city.";
                    ShowToolTip("#ContentPlaceHolder1_xtxtCity", msg, "top");
                    return false;
                }
            }
            if ($("#ContentPlaceHolder1_xchkRegType").is(":checked")) {
                if ($("#ContentPlaceHolder1_xddlRegType option:selected").index() <= 0) {
                    msg = "Please select registration type.";
                    ShowToolTip("#ContentPlaceHolder1_xddlRegType", msg, "top");
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
                        ShowToolTip("#ContentPlaceHolder1_xtxtFromDate", msg, "top");
                        return false;
                    }
                    if ($("#ContentPlaceHolder1_xtxtToDate").val() == '') {
                        msg = "Please select To Date.";
                        ShowToolTip("#ContentPlaceHolder1_xtxtToDate", msg, "top");
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
                        ShowToolTip("#ContentPlaceHolder1_xtxtlogedFromDate", msg, "top");
                        return false;
                    }
                    if ($("#ContentPlaceHolder1_xtxtlogedToDate").val() == '') {
                        msg = "Please select To Date.";
                        ShowToolTip("#ContentPlaceHolder1_xtxtlogedToDate", msg, "top");
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

        function OnChkRepeatChange() {
            if ($('#ContentPlaceHolder1_xrdbNotCategory').is(':checked')) {
                $("#ulRepeatDet").attr('style', 'display:none;');
            }
            else if ($('#ContentPlaceHolder1_xrdbCategory').is(':checked')) {
                $("#ulRepeatDet").attr('style', 'display:block;');
            }
        }

    </script>
    <%--<div class="main purchaseOrder">--%>
        <div class="main supplier">              
                <div class="clmn1">
                    <div class="row1">
                        <div class="whiteBox supplier suppTable brdPink">
                            <div class="leftClmn">
                                <div class="imw48p fl">
                                    <asp:CheckBox ID="xchkCategory" runat="server" class="chkBx" />
                                    <label>Category</label>
                                    <div class="formRow1">
                                    <div class="bgGrey imw100p fl">                            
                                    <div class="styled-select selOrganization">
                                        <asp:DropDownList ID="xddlCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                    </div>
                                    </div>
                                </div>
                                <div class="imw48p fr">
                                    <label>Sub Category</label>
                                    <div class="formRow1">
                                    <div class="bgGrey imw100p fl">                            
                                    <div class="styled-select selOrganization">
                                        <asp:DropDownList ID="xddlSubCategory" AutoPostBack="true" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                        </div>
                                    </div>
                                <br class="cl" />
                                <div class="immrt20">
                                    <asp:CheckBox ID="xchkState" runat="server" class="chkBx " />
                                    <label>State</label>
                                    <asp:TextBox ID="xtxtState" runat="server" CssClass="selDate imw62p" MaxLength="30"></asp:TextBox>
                                </div>
                            </div>
                            <div class="rightClmn righttbl">
                                <div class="imw48p fl">
                                    <asp:CheckBox ID="xchkRegType" runat="server" class="chkBx" />
                                    <label>Registration Type</label>
                                    <div class="formRow1">
                                    <div class="bgGrey imw100p fl">                            
                                        <div class="styled-select selOrganization ">
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
                                        <div class="styled-select selOrganization ">
                                            <asp:DropDownList ID="xddlCountry" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                     </div>
                                     </div>
                                </div>
                                <br class="cl" />
                                <div class="immrt20">
                                    <asp:CheckBox ID="xchkCity" runat="server"  class="chkBx" />
                                    <label>City</label>
                                    <asp:TextBox ID="xtxtCity" runat="server" CssClass="selDate imw62p" MaxLength="30"></asp:TextBox>
                                </div>
                                    
                            </div>
                            <br class="cl" />
                            <br class="cl" />

                            <div class="leftClmn">
                                <div class="imw48p fl">
                                    <asp:CheckBox ID="xchkCreatedOn" runat="server" CssClass="fl chkBx" /><label class="fl">Registered On</label>
                                    <br class="cl" />
                                    <label>From Date</label>
                                    <%--<asp:TextBox ID="xtxtFromDate" runat="server" MaxLength="10" CssClass="selDate icnCal imw62p"></asp:TextBox>--%>
                                     <div class="formRow1">
                                        <div class="bgGrey fl">                                            
                                            <div  class="iconCal">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtFromDate" runat="server" CssClass="selDate icnCal" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                         </div></div>
                                            </div>
                                </div>
                                <div class="imw48p fr">
                                    <label>&nbsp</label>
                                    <label>To Date</label>                                    
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
                                    <asp:CheckBox ID="xchkLoginOn" runat="server" CssClass="fl chkBx" /><label class="fl">Log In On</label>
                                    <br class="cl" />
                                    <label>From Date</label>                                    
                                     <div class="formRow1">
                                        <div class="bgGrey fl">                                            
                                            <div  class="iconCal">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtlogedFromDate" runat="server" CssClass="selDate icnCal" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                         </div></div>
                                            </div>
                                </div>
                                <div class="imw48p fr">
                                    <label>&nbsp</label>
                                    <label>To Date</label>                                    
                                    <div class="formRow1">
                                        <div class="bgGrey fl">                                            
                                            <div  class="iconCal">
                                                <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtlogedToDate" runat="server" CssClass="selDate icnCal" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                             </div></div>
                                            </div>
                                </div>
                            </div>
                            <br class="cl" />
                            
                            <ul class="innerChkbx">
                                <li><asp:CheckBox ID="xchkPublish" runat="server" CssClass="fl chkBx" /><label>Published</label></li>
                                <li><asp:CheckBox ID="xChkActive" runat="server" CssClass="fl chkBx" /><label>Active</label></li>
                                <li><asp:CheckBox ID="xChkNonAvtive" runat="server" CssClass="fl chkBx" /><label>Not Active</label></li>
                                <li><asp:CheckBox ID="xchkTNC" runat="server" CssClass="fl chkBx" /><label>TnC Accepted</label></li>
                                <li><asp:CheckBox ID="xChkIsDemo" runat="server" CssClass="fl chkBx" /><label>Demo</label></li>
                                <li><asp:CheckBox ID="xchkVerified" runat="server" CssClass="fl chkBx" /><label>Verified</label></li>
                            </ul>
                            
                            <br class="cl" />

                            <div class="leftClmn fl" style = "width:38%;">
                                <ul class="moreBtn">
                                <li><asp:RadioButton ID="xrdbNotCategory" runat="server" CssClass="fl" onchange="OnChkRepeatChange();" Visible="false" GroupName="export" Checked="true" /></li>
                                <li><label id="lblNotCategory" runat="server" visible="false">WithOut Category</label></li>
                                <li><asp:RadioButton ID="xrdbCategory" runat="server" CssClass="fl" onchange="OnChkRepeatChange();" Visible="false" GroupName="export" /></li>
                                <li><label id="lblCategory" runat="server" visible="false">With Category</label></li>
                                </ul>
                                <ul id = "ulRepeatDet" style = "display:none;" class="moreBtn">
                                <li><asp:RadioButton ID="xrdbRepeatDet" runat="server" CssClass="fl" GroupName="Repeat" Checked="true" /></li>
                                <li><label id="lblRepeatDet" runat="server" >Repeat Detail</label></li>
                                <li><asp:RadioButton ID="xrdbNotRepeatDet" runat="server" CssClass="fl" GroupName="Repeat" /></li>
                                <li><label id="lblNotRepeatDet" runat="server" >Not Repeat Detail</label></li>
                                </ul>
                            </div>

                            <div class="rightClmn fr" style = "width:60%;">
                                <ul class="moreBtn">      
                                <li><asp:LinkButton ID="xlbtnDownload" runat="server" CssClass="btnRed" Visible="false"
                                    OnClientClick="javascript:DownloadReport();return false;">Export to Excel</asp:LinkButton></li>                            
                                <li><asp:LinkButton ID="xlbtnAllReport" runat="server" CssClass="btnRed"
                                    OnClick="btnAllReport_click">All</asp:LinkButton></li>
                                <li><asp:LinkButton ID="xlbtnSearch" runat="server" CssClass="btnRed" OnClientClick="javascript:if(!validateSearch()){return false;}"
                                    OnClick="btnSearch_click">Search</asp:LinkButton></li>
                            </ul>
                            </div>

                            <br class="cl" />
                        </div>
                        <br class="cl" />
                        <asp:Literal ID="xlitList" runat="server"></asp:Literal>

            </div>
        </div>
        <asp:Literal ID="xlitScript" runat="server"></asp:Literal>
    </div>

</asp:Content>

