<%@ page title="" language="C#" masterpagefile="~/SiteMaster.master" autoeventwireup="true" inherits="ReportCenter_DealReport, App_Web_dealreport.aspx.51bd485d" %>

<%@ MasterType VirtualPath="~/SiteMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        
        $(document).ready(function () {
            $('#tblList').DataTable({
                responsive: true
            });
        });


        function DealFullDetails(Id, entityType) {
            //ShowProgress(true);
            $("#divDet").html('')
            $.ajax({
                type: 'POST',
                url: strUrl + 'ReportCenter/DealReport.aspx/DealFullDetails',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id': '" + Id + "'}",
                cache: false,
                success: function (msg) {
                    //$("#list").hide();
                    $("#divDet").html(msg.d);
                    //$("#divFullDet").show();
                    //$("#searchField").hide();
                    ShowSuppPopUpBox("Search Community Deal Details", msg.d);
                    
                    //ShowProgress(false);
                },
                error: ShowError
            });
        }

        function ShowSuppPopUpBox(title, msg) {
            $("#SuppmsgHeader").html(title);
            $("#SuppmsgBody").html(msg);
            $("#divSuppMsgBox").modal();
        }

        function SendMail(Id, DealId) {
            //if (status = 0) {
            //ShowProgress(true);
            $.ajax({
                type: 'POST',
                url: strUrl + 'ReportCenter/DealReport.aspx/SendMail',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: "{'Id': '" + Id + "','DealId': '" + DealId + "'}",
                cache: false,
                success: function (msg) {
                    //ShowProgress(false);
                    //ShowMessageBox(msg.d);
                    ShowModalMsgBox("Error", msg.d);
                },
                error: ShowError
            });
            //}
            //else
            //    ShowMessageBox("Payment Already Done.");
        }

        function CustomerFullDetailsBack() {
            //ShowProgress(true);
            $("#searchField").show();
            //$("#divPRO").html('');
            $("#divFullDet").hide();
            //ShowProgress(false);
        }

        function SubmitValidation() {
            var msg = "";
            if ($("#ContentPlaceHolderMaster_txtEmail").val() == '') {
                if ($("#ContentPlaceHolderMaster_txtVendorName").val() == '') {
                    if ($("#ContentPlaceHolderMaster_txtBrand").val() == '') {
                        if ($("#ContentPlaceHolderMaster_txtProdName").val() == '') {
                            msg = "Please use filter for search."
                            //ShowMessageBox(msg);
                            ShowModalMsgBox("Error", msg);
                            return false;
                        }
                    }
                }
            }
            if (msg.length <= 0) {
                //ShowProgress(true);
                return true;
            }
        }


    </script>


                    <div class="clmn1">
                        <div class="row1">

                        <div class="whiteBox brdPink">
                            <div class="leftClmn">
                                <div class="formRow">
                                    <label>Vendor Email</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtEmail" runat="server" CssClass="imw100p" onkeypress="return RestrictText(event);" maxlength="50"></asp:TextBox>        
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Vendor Name</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtVendorName" CssClass="imw100p" runat="server" onkeypress="return RestrictText(event);" maxlength="50"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="rightClmn">
                                <div class="formRow">
                                    <label>Brand</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtBrand" CssClass="imw100p" runat="server" maxlength="50" onkeypress="return RestrictText(event);"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formRow">
                                    <label>Product Name</label>
                                    <div class="formRow1">
                                        <asp:TextBox ID="xtxtProdName" CssClass="imw100p" runat="server" maxlength="50" onkeypress="return RestrictText(event);"></asp:TextBox>
                                    </div>
                                </div>
                                
                                
                                
                                
                            </div>
                            <br class="cl" /><br/>
                                <div class="rightBtn">
                                    <asp:LinkButton ID="xbtnSearchSubmit" runat="server" CssClass="btnRed immrt10" OnClick="btnSearchSubmit_ServerClick"
                                        OnClientClick="javascript:if(!SubmitValidation()){return false;}">SEARCH</asp:LinkButton>
                                </div>
                            <br class="cl" />                            
                            
                        </div>

                        <div class="whiteBox">    <%--class="whiteBox brdPink">--%>                          
                            <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                        </div>
                          </div> 
                        </div> 
                    
    <asp:Literal ID="xlitScript" runat="server"></asp:Literal>

    <div class="modal fade" id="divSuppMsgBox" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                  <%--  data-dismiss="modal"--%>
                    
                    <button type="button" class='close'  data-dismiss="modal" >&times;</button>
                    <h4 class="modal-title" id="SuppmsgHeader"></h4>
                </div>
                <div class="modal-body">
                    <%--<p id="SuppmsgBody">--%>



                        <div class="insidepages" id="divFullDet" style="display:none;">     
                            <div class='fR mbot10'>
                                <button id='btnBack' runat='server' type='button' Class="btnRed immrt10" onclick='javascript:CustomerFullDetailsBack();'>Back</button>
                            </div>
                            <br class="cl">
                            </div>       
                            <div id="divDet" class='table' style ="overflow-y:auto; overflow-x:hidden;height:400px;" ></div>




                    <%--</p>--%>
                </div>
                <div class="modal-footer">
                     <%--<button id="btnSubmit" class="btnRed" type="button" onclick="javascript:Submit(true);">
                                Submit</button>--%>
                    <button type="button" class='btnRed immrt10'  data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>