<div class="c-catalog__header">
    <div id="_desktop_category_header">
        <p class="u-h1 u-mb-3">{$category.name}{if isset($smarty.get.page) && $smarty.get.page > 1} <span class="small"> -
                Page {$smarty.get.page}</span>{/if}</p>
    </div>
    {if ($category.description || $category.image.large.url) && $listing.pagination.items_shown_from == 1}
    {if $category.description}
        <p id="category-description" class="u-txt-lead u-mb-0">{$category.description nofilter}</p>
    {/if}
    {*            {if $category.image.large.url}*}
    {*                <div class="category-cover">*}
    {*                    <img src="{$category.image.large.url}" class="lazyload"*}
    {*                         alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}">*}
    {*                </div>*}
    {*            {/if}*}
    {/if}

</div>
<div class="_mobile_category_header"></div>
