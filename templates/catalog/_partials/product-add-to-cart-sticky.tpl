<div id="js-addtocart-sticky">
    <div class="c-addcartsticky">
        <div class="o-wrapper">
            <div class="c-addcartsticky__container">
                <div class="c-addcartsticky__leftside u-d-desktop">
                    {*                    <a href="{$urls.base_url}" class="c-header__logo">*}
                    {*                        <img src="{if isset($modules.prestarockettheme.logo)}{$modules.prestarockettheme.logo.url}{else}{$shop.logo}{/if}"*}
                    {*                             alt="{$shop.name}" width="80" height="50">*}
                    {*                    </a>*}
                    <div class="c-addcartsticky__img">
                        {if $product.cover}
                            <img class="u-img-fluid lazyload"
                                 srcset="{$product.cover.bySize.small_default.url}"
                                 src="{$product.cover.bySize.small_default.url}"
                                 alt="{$product.cover.legend}" title="{$product.cover.legend}"
                                 width="{$product.cover.bySize.small_default.width}"
                                 height="{$product.cover.bySize.small_default.height}">
                            <noscript>
                                <img class="img-fluid" src="{$product.cover.bySize.small_default.url}"
                                     alt="{$product.cover.legend}">
                            </noscript>
                        {elseif isset($urls.no_picture_image)}
                            <img class="u-img-fluid lazyload" src="{$urls.no_picture_image.bySize.small_default.url}">
                        {/if}
                    </div>
                    <div>
                        <p class="u-h3 u-mb-0">{$product.name}</p>
                        <a href="#description" class="u-txt-xs u-txt-dark">Plus de details</a>
                        {if $product.show_availability && $product.availability_message && ($product.availability == 'available' || $product.availability == 'last_remaining_items')}
                            <span class="c-label c-label--success u-txt-xs">
                            {$product.availability_message}
                        </span>
                        {elseif $product.show_availability && $product.availability_message}
                            <span class="c-label c-label--failed u-txt-xs">
                             {$product.availability_message}
                        </span>
                        {/if}
                    </div>
                </div>

                <div class="c-addcartsticky__rightside">
                    <div class="c-addcartsticky__rightside-wrapper">
                        <p class="u-d-mobile u-h3 u-mb-0 u-d-desktop">{$product.name}</p>
                        {if $product.show_price}
                            <div class="o-layout o-layout--start o-layout--center-y u-flex-wrap">
                                <span class="c-price--lg {if !$product.has_discount} c-price--lg--current{else} c-price--lg--discount{/if} u-mr-2">{$product.price}</span>
                                {if $product.has_discount}
                                    {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                    <span class="c-price--old u-mr-2">{$product.regular_price}</span>
                                {/if}
                            </div>
                        {/if}
                    </div>

                    {if $product.add_to_cart_url}
                        <form class="c-addcartsticky__rightside-addtocart" action="{$urls.pages.cart}" method="post"
                              id="add-to-cart-or-refresh">
                            <input type="hidden" name="token" value="{$static_token}">
                            <input type="hidden" name="id_product" value="{$product.id}"
                                   id="product_page_product_id">
                            <input type="hidden" name="id_customization" value="{$product.id_customization}"
                                   id="product_customization_id">
                            <div class="add">
                                <button
                                        class="btn btn-primary u-w-100 /js js-add-to-cart"
                                        data-button-action="add-to-cart"
                                        type="submit"
                                        {if !$product.add_to_cart_url}
                                            disabled
                                        {/if}
                                >
                                    {l s='Add to cart' d='Shop.Theme.Actions'}
                                </button>

                                {hook h='displayProductActions' product=$product}
                            </div>
                        </form>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>