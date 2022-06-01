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
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="row">
                                <div class="col-6 c-history__data">
                                    <span class="u-txt-sm u-txt-dark u-mb-1">{l s='Order reference' d='Shop.Theme.Checkout'}</span>
                                    <span class="u-font-weight-bold">{$order.details.reference}</span>
                                </div>
                                <div class="col-6 c-history__data c-history__data--right">
                                    <span class="u-txt-sm u-txt-dark u-mb-1">{l s='Date' d='Shop.Theme.Checkout'}</span>
                                    <span class="u-font-weight-bold">{$order.details.order_date}</span>
                                </div>
                                <div class="col-6 c-history__data">
                                    <span class="u-txt-sm u-txt-dark u-mb-1">{l s='Total price' d='Shop.Theme.Checkout'}</span>
                                    <span class="u-font-weight-bold">{$order.totals.total.value}</span>
                                </div>
                                <div class="col-6 c-history__data c-history__data--right">
                                    <span class="u-txt-sm u-txt-dark u-mb-1">{l s='Status' d='Shop.Theme.Checkout'}</span>
                                    <span class="c-history__data-status u-font-weight-bold"
                                          style="background-color:{$order.history.current.color}">{$order.history.current.ostate_name}</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 c-history__thumbnails">
                            {foreach from=$order.products item=product name=products}
                                {if $smarty.foreach.products.iteration < 3}
                                <div class="c-history__img">
                                    {if $smarty.foreach.products.first}
                                        <a href="{$order.details.details_url}">
                                            {if $smarty.foreach.products.first.cover}
                                                <img class="u-img-fluid" src="{$product.cover.medium.url}"
                                                     alt="{$product.name}">
                                            {else}
                                                <img class="u-img-fluid" src="{$urls.no_picture_image.bySize.home_default.url}"
                                                     alt="{$product.name}"/>
                                            {/if}
                                        </a>
                                    {else}
                                        <a href="{$order.details.details_url}">
                                            {if isset($product.cover) && $product.cover}
                                                <img class="u-img-fluid"
                                                     src="{$product.cover.medium.url}"
                                                     alt="{$product.name}">
                                            {else}
                                                <img class="u-img-fluid" src="{$urls.no_picture_image.bySize.home_default.url}"
                                                     alt="{$product.name}"/>
                                            {/if}
                                            {if $order.products|count >= 3}
                                                <div class="c-history__img--watermark">
                                                    +{math equation="x - y" x=$order.products|count y=2}
                                                </div>
                                            {/if}
                                        </a>
                                    {/if}
                                </div>
                                {/if}
                            {/foreach}
                        </div>
                    </div>
                    <div class="o-layout o-layout--center-y{if !$order.shipping[0].tracking_number} o-layout--end{/if} u-flex-wrap">
                        <a class="u-mt-2 c-btn--underline" href="{$order.details.details_url}"
                           data-link-action="view-order-details">
                            {l s='Details' d='Shop.Theme.Customeraccount'}
                        </a>
                        <div class="u-mt-2 u-d-flex">
                            {if $order.shipping[0].tracking_number}
                                <a class="c-btn--underline"
                                   href="{$order.shipping[0].url|replace:'@':$order.shipping[0].tracking_number}">{l s='Suivre la commande' d='Shop.Theme.Actions'}</a>
                            {/if}
                            {if $order.details.reorder_url}
                                <a class="c-btn--underline u-ml-2" href="{$order.details.reorder_url}">
                                    {l s='Reorder' d='Shop.Theme.Actions'}
                                </a>
                            {/if}
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    {/if}
{/block}
