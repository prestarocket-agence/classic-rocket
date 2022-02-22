{*
 * This file allows you to customize your search page.
 * You can safely remove it if you want it to appear exactly like all other product listing pages
 *}
{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}
    <div class="c-listing__heading">
        <h1 id="js-product-list-header" class="c-listing__title">{$listing.label}</h1>
    </div>
{/block}