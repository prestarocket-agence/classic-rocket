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
{*        <div class="u-d-flex /js js-product-miniature" data-id-product="{$product.id}">*}
{*            <a class="btn btn-primary c-pdtmodal-btn /js quick-view" href="#" data-link-action="quickview">*}
{*                {include file="_partials/icon.tpl" icon="bag-plus" class="c-icon--center-y c-icon--24"}*}
{*            </a>*}
{*        </div>*}
        <form action="{$urls.pages.cart}" method="post" data-form-id-product="{$product.id}" class="u-ml-auto">
            <input type="hidden" value="{$product.id_product}" name="id_product">
            <input type="hidden" name="qty"
                   value="{if $product.minimal_quantity < 1}1{else}{$product.minimal_quantity}{/if}">
            <button data-button-action="add-to-cart-list"
                    {if !$product.add_to_cart_url}disabled{/if}{if $product.show_quantities} data-stock="{$product.quantity}"{/if}
                    data-allow-oosp="{$product.allow_oosp}" data-min="{$product.minimal_quantity}"
                    data-id_product="{$product.id}"
                    class="btn btn-primary c-pdtmodal-btn /js js-btn-addcartlist">
                {include file="_partials/icon.tpl" icon="bag-plus" class="c-icon--center-y c-icon--24"}
                <span class="spinner-border spinner-border-sm c-addcartlist__loading u-mr-1" role="status">
                    <span class="sr-only">{l s='Loading...' d='Shop.Theme.Global'}</span>
                </span>
                <span class="sr-only u-ml-1">{l s='Ajouter au panier' d='Shop.theme.Global'}</span>
            </button>
        </form>
    </div>
</div>