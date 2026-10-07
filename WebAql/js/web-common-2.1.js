var strUrl = document.URL;
var siteURL = "http://localhost:55327/";

function link_click(mode) {
    var linkURL = siteURL;
    switch (mode) {
        case "I": linkURL = linkURL + "Index.aspx"; break;
        case "T": linkURL = linkURL + "Tickets.aspx"; break;
        case "SC": linkURL = linkURL + "Schedule.aspx"; break;
        case "M": linkURL = linkURL + "Movies.aspx"; break;
        case "PAY": linkURL = linkURL + "PaymentPage.aspx"; break;
        case "C": linkURL = linkURL + "Cinema/Cinemas.aspx"; break;
        case "CG": linkURL = linkURL + "Cinema/VIP.aspx"; break;
        case "JR": linkURL = linkURL + "Cinema/JuniorSchedule.aspx"; break;
        case "JM": linkURL = linkURL + "Cinema/Jomo.aspx"; break;
        case "LX": linkURL = linkURL + "Cinema/Luxe.aspx"; break;
        case "JRENH": linkURL = linkURL + "Cinema/Junior.aspx"; break;
        case "UXD": linkURL = linkURL + "Cinema/MacroXE.aspx"; break;
        case "MCO": linkURL = linkURL + "MaxxCard.aspx"; break;
        case "P": linkURL = linkURL + "EventPromotion.aspx"; break;
        case "N": linkURL = linkURL + "News.aspx"; break;
        case "FNB": linkURL = linkURL + "FnBIndex.aspx"; break;
        case "AU": linkURL = linkURL + "InnerPages/AboutUs.aspx"; break;
        case "PR": linkURL = linkURL + "InnerPages/Press.aspx"; break;
        case "FAQ": linkURL = linkURL + "InnerPages/FAQs.aspx"; break;
        case "TS": linkURL = linkURL + "InnerPages/Terms.aspx"; break;
        case "PP": linkURL = linkURL + "InnerPages/PrivacyPolicy.aspx"; break;
        case "CU": linkURL = linkURL + "InnerPages/ContactUs.aspx"; break;
        case "AD": linkURL = linkURL + "InnerPages/Advertise.aspx"; break;
        case "CS": linkURL = linkURL + "InnerPages/Corporate.aspx"; break;
        case "CSOON": linkURL = linkURL + "CommingSoon.aspx"; break;
        case "CT": linkURL = linkURL + "ConsiderThis.aspx"; break;
        case "MC": linkURL += "Loyalty/MaxxCard.aspx"; break;
        case "PFL": linkURL += "Loyalty/Profile.aspx"; break;
        case "CHP": linkURL += "Loyalty/ChangePassword.aspx"; break;
        case "AA": linkURL += "Loyalty/ActivateCard.aspx"; break;
        case "UP": linkURL += "Loyalty/PersonalInfo.aspx"; break;
        case "SU": linkURL += "Loyalty/Signup.aspx"; break;
        case "FP": linkURL += "Loyalty/ForgotPassword.aspx"; break;
        case "MCB": linkURL += "Loyalty/MaxxCardBenifits.aspx"; break;
        case "MCBS": linkURL += "Loyalty/MaxxCardStarClassBenifits.aspx"; break;
        case "MCFAQ": linkURL += "Loyalty/FAQs.aspx"; break;
        case "MCTC": linkURL += "Loyalty/Tnc.aspx"; break;
        case "LO": linkURL += "Loyalty/Logout.aspx"; break;
        case "MCA": linkURL += "Loyalty/AboutMaxxCard.aspx"; break;
        case "REG": linkURL += "Loyalty/Register.aspx"; break;
        case "CAR": linkURL += "Career/Home.aspx"; break;
    }
    window.location = linkURL;
}

function menu_click(index) {
    $("#col" + index).toggle("slow");
}
function submenu_click(index) {
    $("#subcol" + index).toggle("slow");
}
function HideDiv(Div, Index) {
    $("#" + Div).find('a').removeClass('accHigh');
    $.each($("#" + Div), function (i, left) {
        $('div', left).each(function (i, subDiv) {
            if ("col" + Index !== subDiv.id) {
                $("#" + subDiv.id).hide();
            }
        });
    });
}
function HideDivSub(Div, Index) {
    $("#" + Div).find('a').removeClass('accHigh');
    $.each($("#" + Div), function (i, left) {
        $('ul', left).each(function (i, subDiv) {
            if ("subcol" + Index !== subDiv.id) {
                $("#" + subDiv.id).hide();
            }
        });
    });
}
function HideDivSubDiv(Div, Index) {
    $("#" + Div).find('a').removeClass('accHigh');
    $.each($("#" + Div), function (i, left) {
        $('div', left).each(function (i, subDiv) {
            if ("subcol" + Index !== subDiv.id) {
                $("#" + subDiv.id).hide();
            }
        });
    });
}


