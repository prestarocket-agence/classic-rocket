    {if !isset($modules.prestarockettheme.product.product_layout)}{assign var="product_layout" value="collapse"}
    {else}
        {assign var="product_layout" value=$modules.prestarockettheme.product.product_layout}
    {/if}
    {assign classPdtTab "c-collapse__body /js collapse"}
    {assign classPdtTabActive " show"}
    {if $product_layout === "tabs"}
        {assign classPdtTab "tab-pane fade"}
    {elseif $product_layout === "columns"}
        {assign classPdtTab ""}
        {assign classPdtTabActive ""}
    {/if}
    {* id="product-details" is used in js *}

        {* #product-detail use in js *}
        <div class="{$classPdtTab}{if !$product.description}{$classPdtTabActive}{/if}"
             id="product-details"
             data-product="{$product.embedded_attributes|json_encode}"{if isset($product.reference_to_display) && $product.reference_to_display neq ''} data-reference_to_display="{$product.reference_to_display}"{/if}
                {if $product_layout === "tabs"} role="tabpanel"{/if}
        >

            {if $product.grouped_features}

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
            {/if}
        </div>

