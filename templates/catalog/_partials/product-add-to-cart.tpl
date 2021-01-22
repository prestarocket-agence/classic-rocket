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
<div class="/js product-add-to-cart">
    {if !$configuration.is_catalog}
        {block name='product_add_to_cart_container'}

            {block name='product_quantity'}
                <div class="row c-form__row">
                    <label class="col-lg-3 u-mb-0" for="quantity_wanted">{l s='Quantity' d='Shop.Theme.Catalog'}</label>
                    <div class="c-touchspin__group qty">
                        <input
                                type="number"
                                name="qty"
                                id="quantity_wanted"
                                value="{$product.quantity_wanted}"
                                class="c-touchspin__input"
                                min="{$product.minimal_quantity}"
                                aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
                                {if isset($product.product_url)}data-update-url="{$product.product_url}"{/if}
                        >
                    </div>
                </div>
                <div class="add">
                    <button
                            class="btn btn-primary btn-lg /js js-add-to-cart"
                            data-button-action="add-to-cart"
                            type="submit"
                            {if !$product.add_to_cart_url}
                                disabled
                            {/if}
                    >
                        {l s='Add to cart' d='Shop.Theme.Actions'}
                    </button>

                    {hook h='displayProductActions' product=$product}
                </div>
            {/block}

            {block name='product_availability'}
                {*id use in js*}
                <span id="product-availability">
                {if $product.show_availability && $product.availability_message}
                    {if $product.availability == 'available'}
                        {include file="_partials/icon.tpl" icon="check2" class="product-available text-success"}
                    {elseif $product.availability == 'last_remaining_items'}
                        {include file="_partials/icon.tpl" icon="exclamation-triangle-fill" class="product-last-itemstext-warning"}
                    {else}
                        {include file="_partials/icon.tpl" icon="slash-circle" class="product-unavailable text-danger"}
                    {/if}
                    {$product.availability_message}
                {/if}
            </span>
            {/block}

            {block name='product_minimal_quantity'}
                <p class="product-minimal-quantity">
                    {if $product.minimal_quantity > 1}
                        {l
                        s='The minimum purchase order quantity for the product is %quantity%.'
                        d='Shop.Theme.Checkout'
                        sprintf=['%quantity%' => $product.minimal_quantity]
                        }
                    {/if}
                </p>
            {/block}
        {/block}
    {/if}
</div>
