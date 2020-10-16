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
{extends file=$layout}

{block name='content'}
    <section id="main">
        <div class="row">

            <!-- Left Block: cart product informations & shpping -->
            <div class="col-12 col-lg-8">

                <!-- cart products detailed -->
                <div class="c-panel u-mb-2">
                    <div class="c-panel__head">
                        <p class="u-h4 u-mb-0">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</p>
                    </div>
                    <div class="/js js-cart__card-body">
{*                        <div class="" role="status"><span*}
{*                                    class="sr-only">{l s='Loading...' d='Shop.Theme.Global'}</span>*}
{*                        </div>*}
                        {block name='cart_overview'}
                            {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
                        {/block}
                    </div>
                </div>

                {block name='continue_shopping'}
                    <a class="btn btn-link" href="{$urls.pages.index}">
                       {include file="_partials/icon.tpl" icon="chevron-left"}
                        {l s='Continue shopping' d='Shop.Theme.Actions'}
                    </a>
                {/block}

                <!-- shipping informations -->
                {block name='hook_shopping_cart_footer'}
                    {hook h='displayShoppingCartFooter'}
                {/block}
            </div>

            <!-- Right Block: cart subtotal & cart total -->
            <div class="col-12 col-lg-4">

                {block name='cart_summary'}
                    <div class="c-cart-summary c-panel u-mb-2">
                        <div>
                            {block name='hook_shopping_cart'}
                                {hook h='displayShoppingCart'}
                            {/block}

                            {block name='cart_totals'}
                                {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
                            {/block}
                        </div>
                        <div>
                            {block name='cart_actions'}
                                {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
                            {/block}
                        </div>

                    </div>
                {/block}

                {block name='hook_reassurance'}
                    {hook h='displayReassurance'}
                {/block}

            </div>

        </div>
    </section>
{/block}
