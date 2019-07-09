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
<section class="featured-products clearfix">
  <p class="products-section-title">
    {l s='Popular Products' d='Shop.Theme.Catalog'}
  </p>
  {assign var="productscount" value=$products|count}
  <div class="products products-slick spacing-md-top{if $productscount > 1} products--slickmobile{/if}" data-slick='{strip}
    {ldelim}
    "slidesToShow": 1,
    "slidesToScroll": 1,
    "mobileFirst":true,
    "arrows":true,
    "rows":0,
    "responsive": [
      {ldelim}
        "breakpoint": 992,
        "settings":
        {if $productscount > 4}
        {ldelim}
        "arrows":true,
        "slidesToShow": 4,
        "slidesToScroll": 4,
        "arrows":true
        {rdelim}
        {else}
        "unslick"
        {/if}
      {rdelim},
      {ldelim}
        "breakpoint": 720,
        "settings":
        {if $productscount > 3}
        {ldelim}
        "arrows":true,
        "slidesToShow": 3,
        "slidesToScroll": 3
        {rdelim}
        {else}
        "unslick"
        {/if}
      {rdelim},
      {ldelim}
        "breakpoint": 540,
        "settings":
        {if $productscount > 2}
        {ldelim}
        "arrows":true,
        "slidesToShow": 2,
        "slidesToScroll": 2
        {rdelim}
        {else}
        "unslick"
        {/if}
      {rdelim}
    ]{rdelim}{/strip}'>
    {foreach from=$products item="product"}
      {include file="catalog/_partials/miniatures/product.tpl" product=$product}
    {/foreach}
    </div>
  <a class="all-product-link float-left float-md-right" href="{$allProductsLink}">
    {l s='All products' d='Shop.Theme.Catalog'}<i class="material-icons">&#xE315;</i>
  </a>
</section>
