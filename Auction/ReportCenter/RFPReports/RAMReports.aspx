<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="ReportCenter_RFPReports_RAMReports, App_Web_ramreports.aspx.dbeb476e" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../../Styles/jquery.ui.datepicker.css" rel="stylesheet" />
    <script src="../../Scripts/ReportCenter/RAMReports.js"></script>
    <style >
        .glyphicon-minus, .glyphicon-plus  {
         color:#333;} 

        .panel-default > .panel-heading {
    
    border-color: #fff;
    color: #e4a823; border-radius: 0;
background: #fff; /* Old browsers */

}

        #accordion h5 {
            font-size: 15px;
        }

        .panel-title {
            font-size: 18px;
            /*color : #fff;*/
        }       
    </style>
     
        <div class="clmn1">
            <div class="row1">

               <div class="whiteBox brdPink">
                            <div class="formRow">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            <div class="formRow">
                                                <div class="formRow1 rdpType">
                                                <input type="radio" id="rdRFPEndDate" runat="server" checked="true" onchange="javascript:return ShowDateSelection();" />                                                                                    
                                                <label id="lblRFPEndDate">EndDate</label>                                        
                                                </div>
                                                </div>
                                        </td> 
                                        <td>
                                            <div class="formRow">
                                            <div class="formRow1 rdpType">
                                            <input type="radio" id="rdRFPModifiedDate" runat="server" value="RFP ModifiedDate" onchange="javascript:return ShowDateSelection();" />                                            
                                            <label id="lblRFPModifiedDate">ModifiedDate</label>
                                            </div>
                                            </div>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                    <td>
                                        <label>From Date</label>  
                                        <div class="formRow">
                                        <div class="formRow1">
                                        <div id="xdivFromDate" class="bgGrey imw48p fl">                                            
                                             <div  class="iconCal">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <input type="text" id="xtxtFromDate" class="icnCal"  runat="server" maxlength="10" autocomplete="off" ondrop="return false;" onpaste="return false;" />
                                                 </div>
                                         </div>
                                         
                                        <div id="xdivModifiedFromDate" class="bgGrey imw48p">
                                            <div  class="iconCal">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                <input type="text" id="xtxtFromDate1" class="icnCal" runat="server" maxlength="10" autocomplete="off" ondrop="return false;" onpaste="return false;" />
                                             </div>
                                         </div>
                                        </div>
                                        </div>
                                    </td>
                                      
                                    <td>
                                      <label>To Date</label>
                                        <div class="formRow">
                                        <div class="formRow1">
                                          <div id="xdivToDate" class="bgGrey imw48p">
                                              <div  class="iconCal">
                                                 <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                        <input type="text" id="xtxtToDate" class="icnCal" runat="server" maxlength="10" autocomplete="off" ondrop="return false;" onpaste="return false;" />
                                                    </div>
                                             </div>
                                          <div id="xdivModifiedToDate" class="bgGrey imw48p">
                                              <div  class="iconCal">
                                                 <i class="fa fa-calendar" aria-hidden="true"></i>                                                        
                                                  <input type="text" id="xtxtToDate1" class="icnCal" runat="server" maxlength="10" autocomplete="off" ondrop="return false;" onpaste="return false;" />
                                               </div>
                                           </div>   
                                        </div>                                        
                                        </div>
                                    </td>                                    
                                    </tr>

                                    <tr>
                                     <td>
                                        <label>Search by State</label>
                                        <div class="formRow1">
                                            <div class="bgGrey">
                                                <div class="styled-select selOrganization">
                                                    <select id="xddlState" runat="server"></select>
                                                </div>
                                            </div>
                                        </div>
                                    </td>

                                     <td>
                                            <label>Search by RAM</label>
                                            <div class="formRow1">
                                                <div class="bgGrey">
                                                    <div class="styled-select selOrganization">
                                                        <select id="xddlRAMList" runat="server"></select>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                       
                                    </tr>
                                    <tr>
                                         <td>
                                            <br class="cl" />
                                            <button type="button" id="btnSearch" class="btnRed immrt10" data-toggle="collapse" data-target="#collapse1">Search</button>
                                        </td>
                                        <td><div style="display:none;">
                                            <label>State</label>
                                            <div class="formRow1">
                                                <div class="bgGrey">
                                                    <div class="styled-select selOrganization">
                                                        <select id="xddlCity" runat="server"></select>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
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
                    <div class="panel-group" id="accordion">                       

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">                                   
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"> <i id="licollapse1" class="glyphicon glyphicon-minus"></i>&nbsp;Withdrawn RFP:</a>
                                </h4>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse in">
                                <div class="panel-body"> 
                                    <ul class="rightBtn">
                                        <button type="button" id="btnDownload1"  class="btnBrdr"  data-toggle="collapse" onclick="javascript:DownloadReport(1);return false;">Download</button>                                        
                                    </ul>                                    
                                    <br class="cl" />                                                                                 
                                    <div id="divWithdrawnRFP" class='table'></div>                                                                                                            
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">                                    
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2"><i id="licollapse2" class="glyphicon glyphicon-plus"></i>&nbsp;RFP In Progress:</a>                                      
                                </h4>
                              
                            </div>
                            <div id="collapse2" class="panel-collapse collapse">
                                <div class="panel-body">                                  
                                    <div style="width:100%">
                                    <div id="divDownload2" class="rightBtn"  style="display:none" >
                                        <ul class="rightBtn">
                                        <button type="button" id="btnDownload2" class="btnBrdr" data-toggle="collapse" onclick="javascript:DownloadReport(2);return false;">
                                                        Download</button>
                                        </ul>
                                    </div> 
                                     <div id="divShowAll" class="rightBtn" style="width:10%">
                                         <ul class="rightBtn">
                                        <button type="button" id="btnShowAll" class="btnBrdr" onclick="return GetRFPInProgress(true);"> 
                                                        ShowAll</button>
                                             </ul>
                                    </div>  
                                     </div>
                                    <br class="cl" /> 
                                    <div id="divRFPInProgress" class='table'></div>                                    
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">                                    
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3"><i id="licollapse3" class="glyphicon glyphicon-plus"></i>&nbsp;RFP In Negotiation:</a>
                                </h4>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse">
                                <div class="panel-body reports">                                    
                                    <div id="divDownload3" class="rightBtn" style="display:none">  
                                        <ul class="rightBtn">
                                        <button type="button" id="btnDownload3" class="btnBrdr" data-toggle="collapse" onclick="javascript:DownloadReport(3);return false;" >Download</button>
                                        </ul>
                                    </div>                                     
                                    <br class="cl" />
                                    <div id="divRFPInNegotiation" class='table'></div>                                    
                                </div>
                            </div>
                        </div>

                    </div>                    
                </div>
            </div>
            <br />
            <br />
        </div>

        <script>
            function showcollapse1() {
                //ValidateSearch(1);
                $("#collapse1").show();
                return false;
            }
            $("#collapse1").on('show.bs.collapse', function () {
                GetWithdrawnRFP();
                setclass($("#licollapse1"), 'glyphicon-minus', 'glyphicon-plus');
            });

            $("#collapse1").on('hidden.bs.collapse', function () {
                setclass($("#licollapse1"), 'glyphicon-plus', 'glyphicon-minus');
            });

            $("#collapse2").on('show.bs.collapse', function () {
                GetRFPInProgress(false);
                setclass($("#licollapse2"), 'glyphicon-minus', 'glyphicon-plus');
            });
            $("#collapse2").on('hidden.bs.collapse', function () {
                setclass($("#licollapse2"), 'glyphicon-plus', 'glyphicon-minus');
            });

            $("#collapse3").on('show.bs.collapse', function () {
                GetRFPInNegotiation();
                setclass($("#licollapse3"), 'glyphicon-minus', 'glyphicon-plus');
            });

            $("#collapse3").on('hidden.bs.collapse', function () {
                setclass($("#licollapse3"), 'glyphicon-plus', 'glyphicon-minus');
            });

            $("#collapse4").on('show.bs.collapse', function () {
                ValidateSearch(4);
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


</asp:Content>

