import $ from 'jquery';
import prestashop from 'prestashop';

var $body = $('body');

$body.on(
    'click',
    '[data-button-action="add-to-cart-list"]',
    (event) => {
        event.preventDefault();

        let $form = $(event.target).closest('form'),
            $btn = $(event.currentTarget),
            actionURL = $form.attr('action'),
            dataForm = {},
            id_product = parseInt($('[name="id_product"]', $form).val());

        $form.addClass('is-adding');
        $btn.attr("disabled", true);
        dataForm.add = 1;
        dataForm.action = "update";
        dataForm.token = prestashop.static_token;
        dataForm.id_product = id_product;

        let showModalAddToCart = $btn.data('show-modal'),
            linkAction = "add-to-cart-list";
        if (typeof showModalAddToCart !== "undefined") linkAction = "add-to-cart";

        //check minimal qty to order
        let minimalValue = $btn.data('min');
        typeof minimalValue === "undefined" ? minimalValue = 1 : minimalValue = parseInt($btn.data('min'), 10);

        //add quantity info
        let $inputQty = $('[name="qty"]', $form),
            qty = $inputQty.val();

        qty = parseInt(qty, 10);
        if (!(qty > 0)) qty = 1;

        dataForm.qty = qty;

        $.post(actionURL, dataForm, null, 'json').then((resp) => {
            $btn.attr("disabled", false);
            $form.removeClass('is-adding');

            if (resp.success) $btn.addClass('is-add-success');

            prestashop.emit('updateCart', {
                reason: {
                    idProduct: resp.id_product,
                    idProductAttribute: resp.id_product_attribute,
                    idCustomization: resp.id_customization,
                    linkAction: linkAction,
                    cart: resp.cart,
                    idProductAddList: id_product,
                    fromList: true
                },
                resp: resp
            });
        }).fail((resp) => {
            prestashop.emit('handleError', {eventType: 'addProductToCartList', resp: resp});
            $btn.attr("disabled", false);
            $form.removeClass('is-adding');
        });
    });

$(document).ready(() => {
    prestashop.on('updateCart', function (event) {
        if (event && event.hasOwnProperty('reason')) {
            let reason = event.reason;
            if (reason.hasOwnProperty('fromList') && reason.fromList) {
                if (event.resp.hasError) {
                    showErrorAddToCartList(event.resp.errors, reason.idProductAddList);
                } else {
                    confirmAddToCartList(reason.idProductAddList);
                }
            }
        }
    });
});

function showErrorAddToCartList(errors, id_product) {
    let $btn = $('.js-btn-addcartlist[data-id_product="' + id_product + '"]');

    $btn.tooltip({
        title: errors[0],
        html: true,
        placement: 'top',
        trigger: 'manual'

    }).tooltip('show');

    setTimeout(function () {
        $btn.tooltip('hide');
    }, 5000);
}

function confirmAddToCartList(id_product) {
    let $btn = $('.js-btn-addcartlist[data-id_product="' + id_product + '"]');

    $btn.tooltip({
        title: typeof stringAddedToCart !== 'undefined' ? stringAddedToCart : 'Produit ajouté au panier !',
        html: true,
        placement: 'top',
        trigger: 'manual'
    }).tooltip('show');

    setTimeout(function () {
        $btn.tooltip('hide');
    }, 5000);
}