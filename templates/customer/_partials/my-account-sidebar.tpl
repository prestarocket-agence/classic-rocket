
<div>
    {$customer.firstname|substr:0:1} {$customer.lastname|substr:0:1}

    {l s='Hello' d='Shop.Theme.Global'} {$customer.firstname} {$customer.lastname}
</div>


<div class="">

  <a class="{if $urls.current_url == $urls.pages.identity} is-active{/if}" id="identity-link" href="{$urls.pages.identity}">
      {l s='Information' d='Shop.Theme.Customeraccount'}
  </a>
    {if $customer.addresses|count}
        <a class="{if $urls.current_url == $urls.pages.addresses} is-active{/if}" id="addresses-link" href="{$urls.pages.addresses}">
            {l s='Addresses' d='Shop.Theme.Customeraccount'}
        </a>
    {else}
        <a class="{if $urls.current_url == $urls.pages.address} is-active{/if}" id="address-link" href="{$urls.pages.address}">
              {l s='Add first address' d='Shop.Theme.Customeraccount'}
        </a>
    {/if}

</div>
{*

<div class="row account-links">

  <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="identity-link" href="{$urls.pages.identity}">
        <span class="link-item">
          <i class="material-icons">&#xE853;</i>
            {l s='Information' d='Shop.Theme.Customeraccount'}
        </span>
  </a>

    {if $customer.addresses|count}
      <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="addresses-link" href="{$urls.pages.addresses}">
          <span class="link-item">
            <i class="material-icons">&#xE56A;</i>
              {l s='Addresses' d='Shop.Theme.Customeraccount'}
          </span>
      </a>
    {else}
      <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="address-link" href="{$urls.pages.address}">
          <span class="link-item">
            <i class="material-icons">&#xE567;</i>
              {l s='Add first address' d='Shop.Theme.Customeraccount'}
          </span>
      </a>
    {/if}

    {if !$configuration.is_catalog}
      <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="history-link" href="{$urls.pages.history}">
          <span class="link-item">
            <i class="material-icons">&#xE916;</i>
              {l s='Order history and details' d='Shop.Theme.Customeraccount'}
          </span>
      </a>
    {/if}

    {if !$configuration.is_catalog}
      <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="order-slips-link" href="{$urls.pages.order_slip}">
          <span class="link-item">
            <i class="material-icons">&#xE8B0;</i>
              {l s='Credit slips' d='Shop.Theme.Customeraccount'}
          </span>
      </a>
    {/if}

    {if $configuration.voucher_enabled && !$configuration.is_catalog}
      <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="discounts-link" href="{$urls.pages.discount}">
          <span class="link-item">
            <i class="material-icons">&#xE54E;</i>
              {l s='Vouchers' d='Shop.Theme.Customeraccount'}
          </span>
      </a>
    {/if}

    {if $configuration.return_enabled && !$configuration.is_catalog}
      <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="returns-link" href="{$urls.pages.order_follow}">
          <span class="link-item">
            <i class="material-icons">&#xE860;</i>
              {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
          </span>
      </a>
    {/if}

    {block name='display_customer_account'}
        {hook h='displayCustomerAccount'}
    {/block}

</div>
*}