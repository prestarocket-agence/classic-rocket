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
    <article class="{if isset($col)}{$col}{else}col-lg-3{/if} c-pdt-mini__card /js js-product-miniature"
             data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
        <a href="{$product.url}" class="/js rc">
            {block name='product_thumbnail'}
                <div class="c-pdt-mini__thumbnail">
                    {if $product.cover}
                        <img
                                data-src="{$product.cover.bySize.home_default.url}"
                                alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                                data-full-size-image-url="{$product.cover.large.url}"
                                class="u-img-fluid lazyload"
                        >
                    {elseif isset($urls.no_picture_image)}
                        <img class="u-img-fluid lazyload" src="{$urls.no_picture_image.bySize.home_default.url}">
                    {else}
                        <img class="u-img-fluid lazyload"
                             src="data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==">
                    {/if}

                    {block name='product_flags'}
                        {if $product.has_discount && $product.discount_type === 'percentage'}
                            <div class="c-tag c-tag--discount c-pdt-mini__tag">{$product.discount_percentage}</div>
                        {/if}
                    {/block}
                </div>
            {/block}
            {*                <div class="highlighted-informations text-center p-2{if !$product.main_variants} no-variants{/if} visible--desktop">*}
            {*                    {block name='quick_view'}*}
            {*                        <span class="quick-view" data-link-action="quickview">*}
            {*                      <i class="material-icons search">&#xE8B6;</i> {l s='Quick view' d='Shop.Theme.Actions'}*}
            {*                  </span>*}
            {*                    {/block}*}

            {*                    {block name='product_variants'}*}
            {*                        {if $product.main_variants}*}
            {*                            {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}*}
            {*                        {/if}*}
            {*                    {/block}*}
            {*                </div>*}

            {* end card-img-top*}

            <div>
                {block name='product_name'}
                    <p class="u-txt-sm u-mb-1 u-txt-black">{$product.name|truncate:40:'...'}</p>
                {/block}

                {*                    {block name='product_reviews'}*}
                {*                        {hook h='displayProductListReviews' product=$product}*}
                {*                    {/block}*}


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
            </div>
            {* end card body*}

            {*            {block name='product_flags'}*}
            {*                <ul>*}
            {*                    {foreach from=$product.flags item=flag}*}
            {*                        <li class="{$flag.type}">{$flag.label}</li>*}
            {*                    {/foreach}*}
            {*                    {if $product.has_discount}*}
            {*                        {if $product.discount_type === 'percentage'}*}
            {*                            <li class="">{$product.discount_percentage}</li>*}
            {*                        {elseif $product.discount_type === 'amount'}*}
            {*                            <li class="">{$product.discount_amount_to_display}</li>*}
            {*                        {/if}*}
            {*                    {/if}*}
            {*                </ul>*}
            {*            {/block}*}
            {* end card product*}

        </a>
    </article>
{/block}
