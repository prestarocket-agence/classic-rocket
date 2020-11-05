{*
* 2020 PayPlug
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0).
* It is available through the world-wide-web at this URL:
* https://opensource.org/licenses/osl-3.0.php
* If you are unable to obtain it through the world-wide-web, please send an email
* to contact@payplug.com so we can send you a copy immediately.
*
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PayPlug module to newer
 * versions in the future.
*
*  @author PayPlug SAS
*  @copyright 2020 PayPlug SAS
*  @license   https://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*  International Registered Trademark & Property of PayPlug SAS
*}

<!-- MODULE Payplug -->
<a class="c-account-sidebar__row {if $urls.current_url == $urls.pages} is-active{/if}" id="savedcards-link"
   href="{$payplug_cards_url|escape:'htmlall':'UTF-8'}">
    {include file="_partials/icon.tpl" icon="credit-card" class="c-icon--16 u-mr-2"}
    {l s='Saved cards' mod='payplug'}
</a>
<!-- END : MODULE Payplug -->
