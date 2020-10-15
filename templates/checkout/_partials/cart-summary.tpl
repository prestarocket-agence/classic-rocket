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
<section id="js-checkout-summary" class="c-card /js js-cart mb-5"
         data-refresh-url="{$urls.pages.cart}?ajax=1&action=refresh">
    <div class="c-card__head">
        <p class="u-h4 u-mb-0">{l s='Récapitulatif' d='Shop.Theme.Global'}</p>
    </div>
    <div class="">
        {*        {block name='hook_checkout_summary_top'}*}
        {*            {hook h='displayCheckoutSummaryTop'}*}
        {*        {/block}*}

        {block name='cart_summary_products'}
            <div class="o-layout u-mb-3 /js cart-summary-products">
                <p class="u-mb-0">{$cart.summary_string}</p>
                <a class="" href="#" data-toggle="collapse"
                   data-target="#cart-summary-product-list">
                    <span class="u-txt-sm">{l s='Afficher les détails' d='Shop.Theme.Actions'}</span>
                    {*                    {include file="_partials/icon.tpl" icon="chevron-bottom" class="u-icon--16"}*}
                </a>
                {*                {block name='cart_summary_product_list'}*}
                {*                    <div class="collapse" id="cart-summary-product-list">*}
                {*                        <ul class="media-list">*}
                {*                            {foreach from=$cart.products item=product}*}
                {*                                <li class="media media-list__item">{include file='checkout/_partials/cart-summary-product-line.tpl' product=$product}</li>*}
                {*                            {/foreach}*}
                {*                        </ul>*}
                {*                    </div>*}
                {*                {/block}*}
            </div>
        {/block}

        {block name='cart_summary_subtotals'}
            {include file='checkout/_partials/cart-summary-subtotals.tpl' cart=$cart}
        {/block}

        {*        {block name='cart_summary_voucher'}*}
        {*            {include file='checkout/_partials/cart-voucher.tpl'}*}
        {*        {/block}*}

        {block name='cart_summary_totals'}
            {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
        {/block}
    </div>


</section>
