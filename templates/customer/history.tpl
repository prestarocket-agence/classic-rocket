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
{extends file='customer/page.tpl'}

{block name='page_title'}
    {l s='Order history' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
    {if $orders}
        <div class="c-history">
            {foreach from=$orders item=order}
                <div class="c-history__item">
                    <div class="c-history__infos">
                        <div class="row">
                            <div class="col-6 col-lg-3 c-history__data">
                                <span class="u-txt-sm u-txt-dark u-mb-1">{l s='Order reference' d='Shop.Theme.Checkout'}</span>
                                <span class="u-font-weight-bold">{$order.details.reference}</span>
                            </div>
                            <div class="col-6 col-lg-3 c-history__data c-history__data--right">
                                <span class="u-txt-sm u-txt-dark u-mb-1">{l s='Date' d='Shop.Theme.Checkout'}</span>
                                <span class="u-font-weight-bold">{$order.details.order_date}</span>
                            </div>
                            <div class="col-6 col-lg-3 c-history__data">
                                <span class="u-txt-sm u-txt-dark u-mb-1">{l s='Total price' d='Shop.Theme.Checkout'}</span>
                                <span class="u-font-weight-bold">{$order.totals.total.value}</span>
                            </div>
                            <div class="col-6 col-lg-3 c-history__data c-history__data--right">
                                <span class="u-txt-sm u-txt-dark u-mb-1">{l s='Status' d='Shop.Theme.Checkout'}</span>
                                <span class="u-font-weight-bold">{$order.history.current.ostate_name}</span>
                            </div>
                        </div>
                        <div class="u-d-flex">
                            <div class="c-history__img">
                                <a href="{$order.details.details_url}">
                                    <img class="u-img-fluid" src="{$order.products[0].cover.medium.url}"
                                         alt="{$order.products[0].name}">
                                </a>
                            </div>
                            {if isset($order.products[1].product_id)}
                                <div class="c-history__img">
                                    <a href="{$order.details.details_url}">
                                        <img class="u-img-fluid" src="{$order.products[1].cover.medium.url}" alt="">
                                        {if $order.products|count > 2}
                                            <div class="c-history__img--watermark">
                                                +{math equation="x - y" x=$order.products|count y=2}
                                            </div>
                                        {/if}
                                    </a>
                                </div>
                            {/if}
                        </div>
                    </div>
                    <div class="o-layout o-layout--center-y u-mb-4 {if !$order.shipping[0].url} o-layout--end{/if}">
                        {if $order.shipping[0].url}
                            <a class="c-btn--underline"
                               href="{$order.shipping[0].url}">{l s='Suivre la commande' d='Shop.Theme.Actions'}</a>
                        {/if}
                        <a class="c-btn--underline" href="{$order.details.details_url}"
                           data-link-action="view-order-details">
                            {l s='Details' d='Shop.Theme.Customeraccount'}
                        </a>
                        {if $order.details.reorder_url}
                            <a class="c-btn--underline" href="{$order.details.reorder_url}"
                               title="{l s='Reorder' d='Shop.Theme.Actions'}">
                            </a>
                        {/if}
                    </div>
                </div>
            {/foreach}
        </div>
    {/if}
{/block}
