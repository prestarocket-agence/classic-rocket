//Slick orientation trigger
$(window).on("orientationchange",function(){
    $('[data-slick]').slick('reinit');
});
$('.products-slick').on('init reInit', function (e) {
    // console.log(e);
    var _el = e.target;

    jbResizeSlider(_el);
});

//since multiple events can trigger a slider adjustment, we will control that adjustment here
function jbResizeSlider(_el){
    $('.card-product',_el).height('auto');

    var slickTrack = $('.slick-track',_el);
    var slickTrackHeight = slickTrack.height();

    $('.card-product',_el).css('height', slickTrackHeight + 'px');
}
/*
 * Custom code goes here.
 * A template should always ship with an empty custom.js
 */
