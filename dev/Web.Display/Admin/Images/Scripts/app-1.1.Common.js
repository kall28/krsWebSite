//----------------------------------------------------------------------------------
function trim(inputString) {
    // Removes leading and trailing spaces from the passed string. Also removes
    // consecutive spaces and replaces it with one space. If something besides
    // a string is passed in (null, custom object, etc.) then return the input.

    //if (typeof inputString != "string") { return inputString; }

    var retValue = inputString;
    var ch = retValue.substring(0, 1);
    while (ch == " ") { // Check for spaces at the beginning of the string
        retValue = retValue.substring(1, retValue.length);
        ch = retValue.substring(0, 1);
    }
    ch = retValue.substring(retValue.length - 1, retValue.length);
    while (ch == " ") { // Check for spaces at the end of the string
        retValue = retValue.substring(0, retValue.length - 1);
        ch = retValue.substring(retValue.length - 1, retValue.length);
    }
    while (retValue.indexOf("  ") != -1) { // Note that there are two spaces in the string - look for multiple spaces within the string
        retValue = retValue.substring(0, retValue.indexOf("  ")) + retValue.substring(retValue.indexOf("  ") + 1, retValue.length); // Again, there are two spaces in each of the strings
    }
    return retValue; // Return the trimmed string back to the user
}

//----------------------------------------------------------------------------------
function getKeyCode(e) {
    var keyCode;
    // IE
    if (window.event) { keyCode = e.keyCode; }
    // Netscape/Firefox/Opera
    else if (e.which) { keyCode = e.which; }    
    return keyCode;
}
//----------------------------------------------------------------------------------
function setAlpabets(e) // only Character  & Space allowed
{
    var keyCode = getKeyCode(e);
    //alert(keyCode);
    if ((keyCode < 65 || keyCode > 122) && (keyCode != 32) && (keyCode != 8)) {
        return false;
    }
    return true;
}
//----------------------------------------------------------------------------------
function NoSpace(e) {
    var keyCode = getKeyCode(e);
    if (keyCode == 32) {
        return false;
    }
}
//----------------------------------------------------------------------------------
function setNumber(e) {
    var keyCode = getKeyCode(e);
    if ((keyCode < 48 || keyCode > 57) && (keyCode != 8) && (keyCode != 9))
    { return false; }
}

//----------------------------------------------------------------------------------
function setAmtValue(e, ctrl) {
    var keyCode = getKeyCode(e);
    if (keyCode == 46 && isCharExist(ctrl.value, '.'))
    { return false; }
    if (keyCode < 46 || keyCode > 58)
    { return false; }
}
//----------------------------------------------------------------------------------
function isCharExist(val, chr) {
    var a = val;
    var b = 0;

    for (var i = 0; i < a.length; i++) {
        if (a.charAt(i) == chr) {
            b = 1;
            break;
        }
    }
    if (b == 0)
    { return false; }
    else
    { return true; }
}
//---------------------------------------------------------------------------------
function ValidateNumber(value) {
    var num = /[0-9\+]+/
    var numflag = value.match(num);
    if (numflag != value) {
        return false;
    }
    return true;
}
//---------------------------------------------------------------------------------
function IsBlank(ctrl, strPropName) {
   
    if (trim(ctrl.val()) == "") {
        alert("Please enter " + strPropName);
        ctrl.val("");
        if (ctrl.type != "textarea") {
            ctrl.focus();
        }
        return true;
    }
    return false;
}
//---------------------------------------------------------------------------------
function IsValidEmail(ctrl, checkBlank) {
    var mailid = trim(ctrl.val());
    if (checkBlank) {
        if (IsBlank(ctrl, 'Email'))
            return false;
    }
    if (!validateEmail(mailid)) {
        alert("Invalid Email Id.");
        ctrl.val("");
        if (ctrl.type != "textarea") {
            ctrl.focus();
        }
        return false;
    }
    return true;
}

function validateEmail(mailid) {
    var email = /[-a-zA-Z0-9_''\.]+@[-a-zA-Z0-9_'']+\.[-a-zA-Z0-9\.]+/
    var eflag = mailid.match(email)
    if (eflag != mailid) { return false }
    else if (mailid.indexOf(".") == 0) { return false }
    var LastIndex = mailid.lastIndexOf(".")
    var FirstIndex = mailid.indexOf(".")
    if ((LastIndex - FirstIndex) == 1 || (mailid.length - 1 == LastIndex)) { return false }
    if (mailid.indexOf("..") >= 1) { return false }
    if (mailid.indexOf("@-") >= 1) { return false }
    if (mailid.indexOf("-.") >= 1) { return false }
    return true
}
//---------------------------------------------------------------------------------
function IsValidMobileNo(ctrl, alertFlag) {
    var ctrlVal = trim(ctrl.val());
    if (!ValidateNumber(ctrlVal)) {
        errDesc = "Please enter valid Mobile No.";
        if (alertFlag) { alert(errDesc); }
        ctrl.select();
        return false;
    }
    if (ctrlVal.length != 10) {
        errDesc = "Please enter valid Mobile No.";
        if (alertFlag) { alert(errDesc); }
        ctrl.select();
        return false;
    }
    return true;
}
//---------------------------------------------------------------------------------

function IsValidCardNo(payType, ctlCardNo) {
    //alert(cardNo);
    var cardNo = trim(ctlCardNo.val());
    if (cardNo.length > 19) {
        alert("Invalid Card Number");
        ctlCardNo.focus();
        return false;
    }

    if (payType == "MC") {
        if (cardNo.length != 19) {
            if (cardNo.length != 16) {
                alert("Invalid Card Number");
                ctlCardNo.focus();
                return false;
            }
        }
    }

    if (payType == "CC" || payType == "DC") {
        if (cardNo.length != 16) {
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
        if (mul == 1)
            mul++;
        else
            mul--;
    }
    if ((sum % 10) == 0)
        return (true);
    else {
        alert("Invalid Card Number");
        ctlCardNo.focus();
        return false;
    }
}
//---------------------------------------------------------------------------------

function IsValidCardCVV(cardType, ctlCVV) {
    var cvvVal = trim(ctlCVV.val());
    var chkVal = "0123456789";
    var isValid = true;

    if (cvvVal == "") {
        alert('Please enter CVV code');
        ctlCVV.focus();
        return false;
    }

    for (i = 0; i < cvvVal.length; i++) {
        for (j = 0; j < chkVal.length; j++) {
            if (cvvVal.charAt(i) == chkVal.charAt(j))
                break;
            if (j == chkVal.length) {
                isValid = false;
                break;
            }
        }
    }

    if (!isValid) {
        alert('Please enter only digits in the CVV number.');
        ctlCVV.focus();
        return false;
    }
    switch (cardType) {
        case "American Express":
            if (cvvVal.length < 4 || cvvVal.length > 4) {
                alert('Please enter valid 4dbc code');
                ctlCVV.focus();
                return false;
            }
            break;
        default:
            if (cvvVal.length < 3 || cvvVal.length > 4) {
                alert('Please enter valid CVV code');
                ctlCVV.focus();
                return false;
            }
            break;
    }
    return true;
}
//-------------------------------------------------
function IsSelectOptionSelected(ctrl, strPropName, alertFlag) {
    if (ctrl.prop("selectedIndex") == 0) {
        if (alertFlag) {
            alert("Please select " + strPropName);
            ctrl.focus();
        }
        return false;
    }
    return true;
}
//-------------------------------------------------

  