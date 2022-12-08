<div class="variant-links">
    {foreach from=$variants item=variant name="variantslist"}
        {if $smarty.foreach.variantslist.iteration < 6}
            <a href="{$variant.url}"
               class="{$variant.type} mx-1"
               title="{$variant.name}"
                    {*
                       TODO:
                         put color in a data attribute for use with attr() as soon as browsers support it,
                         see https://developer.mozilla.org/en/docs/Web/CSS/attr
                     *}
                    {if $variant.html_color_code} style="background-color: {$variant.html_color_code}" {/if}
                    {if $variant.texture} style="background-image: url({$variant.texture})" {/if}
            ><span class="sr-only">{$variant.name}</span></a>
        {/if}
    {/foreach}
    {if ($variants|count) > 5}
        <span class="js-count count">+{($variants|count) - 5}</span>
    {/if}
</div>
