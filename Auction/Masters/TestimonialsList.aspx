<%@ page language="C#" autoeventwireup="true" masterpagefile="~/SiteMaster.master" inherits="New_Masters_TestimonialsList, App_Web_testimonialslist.aspx.6044e34" %>
<%@ MasterType virtualpath="~/SiteMaster.master" %>

<asp:content ID="Content1" ContentPlaceHolderID="head" runat="server"> </asp:content>
<asp:Content ID="Content2" ContentPlaceHolderID ="ContentPlaceHolder1" runat ="server">

<script>

    $(document).ready(function () {
        $('#tblList').DataTable({
            responsive: true
        });
    });   

    function UpdateTestimonial(id) {
        ShowProgress(true);
        $.ajax({
            type: 'POST',
            url: 'TestimonialsList.aspx/UpdateTestimonial',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            data: "{'Id':'" + id.toString() + "'}",
            cache: true,
            success: function (msg) {
                window.location.href = msg.d;
            },
            error: function (errmsg) {
            }
        });
    }

    function validateCheckBox() {
        if (!$("#ChkTest input[type='checkbox']").is(":checked")) {
            return false;
        }
        return true;
    }

    function GetCheckedProduct() {
        var checkedCat = [];
        var checkBoxList = $("#ChkTest input[type='checkbox']");
        if (validateCheckBox()) {
            for (var i = 0; i < checkBoxList.length; i++) {
                if (checkBoxList[i].checked) {
                    checkedCat.push(checkBoxList[i].value);
                }
            }
        }

        return checkedCat;
    }

    function deleteTestimonial() {
        var select = [];
        select = GetCheckedProduct();
        var dataToPass = { arr: select };
        var jsonTxt = JSON.stringify(dataToPass);
        if (select.length > 0) {
            var r = confirm("Do you want to delete selected terms and condition..");
            if (r == true) {
                ShowProgress(true);
                $.ajax({
                    type: 'POST',                                        
                    url:'TestimonialsList.aspx/deleteTestimonial',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    data: jsonTxt,
                    cache: false,
                    success: function (msg) {
                        if (msg.d <= 0) {
                            ShowModalMsgBox("Error", "Error while deleting testimonial.");
                        }
                        else { ShowModalMsgBox("Error", "Testimonial deleted successfully."); }
                        ShowProgress(false);
                        location.href = 'TestimonialsList.aspx'
                    },
                    error: function (errmsg) {
                    }
                });
            }
        }
        else { ShowModalMsgBox("Error", "Please select atleast one record"); }
    }
</script>

<div class="main purchaseOrder">    
        <div class="topBlk">
        <div class="mainHead f1">            
            <asp:Literal ID="xlitcap" runat="server" Text="Testimonials"></asp:Literal>
        </div>

         <ul class="rightBtn">
               <li>
                   <asp:LinkButton ID="xlbtnAdd" runat="server" CssClass="btnBlk"  OnClick="xlbtnAdd_Click" OnClientClick="javascript:ShowProgress(true)">Add</asp:LinkButton>
                </li>
             <li>
                 <asp:LinkButton ID="xlbtnDelete" runat="server" CssClass="btnBlk" OnClientClick="javascript:if(!(deleteTestimonial())){return false;}">Delete</asp:LinkButton>
                </li>
             <li>
                 <asp:LinkButton ID="xlbtnBack" runat="server" CssClass="btnBlk" OnClick="xlbtnBack_Click" >Back</asp:LinkButton>                            
                </li>
          </ul>
            <br class="cl" />
    </div>

    <div class="clmn1">
        <div class="row1">
            <asp:Literal ID="xlitMsg" runat="server"></asp:Literal>                                      
        </div>
        <br class="cl" />
        <div class="row1 immrb20">
            <div class="whiteBox">
            <div class="table mT10">
            <table border="0" cellspacing="0" cellpadding="0">
                        <asp:Literal ID="xlitList" runat="server"></asp:Literal>
                
              </table>
            </div>
            </div>
            
        </div>

    </div>    

</div>

</asp:Content>

