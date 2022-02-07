<div class="c-account-sidebar__block">
    <a class="c-account-sidebar__link c-account-sidebar__heading" href="{$urls.pages.my_account}">
        <div class="c-account-sidebar__avatar">
            {$customer.firstname|substr:0:1}{$customer.lastname|substr:0:1}
        </div>
        <p class="c-account-sidebar__customer u-mb-0">
            <span>{l s='Bonjour' d='Shop.Theme.Global'},&nbsp;</span>
            <span class="u-font-weight-bold">{$customer.firstname} {$customer.lastname}</span>
        </p>
    </a>
</div>

{if !$configuration.is_catalog}
    <div class="c-account-sidebar__block">
        <a class="c-account-sidebar__link {if $urls.current_url == $urls.pages.history} is-active{/if}"
           id="history-link" href="{$urls.pages.history}">
            {include file="_partials/icon.tpl" icon="box-seam" class="c-icon--16 c-icon--center-y u-mr-2"}
            {l s='Order history and details' d='Shop.Theme.Customeraccount'}
        </a>

        {if $configuration.return_enabled && !$configuration.is_catalog}
            <a class="c-account-sidebar__link {if $urls.current_url == $urls.pages.order_follow} is-active{/if}"
               id="returns-link" href="{$urls.pages.order_follow}">
                {include file="_partials/icon.tpl" icon="arrow-return-left" class="c-icon--16 c-icon--center-y u-mr-2"}
                {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
            </a>
        {/if}
    </div>
{/if}

<div class="c-account-sidebar__block">
    <a class="c-account-sidebar__link {if $urls.current_url == $urls.pages.identity} is-active{/if}"
       id="identity-link"
       href="{$urls.pages.identity}">
        {include file="_partials/icon.tpl" icon="person-circle" class="c-icon--16 c-icon--center-y u-mr-2"}
        {l s='Information' d='Shop.Theme.Customeraccount'}
    </a>
    {if $customer.addresses|count}
        <a class="c-account-sidebar__link {if $urls.current_url == $urls.pages.addresses} is-active{/if}"
           id="addresses-link"
           href="{$urls.pages.addresses}">
            {include file="_partials/icon.tpl" icon="geo-alt" class="c-icon--16 c-icon--center-y u-mr-2"}
            {l s='Addresses' d='Shop.Theme.Customeraccount'}
        </a>
    {else}
        <a class="c-account-sidebar__link {if $urls.current_url == $urls.pages.address} is-active{/if}"
           id="address-link"
           href="{$urls.pages.address}">
            {include file="_partials/icon.tpl" icon="geo-alt" class="c-icon--16 c-icon--center-y u-mr-2"}
            {l s='Add first address' d='Shop.Theme.Customeraccount'}
        </a>
    {/if}

    {if !$configuration.is_catalog}
        <a class="c-account-sidebar__link {if $urls.current_url == $urls.pages.order_slip} is-active{/if}"
           id="order-slips-link" href="{$urls.pages.order_slip}">
            {include file="_partials/icon.tpl" icon="wallet2" class="c-icon--16 c-icon--center-y u-mr-2"}
            {l s='Credit slips' d='Shop.Theme.Customeraccount'}
        </a>
    {/if}

    {if $configuration.voucher_enabled && !$configuration.is_catalog}
        <a class="c-account-sidebar__link {if $urls.current_url == $urls.pages.discount} is-active{/if}"
           id="discounts-link" href="{$urls.pages.discount}">
            {include file="_partials/icon.tpl" icon="gift" class="c-icon--16 c-icon--center-y u-mr-2"}
            {l s='Vouchers' d='Shop.Theme.Customeraccount'}
        </a>
    {/if}

    {block name='display_customer_account'}
        {hook h='displayCustomerAccount'}
    {/block}
</div>

<div>
    <a class="c-account-sidebar__link" href="{$urls.actions.logout}">
        {include file="_partials/icon.tpl" icon="box-arrow-left" class="c-icon--16 c-icon--center-y u-mr-2"}
        {l s='Déconnexion' d='Shop.Theme.Customeraccount'}
    </a>
</div>