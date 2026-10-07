/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsCntPressInitiated = false;
var CntPress = function () {
    var PageUrl = "Press.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            CntPress.search();

            if (!IsCntPressInitiated) {
                $("#btnAdd").click(function () { CntPress.add(); });
                $("#btnSubmit").click(function () { CntPress.save(); });
                $("#btnBack").click(function () { CntPress.back(); });
                $("#btnBackTop").click(function () { CntPress.back(); });
                IsCntPressInitiated = false;
            }
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#txtTitle").val('');
            CKEDITOR.instances.txtDescription.setData("");
            $("#txtShortDescription").val('');
            $("#txtPublishDate").val('');
            $("#txtFromDate").val('');
            $("#txtToDate").val('');
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, CntPress.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#txtTitle").val(data.Title);
            CKEDITOR.instances.txtDescription.setData(data.Description);
            $("#txtShortDescription").val(data.ShortDescription);
            $("#txtPublishDate").val(Setdate(data.PublishedDate));
            $("#txtFromDate").val(Setdate(data.FromDateTime));
            $("#txtToDate").val(Setdate(data.ToDateTime));
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            CntPress.clear();
            FormRequestHelper.addData(payload, CntPress.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", CntPress.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, CntPress.updateCallback);
        },
        updateCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'edit');
            CommonHelper.hideProgress();
        },
        validate: function () {
            if (!FormCtrlValidationHelper.validateTextCtrl($("#txtTitle"), "Title", "bottom")) { return false; }
            CommonHelper.disableControl($("#btnSubmit"));
            return true;
        },
        save: function () {
            if (CntPress.validate()) {
                var valDesc = CKEDITOR.instances.txtDescription.getData();
                var payload = FormRequestPayloadHelper.saveDataPayload();
                payload.url = PageUrl + "/Save";
                payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                    + "', 'title' : '" + $("#txtTitle").val()
                    + "', 'description' : '" + CommonHelper.parseString(valDesc)
                    + "', 'shortdescription' : '" + CommonHelper.parseString($("#txtShortDescription").val())
                    + "', 'publishdate' : '" + $("#txtPublishDate").val()
                    + "', 'fromdate' : '" + $("#txtFromDate").val()
                    + "', 'todate' : '" + $("#txtToDate").val()
                    + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                    + "' }";
                FormRequestHelper.saveData(payload, CntPress.saveCallback);
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), CntPress.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                CntPress.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), CntPress.save);
                CommonHelper.showMessagePanel($("#divMessage"), "fail", msg);
            }
        },
        back: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
        }
    };
}();

function Setdate(Jsondate) {
    var formattedDate = new Date(parseInt(Jsondate.substr(6)));
    var d = formattedDate.getDate();
    if (d < 10) {
        d = "0" + d;
    }
    var m = formattedDate.getMonth();
    m += 1;  // JavaScript months are 0-11
    if (m < 10) {
        m = "0" + m;
    }
    var y = formattedDate.getFullYear();
    return nowDate = d + "/" + m + "/" + y;
}