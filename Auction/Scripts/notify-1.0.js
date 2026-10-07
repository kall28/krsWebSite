var notfyList = null;
var SelectNotfyId = [];

function ShowNotify() {
    CheckNotify();
    setInterval(function () { CheckNotify(); }, 150000);

}
//150000

function CheckNotify() {
    SelectNotfyId = [];
    var str = "";
    $("#ulNotification").val('');
    $.ajax({
        url: strUrl + 'Handlers/Common.ashx?mode=ntf',
        type: 'POST',  // or get
        contentType: 'application/json; charset =utf-8',
        data: { 'mode': 'ntf' },
        dataType: 'json',
        success: function (data) {
            try {
                notfyList = data;
                var i = 0;
                var RFPCnt = 0;
                var AUCCnt = 0;
                var POCnt = 0;
                var OTHCnt = 0;
                SelectNotfyId = [];
                $("#spnNotifyCount").html('');
                var redirect = strUrl + "Settings/OpenMail.aspx?Id=";
                $("#ulNotification").html(str);
                if (notfyList.length > 0) {
                    $("#spnNotifyCount").html(notfyList[0].NotifyCount);
                    for (var ntfy in notfyList) {
                       SelectNotfyId.push(notfyList[ntfy].Id);
                        switch (notfyList[ntfy].MessageType) {
                            case "RFP":
                                RFPCnt = RFPCnt + 1;
                                $('#liRFPNfty').addClass('nitifySel');
                                break;
                            case "AUC":
                                AUCCnt = AUCCnt + 1;
                                $('#liAUCNfty').addClass('nitifySel');
                                break;
                            case "PUR":
                                POCnt = POCnt + 1;
                                $('#liPONfty').addClass('nitifySel');
                                break;
                            case "OTH":
                                OTHCnt = OTHCnt + 1;
                                $('#liOTHNfty').addClass('nitifySel');
                                break;
                        }
                        str += " <li>" +
                               "<a href='" + redirect + notfyList[ntfy].Id + "'>" +
                                   "<div>" +
                                       "<i class='fa fa-comment fa-fw'></i>" + notfyList[ntfy].Subject +
                                    // " <span class='pull-right text-muted small'>4 minutes ago</span>"+
                                   "</div>" +
                               "</a>" +
                            "</li>" +
                           "<li class='divider'></li>";

                        setTimeout(function (ntfy) {
                            var subject = notfyList[ntfy].Subject;
                            if (subject.length > 20) { subject = subject.substring(0, 17) + "..."; }
                            subject = "<a href='" + strUrl + "Settings/Notifications.aspx' style='color:white'>" + subject + "</a>";
                        }.bind(this, ntfy), 1000 * i++);
                    }

                     str += " <li>" +
                            "<a  href='" + strUrl + "Settings/Notifications.aspx'>" +
                            "<div><i class='fa fa-exclamation-circle fa-fw'></i>Notifications</div></a>" +
                            "</li>";
                }
                else {
                    str = " <li>" +
                               "<a  href='#'>" +
                                "<div>No latest notifications found</div></a>" +
                           "</li>" +
                           "<li class='divider'></li>";
                    str += " <li>" +
                               "<a  href='" + strUrl + "Settings/Notifications.aspx'>" +
                                "<div><i class='fa fa-exclamation-circle fa-fw'></i>Notifications</div></a>" +
                           "</li>";
                }
                $("#ulNotification").html(str);

            }
            catch (e) {
            }
        },
        error: function (data) {
        }
    });
}


function UpdateNotify(msgId) {
    $.ajax({
        url: strUrl + 'Handlers/Common.ashx?mode=ntf&Id=' + msgId,
        type: 'POST',  // or get
        contentType: 'application/json; charset =utf-8',
        data: { 'mode': 'ntf', 'Id': msgId },
        dataType: 'json',
        success: function (data) { },
        error: function (data) { }
    });
}

function UpdateNotifyMsg() {
    var MsgId ="";
    for (var i = 0; i < SelectNotfyId.length; i++) {
        if (i == 0) {
            MsgId= SelectNotfyId[i].value;
        }
        else
        {
            MsgId +=","+ SelectNotfyId[i].value;
        }
    }
    $.ajax({
        url: strUrl + 'Handlers/Common.ashx?mode=ntf&Id=' + MsgId,
        type: 'POST',  // or get
        contentType: 'application/json; charset =utf-8',
        data: { 'mode': 'ntf', 'Id': MsgId },
        dataType: 'json',
        success: function (data) { },
        error: function (data) { }
    });
}
function HideNotify() {
    var select = [];
    // select = SelectNotfyId;
    select[0] = 0;
    var dataToPass = { arr: select };
    var jsonTxt = JSON.stringify(dataToPass);
   // if (select.length > 0) {
       // ShowProgress(true);
        $.ajax({
            type: 'POST',
            url: '/Settings/Notifications.aspx/HideNotify',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            data: jsonTxt,
            cache: false,
            success: function (msg) {
                if (msg.d > 0) {
                    //CheckNotify();
                    //SelectNotfyId = [];
                    // CheckNotify();
                    // ShowModalMsgBox("Error", "Error while deleting buyer.");
                    //$("#ContentPlaceHolderMaster_btnSearch").click();
                }
                else {
                    //ShowModalMsgBox("ReNePay", "Buyer deleted successfully");
                }
               // HideProgress();
                //ShowProgress(false);
                //location.href = 'Buyers.aspx'
                //ShowModalMsgBox("Error", "Error while deleting buyer.");
            },
            error: function (errmsg) {
            }
            //error: ShowError
        });
    //}
}


