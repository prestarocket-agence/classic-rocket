{block name='product_cover'}
<div class="/js images-container">

<div class="c-snap">
        <div class="c-snap__item c-snap__item--fullw">

            {if $product.cover}
                <img class="img-fluid"
                     srcset="{$product.cover.bySize.medium_default.url} 452w,
                                   {$product.cover.bySize.pdt_180.url} 180w,
                                   {$product.cover.bySize.pdt_300.url} 300w,
                                   {$product.cover.bySize.pdt_360.url} 360w,
                                   {$product.cover.bySize.pdt_540.url} 540w"
                     src="{$product.cover.bySize.medium_default.url}"
                     alt="{$product.cover.legend}" title="{$product.cover.legend}" width="{$product.cover.bySize.pdt_540.width}" height="{$product.cover.bySize.pdt_540.height}">
                <noscript>
                    <img class="img-fluid" src="{$product.cover.bySize.medium_default.url}"
                         alt="{$product.cover.legend}">
                </noscript>
            {elseif isset($urls.no_picture_image)}
                <img class="img-fluid" src="{$urls.no_picture_image.bySize.large_default.url}">
            {/if}

        </div>

        {foreach from=$product.images item=image name="images"}
            {if $image.id_image != $product.cover.id_image}
                <div class="c-snap__item c-snap__item--fullw">
                    <div class="u-rc u-rc--1_1">


                        <img class="img-fluid lazyload"
                             {if !$smarty.foreach.images.first && !$product.cover}data-sizes="auto"{/if}
                             {if !$smarty.foreach.images.first && !$product.cover}data-{/if}srcset="{$image.bySize.medium_default.url} 452w,
                   {$image.bySize.pdt_180.url} 180w,
                   {$image.bySize.pdt_300.url} 300w,
                   {$image.bySize.pdt_360.url} 360w,
                   {$image.bySize.pdt_540.url} 540w"
                             {if !$smarty.foreach.images.first && !$product.cover}data-{/if}src="{$image.bySize.medium_default.url}"
                             alt="{$image.legend}"
                             title="{$image.legend}" width="{$image.bySize.pdt_540.width}" height="{$image.bySize.pdt_540.height}">
                        <noscript>
                            <img class="img-fluid" src="{$image.bySize.medium_default.url}" alt="{$image.legend}">
                        </noscript>
                    </div>
                </div>
            {/if}
        {/foreach}
    </div>
</div>
{/block}

