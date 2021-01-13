<div class="tabs product-tabs">
        {include file='catalog/_partials/product-tabs-nav.tpl'}



        <div class="tab-content" id="tab-content">
            <div class="tab-pane fade{if $product.description} show active{/if}" id="description" role="tabpanel">
                {block name='product_description'}
                    <div class="product-description s-cms">{$product.description nofilter}</div>
                {/block}
            </div>

            {block name='product_details'}
                {include file='catalog/_partials/product-details.tpl'}
            {/block}

            {block name='product_attachments'}
                {if $product.attachments}
                    <div class="tab-pane fade" id="attachments" role="tabpanel">
                        <section class="product-attachments">
                            <p class="h4 product__download">{l s='Download' d='Shop.Theme.Actions'}</p>
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
                {/if}
            {/block}

            {foreach from=$product.extraContent item=extra key=extraKey}
            <div class="tab-pane fade {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
            {$extra.content nofilter}
        </div>
        {/foreach}
    </div>
    </div>