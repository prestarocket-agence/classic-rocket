<div class="c-pdt__section c-pdt__section--{$product_layout}">
    {if $product_layout === "collapse"}
        <button class="c-collapse__btn c-collapse__btn--pdtsection" type="button" data-toggle="collapse"
                data-target="#pdt_pack" aria-expanded="true" aria-controls="pdt_pack">
            {l s='Contenu du pack' d='Shop.Theme.Catalog'}
        </button>
    {/if}
    <div class="{$classPdtTab}{if $product.description}{$classPdtTabActive}{/if}"
         id="pdt_pack"{if $product_layout === "tabs"} role="tabpanel"{/if}>
        <section class="product-pack mb-4">
            <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
            {foreach from=$packItems item="product_pack"}
                {block name='product_miniature'}
                    {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                {/block}
            {/foreach}
        </section>
    </div>
</div>