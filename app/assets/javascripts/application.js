//= require jquery/dist/jquery
//= require jquery-countdown/dist/jquery.countdown
//= require jquery-ujs/src/rails
//= require jquery3
//= require popper
//= require bootstrap/dist/js/bootstrap
//= require slick-carousel/slick/slick
//= require_tree .
//= require turbolinks

$(document).on('turbolinks:load', function() {
  $(document).foundation();
  $(document).ready(function() {
    $('.mu-speakers-slider').slick({
      slidesToShow: 4,
      responsive: [
        {
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
  });
});
