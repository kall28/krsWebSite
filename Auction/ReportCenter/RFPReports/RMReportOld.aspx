<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="ReportCenter_RMReportOld, App_Web_rmreportold.aspx.dbeb476e" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <script src="../../Scripts/ReportCenter/rm.report-1.0.js"></script>
    <style>
        .glyphicon-minus, .glyphicon-plus
        {
            color: #333;
        }

        .panel-default > .panel-heading
        {
            border-color: #fff;
            color: #e4a823;
            border-radius: 0;
            background: #fff; /* Old browsers */
        }

        #accordion h5
        {
            font-size: 15px;
        }

        .panel-title
        {
            font-size: 18px;
            /*color: #fff;*/
        }
    </style>

    <asp:UpdatePanel ID="xupnlReport" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
                <div class="clmn1">
                    <div class="row1">
                        <div class="whiteBox brdPink">
                            <div class="formRow">
                                <table>
                                    <tr>
                                    <td>
                                        <label>Account Manager</label>
                                        <div class="formRow1">
                                            <div class="bgGrey">
                                                <div class="styled-select selOrganization">
                                                    <asp:DropDownList ID="xddlAcManager" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <label>From Date</label>                                        
                                        <div class="formRow1">
                                        <div class="bgGrey fl">                                            
                                            <div  class="iconCal">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtFromDate" runat="server" CssClass="selDate icnCal" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                         </div></div>
                                            </div>                                        
                                    </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Company</label>
                                            <div class="formRow1">
                                                <div class="bgGrey">
                                                    <div class="styled-select selOrganization">
                                                        <asp:DropDownList ID="xddlCompany" runat="server"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <label>To Date</label>                                            
                                                <div class="formRow1">
                                                      <div class="bgGrey imw100p fl">                                            
                                                         <div  class="iconCal">
                                                <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <asp:TextBox ID="xtxtToDate" runat="server" CssClass="selDate icnCal imw85p" maxlength="10" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
                                             </div>
                                                      </div>
                                                </div>                                                
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>State</label>
                                            <div class="formRow1">
                                                <div class="bgGrey">
                                                    <div class="styled-select selOrganization">
                                                        <asp:DropDownList ID="xddlState" runat="server"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <br class="cl" />
                                            <button type="button" id="btnSearch" class="btnRed immrt10" data-toggle="collapse" data-target="#collapse1">Search</button>
                                        </td>
                                    </tr>
                                </table>  
                                <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>
                            </div>
                            <br class="cl" />
                        </div>
                    </div>
                    <br class="cl" />
                    <div class="whiteBox brdPink">
                        <div class="row1 immrb20">
                            <%--<div class="container">--%>
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"><i id="licollapse1" class="glyphicon glyphicon-minus"></i>&nbsp;Withdrawn</a>
                                        </h4>
                                    </div>
                                    <div id="collapse1" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <ul class="rightBtn">
                                                <button runat="server" id="btnDownloadWithdrawn" type="button" style="visibility: hidden;" value="Download" class="btnBrdr"
                                                    onclick="javascript:DownloadReport();return false;">
                                                    Download</button>
                                            </ul>
                                            <br class="cl" />
                                            <div id="divWithdrawn">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse2"><i id="licollapse2" class="glyphicon glyphicon-plus"></i>&nbsp;Live Stage</a>
                                        </h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div style="width:100%">
                                            <ul class="rightBtn">
                                                <button runat="server" id="btnDownloadLive" type="button" style="visibility: hidden;" value="Download" class="btnBrdr"
                                                    onclick="javascript:DownloadReport();return false;">
                                                    Download</button>
                                            </ul>
                                             <ul class="rightBtn" style="width:10%">
                                                <button type="button" id="btnShowAll" class="btnBrdr" onclick="return ValidateSearch(2,true);"> 
                                                        ShowAll</button>
                                            </ul>
                                            </div>
                                            <br class="cl" />
                                            <div id="divLiveStage"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse3"><i id="licollapse3" class="glyphicon glyphicon-plus"></i>&nbsp;Pending Stage</a>
                                        </h4>
                                    </div>
                                    <div id="collapse3" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul class="rightBtn">
                                                <button runat="server" id="btnDownloadPending" type="button" style="visibility: hidden;" value="Download" class="btnBrdr"
                                                    onclick="javascript:DownloadReport();return false;">
                                                    Download</button>
                                            </ul>
                                            <br class="cl" />
                                            <div id="divPendingStage"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse4"><i id="licollapse4" class="glyphicon glyphicon-plus"></i>&nbsp;PO Stage</a>

                                        </h4>
                                    </div>
                                    <div id="collapse4" class="panel-collapse collapse">
                                        <div class="panel-body reports">
                                            <ul class="rightBtn">
                                                <button runat="server" id="btnDownloadPOStage" type="button" style="visibility: hidden;" value="Download" class="btnBrdr"
                                                    onclick="javascript:DownloadReport();return false;">
                                                    Download</button>
                                            </ul>
                                            <br class="cl" />
                                            <div id="divPOStage"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--</div>--%>
                        </div>
                    </div>
                    <br />
                    <br />
                </div>
                <script>
                    function showcollapse1() {
                        $("#collapse1").show();
                        return false;
                    }
                    $("#collapse1").on('show.bs.collapse', function () {
                        ValidateSearch(1,false);
                        setclass($("#licollapse1"), 'glyphicon-minus', 'glyphicon-plus');
                    });

                    $("#collapse1").on('hidden.bs.collapse', function () {
                        setclass($("#licollapse1"), 'glyphicon-plus', 'glyphicon-minus');
                    });

                    $("#collapse2").on('show.bs.collapse', function () {
                        ValidateSearch(2,false);
                        setclass($("#licollapse2"), 'glyphicon-minus', 'glyphicon-plus');
                    });
                    $("#collapse2").on('hidden.bs.collapse', function () {
                        setclass($("#licollapse2"), 'glyphicon-plus', 'glyphicon-minus');
                    });

                    $("#collapse3").on('show.bs.collapse', function () {
                        ValidateSearch(3,false);
                        setclass($("#licollapse3"), 'glyphicon-minus', 'glyphicon-plus');
                    });

                    $("#collapse3").on('hidden.bs.collapse', function () {
                        setclass($("#licollapse3"), 'glyphicon-plus', 'glyphicon-minus');
                    });

                    $("#collapse4").on('show.bs.collapse', function () {
                        ValidateSearch(4,false);
                        setclass($("#licollapse4"), 'glyphicon-minus', 'glyphicon-plus');
                    });

                    $("#collapse4").on('hidden.bs.collapse', function () {
                        setclass($("#licollapse4"), 'glyphicon-plus', 'glyphicon-minus');
                    });

                    function setclass(control, addclass, removeclass) {
                        $(control).addClass(addclass);
                        $(control).removeClass(removeclass);
                    }
                </script>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

