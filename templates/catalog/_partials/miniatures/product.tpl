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
{block name='product_miniature_item'}
    <article class="{if isset($col)}{$col}{else}col-lg-3{/if} c-pdt-mini u-p-rel /js js-product-miniature"
             data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
        {block name='after_opening_product_mini_tag'}{/block}
        <div class="c-pdt-mini__card u-p-rel">
            {block name='after_opening_product_mini_card'}{/block}
            <div class="c-pdt-mini__body">
                {block name='product_body'}
                    <div>
                        {block name='product_brand'}
                            {*{if $product.manufacturer_name}*}
                                {*<p class="c-pdt-mini__brand">{$product.manufacturer_name}</p>*}
                            {*{/if}*}
                        {/block}
                        {block name='product_name'}
                            <a href="{$product.canonical_url}" class="c-pdt-mini__name stretched-link /js js-hover-pdt">{$product.name}</a>
                        {/block}
                    </div>
                    <div>
                        {block name='product_reviews'}
                            {hook h='displayProductListReviews' product=$product}
                        {/block}
                        {block name='before_product_price_and_shipping'}{/block}
                        {block name='product_price_and_shipping'}
                            {if $product.show_price}
                                <div class="c-pdt-mini__prices u-mb-1">
                                    {if !$product.has_discount}
                                        {hook h='displayProductPriceBlock' product=$product type="before_price"}
                                        <span class="c-price c-price--current">{splitprice price=$product.price}</span>
                                    {else}
                                        {hook h='displayProductPriceBlock' product=$product type="before_price"}
                                        <span class="c-price c-price--discount">{splitprice price=$product.price}</span>
                                        {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                        <span class="c-price c-price--old">{splitprice price=$product.regular_price}</span>
                                    {/if}
                                    {if $product.has_discount}
                                            <span class="c-tag c-price--tagdiscount">{if $product.discount_type === 'percentage'}{$product.discount_percentage}{else}{$product.discount_amount_to_display}{/if}</span>
                                    {/if}
                                </div>
                                {hook h='displayProductPriceBlock' product=$product type='unit_price'}

                                {hook h='displayProductPriceBlock' product=$product type='weight'}
                            {/if}
                        {/block}
                        {block name='after_product_price_and_shipping'}{/block}
                    </div>
                    {block name='product_variants'}
                        {if $product.main_variants}
                            {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
                        {/if}
                    {/block}
                    {block name='product_body_footer'}
                        {*
                        add data-show-modal to btn if you want to show modal add to cart
                        <form class="c-addcartlist" action="{$urls.pages.cart}" method="post" data-form-id-product="{$product.id}">*}
                            {*<input type="hidden" value="{$product.id_product}" name="id_product">*}
                            {*<input type="text" class="input-group form-control" name="qty" value="{if $product.minimal_quantity < 1}1{else}{$product.minimal_quantity}{/if}">*}
                            {*<button data-button-action="add-to-cart-list" data-show-modal {if !$product.add_to_cart_url}disabled{/if}{if $product.show_quantities} data-stock="{$product.quantity}"{/if} data-allow-oosp="{$product.allow_oosp}" data-min="{$product.minimal_quantity}" data-id_product="{$product.id}" class="btn btn-primary c-addcartlist__btn /js js-btn-addcartlist">*}
                                {*<span class="spinner-border spinner-border-sm c-addcartlist__loading u-mr-1" role="status">*}
                                    {*<span class="sr-only">{l s='Loading...' d='Shop.Theme.Global'}</span>*}
                                {*</span>{l s='Add to cart' d='Shop.Theme.Actions'}*}
                            {*</button>*}
                        {*</form>*}
                    {/block}
                {/block}
            </div>
            <div class="c-pdt-mini__thumb">
                {block name='product_thumbnail'}
                    <div class="u-rc u-rc--pdt">
                        {if $product.cover}
                            <img data-src="{$product.cover.bySize.pdt_540.url}"
                                 alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                                 class="c-pdt-mini__img u-img-fluid /js lazyload"
                                 width="{$product.cover.bySize.pdt_540.width}"
                                 height="{$product.cover.bySize.pdt_540.height}">
                        {else}
                            <img data-src="{$urls.no_picture_image.bySize.home_default.url}"
                                 alt="{$product.name|truncate:30:'...'}"
                                 class="c-pdt-mini__img u-img-fluid /js lazyload">
                        {/if}
                    </div>
                {/block}
                {block name='product_flags'}
                    <ul class="c-pdt-mini__flags u-mb-0">
                        {foreach from=$product.flags item=flag}
                            {if $flag.type !== "discount"}
                                <li class="c-tag c-tag--{$flag.type}">{$flag.label}</li>
                            {/if}
                        {/foreach}

                    </ul>
                {/block}

                {block name='quick_view'}
                    <div class="c-pdt-mini__qv">
                        <button class="btn btn-primary btn-quick-view c-btn-circle c-btn-circle--lg /js quick-view"
                                data-link-action="quickview">
                            {include file="_partials/icon.tpl" icon="eye" class="c-icon--24"}
                            <span class="sr-only">{l s='Quick view' d='Shop.Theme.Actions'}</span>
                        </button>
                    </div>
                {/block}
            </div>
            {block name='before_opening_product_mini_card'}{/block}
        </div>
        {block name='before_closing_product_mini_tag'}{/block}
    </article>
{/block}
