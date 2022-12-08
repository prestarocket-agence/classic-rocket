{**
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
 *}
<div id="blockcart-modal" class="modal fade blockcart-modal" tabindex="-1" role="dialog" aria-labelledby="blockcart-modal-label" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title text-center text-success w-100" id="blockcart-modal-label"><i class="material-icons rtl-no-flip">&#xE876;</i>{l s='Product successfully added to your shopping cart' d='Shop.Theme.Checkout'}</h3>

        <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
          <span aria-hidden="true"><i class="material-icons">close</i></span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-6 divide-right">
            <div class="media">
              <img class="product-image modal-cart__image" src="{$product.cover.medium.url}" alt="{$product.cover.legend}" width="{$product.cover.medium.width}" height="{$product.cover.medium.height}">
              <div class="media-body">
                <p class="h5 product-name modal-cart__name">{$product.name}</p>
                <p class="product-price">{$product.price}</p>
                  {hook h='displayProductPriceBlock' product=$product type="unit_price"}
                  {foreach from=$product.attributes item="property_value" key="property"}
                    <span>{l s='%label%:' sprintf=['%label%' => $property] d='Shop.Theme.Global'}<strong> {$property_value}</strong></span><br>
                  {/foreach}
                <p>
                  <span>{l s='Quantity:' d='Shop.Theme.Checkout'}&nbsp;<strong>{$product.cart_quantity}</strong></span>
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="cart-content">
                {if $cart.products_count > 1}
                  <p class="cart-products-count">{l s='There are %products_count% items in your cart.' sprintf=['%products_count%' => $cart.products_count] d='Shop.Theme.Checkout'}</p>
                {else}
                  <p class="cart-products-count">{l s='There is %product_count% item in your cart.' sprintf=['%product_count%' =>$cart.products_count] d='Shop.Theme.Checkout'}</p>
                {/if}
              <p class="d--flex-between"><span>{l s='Subtotal:' d='Shop.Theme.Checkout'}</span>&nbsp;<span class="value">{$cart.subtotals.products.value}</span></p>
              <p class="d--flex-between"><span>{l s='Shipping:' d='Shop.Theme.Checkout'}</span>&nbsp;<span class="value">{$cart.subtotals.shipping.value} {hook h='displayCheckoutSubtotalDetails' subtotal=$cart.subtotals.shipping}</span></p>

                {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
                  <p class="d--flex-between"><span>{$cart.totals.total.label}&nbsp;{$cart.labels.tax_short}</span>&nbsp;<span>{$cart.totals.total.value}</span></p>
                  <p class="product-total d--flex-between"><span>{$cart.totals.total_including_tax.label}</span>&nbsp;<span class="value">{$cart.totals.total_including_tax.value}</span></p>
                {else}
                  <p class="product-total d--flex-between"><span>{$cart.totals.total.label}&nbsp;{if $configuration.taxes_enabled}{$cart.labels.tax_short}{/if}</span>&nbsp;<span class="value">{$cart.totals.total.value}</span></p>
                {/if}

                {if $cart.subtotals.tax}
                  <p class="product-tax small">{l s='%label%:' sprintf=['%label%' => $cart.subtotals.tax.label] d='Shop.Theme.Global'}&nbsp;<span class="value">{$cart.subtotals.tax.value}</span></p>
                {/if}

            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">{l s='Continue shopping' d='Shop.Theme.Actions'}</button>
        <a href="{$cart_url}" class="btn btn-primary"><i class="material-icons rtl-no-flip">&#xE876;</i>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</a>
      </div>
    </div>
  </div>
</div>
