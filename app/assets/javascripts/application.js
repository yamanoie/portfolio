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
//= require turbolinks
//= require rails-ujs
//= require activestorage
//= require jquery
//= require bxslider
//= require bootstrap-sprockets
//= require data-confirm-modal




// 画像プレビュー
$(function(){
    $('#edit-user-image').on('change', function(e) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(".user-preview").attr('src', e.target.result);
        }
        reader.readAsDataURL(e.target.files[0]);
    });
});

$(function(){
    $('#new-post-image').on('change', function(e) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(".post-preview").attr('src', e.target.result);
        }
        reader.readAsDataURL(e.target.files[0]);
    });
});

$(function(){
    $('#edit-post-image').on('change', function(e) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(".edit-post-preview").attr('src', e.target.result);
        }
        reader.readAsDataURL(e.target.files[0]);
    });
});

// スライダー

$(function(){
	$('.bxslider').bxSlider({
		auto: true,
		speed: 1000,
		pause: 3000,
		randomStart: true,
		autoHover: true,
		autoStart: true,
		infiniteLoop: true,
		slideWidth: 600,
		pager: true,
        touchEnabled: false
	});
});


// トップスクロール

$(function () {
    var topBtn = $('#page-top');
    topBtn.hide();
    $(window).scroll(function () {
        if ($(this).scrollTop() > 500) {
            topBtn.fadeIn();
        } else {
            topBtn.fadeOut();
        }
    });
    topBtn.click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
        return false;
    });
});



// フェードイン

$(window).scroll(function (){
    $('.about-section').each(function(){
        var elemPos = $(this).offset().top,
            scroll = $(window).scrollTop(),
            windowHeight = $(window).height();
          if (scroll > elemPos - windowHeight + 100){
              $(this).addClass('scrollin');
            }
        });
    });


$(window).scroll(function (){
    $('.post-section').each(function(){
        var elemPos = $(this).offset().top,
            scroll = $(window).scrollTop(),
            windowHeight = $(window).height();
          if (scroll > elemPos - windowHeight + 100){
              $(this).addClass('scrollin');
            }
        });
    });


$(window).scroll(function (){
    $('.recruit-section').each(function(){
        var elemPos = $(this).offset().top,
            scroll = $(window).scrollTop(),
            windowHeight = $(window).height();
          if (scroll > elemPos - windowHeight + 100){
              $(this).addClass('scrollin');
            }
        });
    });

$(window).scroll(function (){
    $('.message-section').each(function(){
        var elemPos = $(this).offset().top,
            scroll = $(window).scrollTop(),
            windowHeight = $(window).height();
          if (scroll > elemPos - windowHeight + 100){
              $(this).addClass('scrollin');
            }
        });
    });

$(window).scroll(function (){
    $('.others-section').each(function(){
        var elemPos = $(this).offset().top,
            scroll = $(window).scrollTop(),
            windowHeight = $(window).height();
          if (scroll > elemPos - windowHeight + 100){
              $(this).addClass('scrollin');
            }
        });
    });