function trim(s) {
    var l = 0; var r = s.length - 1;
    while (l < s.length && s[l] === ' ') { l++; }
    while (r > l && s[r] === ' ') { r -= 1; }
    return s.substring(l, r + 1);
}

function IsValidMobileNoNew(ctrl) {

    var ctrlVal = trim(ctrl.val());

    if (!ValidateNumber(ctrlVal)) {
        alert("Invalid Mobile");
        ctrl.val("");
        if (ctrl.type !== "textarea") {
            ctrl.focus();
        }
        return false;
    }

    return true;
}

function ValidateNumber(value) {
    var num = /[0-9\+]+/;
    var numflag = value.match(num);
    if (numflag != value) {
        return false;
    }
    return true;
}

function IsValidEmailNew(ctrl) {
    var mailid = trim(ctrl.val());
    if (!validateEmail(mailid)) {
        alert("Invalid Email Id.");
        ctrl.val("");
        if (ctrl.type !== "textarea") {
            ctrl.focus();
        }
        return false;
    }
    return true;
}

function IsValidEmailNew(ctrl, showAlert) {
    var mailid = trim(ctrl.val());
    if (!validateEmail(mailid)) {
        if (showAlert) { alert("Invalid Email Id."); }
        ctrl.val("");
        if (ctrl.type !== "textarea") {
            ctrl.focus();
        }
        return false;
    }
    return true;
}

function validateEmail(mailid) {
    var email = /[-a-zA-Z0-9_''\.]+@[-a-zA-Z0-9_'']+\.[-a-zA-Z0-9\.]+/;
    var eflag = mailid.match(email);
    if (eflag != mailid) { return false; }
    else if (mailid.indexOf(".") === 0) { return false; }
    var LastIndex = mailid.lastIndexOf(".");
    var FirstIndex = mailid.indexOf(".");
    if ((LastIndex - FirstIndex) === 1 || (mailid.length - 1 === LastIndex)) { return false; }
    if (mailid.indexOf("..") >= 1) { return false; }
    if (mailid.indexOf("@-") >= 1) { return false; }
    if (mailid.indexOf("-.") >= 1) { return false; }
    return true;
}

function IsValidCardNoNew(payType, ctlCardNo) {
    //alert(cardNo);
    var cardNo = trim(ctlCardNo.val());
    if (cardNo.length > 19) {
        alert("Invalid Card Number");
        ctlCardNo.focus();
        return false;
    }

    if (payType === "MC") {
        if (cardNo.length !== 19) {
            if (cardNo.length !== 16) {
                alert("Invalid Card Number");
                ctlCardNo.focus();
                return false;
            }
        }
    }

    if (payType === "CC" || payType === "DC") {
        if (cardNo.length !== 16) {
            alert("Invalid Card Number");
            ctlCardNo.focus();
            return false;
        }
    }

    //    if (payType == "DB") {
    //        if (cardNo.indexOf("4") != 0) {
    //            alert("Invalid Card Number!");
    //            ctlCardNo.focus();
    //            return false;
    //        }
    //    }
    sum = 0;
    mul = 1;
    l = cardNo.length;
    for (i = 0; i < l; i++) {
        digit = cardNo.substring(l - i - 1, l - i);
        tproduct = parseInt(digit, 10) * mul;
        if (tproduct >= 10)
            sum += (tproduct % 10) + 1;
        else
            sum += tproduct;
        if (mul === 1)
            mul++;
        else
            mul--;
    }
    if ((sum % 10) === 0)
        return (true);
    else {
        alert("Invalid Card Number");
        ctlCardNo.focus();
        return false;
    }
}

