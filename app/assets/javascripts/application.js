// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require infinite-scroll.pkgd.min
//= require popper
//= require bootstrap-sprockets
//= require cocoon
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// 画像投稿時のプレビュー表示
$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#profile_image_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#profile_image").change(function(){
    $('#profile_image_prev').removeClass('hidden');
    readURL(this);
  });
});

$(function () {
    var topBtn = $('#page-top');
    topBtn.hide();
    // スクロールが300に達したらボタン表示
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            topBtn.fadeIn();
        } else {
            topBtn.fadeOut();
        }
    });
    // スルスルっとスクロールでトップへもどる
    topBtn.click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
        return false;
    });
});