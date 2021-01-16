import $ from 'jquery';
import prestashop from 'prestashop';


var $body = $('body');

$body.on(
    'click',
    '[data-button-action="add-to-cart-list"]',
    (event) => {
    event.preventDefault();

let $form = $(event.target).closest('form');
let $btn = $(event.currentTarget);


$form.addClass('is-adding');
$btn.attr("disabled", true);

let actionURL = $form.attr('action');
let dataForm = {};

dataForm.add = 1;
dataForm.action = "update";
dataForm.token = prestashop.static_token;
let id_product = parseInt($('[name="id_product"]',$form).val());
dataForm.id_product = id_product;

let showModalAddToCart = $btn.data('show-modal');
let linkAction = "add-to-cart-list";
if(typeof showModalAddToCart !=="undefined"){
    linkAction = "add-to-cart";
}

//check minimal qty to order
let minimalValue = $btn.data('min');
if(typeof minimalValue === "undefined"){
    minimalValue = 1;
}else{
    minimalValue = parseInt($btn.data('min'), 10);
}

let isOosp = $btn.data('allow-oosp');
console.log(isOosp,'oosp');
//add quantity info
let $inputQty = $('[name="qty"]',$form);

let qty = $inputQty.val();
qty = parseInt(qty, 10);
if(!(qty > 0)){
    qty = 1;
}
dataForm.qty = qty;







$.post(actionURL, dataForm, null, 'json').then((resp) => {


    $btn.attr("disabled", false);
    $form.removeClass('is-adding');
    if(resp.success){
        $btn.addClass('is-add-success');
    }
prestashop.emit('updateCart', {
    reason: {
        idProduct: resp.id_product,
        idProductAttribute: resp.id_product_attribute,
        idCustomization: resp.id_customization,
        linkAction: linkAction,
        cart: resp.cart,
        idProductAddList: id_product,
        fromList:true
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
            if(event.resp.hasError){
                showErrorAddToCartList(event.resp.errors,reason.idProductAddList);
            }else{
                confirmAddToCartList(reason.idProductAddList);
            }

        }

    }

});

});

function showErrorAddToCartList(errors,id_product){

    let $btn = $('.js-btn-addcartlist[data-id_product="'+ id_product +'"]');
    $btn.tooltip({
        title:errors[0],
        html:true,
        placement:'top',
        trigger:'manual'

    }).tooltip('show');

    setTimeout(function() {
        $btn.tooltip('hide');
    }, 5000);
}
function confirmAddToCartList(id_product){

    let $btn = $('.js-btn-addcartlist[data-id_product="'+ id_product +'"]');
    $btn.tooltip({
        title:'Produit ajouté au panier !',
        html:true,
        placement:'top',
        trigger:'manual'

    }).tooltip('show');

    setTimeout(function() {
        $btn.tooltip('hide');
    }, 5000);


}