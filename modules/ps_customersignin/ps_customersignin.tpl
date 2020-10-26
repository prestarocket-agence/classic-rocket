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
<div class="c-header__shortcut-item">
    {if $logged}
        <a
                class="o-layout o-layout--center-y"
                href="{$my_account_url}"
                title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
                rel="nofollow"
        >
            {include file="_partials/icon.tpl" icon="person-circle" class="c-icon--28 u-mr-1"}

            <div class="u-hidden-mobile">
                <p class="c-header__customer-name">{$customerName}</p>

                <div class="o-layout o-layout--start o-layout--center-y">
                    <p class="c-header__customer-account">{l s='Mon Compte' d='Shop.Theme.Customeraccount'}</p>
                    {include file="_partials/icon.tpl" icon="chevron-down-sharp"}
                </div>
            </div>
        </a>
    {else}
        <a
                href="{$my_account_url}"
                class="c-btn--nopad u-lh-1"
                title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
                rel="nofollow"
        >
            {include file="_partials/icon.tpl" icon="person-circle" class="c-icon--28 c-header__customer-icon"}
        </a>
    {/if}
</div>
