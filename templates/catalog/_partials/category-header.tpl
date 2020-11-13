<div class="c-cat__heading">
    <div id="_desktop_category_header">
        <h1 class="c-listing__title">{$category.name}{if isset($smarty.get.page) && $smarty.get.page > 1} <span class="c-cat__pag small"> -
                Page {$smarty.get.page}</span>{/if}</h1>
    </div>
    {if ($category.description || $category.image.large.url) && $listing.pagination.items_shown_from == 1}
        {if $category.description}
            <div id="category-description" class="c-cat__desc">{$category.description nofilter}</div>
        {/if}

    {/if}

</div>
<div class="_mobile_category_header"></div>
