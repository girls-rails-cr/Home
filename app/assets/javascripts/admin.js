//= require jquery/dist/jquery
//= require jquery-ujs/src/rails
//= require popper
//= require bootstrap/dist/js/bootstrap
//= require Chart.bundle
//= require chartkick
//= require turbolinks
//= require cocoon
//= require_tree ./admin

$(document).on('turbolinks:load', function() {
  $('#event-start-time').datetimepicker();
});
