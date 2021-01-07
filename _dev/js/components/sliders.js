
import prestashop from 'prestashop';
import $ from 'jquery';
// import Glider from 'glider-js/glider.js';
import './../lib/glider.min';


let slidersGlider = {};
$(document).ready(() => {

    initAllSliders();
prestashop.on('updatedProduct', function (event) {
    initAllSliders();

});
prestashop.on('showProductQuickView', function (e) {
    // slickSlider.init();
    // console.log(e);
    initAllSliders();
});
});

$(document).on('shown.bs.modal','#product-modal', function (e) {
    // $('#js-slick-product').resize();
});


function initAllSliders(){
    $('.js-slider:not(.js-slider-loaded)').each(function (index) {
        initSlider($(this));
    });
}
function initSlider(_el){
    var _options = _el.data('glider');
    // console.log(_el.data());
    if (typeof _options !== "undefined") {
        if(_el.data('name') !== 'undefined'){
            slidersGlider[_el.data('name')] = new Glider(_el[0], _options);
        }else{
            new Glider(_el[0], _options);
        }
        _el.addClass('js-slider-loaded');
    }
}


//
//product page
// $(document).on('glider-slide-visible',function(e){
//     var _index = parseInt(e.detail.slide);
//     $('#js-img-count').text(_index + 1);
//     // .scrollItem(_index);
//     if($('#js-pdt-thumbs').hasClass('js-slider-loaded')){
//         // slidersGlider['pdt-thumbs'].scrollItem(_index);
//     }
//         $('.js-pdt-thumb').removeClass('is-active');
//         $('.js-pdt-thumb[data-index="'+ _index +'"]').addClass('is-active');
//
//
// });
// $(document).on('click','.js-pdt-thumb',function(e){
//     var _index = parseInt($(this).data('index'));
//     //check if slidersGlider exist => if one img=>no exists
//     slidersGlider['pdt-cover'].scrollItem(_index);
//
// });


//

$(document).on('glider-refresh glider-loaded',function(e) {
var _slider = $(e.target),
    _parent = _slider.parents('.c-slider__container'),
    _nbDots = $('.c-slider__dots .glider-dot',_parent).length;
    if(_nbDots === 1){
        _parent.addClass('has-no-nav');
        $('.glider-track',_parent).css('min-width','100%');

    }else if(_nbDots > 1){
        _parent.removeClass('has-no-nav');
        $('.glider-track',_parent).css('min-width','unset');
    }
});

// prestashop.on('responsive update', function(e){
//     if(e.mobile) {
//         $('.js-glider-mobile:not(".glider")').each(function (index) {
//             initGlider($(this));
//         });
//     }
// });