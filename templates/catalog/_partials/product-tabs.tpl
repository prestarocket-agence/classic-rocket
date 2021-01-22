{block name='before_pdt-tabs'}
{/block}
<div class="product-tabs">
    {block name='after_pdt-tabs_opening_tag'}
    {/block}

    {if $product_layout === "tabs"}
        {include file='catalog/_partials/product-tabs-nav.tpl'}
    {/if}

    {assign classPdtTab "c-collapse__body /js collapse"}
    {assign classPdtTabActive " show"}

    {if $product_layout === "tabs"}
        {assign classPdtTab "tab-pane fade"}
    {elseif $product_layout === "columns"}
        {assign classPdtTab "tab-pane fade"}
        {assign classPdtTabActive ""}
    {/if}

    {block name="pdt-tabs"}
    <div class="c-pdt__sections c-pdt__sections--{$product_layout}">
        {if $product.description}
            <div class="c-pdt__section c-pdt__section--{$product_layout}">
                {if $product_layout === "collapse"}
                    <button class="c-collapse__btn c-collapse__btn--pdtsection" type="button" data-toggle="collapse"
                            data-target="#description" aria-expanded="true" aria-controls="description">
                        {l s='Description' d='Shop.Theme.Catalog'}
                    </button>
                {/if}
                <div class="{$classPdtTab}{if $product.description}{$classPdtTabActive}{/if}"
                     id="description"{if $product_layout === "tabs"} role="tabpanel"{/if}>

                    {block name='product_description'}
                        <div class="product-description s-cms">{$product.description nofilter}</div>
                    {/block}
                </div>
            </div>
        {/if}

        {block name='product_details'}
            {include file='catalog/_partials/product-details.tpl'}
        {/block}

        {block name='product_attachments'}
            {if $product.attachments}
                <div class="c-pdt__section c-pdt__section--{$product_layout}">
                    {if $product_layout === "collapse"}
                        <button class="c-collapse__btn c-collapse__btn--pdtsection" type="button" data-toggle="collapse"
                                data-target="#attachments" aria-expanded="false" aria-controls="attachments">
                            {l s='Download' d='Shop.Theme.Actions'}
                        </button>
                    {/if}
                    <div class="{$classPdtTab}" id="attachments"{if $product_layout === "tabs"} role="tabpanel"{/if}>
                        <section class="product-attachments">
                            {if $product_layout === "columns"}
                                <p class="h4 product__download">{l s='Download' d='Shop.Theme.Actions'}</p>
                            {/if}
                            {foreach from=$product.attachments item=attachment}
                                <div class="attachment">
                                    <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a>
                                    <p class="small">{$attachment.description}</p>
                                    <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                                        {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                                    </a>
                                </div>
                            {/foreach}
                        </section>
                    </div>
                </div>
            {/if}
        {/block}

        {foreach from=$product.extraContent item=extra key=extraKey}
        <div class="c-pdt__section c-pdt__section--{$product_layout}">
            {if $product_layout === "collapse"}
            <button class="c-collapse__btn c-collapse__btn--pdtsection" type="button" data-toggle="collapse"
                    data-target="#extra-{$extraKey}" aria-expanded="true" aria-controls="extra-{$extraKey}">
                {$extra.title}
            </button>
            {/if}
            <div class="{$classPdtTab} {$extra.attr.class}" id="extra-{$extraKey}"{if $product_layout === "tabs"}
                 role="tabpanel"{/if} {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
            {$extra.content nofilter}
        </div>
    </div>
    {/foreach}
    {/block}
</div>
{block name='before_pdt-tabs_closing_tag'}
{/block}
</div>
{block name='after_pdt-tabs'}
{/block}