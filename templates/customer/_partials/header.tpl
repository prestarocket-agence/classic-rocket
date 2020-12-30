<header class="c-customer-header">
    <div class="o-wrapper">
        <div class="o-layout o-layout--center-y u-p-rel">
            <div class="u-d-flex u-align-items-center">
                {include file="_partials/icon.tpl" icon="shield-check" class="c-icon--28 c-icon--center-y u-mr-1"}
                {block name='page_title_account'}
                {/block}
            </div>

            <a class="c-customer-header__item-center" href="{$urls.base_url}">
                <img class="u-img-fluid"
                     src="{if isset($modules.prestarockettheme.logo_svg)}{$modules.prestarockettheme.logo_svg}{else}{$shop.logo}{/if}"
                     alt="{$shop.name}">
            </a>

            {if isset($modules.rocketfunnel.cookie_redirect_checkout) && $modules.rocketfunnel.cookie_redirect_checkout}
            <a class="u-d-flex u-align-items-center u-txt-dark u-txt-sm" href="{$urls.pages.cart}?action=show">
                {include file="_partials/icon.tpl" icon="chevron-left" class="u-mr-1 c-icon--center-y"}
                {l s='Retour au panier' d='Shop.Theme.Global'}
            </a>
            {/if}
        </div>
    </div>
</header>