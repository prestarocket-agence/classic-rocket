{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
* @copyright 2007-2015 PrestaShop SA
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*}

<a href="{$mailAlert.link}" class="col-md-2 col-4 text-center">
  <img src="{$mailAlert.cover_url}" alt=""/>
</a>
<a href="{$mailAlert.link}" class="col-md-8 col-6">
  <div>{$mailAlert.name}
    <span>{$mailAlert.attributes_small}</span></div>
</a>
<a href="#"
   title="{l s='Remove mail alert' d='Modules.Emailalerts.Shop'}"
   class="js-remove-email-alert btn btn-link col-2"
   rel="js-id-emailalerts-{$mailAlert.id_product|intval}-{$mailAlert.id_product_attribute|intval}"
   data-url="{url entity='module' name='ps_emailalerts' controller='actions' params=['process' => 'remove']}">
  <i class="material-icons">delete</i>
</a>
