<%@ page language="C#" autoeventwireup="true" inherits="Campaign_test1_Default, App_Web_default.aspx.6f867068" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <style>
        #return-to-top {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background: rgb(0, 0, 0);
    background: rgba(0, 0, 0, 0.7);
    width: 50px;
    height: 50px;
    display: block;
    text-decoration: none;
    -webkit-border-radius: 35px;
    -moz-border-radius: 35px;
    border-radius: 35px;
    display: none;
    -webkit-transition: all 0.3s linear;
    -moz-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
#return-to-top i {
    color: #fff;
    margin: 0;
    position: relative;
    left: 16px;
    top: 13px;
    font-size: 19px;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
#return-to-top:hover {
    background: rgba(0, 0, 0, 0.9);
}
#return-to-top:hover i {
    color: #fff;
    top: 5px;
}


/* Extra Things */
body{background: #eee ;font-family: 'Open Sans', sans-serif;}h3{font-size: 30px; font-weight: 400;text-align: center;margin-top: 50px;}h3 i{color: #444;}
    </style>

    <script>
        // ===== Scroll to Top ==== 
        $(window).scroll(function () {
            if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
                $('#return-to-top').fadeIn(200);    // Fade in the arrow
            } else {
                $('#return-to-top').fadeOut(200);   // Else fade out the arrow
            }
        });
        $('#return-to-top').click(function () {      // When arrow is clicked
            $('body,html').animate({
                scrollTop: 0                       // Scroll to top of body
            }, 500);
        });
    </script>

    <form id="form1" runat="server">
        <!-- Return to Top -->
<a href="javascript:" id="return-to-top"><i class="icon-chevron-up"></i></a>


<!-- ICON NEEDS FONT AWESOME FOR CHEVRON UP ICON -->
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">


<!-- Test the scroll -->
<div style="height:2000px;">

  <h3>Scroll down</h3>
  <h3><i class="icon-arrow-down"></i>
  
</div>
    <div id="text">
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
        lkdsfkldsjfsdlkjfkjsdhgdkjh<br />
    </div>
    </form>

</body>
</html>
