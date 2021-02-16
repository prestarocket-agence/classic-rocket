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
    {if !isset($modules.prestarockettheme.product.product_layout)}{assign var="product_layout" value="collapse"}
    {else}
        {assign var="product_layout" value=$modules.prestarockettheme.product.product_layout}
    {/if}
    {assign classPdtTab "c-collapse__body /js collapse"}
    {assign classPdtTabActive " show"}
    {if $product_layout === "tabs"}
        {assign classPdtTab "tab-pane fade"}
    {elseif $product_layout === "columns"}
        {assign classPdtTab ""}
        {assign classPdtTabActive ""}
    {/if}
    <section id="main" class="s-product-layout-{$product_layout} /js product-container">
        <div class="row">

            <div class="col-lg-5 offset-lg-1 u-order-1">
                {block name='page_header_container'}
                    {block name='page_header'}
                        <h1 class="c-pdt__title">{block name='page_title'}{$product.name}{/block}</h1>
                    {/block}
                {/block}
                {block name='after_product_title'}
                {/block}
                {block name='product_prices'}
                    {include file='catalog/_partials/product-prices.tpl'}
                {/block}
                {block name='after_product_price'}
                {/block}

                <div class="product-information">
                    {if $product.is_customizable && count($product.customizations.fields)}
                        {block name='product_customization'}
                            {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
                        {/block}
                    {/if}

                    <div class="/js product-actions">
                        {block name='product_buy'}
                            <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                                <input type="hidden" name="token" value="{$static_token}">
                                <input type="hidden" name="id_product" value="{$product.id}"
                                       id="product_page_product_id">
                                <input type="hidden" name="id_customization" value="{$product.id_customization}"
                                       id="product_customization_id">

                                {block name='product_variants'}
                                    {include file='catalog/_partials/product-variants.tpl'}
                                {/block}


                                {block name='product_discounts'}
                                    {include file='catalog/_partials/product-discounts.tpl'}
                                {/block}

                                {block name='product_add_to_cart'}
                                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                                {/block}

                                {block name='product_description_short'}
                                    <div id="product-description-short-{$product.id}" class="s-cms">{$product.description_short nofilter}</div>
                                {/block}

                                {block name='product_additional_info'}
                                    {include file='catalog/_partials/product-additional-info.tpl'}
                                {/block}

                                {block name='product_refresh'}
                                    {if !isset($product.product_url)}
                                        <input class="product-refresh ps-hidden-by-js" name="refresh" type="submit"
                                               value="{l s='Refresh' d='Shop.Theme.Actions'}">
                                    {/if}
                                {/block}
                            </form>
                        {/block}

                    </div>

                    {block name='block_after_product_action'}
                    {/block}

                    {block name='hook_display_reassurance'}
                        {hook h='displayReassurance'}
                    {/block}


                </div>
                {if $product_layout == "collapse"}
                    {block name='product_tabs'}
                        {include file='catalog/_partials/product-tabs.tpl'}
                    {/block}
                {/if}
            </div>

            <div class="col-lg-6 u-order-0">
                {block name='page_content_container'}
                    <section class="page-content--product u-sticky u-mb-4" id="content">
                        {block name='page_content'}
                          {block name='product_flags'}
                              {include file='catalog/_partials/product-flags.tpl'}
                          {/block}

                            {block name='product_cover_thumbnails'}
                                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                            {/block}

                        {/block}
                    </section>
                {/block}
            </div>
        </div>

        {block name='product_pack'}
            {if $packItems}
                {include file='catalog/_partials/product-pack.tpl'}
            {/if}
        {/block}
        {if $product_layout != "collapse"}
            {block name='product_tabs'}
                {include file='catalog/_partials/product-tabs.tpl' product_layout=$product_layout}
            {/block}
        {/if}
        {block name='product_accessories'}
            {if $accessories}
                {include file='catalog/_partials/product-accessories.tpl'}
            {/if}
        {/block}

        {block name='product_footer'}
            {hook h='displayFooterProduct' product=$product category=$category}
        {/block}

        {block name='product_images_modal'}
            {include file='catalog/_partials/product-images-modal.tpl'}
        {/block}

        {block name='page_footer_container'}
            <footer class="page-footer">{block name='page_footer'}{/block}</footer>
        {/block}
    </section>
{/block}
