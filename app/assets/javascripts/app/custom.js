$(document).ready(function() {
  $(window).bind('scroll', function() {
    if ($(window).scrollTop() > 150) {
      $('.mu-navbar').addClass('mu-nav-show');

    } else {
      $('.mu-navbar').removeClass('mu-nav-show');
    }
  });
  var current_date = $('#mu-event-counter').data('countdown');
  $('#mu-event-counter').countdown(current_date).on('update.countdown', function(event) {
    var $this = $(this).html(event.strftime('' + '<span class="mu-event-counter-block"><span>%D</span> Days</span> ' + '<span class="mu-event-counter-block"><span>%H</span> Hours</span> ' + '<span class="mu-event-counter-block"><span>%M</span> Mins</span> ' + '<span class="mu-event-counter-block"><span>%S</span> Secs</span>'));
  });

  if ($(".mu-speakers-slider").length) {
    $('.mu-speakers-slider').slick({
      slidesToShow: 4,
      responsive: [
        {
          breakpoint: 768,
          settings: {
            arrows: true,
            slidesToShow: 3
          }
        }, {
          breakpoint: 480,
          settings: {
            arrows: true,
            slidesToShow: 1
          }
        }
      ]
    });

  }

  $('#accordion .panel-collapse').on('shown.bs.collapse', function() {
    $(this).prev().find(".fa").removeClass("fa-angle-up").addClass("fa-angle-down");
  });

  $('#accordion .panel-collapse').on('hidden.bs.collapse', function() {
    $(this).prev().find(".fa").removeClass("fa-angle-down").addClass("fa-angle-up");
  });

  $('.mu-menu').on('click', 'li a', function() {
    $('.mu-navbar .in').collapse('hide');
  });

});
