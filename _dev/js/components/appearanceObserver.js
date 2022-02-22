const config = {
    root: null,
    rootMargin: '0px',
    threshold: [0.1, 0.5, 0.7, 1]
};

let previousY = 0;
let previousRatio = 0;


let observer = new IntersectionObserver(function (entries) {
    entries.forEach(entry => {
        const currentY = entry.boundingClientRect.y;
        const currentRatio = entry.intersectionRatio;
        const isIntersecting = entry.isIntersecting;
        const element = entry.target;
        const _el = $(element);

        _el.removeClass("is-outview--top is-inview--top is-inview--bottom is-outview--bottom is-inview is-outview")
        //element.classList.remove("is-outview--top", "is-inview--top", "is-inview--bottom", "is-outview--bottom","is-inview","is-outview");
        let direction = 'down';
        // Scrolling up
        if (currentY < previousY) {
            const className = (currentRatio >= previousRatio) ? "is-inview--top is-inview" : "is-outview--top is-outview";
            _el.addClass(className);

            // Scrolling down
        } else if (currentY > previousY) {
            const className = (currentRatio <= previousRatio) ? "is-outview--bottom is-outview" : "is-inview--bottom is-inview";
            direction = 'up';
            _el.addClass(className);

        }
        const data = {
            'direction': direction,
            'isIntersecting': isIntersecting,
            'currentRatio': currentRatio,
            'previousRatio': previousRatio

        };

        //send events
        _el.trigger('rckt.observe', data);

        //observe only one time with data data-unobserve="1"
        if (_el.data('unobserve') && isIntersecting) {
            observer.unobserve(element);
        }


        previousY = currentY;
        previousRatio = currentRatio;
    })
}, config);
$(document).ready(function (e) {
    const _els = $('.js-observe');
    $.each(_els, function (key, _el) {
        observer.observe(_el);
    });
    // $('.js-observe').on('rckt.observe',function(e,data){
    //    console.log(data);
    // });
});
