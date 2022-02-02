<div class="c-pdtmodal">
    {block name='product_thumbnail_mini'}
        <div class="c-pdtmodal__media">
            {if $product.cover}
                <a href="{$product.canonical_url}">
                    <img
                            src="{$product.cover.bySize.home_default.url}"
                            alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                            data-full-size-image-url="{$product.cover.large.url}"
                            class="u-img-fluid"
                    >
                </a>
            {elseif isset($urls.no_picture_image)}
                <img src="{$urls.no_picture_image.bySize.home_default.url}" class="u-img-fluid">
            {else}
                <img src="data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==">
            {/if}

        </div>
    {/block}
    <div class="c-pdtmodal__body">
        <div>
            <a class="u-mb-1 product-title" href="{$product.canonical_url}">{$product.name}</a>
            {block name='product_reviews_mini'}
                {hook h='displayProductListReviews' product=$product}
            {/block}
            {if $product.show_price}
                {block name='product_price'}
                    <div class="u-d-flex u-align-items-center u-mb-1">
                        <span class="c-price--current{if $product.has_discount} c-price--discount{/if} u-mr-2">{$product.price}</span>
                        {block name='product_discount'}
                            {if $product.has_discount}
                                {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                <span class="c-price--old">{$product.regular_price}</span>
                            {/if}
                        {/block}
                    </div>
                {/block}
            {/if}
        </div>
        <div class="u-d-flex /js js-product-miniature" data-id-product="{$product.id}">
            <a class="btn btn-primary c-pdtmodal-btn /js quick-view" href="#" data-link-action="quickview">
                {include file="_partials/icon.tpl" icon="bag-plus" class="c-icon--center-y c-icon--24"}
            </a>
        </div>
    </div>
</div>