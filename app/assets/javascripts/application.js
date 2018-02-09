//= require jquery/dist/jquery
//= require jquery-ujs/src/rails
//= require jquery3
//= require jquery-countdown/dist/jquery.countdown
//= require popper
//= require bootstrap/dist/js/bootstrap
//= require cleave.js/dist/cleave
//= require cleave.js/dist/addons/cleave-phone.cr.js
//= require_tree .
//= require turbolinks

$(document).on('turbolinks:load', function() {
  loadSpeakers();
  loadCountdown();
  validadateSubscriberInputs();
});

function loadSpeakers() {
  if ($('.mu-speakers-slider').length) {
    $('.mu-speakers-slider').slick({
      slidesToShow: 4,
      responsive: [{
        breakpoint: 768,
        settings: {
          arrows: true,
          slidesToShow: 3
        }
      },
      {
        breakpoint: 480,
        settings: {
          arrows: true,
          slidesToShow: 1
        }
      }
    ]

  })
}
}

function loadCountdown() {
  if ($('#mu-event-counter').length) {
    var finalDate = $('#mu-event-counter').data('countdown')
    $('#mu-event-counter').countdown(finalDate).on('update.countdown', function(event) {
      var $this = $(this).html(event.strftime('' +
      '<span class="mu-event-counter-block"><span>%D</span> Days</span> ' +
      '<span class="mu-event-counter-block"><span>%H</span> Hours</span> ' +
      '<span class="mu-event-counter-block"><span>%M</span> Mins</span> ' +
      '<span class="mu-event-counter-block"><span>%S</span> Secs</span>'));
    });
  }
}

function validadateSubscriberInputs() {
  if ($('#phone-number').length) {
    new Cleave('#phone-number', {
      phone: true,
      phoneRegionCode: 'CR'
    });
  }
}
