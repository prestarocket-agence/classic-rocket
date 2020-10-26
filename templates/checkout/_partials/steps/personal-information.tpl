{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
    {hook h='displayPersonalInformationTop' customer=$customer}

    {if $customer.is_logged && !$customer.is_guest}
        <div class="u-txt-center u-mb-4">
            <p class="identity u-mb-3">
                {* [1][/1] is for a HTML tag. *}
                {l s='Connected as [1]%firstname% %lastname%[/1].'
                d='Shop.Theme.Customeraccount'
                sprintf=[
                '[1]' => "<a href='{$urls.pages.identity}'>",
                '[/1]' => "</a>",
                '%firstname%' => $customer.firstname,
                '%lastname%' => $customer.lastname
                ]
                }
            </p>
            <p class="u-mb-1">
                {* [1][/1] is for a HTML tag. *}
                {l
                s='Not you? [1]Log out[/1]'
                d='Shop.Theme.Customeraccount'
                sprintf=[
                '[1]' => "<a href='{$urls.actions.logout}'>",
                '[/1]' => "</a>"
                ]
                }
            </p>
            {if !isset($empty_cart_on_logout) || $empty_cart_on_logout}
                <p class="u-txt-sm">{l s='If you sign out now, your cart will be emptied.' d='Shop.Theme.Checkout'}</p>
            {/if}
        </div>
        <div class="c-form__footer clearfix">
            <form method="GET" action="{$urls.pages.order}">
                <button
                        class="btn btn-primary /js continue"
                        name="controller"
                        type="submit"
                        value="order"
                >
                    {l s='Continue' d='Shop.Theme.Actions'}
                </button>
            </form>

        </div>
    {else}
        <ul class="c-checkout-panel__head /js nav nav-tabs" role="tablist">
            <li class="/js nav-item">
                <a
                        class="btn btn-link /js nav-link {if !$show_login_form}active{/if}"
                        data-toggle="tab"
                        href="#checkout-guest-form"
                        role="tab"
                        aria-controls="checkout-guest-form"
                        {if !$show_login_form} aria-selected="true"{/if}
                >
                    {if $guest_allowed}
                        {l s='Order as a guest' d='Shop.Theme.Checkout'}
                    {else}
                        {l s='Create an account' d='Shop.Theme.Customeraccount'}
                    {/if}
                </a>
            </li>

            <li class="/js nav-item">
                <a
                        class="btn btn-link /js nav-link {if $show_login_form}active{/if}"
                        data-link-action="show-login-form"
                        data-toggle="tab"
                        href="#checkout-login-form"
                        role="tab"
                        aria-controls="checkout-login-form"
                        {if $show_login_form} aria-selected="true"{/if}
                >
                    {l s='Sign in' d='Shop.Theme.Actions'}
                </a>
            </li>
        </ul>
        <div class="c-checkout-panel__form /js tab-content">
            <div class="checkout-form tab-pane {if !$show_login_form}active{/if}" id="checkout-guest-form"
                 role="tabpanel" {if $show_login_form}aria-hidden="true"{/if}>
                {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
            </div>
            <div class="checkout-form tab-pane {if $show_login_form}active{/if}" id="checkout-login-form"
                 role="tabpanel" {if !$show_login_form}aria-hidden="true"{/if}>
                {render file='checkout/_partials/login-form.tpl' ui=$login_form}
            </div>
        </div>
    {/if}
{/block}
