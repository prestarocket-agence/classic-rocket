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
        <div class="c-pdt-mini__card">
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
            </div>
            <div class="c-pdt-mini__body">
                {block name='product_brand'}
                    {if isset($product_manufacturer->id)}
                        <p class="c-pdt-mini__brand">{$product_manufacturer->name}</p>
                    {/if}
                {/block}
                {block name='product_name'}
                    <p class="c-pdt-mini__name">{$product.name}</p>
                {/block}
            </div>
        </div>
    </article>
{/block}
