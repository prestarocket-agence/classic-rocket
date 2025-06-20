import prestashop from 'prestashop';
import $ from 'jquery';
import './../lib/glider.min';


let slidersGlider = {};
let mutationObserver = null;

$(document).ready(() => {
    initAllSliders();
    prestashop.on('updatedProduct updateFacets updateProductList showProductQuickView', function (event) {
        initAllSliders();
    });
    // Replace deprecated DOMSubtreeModified with MutationObserver
    if (mutationObserver) {
        mutationObserver.disconnect();
    }

    mutationObserver = new MutationObserver(function(mutations) {
        let shouldInit = false;
        mutations.forEach(function(mutation) {
            if (mutation.type === 'childList' && mutation.addedNodes.length > 0) {
                // Check if any added nodes contain sliders
                for (let node of mutation.addedNodes) {
                    if (node.nodeType === Node.ELEMENT_NODE) {
                        if ((node.classList && node.classList.contains('js-slider')) ||
                            (node.querySelector && node.querySelector('.js-slider'))) {
                            shouldInit = true;
                            break;
                        }
                    }
                }
            }
        });

        if (shouldInit) {
            // Use a small delay to avoid excessive calls
            clearTimeout(window.sliderInitTimeout);
            window.sliderInitTimeout = setTimeout(initAllSliders, 100);
        }
    });

    // Start observing
    mutationObserver.observe(document.body, {
        childList: true,
        subtree: true
    });
});

function initAllSliders() {
    $('.js-slider:not(.js-slider-loaded):visible').each(function (index) {
        initSlider($(this));
    });
}

function initSlider(_el) {
    var _options = _el.data('glider');

    if (typeof _options !== "undefined") {
        var slider = new Glider(_el[0], _options);
        if (_el.data('name') !== 'undefined') {
            slidersGlider[_el.data('name')] = slider;
        }
        _el.addClass('js-slider-loaded');

    }
}

$(document).on('glider-refresh glider-loaded', '.js-slider', function (e) {
    if (!$(e.target).data('glider')) return;

    var _options = $(e.target).data('glider'),
        _arrows = false,
        _dots = false,
        _slidesToShow = _options.slidesToShow;

    if (typeof _options.arrows !== "undefined") {
        _arrows = _options.arrows;
    }
    if (typeof _options.dots !== "undefined") {
        _dots = _options.dots;
    }

    //Hide or display dots nav
    if (_dots) {
        var _dotslength = $('.glider-dot', _dots).length;
        if (_dotslength > 1) {
            $(_dots).removeClass('is-dots-hidden');

            $('.glider-track', e.target).css('min-width', 'auto');

        } else {
            $(_dots).addClass('is-dots-hidden');
            if (_slidesToShow != 1) {

                $('.glider-track', e.target).css('min-width', '100%');
            }


        }
    }

    //Hide or display arrow nav
    if (_arrows) {
        var _nextarrow = $(_arrows['next']),
            _prevarrow = $(_arrows['prev']);
        if (_nextarrow.hasClass('disabled') && _prevarrow.hasClass('disabled')) {
            _prevarrow.addClass('is-arrow-hidden');
            _nextarrow.addClass('is-arrow-hidden');
            if (!_dots && _slidesToShow != 1) {
                $('.glider-track', e.target).css('min-width', '100%');
            }
        } else {
            _prevarrow.removeClass('is-arrow-hidden');
            _nextarrow.removeClass('is-arrow-hidden');
            if (!_dots) {
                $('.glider-track', e.target).css('min-width', 'unset');
            }
        }
    }
});

//Product page
$(document).on('glider-slide-visible', '#js-pdtcover', function (e) {

    var imgindex = $('.glider-slide.active').data('imgindex');
    refreshPdtThumbs(imgindex);
});


$(document).on('click', '.js-thumb-pdt:not(.is-thumb-selected)', function (e) {
    var _el = $(this);
    toggleStateThumbPdt(_el);
    var imgindex_thumb = _el.data('imgindex'),
        position_to_scroll = $('[data-imgindex="' + imgindex_thumb + '"]', '#js-pdtcover').data('gslide');
    if (position_to_scroll > -1) {
        slidersGlider['js-pdtcover'].scrollItem(position_to_scroll);
    }
});

//On scroll in main slider,
function refreshPdtThumbs(imgindex) {
    if (typeof imgindex === "undefined") {
        return;
    }
    var thumb_to_update = $('.js-thumb-pdt[data-imgindex="' + imgindex + '"]:not(.is-thumb-selected)');

    toggleStateThumbPdt(thumb_to_update);
}

//On click thumb, manage thumb selected for extra class
function toggleStateThumbPdt(el) {
    if (el.length > 0) {
        $('.js-thumb-pdt').removeClass('is-thumb-selected');
        el.addClass('is-thumb-selected');
        scrollThumbNav(el);
    }
}

//If click on thumb, scroll main slider
function scrollThumbNav(el) {
    if (!el.hasClass('visible') && slidersGlider.hasOwnProperty('js-pdtthumbs')) {
        slidersGlider['js-pdtthumbs'].scrollItem(el.data('gslide'));
    }
}

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