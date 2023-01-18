import './lib/modernizr-custom';
import './bootstrap/bootstrap-lib';
import '../node_modules/bootstrap-touchspin';
import './lib/debouncedresize';
import './lib/jquery.hoverIntent.min';

import './responsive';
import './checkout';
import './customer';
import './listing';
import './product';
import './cart';
import './listing-add-to-cart';


import Form from './components/form';
import TopMenu from './components/top-menu';
import ProductMinitature from './components/product-miniature';
import './components/appearanceObserver';
import './components/sliders';
import './components/touchspin';


import prestashop from 'prestashop';
import EventEmitter from 'events';


import './components/block-cart';
import lazysizes from 'lazysizes'


// "inherit" EventEmitter
for (var i in EventEmitter.prototype) {
  prestashop[i] = EventEmitter.prototype[i];
}

$(document).ready(() => {

  const form = new Form();
  let productMinitature = new ProductMinitature();

  form.init();
    let topMenuEl = $('#_desktop_top_menu #top-menu');
    if(topMenuEl.length > 0) {
        let topMenu = new TopMenu(topMenuEl);
        topMenu.init();
    }
  productMinitature.init();


//display input file content in custom file input BS
// @todo still need ?
  $('.custom-file-input').on('change',function(){
      let fileName = $(this).val().split('\\').pop();
      $(this).next('.custom-file-label').addClass("selected").text(fileName);
  })
});

document.addEventListener('lazyloaded', function(e){
    $(e.target).parent().addClass('rc--lazyload');
});
