$(document).ready(() => {
    pdtTouchspin();
});

prestashop.on('updatedProduct', () => {
    pdtTouchspin();
});

$(document).on('show.bs.modal', () => {
    pdtTouchspin();
});

pdtTouchspin = () => {
    $.each($('input[name="pack_qty"]'), (index, spinner) => {
        $(spinner).TouchSpin({
            buttondown_class: 'c-touchspin__btn c-touchspin__btn-minus /js js-touchspin',
            buttonup_class: 'c-touchspin__btn c-touchspin__btn-plus /js js-touchspin',
            min: parseInt($(spinner).attr('min'), 10),
            max: 1000000
        });
    });
    $.each($('input[name="qty"]'), (index, spinner) => {
        $(spinner).TouchSpin({
            buttondown_class: 'c-touchspin__btn c-touchspin__btn-minus /js js-touchspin',
            buttonup_class: 'c-touchspin__btn c-touchspin__btn-plus /js js-touchspin',
            min: parseInt($(spinner).attr('min'), 10),
            max: 1000000
        });
    });
};