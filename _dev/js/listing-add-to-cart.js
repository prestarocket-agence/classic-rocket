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
    '[data-button-action="add-to-cart-list"]',
    (event) => {
    event.preventDefault();

let $form = $(event.target).closest('form');
$form.addClass('is-adding');
console.log(event);
let $btn = $(event.currentTarget);
let actionURL = $form.attr('action');
let query = $form.serialize() + '&add=1&action=update&token='+prestashop.static_token;


let minimalValue = parseInt($btn.data('min'), 10);
let isOosp = $btn.data('allow-oosp');
let $inputQty = $('[name="qty"]',$form);
let qty = $inputQty.val();
qty = parseInt(qty, 10);
if(qty < 1){
    qty = 1;
}

console.log(isOosp,qty);

$.post(actionURL, query, null, 'json').then((resp) => {

    console.log(resp);
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





});