<div class="/js images-container">

{block name='product_cover'}
<div class="c-coverpdt">
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
    <div class="u-p-rel">
    <div class="c-pdt__thumbs">

        <div class="c-pdt__thumbs-list c-snap{if $count_pdt_img > 1} js-slider{/if}"{strip}{if $count_pdt_img > 1}  data-glider='
            {ldelim}
            "slidesToShow":"auto",
            "itemWidth":82,
            "slidesToScroll":"auto",
            "scrollLock":true,
            "draggable":false,
            "arrows": {ldelim}
                "prev": "#js-pdt-thumb-arrow-prev",
                "next": "#js-pdt-thumb-arrow-next"
            {rdelim}
            {rdelim}
            '{/strip}{/if}>
            {foreach from=$product.images item=image}
                <div class="c-snap__item c-pdt__thumb{if $image.id_image == $product.cover.id_image} is-thumb-selected{/if}">
                    <div class="u-rc u-rc--1_1">

                    <img
                            class="c-pdt__thumbimg img-fluid lazyload"
                            src="{$image.bySize.cart_default.url}"
                            alt="{$image.legend}"
                            title="{$image.legend}"
                            width="{$image.bySize.cart_default.width}"
                            height="{$image.bySize.cart_default.height}"
                    >
                    </div>
                </div>
            {/foreach}
        </div>

    </div>
        <button id="js-pdt-thumb-arrow-prev" class="c-btn-arrow c-btn-arrow--prev c-btn-arrow--abs">{include file="_partials/icon.tpl" icon="chevron-left" class="c-icon--20"}</button>
        <button id="js-pdt-thumb-arrow-next" class="c-btn-arrow c-btn-arrow--next c-btn-arrow--abs">{include file="_partials/icon.tpl" icon="chevron-right" class="c-icon--20"}</button>


    </div>
{/block}
</div>
{hook h='displayAfterProductThumbs'}


