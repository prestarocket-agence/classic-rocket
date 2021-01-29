{extends file='page.tpl'}
{block name='pageWrapperClass'}{/block}
{block name='page_content_container' prepend}
    <section id="content-hook_order_confirmation" class="u-mb-3">

        {block name='order_confirmation_header'}
            <p class="u-h3 u-d-flex u-align-items-center u-mb-2 u-txt-success">
                {include file="_partials/icon.tpl" icon="check" class="c-icon--28 c-icon--center-y u-mr-1"}
                {l s='Your order is confirmed' d='Shop.Theme.Checkout'}
            </p>
        {/block}

        <p class="u-mb-0 u-ml-4">
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
    <section id="content" class="page-content page-order-confirmation mb-3">
        {block name='order_confirmation_table'}
            <div>
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
        {block name='order_details'}
            <div id="order-details" class="c-panel c-panel--border">
                <h3 class="u-h3 c-panel__head">{l s='Order details' d='Shop.Theme.Checkout'}:</h3>
                <ul>
                    <li>{l s='Order reference: %reference%' d='Shop.Theme.Checkout' sprintf=['%reference%' => $order.details.reference]}</li>
                    <li>{l s='Payment method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.details.payment]}</li>
                    {if !$order.details.is_virtual}
                        <li>
                            {l s='Shipping method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.carrier.name]}
                            <br>
                            <em>{$order.carrier.delay}</em>
                        </li>
                    {/if}
                </ul>
            </div>
        {/block}

    </section>
    {block name='hook_payment_return'}
        {if ! empty($HOOK_PAYMENT_RETURN)}
            <section id="content-hook_payment_return" class="c-panel c-panel--border u-mb-4">
                {$HOOK_PAYMENT_RETURN nofilter}
            </section>
        {/if}
    {/block}

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

    {block name='hook_order_confirmation_2'}
        <section id="content-hook-order-confirmation-footer">
            {hook h='displayOrderConfirmation2'}
        </section>
    {/block}
{/block}
