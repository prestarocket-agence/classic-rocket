/**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */
import $ from 'jquery';
import prestashop from 'prestashop';


var $body = $('body');

$body.on(
    'click',
    '[data-add-to-cart-list="add-to-cart"]',
    (event) => {
    event.preventDefault();





if ($('#quantity_wanted').val() > $('[data-stock]').data('stock') && $('[data-allow-oosp]').data('allow-oosp').length === 0) {
    $('[data-button-action="add-to-cart"]').attr('disabled', 'disabled');
} else {
    let $form = $(event.target).closest('form');
    let query = $form.serialize() + '&add=1&action=update';
    let actionURL = $form.attr('action');

    let isQuantityInputValid = ($input) => {
        var validInput = true;

        $input.each((index, input) => {
            let $input = $(input);
        let minimalValue = parseInt($input.attr('min'), 10);
        if (minimalValue && $input.val() < minimalValue) {
            onInvalidQuantity($input);
            validInput = false;
        }
    });

        return validInput;
    };

    let onInvalidQuantity = ($input) => {
        $input.parents('.product-add-to-cart').first().find('.product-minimal-quantity').addClass('error');
        $input.parent().find('label').addClass('error');
    };

    let $quantityInput = $form.find('input[min]' );
    if (!isQuantityInputValid($quantityInput)) {
        onInvalidQuantity($quantityInput);

        return;
    }

    $.post(actionURL, query, null, 'json').then((resp) => {
        prestashop.emit('updateCart', {
        reason: {
            idProduct: resp.id_product,
            idProductAttribute: resp.id_product_attribute,
            idCustomization: resp.id_customization,
            linkAction: 'add-to-cart-list',
            cart: resp.cart
        },
        resp: resp
    });
}).fail((resp) => {
        prestashop.emit('handleError', {eventType: 'addProductToCart', resp: resp});
});
}
}
);