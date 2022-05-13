{extends file='page.tpl'}
{block name='pageWrapperClass'}{/block}
{block name='page_content_container' prepend}
    <section id="content-hook_order_confirmation"
             class="c-panel c-panel--center alert alert-success u-txt-center c-panel--rounded u-mb-4">

        {block name='order_confirmation_header'}
            {include file="_partials/icon.tpl" icon="check-circle-fill" class="c-icon--32 u-txt-success"}
            <p class="u-h3 u-mt-2 u-mb-3">{l s='Your order is confirmed' d='Shop.Theme.Checkout'}</p>
        {/block}

        <p class="u-mb-0">
            {l s='An email has been sent to your mail address %email%.' d='Shop.Theme.Checkout' sprintf=['%email%' => $customer.email]}
            {if $order.details.invoice_url}
                {* [1][/1] is for a HTML tag. *}
                {l
                s='You can also [1]download your invoice[/1]'
                d='Shop.Theme.Checkout'
                sprintf=[
                '[1]' => "<a href='{$order.details.invoice_url}'>",
                '[/1]' => "</a>"
                ]
                }
            {/if}
        </p>

        {block name='hook_order_confirmation'}
            {$HOOK_ORDER_CONFIRMATION nofilter}
        {/block}
    </section>
{/block}

{block name='page_content_container'}
    <section id="content" class="row page-content page-order-confirmation">
        <div class="col-lg-4">
            {block name='order_details'}
                <div id="order-details"
                     class="c-panel c-panel--lg c-panel--border c-panel--rounded">
                    <div class="c-history__item">
                        <div class="row">
                            <div class="col-md-6 u-mb-3">
                                <p class="u-txt-dark u-txt-sm u-mb-1">{l s='Order reference' d='Shop.Theme.Checkout'}</p>
                                <p class="u-h5 u-font-weight-bold u-mb-1">{$order.details.reference}</p>
                            </div>
                            <div class="col-md-6 u-mb-3@mob">
                                <p class="u-txt-dark u-txt-sm u-mb-1">{l s='Payment method' d='Shop.Theme.Checkout'}</p>
                                <p class="u-h5 u-font-weight-bold u-mb-1">{$order.details.payment}</p>
                            </div>
                            <div class="col-12">
                                {if !$order.details.is_virtual}
                                    <p class="u-txt-dark u-txt-sm u-mb-1">{l s='Shipping method' d='Shop.Theme.Checkout'}</p>
                                    <p class="u-h5 u-font-weight-bold u-mb-1">{$order.carrier.name}</p>
                                    <p class="u-mb-0">{$order.carrier.delay}</p>
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
            {/block}

            {block name='hook_payment_return'}
                {if ! empty($HOOK_PAYMENT_RETURN)}
                    <section id="content-hook_payment_return"
                             class="c-panel c-panel--border c-panel--center c-panel--rounded">
                        {$HOOK_PAYMENT_RETURN nofilter}
                    </section>
                {/if}
            {/block}
        </div>
        <div class="col-lg-8">
            {block name='order_confirmation_table'}
                <div id="order-items"
                     class="c-panel c-panel--lg c-panel--border c-panel--rounded">
                    <p class="c-panel__head u-h3">{l s='Articles' d='Shop.Theme.Catalog'}</p>
                    {include
                    file='checkout/_partials/order-confirmation-table.tpl'
                    products=$order.products
                    subtotals=$order.subtotals
                    totals=$order.totals
                    labels=$order.labels
                    add_product_link=false
                    }
                </div>
            {/block}
        </div>
    </section>

    {block name='customer_registration_form'}
        {if $customer.is_guest}
            <div id="registration-form" class="card mb-3">
                <div class="card-body">
                    <h4 class="h4">{l s='Save time on your next order, sign up now' d='Shop.Theme.Checkout'}</h4>
                    {render file='customer/_partials/customer-form.tpl' ui=$register_form}
                </div>
            </div>
        {/if}
    {/block}

    {block name='hook_order_confirmation_1'}
        {hook h='displayOrderConfirmation1'}
    {/block}
    <div class="u-txt-center u-mt-3 u-mb-3">
        <a class="btn btn-primary u-mb-2 u-ml-1 u-mr-1"
           href="{$urls.pages.my_account}">{l s='Accéder à mon compte' d='Shop.Theme.Checkout'}</a>
        <a class="btn btn-secondary u-mb-2 u-ml-1 u-mr-1"
           href="{$urls.base_url}">{l s='Retour à la boutique' d='Shop.Theme.Checkout'}</a>
    </div>
    {block name='hook_order_confirmation_2'}
        <section id="content-hook-order-confirmation-footer">
            {hook h='displayOrderConfirmation2'}
        </section>
    {/block}
{/block}
