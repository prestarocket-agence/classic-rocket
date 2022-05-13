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
{*{block name='cart_summary_product_line'}*}
{*    <a href="{$product.url}" title="{$product.name}" class="mr-3">*}
{*      <img class="media-object" src="{$product.cover.small.url}" alt="{$product.name}" width="50">*}
{*    </a>*}
{*  <div class="media-body small">*}
{*    <div class="product-name">{$product.name}</div>*}
{*    <div class="clearfix">*}
{*      <span class="product-quantity float-left">x{$product.quantity}</span>*}
{*      <span class="product-price float-right">{$product.price}</span>*}
{*    </div>*}
{*    {hook h='displayProductPriceBlock' product=$product type="unit_price"}*}
{*  {foreach from=$product.attributes key="attribute" item="value"}*}
{*      <div class="product-line-info product-line-info-secondary text-muted small">*}
{*          <span class="label">{$attribute}:</span>*}
{*          <span class="value">{$value}</span>*}
{*      </div>*}
{*  {/foreach}*}

{*  </div>*}
{*{/block}*}

<div class="c-pdtmodal">
    {block name='product_thumbnail_mini'}
        <div class="c-pdtmodal__media">
            {if $product.cover}
                <a href="{$product.canonical_url}">
                    <img
                            src="{$product.cover.bySize.home_default.url}"
                            alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                            data-full-size-image-url="{$product.cover.large.url}"
                            class="u-img-fluid"
                    >
                </a>
            {elseif isset($urls.no_picture_image)}
                <img src="{$urls.no_picture_image.bySize.home_default.url}" class="u-img-fluid">
            {else}
                <img src="data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==">
            {/if}
        </div>
    {/block}
    <div class="c-pdtmodal__body">
        <div>
            <a class="u-mb-1 product-title" href="{$product.canonical_url}">{$product.name}</a>
            {block name='product_reviews_mini'}
                {hook h='displayProductListReviews' product=$product}
            {/block}
            {if $product.show_price}
                {block name='product_price'}
                    <div class="u-d-flex u-align-items-center u-mb-1">
                        <span class="c-price--current{if $product.has_discount} c-price--discount{/if} u-mr-2">{splitprice price=$product.price}</span>
                        {block name='product_discount'}
                            {if $product.has_discount}
                                {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                <span class="c-price--old">{$product.regular_price}</span>
                            {/if}
                        {/block}
                    </div>
                {/block}
            {/if}
            <div class="product-line-info product-line-info-secondary text-muted small">
                <span class="label">{l s='Quantité: ' d='Shop.Theme.Checkout'}</span>
                <span class="value">{$product.quantity}</span>
            </div>
            {foreach from=$product.attributes key="attribute" item="value"}
                <div class="product-line-info product-line-info-secondary text-muted small">
                    <span class="label">{$attribute}:</span>
                    <span class="value">{$value}</span>
                </div>
            {/foreach}
        </div>
    </div>
</div>
