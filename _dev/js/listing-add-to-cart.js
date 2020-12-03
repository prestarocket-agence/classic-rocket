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

let $btn = $(event.currentTarget);
let actionURL = $form.attr('action');
let dataForm = {};

dataForm.add = 1;
dataForm.action = "update";
dataForm.token = prestashop.static_token;
dataForm.id_product = $('[name="id_product"]',$form).val();

let showModalAddToCart = $btn.data('show-modal');
let linkAction = "add-to-cart-list";
if(typeof showModalAddToCart !=="undefined"){
    linkAction = "add-to-cart";
}
console.log(typeof showModalAddToCart);

//check minimal qty to order
let minimalValue = $btn.data('min');
if(typeof minimalValue === "undefined"){
    minimalValue = 1;
}else{
    minimalValue = parseInt($btn.data('min'), 10);

}

let isOosp = $btn.data('allow-oosp');

let $inputQty = $('[name="qty"]',$form);
let qty = $inputQty.val();
qty = parseInt(qty, 10);
if(!(qty > 0)){
    qty = 1;
}
dataForm.qty = qty;





$.post(actionURL, dataForm, null, 'json').then((resp) => {

    console.log(resp);
    prestashop.emit('updateCart', {
    reason: {
        idProduct: resp.id_product,
        idProductAttribute: resp.id_product_attribute,
        idCustomization: resp.id_customization,
        linkAction: linkAction,
        cart: resp.cart
    },
    resp: resp
});
}).fail((resp) => {
    prestashop.emit('handleError', {eventType: 'addProductToCart', resp: resp});
});





});