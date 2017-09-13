//= require jquery/dist/jquery
//= require jquery-ujs/src/rails
//= require foundation-sites/dist/js/foundation
//= require_tree ./admin
//= require turbolinks

$(document).on('turbolinks:load', function() {
  $(document).foundation();
});

$(document).on("click", "#export-btn", function () {
  export_list();
});

function export_list() {
 $.ajax({
     type: "POST",// GET in place of POST
     contentType: "application/json; charset=utf-8",
     url: "/admin/export_csv",
     dataType: "json",
     success: function (result) {
        //do somthing here
        window.alert("success!!");
     },
     error: function (){
        window.alert("something wrong!");
     }
   });
}
