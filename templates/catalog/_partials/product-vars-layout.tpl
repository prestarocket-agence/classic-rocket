{if !isset($modules.prestarockettheme.product.product_layout)}
    {assign var="product_layout" value="collapse"}
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