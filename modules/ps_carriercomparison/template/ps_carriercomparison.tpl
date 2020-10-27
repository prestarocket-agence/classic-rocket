{*
* 2007-2015 PrestaShop
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<div class="c-panel u-mb-3 /js js-carrier-compare"
     data-url="{url entity='module' name='ps_carriercomparison' controller='carrier_comparison'}"
     data-item="{$carrierComparisonInfo|@json_encode}"
     data-method="{$refreshMethod}">
    <form method="post" action="#">
        <fieldset>
            <p class="c-panel__head u-h4">{l s='Estimez vos frais de livraison' d='Modules.Carriercomparison.Shop'}</p>

            <div>
                <div class="c-checkout-carrier__info">
                    <div class="u-mb-3">
                        <label>{l s='Sélectionnez votre pays' d='Modules.Carriercomparison.Shop'}</label>
                        <select class="custom-select" name="id_country">
                            {foreach from=$countries item=country}
                                <option value="{$country.id_country}"
                                        {if $carrierComparisonInfo['idCountry'] == $country.id_country}selected="selected"{/if}>{$country.name}</option>
                            {/foreach}
                        </select>
                    </div>

                    {*                    <div class="/js js-states">*}
                    {*                        <label>{l s='State' d='Modules.Carriercomparison.Shop'}</label>*}
                    {*                        <select name="id_state">*}
                    {*                            <option></option>*}
                    {*                        </select>*}
                    {*                    </div>*}

                    <div class="u-mb-3">
                        <label>{l s='Zip Code' d='Modules.Carriercomparison.Shop'}</label>
                        <input class="form-control c-carrier__input u-mr-1" type="text" name="zipcode"
                               value="{$carrierComparisonInfo['zipCode']}"/>

                        <span class="u-txt-xs">
                            ({l s='Needed for certain carriers.' d='Modules.Carriercomparison.Shop'})
                        </span>
                    </div>
                </div>

                <div class="c-checkout-carrier u-mb-3 /js js-carriers">
                    <table>
                        <tbody id="carriers_list">
                        </tbody>
                    </table>
                </div>

                <div class="c-checkout-carrier__btn">
                    <input class="btn btn-link /js js-carrier-compare-estimate" type="button"
                           value="{l s='Estimate Shipping Cost' d='Modules.Carriercomparison.Shop'}"/>
                    <input class="btn btn-primary /js js-carrier-compare-submit" type="button"
                           value="{l s='Update cart' d='Modules.Carriercomparison.Shop'}"/>
                </div>
            </div>
        </fieldset>
    </form>
</div>
