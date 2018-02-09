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
  if ($('#event-start-time').length || $('#event-end-time').length) {
    $('#event-start-time').datetimepicker();
    $('#event-end-time').datetimepicker();
  }
});
