$(document).ready(function () {
    WebAuthorsHelper.init();
});

var IsAuthorsitiated = false;
var WebAuthorsHelper = function () {
    var PageUrl = "Authors.aspx";
    return {
        init: function () {
            if (!IsAuthorsitiated) {               
                $("#lnkBCHome").click(function () { WebNavHelper.redirectToPageMain("home"); });   
                IsAuthorsitiated = true;
            }           
        }        
    };
}();