
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
    $('.js-slider:not(.js-slider-loaded):visible').each(function (index) {
        initSlider($(this));
    });
}
function initSlider(_el){
    var _options = _el.data('glider');

    if (typeof _options !== "undefined") {
        var slider = new Glider(_el[0], _options);
        if(_el.data('name') !== 'undefined'){
            slidersGlider[_el.data('name')] = slider;
        }
        _el.addClass('js-slider-loaded');

    }
}

$(document).on('glider-refresh glider-loaded','.js-slider',function(e) {


    var _options = $(e.target).data('glider'),
        _arrows = false,
        _dots = false,
        _slidesToShow = _options.slidesToShow;
    console.log($(e.target));
    if(typeof _options.arrows !== "undefined"){
        _arrows = _options.arrows;
    }
    if(typeof _options.dots !== "undefined"){
        _dots = _options.dots;
    }
    //hide or display dots nav
    if(_dots){
        var _dotslength = $('.glider-dot',_dots).length;
        if(_dotslength > 1){
            $(_dots).removeClass('is-dots-hidden');

                $('.glider-track', e.target).css('min-width', 'auto');

        }else{
            $(_dots).addClass('is-dots-hidden');
            if(_slidesToShow != 1) {

                $('.glider-track', e.target).css('min-width', '100%');
            }


        }
    }

    //hide or display arrow nav
    if(_arrows){
        var _nextarrow = $(_arrows['next']),
        _prevarrow = $(_arrows['prev']);
        if(_nextarrow.hasClass('disabled') && _prevarrow.hasClass('disabled')){
            _prevarrow.addClass('is-arrow-hidden');
            _nextarrow.addClass('is-arrow-hidden');
            if(!_dots && _slidesToShow != 1){
                $('.glider-track',e.target).css('min-width','100%');
            }
        }else{
            _prevarrow.removeClass('is-arrow-hidden');
            _nextarrow.removeClass('is-arrow-hidden');
            if(!_dots){
                $('.glider-track',e.target).css('min-width','unset');
            }

        }
    }


});


//
//product page
$(document).on('glider-slide-visible','#js-pdtcover',function(e){

    var imgindex = $('.glider-slide.active').data('imgindex');
    refreshPdtThumbs(imgindex);
});


$(document).on('click','.js-thumb-pdt:not(.is-thumb-selected)',function(e){
    var _el = $(this);
    toggleStateThumbPdt(_el);
    var imgindex_thumb = _el.data('imgindex'),
        position_to_scroll = $('[data-imgindex="'+  imgindex_thumb+'"]','#js-pdtcover').data('gslide');
    if(position_to_scroll > -1){
    slidersGlider['js-pdtcover'].scrollItem(position_to_scroll);
    }
});

// on scroll in main slider,
function refreshPdtThumbs(imgindex){
    if(typeof imgindex === "undefined"){
        return;
    }
    var thumb_to_update = $('.js-thumb-pdt[data-imgindex="'+ imgindex +'"]:not(.is-thumb-selected)');

    toggleStateThumbPdt(thumb_to_update);
}

//on click thumb, manage thumb selected for extra class
function toggleStateThumbPdt(el){
    if(el.length > 0){
        $('.js-thumb-pdt').removeClass('is-thumb-selected');
        el.addClass('is-thumb-selected');
        scrollThumbNav(el);
    }
}

// if click on thumb, scroll main slider
function scrollThumbNav(el){
    if(!el.hasClass('visible') && slidersGlider.hasOwnProperty('js-pdtthumbs')){
        slidersGlider['js-pdtthumbs'].scrollItem(el.data('gslide'));
    }
}

// prestashop.on('responsive update', function(e){
//     if(e.mobile) {
//         $('.js-glider-mobile:not(".glider")').each(function (index) {
//             initGlider($(this));
//         });
//     }
// });

$(document).on('glider-slide-visible', '.glider', function (event) {
    var imgs_to_anticipate = 2;
    var glider = Glider(this);

    for (var i = 0; i <= imgs_to_anticipate; ++i) {
        var index = Math.min(event.detail.slide + i, glider.slides.length - 1),
            glider = glider;

        loadImages.call(glider.slides[index], function () {
            glider.refresh(true);
        })
    }
});

function loadImages(callback) {
    [].forEach.call(this.querySelectorAll('.js-glider-lazyload:not(.lazyloaded)'), function (img) {
        $(img).addClass('lazyload');
    });
}