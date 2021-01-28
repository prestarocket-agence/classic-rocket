<section class="product-pack mb-4">
    <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
    {foreach from=$packItems item="product_pack"}
        {block name='product_miniature'}
            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
        {/block}
    {/foreach}
</section>