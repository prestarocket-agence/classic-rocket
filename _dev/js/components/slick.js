import $ from 'jquery';


export default class SlickSlider {
    init() {
        $('[data-slick]').not('.slick-initialized').each(function() {
            let self = $( this );
            if(self.data('count') === 1){
                return;
            }

            self.slick({
                prevArrow:"<button type=\"button\" class=\"btn btn-link slick-prev slick-arrow\"><i class=\"material-icons left\">&#xE314;</i></button>",
                nextArrow:"<button type=\"button\" class=\"btn btn-link slick-next slick-arrow\"><i class=\"material-icons right\">&#xE315;</i></button>"

                });
        });
    }

}
