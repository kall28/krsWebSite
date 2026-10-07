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
//function setAlpabets(e) // only Character  & Space allowed
//{
//    var keyCode = getKeyCode(e);  
//    if ((keyCode < 65 || keyCode > 122) && (keyCode != 32) && (keyCode != 8) && (keyCode != 9)) {
//        return false;
//    }
//    return true;
//}
//---------------------------------------------------------------------------------KP
// Only Character & space allowed kp
function setAlpabets(e) {
    var k;
    document.all ? k = e.keyCode : k = e.which;
    return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k==32 );
}

//--------------------------------------------------------------------------------KP
function ValidateMobile(ctrl, alertFlag) {
    var ctrlVal = trim(ctrl.val());
    var numbers = /^[7-9][0-9]+$/;
    if (ctrlVal != "") {
        if (ctrlVal.length != 10) {
         var errDesc = "Please enter valid Mobile No.";
                alert(errDesc); 
            ctrl.select();
            return false;
        }
       if (ctrlVal.match(numbers)) {
           return true;
        }
        else {
            alert('Please Enter valid Mobile No.');
            ctrl.focus();
            return false;
                }
   } 
    else { alert('Please Enter ' + alertFlag); ctrl.focus(); return false; }
}
//---------------------------------------------------------------------------------KP
function IsAlphabet(Ctrl, ErrMsg) {
    var alphaExp = /^[a-zA-Z\s]+$/;
     
    var CtrlVal =trim( Ctrl.val());//alert(CtrlVal);
    if (CtrlVal != "") {
        if (CtrlVal.match(alphaExp)) {
            return true;
        } else {
            alert('Please Enter Char Only!!');
            Ctrl.focus();
            return false;
        }

    } else { alert('Please Enter '+ErrMsg); return false; }
}
//--------------------------------------------------------------------------------KP
function NubersOnly_onclick(Ctrl, ErrMsg) {
    var numbers = /^[0-9]+$/;
    var ctrlVal = trim(Ctrl.val());
    if (ctrlVal != "") {
        if (ctrlVal.match(numbers)) {
            return true;
        }
        else {
            alert('Please enter integer values Only!!');
            Ctrl.focus();
            return false;
        }
    } else { alert('Please Enter ' + ErrMsg); return false; }
}
//---------------------------------------------------------------------------------KP
function ValidateNonZeroNumbers(ctrl, alertFlag) {
    var ctrlVal = trim(ctrl.val());
    var numbers = /^[0-9]+$/;
    if (ctrlVal != "0") {
        if (ctrlVal.match(numbers)) {
            return true;
        }
        else {
            alert('Please enter valid '+alertFlag);
            ctrl.focus();
            return false;
        }
    }
    else { alert(alertFlag+' cannot be zero'); ctrl.focus(); return false; }
}
function PathValidation(ctrl, ErrMsg) {
    //alert('hi');
    var reg = /^(([a-zA-Z])|(\/{0}\w+)\$?)(\/(\w[\w].*))+(.aspx|.asp|.xml|.html|.htm)$/;
    // var path = document.getElementById('<%=xtxtWebPagePath.ClientID%>').value;
    if (reg.test(ctrl.value))
    { return true; }
    else {
        alert(ErrMsg);

        return false;
    }
}

//----------------------------------------------------------------------------------KP
function ExtensionValidation(ctrl, ErrMsg) {
    //alert('hi');
    var reg = /^(([a-zA-Z])|(\/{0}\w+)\$?)(\/(\w[\w].*))+(.aspx|.asp|.xml|.html|.htm)$/;
    // var path = document.getElementById('<%=xtxtWebPagePath.ClientID%>').value;
    if (reg.test(ctrl.value))
    { return true; }
    else {
        alert(ErrMsg);

        return false;
    }
}

//----------------------------------------------------------------------------------
function NoSpace(e) {
    var keyCode = getKeyCode(e);
    if (keyCode == 32 && (keyCode != 8) && (keyCode != 9)) {
        return false;
    }
}
//----------------------------------------------------------------------------------
function setNumber(e) {
    var keyCode = getKeyCode(e);
    if (keyCode == 46 && (keyCode != 8) && (keyCode != 9) && (keyCode < 37|| keyCode> 40))
     {return false;}
    if ((keyCode < 48 || keyCode > 57) && (keyCode < 96 || keyCode > 105) && (keyCode != 8) && (keyCode != 9))
    { return false; }
}

