$(document).on('turbolinks:load', function() {
  load_datatables();
  load_images();
  load_img();

});

function load_images() {
  $('#load-images').change(function() {
    div_image = $('#preview-images');
    if (this.files && this.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        image = document.createElement('img');
        image.src = e.target.result;
        image.width = 150;
        image.height = 150;
        div_image.append(image);
      }
      reader.readAsDataURL(this.files[0]);
    }
  });
}

function load_img() {
  $('.load-image').change(function() {
    div_image = $('#preview-image');
    if (this.files && this.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        image = document.createElement('img');
        image.src = e.target.result;
        image.width = 150;
        image.height = 150;
        div_image.html(image);
      }
      reader.readAsDataURL(this.files[0]);
    }
  });
}

$(document).on("click", "#export-btn", function() {
  export_list();
});

function export_list() {
  $.ajax({
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "/admin/export_csv",
    dataType: "json",
    success: function(result) {
      window.alert("success!!");
    },
    error: function() {
      window.alert("something wrong!");
    }
  });
}

function load_datatables() {
  $('#subscribers').DataTable({
    "scrollX": true
  });

  $('#speakers').DataTable({
    "scrollX": true
  });

  $('#events').DataTable({
    "scrollX": true
  });

  $('#sponsors').DataTable({
    "scrollX": true
  });
  $('#admins').DataTable({
    "scrollX": true
  });
  $('#voluntaries').DataTable({
    "scrollX": true
  });

}



var searchVisible = 0;
var transparent = true;

var transparentDemo = true;
var fixedTop = false;

var navbar_initialized = false;

$(document).ready(function() {
  window_width = $(window).width();

  // check if there is an image set for the sidebar's background
  lbd.checkSidebarImage();

  // Init navigation toggle for small screens
  lbd.initRightMenu();

  //  Activate the tooltips
  $('[rel="tooltip"]').tooltip();

  $('.form-control').on("focus", function() {
    $(this).parent('.input-group').addClass("input-group-focus");
  }).on("blur", function() {
    $(this).parent(".input-group").removeClass("input-group-focus");
  });

  // Fixes sub-nav not working as expected on IOS
  $('body').on('touchstart.dropdown', '.dropdown-menu', function(e) {
    e.stopPropagation();
  });
});

$(document).on('click', '.navbar-toggle', function() {
  $toggle = $(this);

  if (lbd.misc.navbar_menu_visible == 1) {
    $('html').removeClass('nav-open');
    lbd.misc.navbar_menu_visible = 0;
    $('#bodyClick').remove();
    setTimeout(function() {
      $toggle.removeClass('toggled');
    }, 550);
  } else {
    setTimeout(function() {
      $toggle.addClass('toggled');
    }, 580);
    div = '<div id="bodyClick"></div>';
    $(div).appendTo('body').click(function() {
      $('html').removeClass('nav-open');
      lbd.misc.navbar_menu_visible = 0;
      setTimeout(function() {
        $toggle.removeClass('toggled');
        $('#bodyClick').remove();
      }, 550);
    });

    $('html').addClass('nav-open');
    lbd.misc.navbar_menu_visible = 1;
  }
});

$(window).on('resize', function() {
  if (navbar_initialized) {
    lbd.initRightMenu();
    navbar_initialized = true;
  }
});

lbd = {
  misc: {
    navbar_menu_visible: 0
  },

  checkSidebarImage: function() {
    $sidebar = $('.sidebar');
    image_src = $sidebar.data('image');

    if (image_src !== undefined) {
      sidebar_container = '<div class="sidebar-background" style="background-image: url(' + image_src + ') "/>'
      $sidebar.append(sidebar_container);
    }
  },

  initRightMenu: debounce(function() {
    if (!navbar_initialized) {
      $sidebar_wrapper = $('.sidebar-wrapper');
      $navbar = $('nav').find('.navbar-collapse').html();

      mobile_menu_content = '';

      nav_content = $navbar;

      nav_content = '<ul class="nav nav-mobile-menu">' + nav_content + '</ul>';

      // navbar_form = $('nav').find('.navbar-form').get(0).outerHTML;

      $sidebar_nav = $sidebar_wrapper.find(' > .nav');

      // insert the navbar form before the sidebar list
      $nav_content = $(nav_content);
      // $navbar_form = $(navbar_form);
      $nav_content.insertBefore($sidebar_nav);
      // $navbar_form.insertBefore($nav_content);

      $(".sidebar-wrapper .dropdown .dropdown-menu > li > a").click(function(event) {
        event.stopPropagation();

      });

      mobile_menu_initialized = true;
    } else {
      if ($(window).width() > 991) {
        // reset all the additions that we made for the sidebar wrapper only if the screen is bigger than 991px
        // $sidebar_wrapper.find('.navbar-form').remove();
        $sidebar_wrapper.find('.nav-mobile-menu').remove();

        mobile_menu_initialized = false;
      }
    }
  }, 200)
}


function debounce(func, wait, immediate) {
  var timeout;
  return function() {
    var context = this,
      args = arguments;
    clearTimeout(timeout);
    timeout = setTimeout(function() {
      timeout = null;
      if (!immediate) func.apply(context, args);
    }, wait);
    if (immediate && !timeout) func.apply(context, args);
  };
};
