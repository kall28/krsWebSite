$(document).ready(function () {
    WebProductDetHelper.init();
});

var IsProductDetIntiated = false;
var WebProductDetHelper = function () {
    var PageUrl = "ProfileDetails.aspx";
    return {
        init: function () {
            if (!IsProductDetIntiated) {
               
                IsProductDetIntiated = true;
            }

        },
        
    };
}();