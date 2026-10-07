$(document).ready(function () {
    WebBlogLstHelper.init();
});

var IsBlogsLstIntiated = false;
var WebBlogLstHelper = function () {
    var PageUrl = "Blogs.aspx";
    return {
        init: function () {
            if (!IsBlogsLstIntiated) {
                $('header').addClass("bg-dark");
                IsBlogsLstIntiated = true;
            }
        },
       
    };
}();