function IsValidCardCVVNew(cardType, ctlCVV) {
    var cvvVal = trim(ctlCVV.val());
    var chkVal = "0123456789";
    var isValid = true;

    if (cvvVal === "") {
        alert("Enter CVV code");
        ctlCVV.focus();
        return false;
    }

    for (i = 0; i < cvvVal.length; i++) {
        for (j = 0; j < chkVal.length; j++) {
            if (cvvVal.charAt(i) === chkVal.charAt(j))
                break;
            if (j === chkVal.length) {
                isValid = false;
                break;
            }
        }
    }

    if (!isValid) {
        //alert('Please enter only digits in the CVV number.');
        alert("Invalid CVV code");
        ctlCVV.focus();
        return false;
    }
    switch (cardType) {
        case "American Express":
            if (cvvVal.length < 4 || cvvVal.length > 4) {
                //alert('Please enter valid 4dbc code');
                alert("Invalid CVV code");
                ctlCVV.focus();
                return false;
            }
            break;
        default:
            if (cvvVal.length < 3 || cvvVal.length > 4) {
                //alert('Please enter valid CVV code');
                alert("Invalid CVV code");
                ctlCVV.focus();
                return false;
            }
            break;
    }
    return true;
}


function addCommas(nStr) {
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}

function OpenTnCPopUp(url) {
    window.open(url, '_blank', 'location=yes,scrollbars=yes,status=yes');
    return false;
}

function ChangeClass() {
    $("#ancHome").removeClass("select");
    $("#ancTickets").removeClass("select");
    $("#ancMovies").removeClass("select");
    $("#ancCinemas").removeClass("select");
    $("#ancSchedule").removeClass("select");
    //    $("#ancCinemaxxGold").removeClass("select");
    //    $("#ancUltraXD").removeClass("select");
    $("#ancMaxxCard").removeClass("select");
    $("#ancPromotion").removeClass("select");
    $("#ancNews").removeClass("select");
    $("#ancNews").removeClass("select");

    var siteMenuURL = document.URL;
    if (siteMenuURL.indexOf("Index.aspx") > 0 ||
        siteMenuURL === 'http://www.cinemaxxtheater.com/' ||
        siteMenuURL === 'http://cinemaxxtheater.com/')
        $("#ancHome").addClass("select");
    if (siteMenuURL.indexOf("Tickets.aspx") > 0)
        $("#ancTickets").addClass("select");
    if (siteMenuURL.indexOf("Schedule.aspx") > 0)
        $("#ancSchedule").addClass("select");
    if (siteMenuURL.indexOf("Movies.aspx") > 0)
        $("#ancMovies").addClass("select");
    if (siteMenuURL.indexOf("Cinemas.aspx") > 0)
        $("#ancCinemas").addClass("select");
    if (siteMenuURL.indexOf("CinemaxxGold.aspx") > 0)
        $("#ancCinemaxxGold").addClass("select");
    if (siteMenuURL.indexOf("UltraXD.aspx") > 0)
        $("#ancUltraXD").addClass("select");
    if (siteMenuURL.indexOf("MaxxCard.aspx") > 0)
        $("#ancMaxxCard").addClass("select");
    if (siteMenuURL.indexOf("Promotions.aspx") > 0 || siteMenuURL.indexOf("PromotionDetails.aspx") > 0)
        $("#ancPromotion").addClass("select");
    if (siteMenuURL.indexOf("News.aspx") > 0 || siteMenuURL.indexOf("NewsDetails.aspx") > 0)
        $("#ancNews").addClass("select");
}

function ShowToolTip(ctrl, content) {
    $(ctrl).tooltip({
        items: ctrl,
        content: function () {
            return content;
        },
        position: {
            my: "center bottom-10",
            at: "center top",
            using: function (position, feedback) {
                $(this).css(position);
                $("<div>")
                    .addClass("arrow")
                    .addClass(feedback.vertical)
                    .addClass(feedback.horizontal)
                    .appendTo(this);
            }
        },
        close: function (event, ui) {
            var me = this;
            ui.tooltip.hover(
                function () {
                    $(this).stop(true).fadeTo(400, 1);
                },
                function () {
                    $(this).fadeOut("400", function () {
                        $(this).remove();
                    });
                }
            );
            ui.tooltip.on("remove", function () {
                $(me).tooltip("destroy");
            });
        },
    }
    );
    $(ctrl).tooltip("open");
    $(ctrl).focus();
}


function checkStrength(password) {
    //if the password length is less than 6, return message.
    if (password.length < 8) {
        return 'Password length is less than 8 characters.'
    }

    //length is ok, lets continue.

    //if password contains both lower and uppercase characters, increase strength value
    if (!password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) {
        return 'Password must contain lower and uppercase characters.';
    }

    //if it has numbers and characters, increase strength value
    if (!(password.match(/([a-zA-Z])/) && password.match(/([0-9])/))) {
        return 'Password must contain numbers and characters.';
    }

    return "0";
}
