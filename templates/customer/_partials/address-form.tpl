{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='address_form'}
  <div class="{if $page.page_name === "checkout"}c-checkout-panel__form {/if}/js js-address-form">

    {block name='address_form_errors'}
      {include file='_partials/form-errors.tpl' errors=$errors['']}
    {/block}

    {block name='address_form_url'}
    <form
      method="POST"
      class="{if isset($formFields.id_state)}c-form--withstates {/if}/js needs-validation"
      action="{url entity='address' params=['id_address' => $id_address]}"
      data-id-address="{$id_address}"
      data-refresh-url="{url entity='address' params=['ajax' => 1, 'action' => 'addressForm']}"
      novalidate
      autocomplete="false"
    >
    {/block}

      {block name='address_form_fields'}
        <section class="u-mb-3 form-fields">
          {block name='form_fields'}
            {foreach from=$formFields item="field"}
              {block name='form_field'}
                  {if $field.name !== "alias"}
                      {* input firstname & lastname in a row*}
                      {if isset($modules.rocketfunnel.rocket_funnel_enable) && $field.name === "firstname" && isset($formFields['lastname'])}
                          <div class="c-form__inputrow">
                      {/if}

                      {* we close a div before phone for row input city cp and country*}

                      {if isset($modules.rocketfunnel.rocket_funnel_enable) && $field.name === "phone" && isset($formFields['address2'])}
                          </div>
                      {/if}

                      {form_field field=$field}
                      {* we open a div after address2 for row input city cp and country*}
                      {if isset($modules.rocketfunnel.rocket_funnel_enable) && $field.name === "address2"}
                      <div class="c-form__inputrow">
                          {/if}


                      {if isset($modules.rocketfunnel.rocket_funnel_enable) && $field.name === "lastname" && isset($formFields['firstname'])}
                          </div>
                      {/if}

                  {/if}
              {/block}
            {/foreach}
              {if $field.name eq "alias" and $customer.is_guest}
                   {*we don't ask for alias here if customer is not registered*}
              {else}
                  {if isset($formFields['alias'])}
                      {form_field field=$formFields['alias']}
                  {/if}
              {/if}
          {/block}
        </section>
      {/block}

      {block name='address_form_footer'}
        <footer class="c-form__footer u-flex-column u-align-items-center">
          <input type="hidden" name="submitAddress" value="1">
          {block name='form_buttons'}
            <button class="btn btn-primary form-control-submit" type="submit">
              {l s='Save' d='Shop.Theme.Actions'}
            </button>
          {/block}
        </footer>
      {/block}
    </form>
    
  </div>
{/block}
