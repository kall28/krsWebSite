// sidebar

$(document).ready(function () {
  $('.button-left').click(function () {
    $('.sidebar').toggleClass('fliph');
  });

});



//  slder


$(document).ready(function () {
  $('.owl-carousel').owlCarousel({
    loop: true,
    margin: 10,
    responsiveClass: true,
    responsive: {
      0: {
        items: 2,
        nav: true
      },
      600: {
        items: 3,
        nav: false
      },
      1000: {
        items: 5,
        nav: true,
        loop: true,
        margin: 5
      }
    }
  })
})


// spinner

$(document).on('click', '.number-spinner button', function () {
  var btn = $(this),
    oldValue = btn.closest('.number-spinner').find('input').val().trim(),
    newVal = 0;

  if (btn.attr('data-dir') == 'up') {
    newVal = parseInt(oldValue) + 1;
  } else {
    if (oldValue > 1) {
      newVal = parseInt(oldValue) - 1;
    } else {
      newVal = 1;
    }
  }
  btn.closest('.number-spinner').find('input').val(newVal);
});

// category filter
$(document).ready(function () {

  $(".filter-button").click(function () {
    var value = $(this).attr('data-filter');

    if (value == "Alist") {
      //$('.filter').removeClass('hidden');
      $('.active1').show('1000');
    }
    else {
      //            $('.filter[filter-item="'+value+'"]').removeClass('hidden');
      //            $(".filter").not('.filter[filter-item="'+value+'"]').addClass('hidden');
      $(".filter").not('.' + value).hide('3000');
      $('.filter').filter('.' + value).show('3000');

    }
  });

  // if ($(".filter-button").removeClass("active")) {
  //   $(this).removeClass("active");
  // }
  $(this).addClass("active");

});