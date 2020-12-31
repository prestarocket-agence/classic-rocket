<div class="c-header__shortcut-item c-header__shortcut-icon--cart">
    <div class="/js blockcart {if $cart.products_count > 0}active{else}inactive{/if}"
         data-refresh-url="{$refresh_url}">
        {if $cart.products_count > 0}
        <a class="" rel="nofollow" href="{$cart_url}">
            {/if}
            {include file="_partials/icon.tpl" icon="cart" class="c-header__shortcut-icon"}
{*            <span class="u-d-desktop c-header__shortcut-link">{l s='Cart' d='Shop.Theme.Checkout'}</span>*}
            <span class="c-header__shortcut-icon--cart-label">{$cart.products_count}</span>
            {if $cart.products_count > 0}
        </a>
        {/if}
    </div>
</div>