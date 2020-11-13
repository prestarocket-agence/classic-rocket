<div id="js-product-list-header" class="c-cat__heading c-listing__heading">
    <div id="_desktop_category_header">
        <h1 class="c-listing__title">{$category.name}{if isset($smarty.get.page) && $smarty.get.page > 1} <span
                    class="c-cat__pag small"> -
                Page {$smarty.get.page}</span>{/if}</h1>
    </div>
    {if ($category.description || $category.image.large.url) && $listing.pagination.items_shown_from == 1}
        {if $category.description}
            <div id="category-description" class="c-listing__desc">{$category.description nofilter}</div>
        {/if}

    {/if}
    {block name="subcategory__items"}
        {if $subcategories}
            <div class="c-listing__subcat u-d-flex">
                {block name="before_subcategory__items"}{/block}
                {foreach from=$subcategories item=subcategory}
                    <a href="{$subcategory.url}"
                       class="btn btn-outline-primary c-listing__subcatitem">{$subcategory.name}</a>
                {/foreach}
                {block name="after_subcategory__items"}{/block}
            </div>
        {/if}
    {/block}

</div>
<div class="_mobile_category_header"></div>
