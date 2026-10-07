$(window).on('load', function () {
    setTimeout(function () {
        $('.loader-wrapper').fadeOut('slow');
    }, 1000);
    $('.loader-wrapper').remove('slow');
});


$(function () {
    $("#head").load("head.html");
    $("#header").load("header.html");
    $("#footer").load("footer.html");
    $("#modal").load("modal.html");
});

