{block name='product_cover'}
    {if $product.cover}
    <div class="c-slider__item c-pdt__cover">
        <div class="">
            <img class="img-fluid"
                 srcset="{$product.cover.bySize.medium_default.url} 452w,
                                   {$product.cover.bySize.pdt_180.url} 180w,
                                   {$product.cover.bySize.pdt_300.url} 300w,
                                   {$product.cover.bySize.pdt_360.url} 360w,
                                   {$product.cover.bySize.pdt_540.url} 540w"
                 src="{$product.cover.bySize.medium_default.url}"
                 alt="{$product.cover.legend}" title="{$product.cover.legend}">
    {elseif isset($urls.no_picture_image)}
            <img class="img-fluid" src="{$urls.no_picture_image.bySize.large_default.url}">
    {/if}
        </div>
    {if $product.cover}
        <noscript>
            <img class="img-fluid" src="{$product.cover.bySize.medium_default.url}"
                 alt="{$product.cover.legend}">
        </noscript>
    {/if}
    </div>
{/block}