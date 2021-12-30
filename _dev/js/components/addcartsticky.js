$(document).ready(function (e) {
    moveAddCart();
    showHideStickyAddCart();
    prestashop.on('updatedProduct', function (event) {
        moveAddCart();
    });
});

function moveAddCart() {
    $('#js-addcartsticky-bottom').empty().append($('#js-addtocart-sticky').children().detach());
}

function showHideStickyAddCart(e, data) {
    if (typeof data === 'object' && data !== null) {
        if (data.direction === "down" && !data.isIntersecting) {
            $('.c-addcartsticky').addClass('is-addcartsticky-show');
        } else {
            $('.c-addcartsticky').removeClass('is-addcartsticky-show');
        }
    }
}

$(document).on('rckt.observe', '#pdt_addtocart', function (e, data) {
    showHideStickyAddCart(e, data);
});