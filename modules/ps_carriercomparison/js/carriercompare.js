/*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

$(document).ready(function () {
  var carrierComparisonDiv = $('div.js-carrier-compare');
  carrierComparisonUrl = carrierComparisonDiv.data('url');
  carrierComparisonInfo = carrierComparisonDiv.data('item');
  carrierComparisonRefreshMethod = carrierComparisonDiv.data('method');

  $(document).on('change', 'select[name=id_country]', function() {
      updateStateByIdCountry();
  });

  if (carrierComparisonRefreshMethod) {
      $(document).on('change', 'select[name=id_state]', function() {
          updateCarriersList();
      });

      $(document).on('keyup', 'input[name=zipcode]', function(e) {
          if ('13' == e.keyCode) {
              updateCarriersList();
          }
      });
  }

  $(document).on('click', '.js-carrier-compare-estimate', function() {
      updateCarriersList();
  });

  $(document).on('click', '.js-carrier-compare-submit', function() {
      simulateSelection();
      return false;
  });

  $(document).on('change', "input[name='carrier_id']", function() {
      disableUpdateCart();
  });

  updateStateByIdCountry();
  disableUpdateCart();
});

function disableUpdateCart() {
    var checked = $('input[name="carrier_id"]:checked').val();

    if('undefined' === typeof checked) {
        $('.js-carrier-compare-submit').attr("disabled", "disabled");
    } else {
        $('.js-carrier-compare-submit').removeAttr("disabled");
    }
}

function updateStateByIdCountry() {
    $('select[name=id_state]').children().remove();
    $('.js-carriers').slideUp('fast');
    $('.js-states').slideUp('fast');

    $.ajax({
        type: 'POST',
        headers: { "cache-control": "no-cache" },
        url: carrierComparisonUrl + '?rand=' + new Date().getTime(),
        data: 'method=getStates&id_country=' + $('select[name=id_country]').val(),
        dataType: 'json',
        success: function (json) {
            if (json.length) {
                for (state in json) {
                    $('select[name=id_state]').append('<option value=\''+json[state].id_state+'\' '+(carrierComparisonInfo.idState == json[state].id_state ? 'selected="selected"' : '')+'>'+json[state].name+'</option>');
                }
                $('.js-states').slideDown('fast');
                if (!!$.prototype.uniform)
                    $.uniform.update('select[name=id_state]');
            }
            if (carrierComparisonRefreshMethod)
                updateCarriersList();
        }
    });
}

function updateCarriersList() {
    $('.js-carriers').slideUp('normal', function () {
        $(this).find('tbody').children().remove();

        $.ajax({
            type: 'POST',
            headers: { "cache-control": "no-cache" },
            url: carrierComparisonUrl + '?rand=' + new Date().getTime(),
            data: 'method=getCarriers&id_country=' + $('select[name=id_country]').val() + '&id_state=' + $('select[name=id_state]').val() + '&zipcode=' + $('select[name=zipcode]').val(),
            dataType: 'json',
            success: function(json) {
                if (json.length) {
                    var html  = '';
                    $.each(json, function(index, carrier)
                    {
                        html += '<tr class="c-checkout-carrier__row">'+
                                    '<td>'+
                                        '<input type="radio" name="carrier_id" value="'+ carrier.id_carrier +'" '+(carrierComparisonInfo.idCarrier == carrier.id_carrier ? 'checked="checked"' : '')+'/>'+
                                    '</td>'+
                                    '<td>'+
                                        (carrier.img ? '<img src="'+carrier.img+'" alt="'+carrier.name+'" />' : carrier.name)+
                                    '</td>'+
                                    '<td>'+
                                        ((carrier.delay != null) ? carrier.delay : '') +
                                    '</td>'+
                                    '<td>';
                        if (carrier.price) {
                          html += '<span>'+ carrier.price + '</span>';
                        } else {
                          html += '<span>' + carrierComparisonInfo['txtFree'] + '</span>'
                        }
                        html += 	'</td>'+
                                '</tr>';
                    });
                    $('.js-carriers tbody').append(html);
                    $('.js-carriers').slideDown();
                }
            }
        });
    });
}

function simulateSelection() {
    $.ajax({
        type: 'POST',
        headers: { "cache-control": "no-cache" },
        url: carrierComparisonUrl + '?rand=' + new Date().getTime(),
        data: 'method=simulateSelection&' + $('.js-carrier-compare > form').serialize() + '&id_country=' + $('select[name=id_country]').val() + '&id_state=' + $('select[name=id_state]').val(),
        dataType: 'json',
        success: function(json) {
            if (json.shipping_total != 0) {
              $('div#cart-subtotal-shipping > div > span.value').html(json.shipping_total);
            } else {
              $('div#cart-subtotal-shipping > div > span.value').text(carrierComparisonInfo['txtFree']);
            }
            $('div.cart-total > span.value').html(json.total);
            $('div.tax > span.value').html(json.tax_total);
        }
    });
}
