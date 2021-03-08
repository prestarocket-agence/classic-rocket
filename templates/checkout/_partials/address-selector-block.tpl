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
{block name='address_selector_blocks'}
    {foreach $addresses as $address}
        <div class="col-lg-6">
            <article
                    class="c-checkout-card /js address-item{if $address.id == $selected} is-selected{/if}"
                    id="{$name|classname}-address-{$address.id}"
            >
                <label for="r-{$name|classname}-address-{$address.id}" class="u-mb-0 u-w-100">
                <span class="u-mb-1 u-d-flex /js custom-control custom-radio">
                    <span class="o-layout o-layout--start o-layout--center-y">
                        <input
                                type="radio"
                                name="{$name}"
                                value="{$address.id}"
                                id="r-{$name|classname}-address-{$address.id}"
                                class="custom-control-input /js js-input-delivery"
                                {if $address.id == $selected}checked{/if}
                        >
                        <span class="u-h6 u-mr-2 /js custom-control-label">{$address.alias}</span>
                    </span>
                </span>


                    <span class="u-txt-sm">
                    {$address.formatted nofilter}
                </span>
                </label>
                {if $interactive}
                    <div class="u-mt-2">
                <span class="u-mr-2">
                    <a class="u-txt-sm /js edit-address text-muted"
                       data-link-action="edit-address"
                       href="{url entity='order' params=['id_address' => $address.id, 'editAddress' => $type, 'token' => $token]}">
                        {include file="_partials/icon.tpl" icon="pencil-square" class="u-icon--center-y u-mr-1"}
                        {l s='Edit' d='Shop.Theme.Actions'}
                    </a>
                </span>
                <span>
                    <a class="u-txt-sm /js delete-address text-muted"
                       data-link-action="delete-address"
                       href="{url entity='order' params=['id_address' => $address.id, 'deleteAddress' => true, 'token' => $token]}">
                        {include file="_partials/icon.tpl" icon="trash-fill" class="u-icon--center-y u-mr-1"}
                        {l s='Delete' d='Shop.Theme.Actions'}
                    </a>
                </span>
                    </div>
                {/if}
            </article>
        </div>
    {/foreach}
    {if $interactive}
        <p>
            <button class="/js ps-hidden-by-js" type="submit">{l s='Save' d='Shop.Theme.Actions'}</button>
        </p>
    {/if}
{/block}
