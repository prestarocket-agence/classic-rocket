{block name='before_pdt-tabs'}
{/block}
<div class="product-tabs">
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

    {block name='after_pdt-tabs_opening_tag'}
    {/block}

    {if $product_layout === "tabs"}
        {include file='catalog/_partials/product-tabs-nav.tpl'}
    {/if}



    {block name="pdt-tabs"}
    <div class="c-pdt__sections c-pdt__sections--{$product_layout}">
        {if $product.description}
            <div class="c-pdt__section c-pdt__section--{$product_layout}">
                {if $product_layout === "collapse"}
                    <button class="c-collapse__btn c-collapse__btn--pdtsection" type="button" data-toggle="collapse"
                            data-target="#description" aria-expanded="true" aria-controls="description">
                        {l s='Description' d='Shop.Theme.Catalog'}
                        {include file="_partials/icon.tpl" class="c-icon--center-y" icon="chevron-up"}
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

        {* id="product-details" is used in js *}
        <div class="c-pdt__section">
            {if $product_layout === "collapse"}
                <button class="c-collapse__btn c-collapse__btn--pdtsection" type="button" data-toggle="collapse"
                        data-target="#product-details" aria-expanded="false" aria-controls="product-details">
                    {l s='Data sheet' d='Shop.Theme.Catalog'}
                    {include file="_partials/icon.tpl" class="c-icon--center-y" icon="chevron-up"}
                </button>
            {/if}
            {include file='catalog/_partials/product-details.tpl'}
        </div>
        {/block}

        {block name='product_attachments'}
            {if $product.attachments}
                <div class="c-pdt__section c-pdt__section--{$product_layout}">
                    {if $product_layout === "collapse"}
                        <button class="c-collapse__btn c-collapse__btn--pdtsection" type="button" data-toggle="collapse"
                                data-target="#attachments" aria-expanded="false" aria-controls="attachments">
                            {l s='Download' d='Shop.Theme.Actions'}
                            {include file="_partials/icon.tpl" class="c-icon--center-y" icon="chevron-up"}
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
                    {include file="_partials/icon.tpl" class="c-icon--center-y" icon="chevron-up"}
                </button>
                {/if}
                <div class="{$classPdtTab} {$extra.attr.class}" id="extra-{$extraKey}"{if $product_layout === "tabs"}
                     role="tabpanel"{/if} {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                {$extra.content nofilter}
            </div>
            </div>
        {/foreach}

        {block name="product_pack"}
            {if $product.pack == 1}
                <div class="c-pdt__section c-pdt__section--{$product_layout}">
                    {if $product_layout === "collapse"}
                        <button class="c-collapse__btn c-collapse__btn--pdtsection" type="button" data-toggle="collapse"
                                data-target="#pdt_pack" aria-expanded="true" aria-controls="pdt_pack">
                            {l s='Contenu du pack' d='Shop.Theme.Catalog'}
                            {include file="_partials/icon.tpl" class="c-icon--center-y" icon="chevron-up"}
                        </button>
                    {/if}
                    <div class="{$classPdtTab}{if $product.pack}{$classPdtTabActive}{/if}"
                         id="pdt_pack"{if $product_layout === "tabs"} role="tabpanel"{/if}>
                        {include file="catalog/_partials/product-pack.tpl"}
                    </div>
                </div>
            {/if}
        {/block}
    {/block}
</div>
{block name='before_pdt-tabs_closing_tag'}
{/block}
</div>
{block name='after_pdt-tabs'}
{/block}