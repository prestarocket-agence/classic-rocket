<div class="c-variants">
    {foreach from=$variants item=variant name="variantslist"}
        {if $smarty.foreach.variantslist.iteration < 6 && $variant.type === "color"}
            <span
               class="c-variants c-variants__item c-variants__{$variant.type}"
               title="{$variant.name}"
                    {if $variant.html_color_code} style="background-color: {$variant.html_color_code}" {/if}
                    {if $variant.texture} style="background-image: url({$variant.texture})" {/if}
            ><span class="sr-only">{$variant.name}</span></span>
            {elseif $smarty.foreach.variantslist.iteration === 6}
            <span class="c-variants__count">+{($variants|count) - 5}</span>

        {/if}
    {/foreach}
</div>
{hook h='displayVariantLinks' product=$product}

