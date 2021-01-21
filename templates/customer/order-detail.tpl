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

{block name='main_account_class'}
{/block}

{*{block name='page_title'}*}
{*    {l s='Order details' d='Shop.Theme.Customeraccount'}*}
{*{/block}*}

{block name='page_content'}
    <div class="c-panel c-panel--lg">
        <h2 class="c-panel__head u-h2">{l s='Order details' d='Shop.Theme.Customeraccount'}</h2>
        {block name='order_infos'}
            <div class="c-history__item">
                <div id="order-infos" class="c-history__infos">
                    <div class="row u-w-100">
                        <div class="col-6 col-lg-4 c-history__data">
                            <span class="u-txt-sm u-txt-dark u-mb-1">{l s='Order reference' d='Shop.Theme.Checkout'}</span>
                            <span class="u-font-weight-bold">{$order.details.reference}</span>
                        </div>
                        <div class="col-6 col-lg-4 c-history__data">
                            <span class="u-txt-sm u-txt-dark u-mb-1">{l s='Date' d='Shop.Theme.Checkout'}</span>
                            <span class="u-font-weight-bold">{$order.details.order_date}</span>
                        </div>
                        <div class="col-6 col-lg-4 c-history__data">
                            <span class="u-txt-sm u-txt-dark u-mb-1">{l s='Status' d='Shop.Theme.Checkout'}</span>
                            <span class="u-font-weight-bold">{$order.history.current.ostate_name}</span>
                        </div>
                    </div>
                    {if $order.details.reorder_url}
                        <a href="{$order.details.reorder_url}"
                           class="c-btn--underline u-mb-2">{l s='Reorder' d='Shop.Theme.Actions'}</a>
                    {/if}
                </div>
            </div>
            <div class="c-history__item">
                {block name='addresses'}
                    <div class="row">
                        {if $order.addresses.delivery}
                            <div class="col-12 col-lg-6 c-history__data">
                                <article id="delivery-address" class="address">
                                    <p class="u-h6">
                                        {include file="_partials/icon.tpl" icon="house-door" class="c-icon--16 u-mr-1"}
                                        {l s='Delivery address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.invoice.alias]}
                                    </p>
                                    <address class="u-mb-0">
                                        {$order.addresses.delivery.formatted nofilter}
                                    </address>
                                </article>
                            </div>
                        {/if}

                        <div class="col-12 col-lg-6 c-history__data">
                            <article id="delivery-address" class="address">
                                <p class="u-h6">
                                    {l s='Invoice address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.invoice.alias]}
                                </p>
                                <address class="u-mb-0">
                                    {$order.addresses.invoice.formatted nofilter}
                                </address>
                            </article>
                        </div>
                    </div>
                {/block}
            </div>
            <div class="row">
                <div class="col-12 col-lg-6 c-history__data">
                <span class="u-font-weight-bold u-mb-1">
                    {include file="_partials/icon.tpl" icon="truck" class="c-icon--16 u-mr-1"}
                    {l s='Carrier' d='Shop.Theme.Checkout'}
                </span>
                    {$order.carrier.name}</div>
                <div class="col-12 col-lg-6 c-history__data">
                <span class="u-font-weight-bold u-mb-1">
                    {include file="_partials/icon.tpl" icon="credit-card" class="c-icon--16 u-mr-1"}
                    {l s='Payment method' d='Shop.Theme.Checkout'}
                </span>
                    {$order.details.payment}
                </div>

                {if $order.details.invoice_url}
                    <li>
                        <a href="{$order.details.invoice_url}">
                            {l s='Download your invoice as a PDF file.' d='Shop.Theme.Customeraccount'}
                        </a>
                    </li>
                {/if}

                {if $order.details.recyclable}
                    <li>
                        {l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.Customeraccount'}
                    </li>
                {/if}

                {if $order.details.gift_message}
                    <li>{l s='You have requested gift wrapping for this order.' d='Shop.Theme.Customeraccount'}</li>
                    <li>{l s='Message' d='Shop.Theme.Customeraccount'} {$order.details.gift_message nofilter}</li>
                {/if}
            </div>
        {/block}
    </div>
    <div class="c-panel c-panel--lg">
        <p class="c-panel__head u-h3">{l s='Articles' d='Shop.Theme.Customeraccount'}</p>
        {block name='order_detail'}
            {if $order.details.is_returnable}
                {include file='customer/_partials/order-detail-return.tpl'}
            {else}
                {include file='customer/_partials/order-detail-no-return.tpl'}
            {/if}
        {/block}
    </div>
    {block name='order_carriers'}
        {if $order.shipping}
            <div class="c-panel c-panel--lg">
                <p class="c-panel__head u-h3">{l s='Livraison' d='Shop.Theme.Customeraccount'}</p>
                <div class="u-d-desktop">
                    <table class="table table-bordered table-striped">
                        <thead class="thead-default">
                        <tr>
                            <th>{l s='Date' d='Shop.Theme.Global'}</th>
                            <th>{l s='Carrier' d='Shop.Theme.Checkout'}</th>
                            <th>{l s='Weight' d='Shop.Theme.Checkout'}</th>
                            <th>{l s='Shipping cost' d='Shop.Theme.Checkout'}</th>
                            <th>{l s='Tracking number' d='Shop.Theme.Checkout'}</th>
                        </tr>
                        </thead>
                        <tbody>
                        {foreach from=$order.shipping item=line}
                            <tr>
                                <td>{$line.shipping_date}</td>
                                <td>{$line.carrier_name}</td>
                                <td>{$line.shipping_weight}</td>
                                <td>{$line.shipping_cost}</td>
                                <td>{$line.tracking nofilter}</td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                </div>
                <div class="u-d-mobile u-mb-5 shipping-lines">
                    {foreach from=$order.shipping item=line}
                        <div class="shipping-line">
                            <ul>
                                <li>
                                    <strong>{l s='Date' d='Shop.Theme.Global'}</strong> {$line.shipping_date}
                                </li>
                                <li>
                                    <strong>{l s='Carrier' d='Shop.Theme.Checkout'}</strong> {$line.carrier_name}
                                </li>
                                <li>
                                    <strong>{l s='Weight' d='Shop.Theme.Checkout'}</strong> {$line.shipping_weight}
                                </li>
                                <li>
                                    <strong>{l s='Shipping cost' d='Shop.Theme.Checkout'}</strong> {$line.shipping_cost}
                                </li>
                                <li>
                                    <strong>{l s='Tracking number' d='Shop.Theme.Checkout'}</strong> {$line.tracking nofilter}
                                </li>
                            </ul>
                        </div>
                    {/foreach}
                </div>
            </div>
        {/if}
    {/block}
    {block name='order_messages'}
        <div class="c-panel c-panel--lg">
            {include file='customer/_partials/order-messages.tpl'}
        </div>
    {/block}
{/block}
