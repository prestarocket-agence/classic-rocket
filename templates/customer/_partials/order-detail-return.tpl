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
{block name='order_products_table'}
    <form id="order-return-form" action="{$urls.pages.order_follow}" method="post" novalidate autocomplete="false">
        <div id="order-products">
            <div class="c-cart__row--border">
                {foreach from=$order.products item=product name=products}
                    <div class="c-cart__row u-mb-3">
                        <div class="c-cart__caracts">
                            {if !$product.customizations}
                                <span id="_desktop_product_line_{$product.id_order_detail}" class="">
                                    <input type="checkbox" id="cb_{$product.id_order_detail}"
                                           name="ids_order_detail[{$product.id_order_detail}]"
                                           value="{$product.id_order_detail}"
                                           class="u-mr-1">
                                  </span>
                            {else}
                                {foreach $product.customizations  as $customization}
                                    <span id="_desktop_product_customization_line_{$product.id_order_detail}_{$customization.id_customization}"
                                          class="">
                                      <input type="checkbox" id="cb_{$product.id_order_detail}"
                                             name="customization_ids[{$product.id_order_detail}][]"
                                             value="{$customization.id_customization}"
                                             class="u-mr-1">
                                    </span>
                                {/foreach}
                            {/if}
                            <div class="u-mr-3">
                                <img class="c-cart__img" src="{$product.cover.bySize.cart_default.url}"
                                     alt="{$product.name|escape:'quotes'}"
                                     width="{$product.cover.bySize.cart_default.width}"
                                     height="{$product.cover.bySize.cart_default.height}">
                            </div>
                            <div>
                                <p class="u-h5">
                                    <a {if isset($product.download_link)}href="{$product.download_link}"{/if}>
                                        {$product.name}
                                    </a>
                                </p>

                                {if $product.reference}
                                    <div>
                                        <span class="u-txt-dark">{l s='Reference' d='Shop.Theme.Catalog'} : </span>
                                        <span class="">{$product.reference}</span>
                                    </div>
                                {/if}
                                <div>
                                    <span class="u-txt-dark">{l s='Quantity' d='Shop.Theme.Catalog'} : </span>
                                    <span>
                                        {if $product.customizations}
                                            {foreach $product.customizations as $customization}
                                                {$customization.quantity}
                                            {/foreach}
                                        {else}
                                            {$product.quantity}
                                        {/if}
                                    </span>
                                </div>

                                {if $product.customizations}
                                    {foreach from=$product.customizations item="customization"}
                                        <div class="customization">
                                            <a href="#" data-toggle="modal"
                                               data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                                        </div>
                                        <div id="_desktop_product_customization_modal_wrapper_{$customization.id_customization}">
                                            <div class="modal fade customization-modal"
                                                 id="product-customizations-modal-{$customization.id_customization}"
                                                 tabindex="-1" role="dialog" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="{l s='Close' d='Shop.Theme.Global'}">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                            <h4 class="modal-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            {foreach from=$customization.fields item="field"}
                                                                <div class="product-customization-line row">
                                                                    <div class="col-sm-3 col-4 label">
                                                                        {$field.label}
                                                                    </div>
                                                                    <div class="col-sm-9 col-8 value">
                                                                        {if $field.type == 'text'}
                                                                            {if (int)$field.id_module}
                                                                                {$field.text nofilter}
                                                                            {else}
                                                                                {$field.text}
                                                                            {/if}
                                                                        {elseif $field.type == 'image'}
                                                                            <img src="{$field.image.small.url}">
                                                                        {/if}
                                                                    </div>
                                                                </div>
                                                            {/foreach}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                {/if}

                                <div class="u-d-flex u-align-items-center u-mt-2">
                                    {if !$product.customizations}
                                        {if $product.quantity > $product.qty_returned}
                                            <span class="u-mr-1">{l s='Quantité à retourner' d='Shop.Theme.Catalog'} :</span>
                                            <div class="select" id="_desktop_return_qty_{$product.id_order_detail}">
                                                <select name="order_qte_input[{$product.id_order_detail}]"
                                                        class="custom-select">
                                                    {section name=quantity start=1 loop=$product.quantity+1-$product.qty_returned}
                                                        <option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
                                                    {/section}
                                                </select>
                                            </div>
                                        {else}
                                            <span>{l s='Article retourné' d='Shop.Theme.Catalog'}</span>
                                        {/if}
                                    {else}
                                        {foreach $product.customizations as $customization}
                                            <div class="current">
                                                {$customization.quantity}
                                            </div>
                                            <div class="select"
                                                 id="_desktop_return_qty_{$product.id_order_detail}_{$customization.id_customization}">
                                                <select
                                                        name="customization_qty_input[{$customization.id_customization}]"
                                                        class="form-control form-control-select"
                                                >
                                                    {section name=quantity start=1 loop=$customization.quantity+1}
                                                        <option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
                                                    {/section}
                                                </select>
                                            </div>
                                        {/foreach}
                                        <div class="clearfix"></div>
                                    {/if}
                                </div>
                            </div>
                        </div>

                        <div>
                            <div class="c-cart__price">
                                <span>{$product.price}</span>
                                <span class="u-font-weight-bold u-ml-4">{l s='Total' d='Shop.Theme.Catalog'} : {$product.total}</span>
                            </div>
                        </div>
                    </div>
{*                    <div class="u-d-flex u-justify-content-between">*}
{*                        <div class="u-d-flex">*}
{*                            <span class="u-mr-1">{l s='Returned' d='Shop.Theme.Customeraccount'} :</span>*}
{*                            <span class="u-font-weight-bold">{$product.qty_returned}</span>*}
{*                        </div>*}
{*                        <div class="u-d-flex">*}
{*                            <span class="u-mr-1">{l s='Unit price' d='Shop.Theme.Catalog'} :</span>*}
{*                            <span class="u-font-weight-bold">{$product.price}</span>*}
{*                        </div>*}
{*                        <div class="u-d-flex">*}
{*                            <span class="u-mr-1">{l s='Total price' d='Shop.Theme.Catalog'} :</span>*}
{*                            <span class="u-font-weight-bold">{$product.total}</span>*}
{*                        </div>*}
{*                    </div>*}
                    {if !$smarty.foreach.products.last}
                        <hr class="u-mb-3">
                    {/if}
                {/foreach}
            </div>

            <div class="order-totals u-mb-4">
                {foreach $order.subtotals as $line}
                    {if $line.value}
                        <div class="o-layout c-cart__row--border line-{$line.type}">
                            <span>{$line.label}</span>
                            <span>{$line.value|ucfirst}</span>
                        </div>
                    {/if}
                {/foreach}
                <div class="o-layout line-{$order.totals.total.type}">
                    <span>{$order.totals.total.label}</span>
                    <span>{$order.totals.total.value|ucfirst}</span>
                </div>
            </div>

            <div>
                <header>
                    <h3>{l s='Merchandise return' d='Shop.Theme.Customeraccount'}</h3>
                    <p>{l s='If you wish to return one or more products, please mark the corresponding boxes and provide an explanation for the return. When complete, click the button below.' d='Shop.Theme.Customeraccount'}</p>
                </header>
                <section class="form-fields">
                    <div class="form-group">
                        <textarea cols="67" rows="3" name="returnText" class="form-control" required></textarea>
                        <div class="invalid-feedback js-invalid-feedback-browser"></div>
                    </div>
                </section>
                <footer class="form-footer">
                    <input type="hidden" name="id_order" value="{$order.details.id}">
                    <button class="form-control-submit btn btn-primary" type="submit" name="submitReturnMerchandise">
                        {l s='Request a return' d='Shop.Theme.Customeraccount'}
                    </button>
                </footer>
            </div>
        </div>
    </form>
{/block}