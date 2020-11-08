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
    <article class="{if isset($col)}{$col}{else}col-lg-3{/if} c-pdt-mini /js js-product-miniature"
             data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
        <div class="c-pdt-mini__card u-p-rel">
            <div class="c-pdt-mini__body">
                {block name='product_brand'}
                    <div>
                        {block name='product_brand'}
                            {if isset($product_manufacturer->id)}
                                <p class="c-pdt-mini__brand">{$product_manufacturer->name}</p>
                            {/if}
                        {/block}
                        {block name='product_name'}
                            <p class="c-pdt-mini__name"><a href="{$product.canonical_url}" class="stretched-link">{$product.name}</a>
                            </p>
                        {/block}
                    </div>
                    <div>
                        {block name='product_reviews'}
                            {hook h='displayProductListReviews' product=$product}
                        {/block}
                        {block name='before_product_price_and_shipping'}{/block}
                        {block name='product_price_and_shipping'}
                            {if $product.show_price}
                                <div class="">
                                    {if !$product.has_discount}
                                        {hook h='displayProductPriceBlock' product=$product type="before_price"}
                                        <span class="c-price-sm c-price--current">{$product.price}</span>
                                    {else}
                                        {hook h='displayProductPriceBlock' product=$product type="before_price"}
                                        <span class="c-price-sm c-price--discount">{$product.price}</span>
                                        {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                        <span class="c-price-sm c-price--old">{$product.regular_price}</span>
                                    {/if}

                                    {hook h='displayProductPriceBlock' product=$product type='unit_price'}

                                    {hook h='displayProductPriceBlock' product=$product type='weight'}
                                </div>
                            {/if}
                        {/block}
                        {block name='after_product_price_and_shipping'}{/block}
                    </div>
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
                            <li class="c-flag c-flag--{$flag.type}">{$flag.label}</li>
                        {/foreach}
                        {if $product.has_discount}
                            {if $product.discount_type === 'percentage'}
                                <li class="c-flag c-flag--discount">{$product.discount_percentage}</li>
                            {elseif $product.discount_type === 'amount'}
                                <li class="c-flag c-flag--discount">{$product.discount_amount_to_display}</li>
                            {/if}
                        {/if}
                    </ul>
                {/block}
                {block name='product_variants'}
                    {if $product.main_variants}
                        {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
                    {/if}
                {/block}
                {block name='quick_view'}
                    <div class="c-pdt-mini__qv">
                        <button class="btn btn-primary btn-quick-view c-btn-circle c-btn-circle--lg  quick-view"
                                data-link-action="quickview">
                            {include file="_partials/icon.tpl" icon="eye" class="c-icon--24"}
                            <span class="sr-only">{l s='Quick view' d='Shop.Theme.Actions'}</span>
                        </button>
                    </div>
                {/block}
            </div>

        </div>
    </article>
{/block}
