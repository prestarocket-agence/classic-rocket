<div class="c-header__shortcut-item c-header__cart">
    <div class="/js blockcart {if $cart.products_count > 0}active{else}inactive{/if}"
         data-refresh-url="{$refresh_url}">
        {if $cart.products_count > 0}
        <a class="u-txt-black" rel="nofollow" href="{$cart_url}">
            {/if}
            {include file="_partials/icon.tpl" icon="cart" class="c-header__icon c-icon--28"}
            {*                <span class="visible--desktop blockcart__label small">{l s='Cart' d='Shop.Theme.Checkout'}</span>*}
            <span class="c-header__cart-label">{$cart.products_count}</span>
            {if $cart.products_count > 0}
        </a>
        {/if}
    </div>
</div>