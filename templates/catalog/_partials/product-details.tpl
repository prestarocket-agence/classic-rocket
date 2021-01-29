{if $product.grouped_features}
    {* id="product-details" is used in js *}
    <div class="c-pdt__section">
        {if $product_layout === "collapse"}
            <button class="c-collapse__btn c-collapse__btn--pdtsection" type="button" data-toggle="collapse"
                    data-target="#product-details" aria-expanded="false" aria-controls="product-details">
                {l s='Data sheet' d='Shop.Theme.Catalog'}
            </button>
        {/if}
        {* #product-detail use in js *}
        <div class="{$classPdtTab}{if !$product.description}{$classPdtTabActive}{/if}"
             id="product-details"
             data-product="{$product.embedded_attributes|json_encode}"{if isset($product.reference_to_display) && $product.reference_to_display neq ''} data-reference_to_display="{$product.reference_to_display}"{/if}
                {if $product_layout === "tabs"} role="tabpanel"{/if}
        >


            {block name='product_features'}
                <section class="product-features">
                    {if $product_layout === "columns"}
                        <p class="h6">{l s='Data sheet' d='Shop.Theme.Catalog'}</p>
                    {/if}
                    <dl class="data-sheet">
                        {foreach from=$product.grouped_features item=feature}
                            <dt class="name">{$feature.name}</dt>
                            <dd class="value">{$feature.value|escape:'htmlall'|nl2br nofilter}</dd>
                        {/foreach}
                    </dl>
                </section>
            {/block}
        </div>
    </div>
{/if}
