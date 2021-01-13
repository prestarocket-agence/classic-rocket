<ul class="nav nav-tabs" role="tablist">
    {if $product.description}
        <li class="nav-item">
            <a
                    class="nav-link{if $product.description} active{/if}"
                    data-toggle="tab"
                    href="#description"
                    role="tab"
                    aria-controls="description"
                    {if $product.description} aria-selected="true"{/if}>{l s='Description' d='Shop.Theme.Catalog'}</a>
        </li>
    {/if}
    <li class="nav-item">
        <a
                class="nav-link{if !$product.description} active{/if}"
                data-toggle="tab"
                href="#product-details"
                role="tab"
                aria-controls="product-details"
                {if !$product.description} aria-selected="true"{/if}>{l s='Product Details' d='Shop.Theme.Catalog'}</a>
    </li>
    {if $product.attachments}
        <li class="nav-item">
            <a
                    class="nav-link"
                    data-toggle="tab"
                    href="#attachments"
                    role="tab"
                    aria-controls="attachments">{l s='Attachments' d='Shop.Theme.Catalog'}</a>
        </li>
    {/if}
    {foreach from=$product.extraContent item=extra key=extraKey}
        <li class="nav-item">
            <a
                    class="nav-link"
                    data-toggle="tab"
                    href="#extra-{$extraKey}"
                    role="tab"
                    aria-controls="extra-{$extraKey}">{$extra.title}</a>
        </li>
    {/foreach}
</ul>