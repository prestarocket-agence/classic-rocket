<header class="c-customer-header">
    <div class="o-wrapper">
        <div class="o-layout o-layout--center-y u-p-rel">
            <a href="{$urls.base_url}">
                <img class="u-img-fluid"
                     src="{if isset($modules.prestarockettheme.logo_svg)}{$modules.prestarockettheme.logo_svg}{else}{$shop.logo}{/if}"
                     alt="{$shop.name}">
            </a>
            {block name='page_title_account'}
            {/block}
            <p class="u-mb-0 c-customer-header__item-center">{l s='Espace sécurisé' d='Shop.Theme.Global'}</p>
            {include file="_partials/icon.tpl" icon="shield-check" class="c-icon--28 c-icon--center-y"}
        </div>
    </div>
</header>