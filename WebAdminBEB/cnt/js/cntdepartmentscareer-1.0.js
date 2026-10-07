/*
 *  Document   : ecomProducts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in eCommerce Products page
 */
var IsCntDepartmentsCareerInitiated = false;
var CntDepartmentsCareer = function () {
    var PageUrl = "DepartmentsCareer.aspx";
    return {
        init: function () {
            CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
            
            if (!IsCntDepartmentsCareerInitiated) {
                $("#btnAdd").click(function () { CntDepartmentsCareer.add(); });
                $("#btnSubmit").click(function () { CntDepartmentsCareer.save(); });
                $("#btnBack").click(function () { CntDepartmentsCareer.back(); });
                $("#btnBackTop").click(function () { CntDepartmentsCareer.back(); });
                $("#fileUplThubnail").change(function () {
                    FileHelper.onImageSelect(this, 'imgThumbnailImage', 'hdnThumbnailFileName');
                });
                $("#imgThumbnailImage").click(function () {
                    $("#fileUplThubnail").click();
                    return false;
                });
                IsCntDepartmentsCareerInitiated = true;
            }
            CntDepartmentsCareer.search();
        },
        clear: function () {
            $("#hdnRef").val('');
            $("#hdnThumbnailFileName").val('');
            $('#imgThumbnailImage').attr('src', '');
            $("#txtTitle").val('');
            CKEDITOR.instances.txtDescription.setData("");
            $("#txtShortDescription").val('');
            $("#chkStatus").prop('checked', true);
            $("#divMessage").html("");
        },
        search: function () {
            var payload = FormRequestPayloadHelper.searchDataDefaultPayload(PageUrl, "");
            FormRequestHelper.searchData(payload, CntDepartmentsCareer.searchCallback);
        },
        searchCallback: function () {
            CommonDatatableHelper.init($("#tblList"));
        },
        show: function (data) {
            $("#hdnRef").val(data.Id);
            $("#txtTitle").val(data.Title);
            CKEDITOR.instances.txtDescription.setData(data.Description);
            $("#txtShortDescription").val(data.ShortDescription);
            $("#hdnThumbnailFileName").val(data.Thumbnail);
            $('#imgThumbnailImage').attr('src', data.ThumbnailFullPath);
            $("#chkStatus").prop('checked', data.Status === 1 ? true : false);
        },
        add: function () {
            var payload = FormRequestPayloadHelper.addDataPayloadDefault(PageUrl, "");
            CntDepartmentsCareer.clear();
            FormRequestHelper.addData(payload, CntDepartmentsCareer.addCallback);
        },
        addCallback: function () {
            CommonHelper.switchPanelView('#divDataList', '#divDataEdit', 'new');
            CommonHelper.hideProgress();
        },
        update: function (Id) {
            var payload = FormRequestPayloadHelper.updateDataPayloadDefault(PageUrl,
                "{'Id':'" + Id.toString() + "'}", CntDepartmentsCareer.show);
            CommonHelper.showProgress();
            FormRequestHelper.updateData(payload, CntDepartmentsCareer.updateCallback);
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
            if (CntDepartmentsCareer.validate()) {
                FileHelper.saveImageFile("fileUplThubnail", "cnt-deptthumb",
                    $("#hdnRef").val(), "hdnThumbnailFileName", CntDepartmentsCareer.saveThumbnailcallback);
            }
        },
        saveThumbnailcallback: function (errorCode) {
            switch (errorCode) {
                case 0:
                    var valDesc = CKEDITOR.instances.txtDescription.getData();
                    var payload = FormRequestPayloadHelper.saveDataPayload();
                    payload.url = PageUrl + "/Save";
                    payload.data = "{ 'refNo' : '" + $("#hdnRef").val()
                        + "', 'title' : '" + $("#txtTitle").val()
                        + "', 'description' : '" + CommonHelper.parseString(valDesc)
                        + "', 'shortdescription' : '" + CommonHelper.parseString($("#txtShortDescription").val())
                        + "', 'thumbnail' : '" + $("#hdnThumbnailFileName").val()
                        + "', 'status' : '" + ($('#chkStatus').is(":checked") ? 1 : 0)
                        + "' }";
                    FormRequestHelper.saveData(payload, CntDepartmentsCareer.saveCallback);
                    break;
                case -1:
                    CommonHelper.showModalMsgBox("Error", "Please select thumbnail.");
                    CommonHelper.enableControl($("#btnSubmit"), CntDepartmentsCareer.save);
                    break;
                default:
                    CommonHelper.showModalMsgBox("Error", "Error while uploading image.");
                    CommonHelper.enableControl($("#btnSubmit"), CntDepartmentsCareer.save);
                    break;
            }
        },
        saveCallback: function (success, msg) {
            CommonHelper.hideProgress();
            if (success) {
                CommonHelper.enableControl($("#btnSubmit"), CntDepartmentsCareer.save);
                CommonHelper.showModalMsgBox("Sucess", msg);
                CommonHelper.switchPanelView('#divDataEdit', '#divDataList', '');
                CntDepartmentsCareer.search();
            }
            else {
                CommonHelper.enableControl($("#btnSubmit"), CntDepartmentsCareer.save);
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