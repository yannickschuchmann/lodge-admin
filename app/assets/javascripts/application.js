// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tether
//= require bootstrap
//= require summernote
//= require loadingoverlay
//= require es6-promise.auto
//= require ./js.cookie
//= require ie10winphone8-fix
//= require jstz
//= require browser_timezone_rails/set_time_zone

var sendFile = function(file, $toSummernote) {
  return new Promise(function(resolve, reject) {
    var data = new FormData();
    data.append('image[image]', file);
    $.ajax({
      data: data,
      type: 'POST',
      url: '/images/upload',
      cache: false,
      contentType: false,
      processData: false,
      error: function(err) {
        console.log(err);
        reject(err);
      },
      success: function(data) {
        resolve(data.url);
      }
    });
  });
};

var ready = function() {
  $('[data-provider="summernote"]').each(function() {
    $(this).summernote({
      onImageUpload: function(files) {
        var $this = $(this);
        var uploads = [];
        for (var i = 0; i < files.length; i++) {
          uploads.push(sendFile(files[i], $this));
        }
        $.LoadingOverlay('show');
        Promise.all(uploads).then(function(urls) {
          $.LoadingOverlay('hide');
          for (var i = 0; i < urls.length; i++) {
            $this.summernote('insertImage', urls[i]);
          }
        });
      }
    });
  });

  $('.navbar-toggler').on('click', function(e) {
    e.preventDefault();
    $(this)
      .closest('nav')
      .toggleClass('active');
  });
};

$(document).on('turbolinks:load', ready); // turbolinks
