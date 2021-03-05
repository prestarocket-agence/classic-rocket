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

prestashop.responsive = prestashop.responsive || {};

prestashop.responsive.current_width = window.innerWidth;
prestashop.responsive.min_width = 992;
prestashop.responsive.max_width_mobilexs = 576;
prestashop.responsive.mobile = prestashop.responsive.current_width < prestashop.responsive.min_width;
prestashop.responsive.mobilexs = prestashop.responsive.current_width < prestashop.responsive.max_width_mobilexs;
setConnection();

function swapChildren(obj1, obj2)
{
	var temp = obj2.children().detach();
	obj2.empty().append(obj1.children().detach());
	obj1.append(temp);
}

function toggleMobileStyles()
{
	if (prestashop.responsive.mobile) {
		$("*[id^='_desktop_']").each(function(idx, el) {
			var target = $('#' + el.id.replace('_desktop_', '_mobile_'));
			if (target.length) {
				swapChildren($(el), target);
			}
		});
        $('[data-collapse-hide-mobile]').collapse('hide');

    } else {
		$("*[id^='_mobile_']").each(function(idx, el) {
			var target = $('#' + el.id.replace('_mobile_', '_desktop_'));
			if (target.length) {
				swapChildren($(el), target);
			}

		});
        $('[data-collapse-hide-mobile]').not('.show').collapse('show');
        $('[data-modal-hide-mobile].show').modal('hide');

    }

	prestashop.emit('responsive update', {
		mobile: prestashop.responsive.mobile
	});
}

//test bandwidth
function setConnection()
{
    const connection_support = navigator.connection || navigator.mozConnection || navigator.webkitConnection;
    prestashop.responsive.connection = "slow";
    //if browser not support connection api, we assume that connection is fast
    if(!connection_support || !(/\slow-2g|2g|3g/).test(connection_support.effectiveType)) {
        prestashop.responsive.connection = "fast";
    };
    const htmltag = document.getElementsByTagName( 'html' )[0];
    htmltag.className += ' js-connection-'+prestashop.responsive.connection;
}

$(window).on('debouncedresize', function() {
	var _cw = prestashop.responsive.current_width;
	var _mw = prestashop.responsive.min_width;
	var _w = window.innerWidth;
	var _toggle = (_cw >= _mw && _w < _mw) || (_cw < _mw && _w >= _mw);
	prestashop.responsive.current_width = _w;
    prestashop.responsive.mobile = prestashop.responsive.current_width < prestashop.responsive.min_width;
    prestashop.responsive.mobilexs = prestashop.responsive.current_width < prestashop.responsive.max_width_mobilexs;
	if (_toggle) {
		toggleMobileStyles();
	}
});


$(document).ready(function() {
	if (prestashop.responsive.mobile) {
		toggleMobileStyles();
	}
});
