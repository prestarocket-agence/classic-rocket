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
{block name='bodyClass'} s-listing{/block}

{block name='content'}
    <div id="main" class="{block name='mainListingClass'}{/block}">

        {block name='product_list_header'}
            <div class="c-listing__heading">

                <h1 id="js-product-list-header" class="c-listing__title">{$listing.label}</h1>
            </div>
        {/block}
        {block name='before_products'}
        {/block}


        <section id="products" class="">
            {if $listing.products|count}

                {block name='product_list_top'}
                    {include file='catalog/_partials/products-top.tpl' listing=$listing}
                {/block}

                {block name='product_list_active_filters'}
                    <div class="visible--desktop">
                        {$listing.rendered_active_filters nofilter}
                    </div>
                {/block}
                <div>
                    {block name='product_list'}
                        {include file='catalog/_partials/products.tpl' listing=$listing}
                    {/block}
                </div>
                <div id="js-product-list-bottom">
                    {block name='product_list_bottom'}
                        {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
                    {/block}
                </div>
            {else}
                <div id="js-product-list-top"></div>
                {block name="product_list_no_pdt"}
                    <div id="js-product-list">
                        {include file='errors/not-found.tpl'}
                    </div>
                {/block}
                <div id="js-product-list-bottom"></div>
            {/if}
        </section>

    </div>
    {block name='product_list_after_bottom'}
    {/block}
{/block}


