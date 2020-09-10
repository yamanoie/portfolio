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


// TIME

function set2fig(num) {
   var ret;
   if( num < 10 ) { ret = "0" + num; }
   else { ret = num; }
   return ret;
}

function showClock() {
   var nowTime = new Date();
   var nowHour = set2fig( (nowTime.getHours()) - 1 );
   var nowMin  = set2fig( nowTime.getMinutes() );
   var nowSec  = set2fig( nowTime.getSeconds() );
   var msg = nowHour + ":" + nowMin + ":" + nowSec;
   document.getElementById("RealtimeClockAreaPH").innerHTML = msg;
}
setInterval('showClock()',1000);


function showClockFP() {
   var nowTime = new Date();
   var nowHour = set2fig( nowTime.getHours() );
   var nowMin  = set2fig( nowTime.getMinutes() );
   var nowSec  = set2fig( nowTime.getSeconds() );
   var msg = nowHour + ":" + nowMin + ":" + nowSec;
   document.getElementById("RealtimeClockAreaJP").innerHTML = msg;
}
setInterval('showClockFP()',1000);

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
		slideWidth: 750,
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
    $('.mainvisual').each(function(){
        var elemPos = $(this).offset().top,
            scroll = $(window).scrollTop(),
            windowHeight = $(window).height();
          if (scroll > elemPos - windowHeight + 100){
              $(this).addClass('scrollin');
            }
        });
    });

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
