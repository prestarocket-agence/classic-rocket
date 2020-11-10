{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
    <div class="c-checkout-panel__form c-checkout-panel__form--lg">
        {hook h='displayPaymentTop'}

        {* used by javascript to correctly handle cart updates when we are on payment step (eg vouchers added) *}
        <div style="display:none" class="js-cart-payment-step-refresh"></div>
        {if !empty($display_transaction_updated_info)}
            <p class="cart-payment-step-refreshed-info">
                {l s='Transaction amount has been correctly updated' d='Shop.Theme.Checkout'}
            </p>
        {/if}

        {if $is_free}
            <p>{l s='No payment needed for this order' d='Shop.Theme.Checkout'}</p>
        {/if}

        <div class="{if $is_free}d--none{/if}">
            {foreach from=$payment_options item="module_options"}
                {foreach from=$module_options item="option"}
                    <div id="{$option.id}-container" class="c-checkout-card /js payment-option clearfix">
                        {* This is the way an option should be selected when Javascript is enabled *}
                        <div class="/js custom-control custom-radio">
                            <input
                                    class="/js ps-shown-by-js custom-control-input{if $option.binary} binary{/if}"
                                    id="{$option.id}"
                                    data-module-name="{$option.module_name}"
                                    name="payment-option"
                                    type="radio"
                                    required
                                    {if $selected_payment_option == $option.id || $is_free} checked {/if}
                            >
                            {* This is the way an option should be selected when Javascript is disabled *}
                            <form method="GET" class="/js ps-hidden-by-js">
                                {if $option.id === $selected_payment_option}
                                    {l s='Selected' d='Shop.Theme.Checkout'}
                                {else}
                                    <button class="/js ps-hidden-by-js" type="submit" name="select_payment_option"
                                            value="{$option.id}">
                                        {l s='Choose' d='Shop.Theme.Actions'}
                                    </button>
                                {/if}
                            </form>
                            <label class="/js custom-control-label" for="{$option.id}">
                                {$option.call_to_action_text}
                                {if $option.logo}
                                    <img src="{$option.logo}">
                                {/if}
                            </label>
                        </div>
                    </div>
                    {if $option.additionalInformation}
                        <div
                                id="{$option.id}-additional-information"
                                class="/js js-additional-information{if $option.id != $selected_payment_option} ps-hidden {/if}"
                        >
                            <div class="alert alert-primary u-mb-2">
                                {$option.additionalInformation nofilter}
                            </div>
                        </div>
                    {/if}
                    <div
                            id="pay-with-{$option.id}-form"
                            class="/js js-payment-option-form {if $option.id != $selected_payment_option} ps-hidden {/if}"
                    >
                        {if $option.form}
                            {$option.form nofilter}
                        {else}
                            <form id="payment-form" method="POST" action="{$option.action nofilter}">
                                {foreach from=$option.inputs item=input}
                                    <input type="{$input.type}" name="{$input.name}" value="{$input.value}">
                                {/foreach}
                                <button style="display:none" id="pay-with-{$option.id}" type="submit"></button>
                            </form>
                        {/if}
                    </div>
                {/foreach}
                {foreachelse}
                <p class="alert alert-danger">{l s='Unfortunately, there are no payment method available.' d='Shop.Theme.Checkout'}</p>
            {/foreach}
        </div>
        {if $show_final_summary}
            {include file='checkout/_partials/order-final-summary.tpl'}
        {/if}

        {if $conditions_to_approve|count}
            <p class="/js ps-hidden-by-js">
                {* At the moment, we're not showing the checkboxes when JS is disabled
                   because it makes ensuring they were checked very tricky and overcomplicates
                   the template. Might change later.
                *}
                {l s='By confirming the order, you certify that you have read and agree with all of the conditions below:' d='Shop.Theme.Checkout'}
            </p>
            <form id="conditions-to-approve" method="GET" class="u-mb-2 alert alert-info">
                {foreach from=$conditions_to_approve item="condition" key="condition_name"}
                    <div class="/js custom-control custom-checkbox">
                        <input id="conditions_to_approve[{$condition_name}]"
                               name="conditions_to_approve[{$condition_name}]"
                               required
                               type="checkbox"
                               value="1"
                               class="/js ps-shown-by-js custom-control-input"
                        >
                        <label class="c-form__label c-form__label--sm /js custom-control-label js-terms"
                               for="conditions_to_approve[{$condition_name}]">{$condition nofilter}</label>
                    </div>
                {/foreach}
            </form>
        {/if}
        <div id="payment-confirmation" class="c-form__footer">
            <div class="/js ps-shown-by-js">
                <p class="">
                    <button type="submit" {if !$selected_payment_option} disabled {/if}
                            class="btn btn-primary center-block mt-3 text-uppercase">
                        {l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}
                    </button>
                </p>
                {if $show_final_summary}
                    <article class="alert alert-danger mt-2 js-alert-payment-conditions" role="alert"
                             data-alert="danger">
                        {l
                        s='Please make sure you\'ve chosen a [1]payment method[/1] and accepted the [2]terms and conditions[/2].'
                        sprintf=[
                        '[1]' => '<a href="#checkout-payment-step">',
                        '[/1]' => '</a>',
                        '[2]' => '<a href="#conditions-to-approve">',
                        '[/2]' => '</a>'
                        ]
                        d='Shop.Theme.Checkout'
                        }
                    </article>
                {/if}
            </div>
            <div class="ps-hidden-by-js">
                {if $selected_payment_option and $all_conditions_approved}
                    <label for="pay-with-{$selected_payment_option}">{l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}</label>
                {/if}
            </div>
        </div>
        {hook h='displayPaymentByBinaries'}
        <div class="modal fade" id="modal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="{l s='Close' d='Shop.Theme.Global'}">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="js-modal-content"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                                data-dismiss="modal">{l s='Close' d='Shop.Theme.Global'}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}
