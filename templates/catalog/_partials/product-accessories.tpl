<section class="product-accessories mt-3">
    <p class="products-section-title">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
    <div class="products">
        {foreach from=$accessories item="product_accessory"}
            {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
            {/block}
        {/foreach}
    </div>
</section>