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
import 'bootstrap/js/src/util';
import 'bootstrap/js/src/alert';
import 'bootstrap/js/src/button';
import  '../node_modules/bootstrap/js/src/collapse.js';
import 'bootstrap/js/src/collapse';
import 'bootstrap/js/src/dropdown';
import 'bootstrap/js/src/modal';
import 'bootstrap/js/src/popover';
import 'bootstrap/js/src/tab';
import 'bootstrap/js/src/toast';
import 'bootstrap/js/src/tooltip';
import 'bootstrap-touchspin';
import './lib/slick.min';
import './lib/jquery.hoverIntent.min';
import SlickSlider from './components/slick';

import './responsive';
import './checkout';
import './customer';
import './listing';
import './product';
import './cart';

import Form from './components/form';
import TopMenu from './components/top-menu';

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
  let slickSlider = new SlickSlider();
  let topMenuEl = $('#_desktop_top_menu #top-menu');
  let topMenu = new TopMenu(topMenuEl);

  form.init();
  slickSlider.init();
  topMenu.init();

  //display input file content in custom file input BS
  $('.custom-file-input').on('change',function(){
      let fileName = $(this).val().split('\\').pop();
      $(this).next('.custom-file-label').addClass("selected").html(fileName);
  })

});
document.addEventListener('lazyloaded', function(e){
    $(e.target).parent().addClass('rc--lazyload');
});
