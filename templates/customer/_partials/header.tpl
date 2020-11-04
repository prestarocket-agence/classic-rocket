<header class="c-customer-header">
    <div class="o-wrapper">
        <div class="o-layout o-layout--center-y">
            <a href="{$urls.base_url}" class="c-header__logo">
                <img class="u-img-fluid" src="{if isset($modules.prestarockettheme.logo_svg)}{$modules.prestarockettheme.logo_svg}{else}{$shop.logo}{/if}" alt="{$shop.name}">
            </a>
            {block name='page_title_account'}
            {/block}
            <div class="u-d-flex u-align-items-center">
                <p class="u-mb-0 u-mr-2">Espace sécurisé</p>
                {include file="_partials/icon.tpl" icon="shield-check" class="c-icon--28"}
            </div>
        </div>
    </div>
</header>