function AllowNonZeroIntegers(e) {
    var val = e.keyCode;
    var target = event.target ? event.target : event.srcElement;
    if (target.value.length == 0 && val == 48) {
        return false;
    }
    else if ((val >= 48 && val < 58) || ((val > 96 && val < 106)) || val == 46 || val == 8 || val == 127 || val == 189 || val == 109 || val == 45 || val == 9) {
        return true;
    }
    else {
        return false;
    }
}
//----------------------------------------------------------------------------------KP validate Decimal & Integer
function extractNumber(obj, decimalPlaces, allowNegative) {
    var temp = obj.value;

        // avoid changing things if already formatted correctly
        var reg0Str = '[1-9]+[0-9]*';
        if (decimalPlaces > 0) {
            reg0Str += '\\.?[0-9]{0,' + decimalPlaces + '}';
        } else if (decimalPlaces < 0) {
            reg0Str += '\\.?[0-9]*';
        }
        reg0Str = allowNegative ? '^-?' + reg0Str : '^' + reg0Str;
        reg0Str = reg0Str + '$';
        var reg0 = new RegExp(reg0Str);
        if (reg0.test(temp)) return true;

        // first replace all non numbers
        var reg1Str = '[^0-9' + (decimalPlaces != 0 ? '.' : '') + (allowNegative ? '-' : '') + ']';
        var reg1 = new RegExp(reg1Str, 'g');
        temp = temp.replace(reg1, '');

        if (allowNegative) {
            // replace extra negative
            var hasNegative = temp.length > 0 && temp.charAt(0) == '-';
            var reg2 = /-/g;
            temp = temp.replace(reg2, '');
            if (hasNegative) temp = '-' + temp;
        }

        if (decimalPlaces != 0) {
            var reg3 = /\./g;
            var reg3Array = reg3.exec(temp);
            if (reg3Array != null) {
                // keep only first occurrence of .
                //  and the number of places specified by decimalPlaces or the entire string if decimalPlaces < 0
                var reg3Right = temp.substring(reg3Array.index + reg3Array[0].length);
                reg3Right = reg3Right.replace(reg3, '');
                reg3Right = decimalPlaces > 0 ? reg3Right.substring(0, decimalPlaces) : reg3Right;
                temp = temp.substring(0, reg3Array.index) + '.' + reg3Right;
            }
        
    }
    obj.value = temp;
}
function blockNonNumbers(obj, e, allowDecimal, allowNegative) {
    var key;
    var isCtrl = false;
    var keychar;
    var reg;

    if (window.event) {
        key = e.keyCode;
        isCtrl = window.event.ctrlKey
    }
    else if (e.which) {
        key = e.which;
        isCtrl = e.ctrlKey;
    }

    if (isNaN(key)) return true;

    keychar = String.fromCharCode(key);

    // check for backspace or delete, or if Ctrl was pressed
    if (key == 8 || isCtrl) {
        return true;
    }

    reg = /\d/;
    var isFirstN = allowNegative ? keychar == '-' && obj.value.indexOf('-') == -1 : false;
    var isFirstD = allowDecimal ? keychar == '.' && obj.value.indexOf('.') == -1 : false;

    return isFirstN || isFirstD || reg.test(keychar);
}
//----------------------------------------------------------------------------------KP


//----------------------------------------------------------------------------------KP
//kp
function setNubersOnly(e) {
    var unicode = e.charCode ? e.charCode : e.keyCode
  //  alert(unicode);
    if ((unicode != 8) && (unicode != 9)) { //if the key isn't the backspace key (which we should allow) && (unicode != 37) && (unicode != 39)
        if (unicode < 48 || unicode > 57) {
            if (unicode < 96 || unicode > 105) {
                if (unicode = 46) {
                    return false; //disable key press
                }

                else
                { }
            } 
        }
    }
}


//--------------------------------------------------------------------------------test
function inputOnlyNumbers(evt) {
    var e = window.event || evt; // for trans-browser compatibility 
    var charCode = e.which || e.keyCode;
    alert(charCode);
    if ((charCode > 45 && charCode < 58) || charCode == 8) {
        return true;
    }
    return false;
}


    //----------------------------------------------------------------------------------
    function setAmtValue(e, ctrl) {

        var keyCode = getKeyCode(e);
        if (keyCode == 46 && (keyCode != 8) && (keyCode != 9) && isCharExist(ctrl.value, '.'))
        { return false; }
        if ((keyCode < 46 || keyCode > 58) && (keyCode < 96 || keyCode > 105) && (keyCode != 8) && (keyCode != 9) && (keyCode < 58 || keyCode > 64))
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
function IsValidMobileNo(ctrl, alertFlag){
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
    //alert(ctrl.prop("selectedIndex"));
    if (ctrl.prop("selectedIndex") == 0) {
        if (alertFlag) {
            alert("Please select " + strPropName);
            ctrl.focus();
        }
        return false;
    }
    return true;
   }
    function AutoComplete(matchFieldName, resultFieldName, lookupURL) {
        alert("Hi auto");
        $(matchFieldName).autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: lookupURL,
                    data: "{ 'prefix': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                $(resultFieldName).val(i.item.val);
            },
            minLength: 1
        });
}
//-------------------------------------------------

  