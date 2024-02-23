let title = "javascript使用中。ファイルはapp/javascript/script.jsです。";
alert(title);

$(document).on('turbolinks:load', function(){
    $('header').each(function(){
        var $window = $(window),
            $header = $(this),
            //ヘッダーボックスの初期位置を取得
            headeBoxTop = $header.offset().top;

        //スクロールイベントを監視
        $window.on('scroll',function(){
            //スクロール量がヘッダーボックスの
            //初期位置より多ければクラスを追加
            if($window.scrollTop()>headeBoxTop){
                $header.addClass('sticky');
            } else {
                $header.removeClass('sticky');
            }
        });
        //ウィンドウのスクロールイベントを発生させる
        $window.trigger('scroll');
    });
});



// Swiperのオプションを定数化
const opt = {
  loop: true, 
  pagination: { 
    el: '.swiper-pagination', 
  },
  navigation: { 
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  }
}

// Swiperを実行(初期化)
$(document).on('turbolinks:load', function() {
    let swiper = new Swiper('.swiper',opt);
});
