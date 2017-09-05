//= require jquery/dist/jquery
//= require jquery-ujs/src/rails
//= require foundation-sites/dist/js/foundation
//= require_tree ./admin
//= require turbolinks

$(document).on('turbolinks:load', function() {
  $(document).foundation();
});
