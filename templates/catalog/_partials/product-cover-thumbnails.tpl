{block name='product_cover'}
<div class="c-coverpdt /js images-container">
{assign count_pdt_img $product.images|count}
<div class="c-snap{if $count_pdt_img > 1} js-slider{/if}"{strip}{if $count_pdt_img > 1}  data-glider='
            {ldelim}
            "slidesToShow":1,
            "slidesToScroll":1,
            "draggable":false,
            "dots":"#pdt-dots",
            "arrows": {ldelim}
                "prev": "#pdt-arrow-prev",
                "next": "#pdt-arrow-next"
            {rdelim}
            {rdelim}
            '{/strip}{/if}>
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

    <div id="pdt-dots">put btn glider visible hidden</div>
    <div id="pdt-arrow-prev"></div>
    <div id="pdt-arrow-next"></div>
{/block}

{block name='product_images'}
    <div class="js-qv-mask mask">
        <ul class="product-images js-qv-product-images">
            {foreach from=$product.images item=image}
                <li class="thumb-container">
                    <img
                            class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
                            data-image-medium-src="{$image.bySize.medium_default.url}"
                            data-image-large-src="{$image.bySize.large_default.url}"
                            src="{$image.bySize.home_default.url}"
                            alt="{$image.legend}"
                            title="{$image.legend}"
                            width="100"
                            itemprop="image"
                    >
                </li>
            {/foreach}
        </ul>
    </div>
{/block}
{hook h='displayAfterProductThumbs'}


