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
<div id="js-product-list-top" class="row products-selection my-3">
  <div class="col-lg-6 visible--desktop total-products">
    {if $listing.pagination.total_items > 1}
      <p class="product__quantity">{l s='There are %product_count% products.' d='Shop.Theme.Catalog' sprintf=['%product_count%' => $listing.pagination.total_items]}</p>
    {elseif $listing.pagination.total_items > 0}
      <p class="product__quantity">{l s='There is 1 product.' d='Shop.Theme.Catalog'}</p>
    {/if}
  </div>
  <div class="col-lg-6">
    <div class="sort-by-row justify-content-md-end">

      {block name='sort_by'}
        {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
      {/block}

      {if !empty($listing.rendered_facets)}
          <button type="button" id="search_filter_toggler" class="btn btn-secondary visible--mobile" data-target="#offcanvas_search_filter" data-toggle="modal">
            {l s='Filter' d='Shop.Theme.Actions'}
          </button>
      {/if}
    </div>
  </div>
    <div class="visible--mobile text-sm-center mt-1 col-12 ">
        {l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=[
        '%from%' => $listing.pagination.items_shown_from ,
        '%to%' => $listing.pagination.items_shown_to,
        '%total%' => $listing.pagination.total_items
        ]}
    </div>
</div>


