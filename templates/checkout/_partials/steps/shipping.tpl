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
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  <div id="hook-display-before-carrier">
    {$hookDisplayBeforeCarrier nofilter}
  </div>

  <div class="delivery-options-list">
    {if $delivery_options|count}
      <form
        class="clearfix"
        id="js-delivery"
        data-url-update="{url entity='order' params=['ajax' => 1, 'action' => 'selectDeliveryOption']}"
        method="post"
      >
        <div class="form-fields">
          {block name='delivery_options'}
              <div class="delivery-options">
                  {foreach from=$delivery_options item=carrier key=carrier_id}
                      <div class="delivery-option">
                          <div class="row">
                          <div class="col-sm-1">

                      <div class="custom-control custom-radio">
                          <input class="custom-control-input" type="radio" name="delivery_option[{$id_address}]" id="delivery_option_{$carrier.id}" value="{$carrier_id}"{if $delivery_option == $carrier_id} checked{/if}>
                          <label class="custom-control-label" for="delivery_option_{$carrier.id}"><span class="sr-only">{$carrier.name}</span></label>
                      </div>
                          </div>
                          <label for="delivery_option_{$carrier.id}" class="col-sm-11 delivery-option-2">
                              <div class="row">
                                  <div class="col-sm-5 col-12">
                                      <div class="row">
                                          {if $carrier.logo}
                                              <div class="col-3">
                                                  <img src="{$carrier.logo}" alt="{$carrier.name}" />
                                              </div>
                                          {/if}
                                          <div class="{if $carrier.logo}col-9{else}col-12{/if}">
                                              <span class="h6 carrier-name">{$carrier.name}</span>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-sm-4 col-12">
                                      <span class="carrier-delay">{$carrier.delay}</span>
                                  </div>
                                  <div class="col-sm-3 col-12 text--right">
                                      <span class="carrier-price">{$carrier.price}</span>
                                  </div>
                              </div>
                          </label>
                          </div>
                      </div>
                      <div class="carrier-extra-content"{if $delivery_option != $carrier_id} style="display:none;"{/if}>{$carrier.extraContent nofilter}</div>
                      <div class="clearfix"></div>
                  {/foreach}
              </div>
          {/block}
          <div class="order-options">
            <div id="delivery" class="form-group">
              <label for="delivery_message">{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Checkout'}</label>
              <textarea class="form-control" rows="2" cols="120" id="delivery_message" name="delivery_message">{$delivery_message}</textarea>
            </div>

            {if $recyclablePackAllowed}
              <div class="custom-control custom-checkbox">
                <input class="custom-control-input" type="checkbox" id="input_recyclable" name="recyclable" value="1" {if $recyclable} checked {/if}>
                <label class="custom-control-label" for="input_recyclable">{l s='I would like to receive my order in recycled packaging.' d='Shop.Theme.Checkout'}</label>
              </div>

            {/if}

            {if $gift.allowed}
              <div class="custom-control custom-checkbox">
                <input class="custom-control-input js-gift-checkbox" type="checkbox" id="input_gift" name="gift" value="1" value="1" {if $gift.isGift}checked="checked"{/if}>
                <label class="custom-control-label" for="input_gift">{$gift.label}</label >
              </div>


              <div id="gift" class="collapse{if $gift.isGift} show{/if}">
                <div class="form-group">
                <label for="gift_message">{l s='If you\'d like, you can add a note to the gift:' d='Shop.Theme.Checkout'}</label>
                <textarea class="form-control" rows="2" cols="120" id="gift_message" name="gift_message">{$gift.message}</textarea>
                </div>
              </div>
            {/if}

          </div>
        </div>
        <button type="submit" class="continue btn btn-primary btn-lg mt-3" name="confirmDeliveryOption" value="1">
          {l s='Continue' d='Shop.Theme.Actions'}
        </button>
      </form>
    {else}
      <p class="alert alert-danger">{l s='Unfortunately, there are no carriers available for your delivery address.' d='Shop.Theme.Checkout'}</p>
    {/if}
  </div>

  <div id="hook-display-after-carrier">
    {$hookDisplayAfterCarrier nofilter}
  </div>

  <div id="extra_carrier"></div>
{/block}
