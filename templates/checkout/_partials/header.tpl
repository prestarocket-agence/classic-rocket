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
{block name='header'}
    {block name='header_nav'}
        <div class="o-wrapper">
            <div class="o-layout o-layout--center-y">
                <div class="u-d-flex u-align-items-center">
                    {include file="_partials/icon.tpl" icon="shield-check" class="c-icon--24 u-mr-2"}
                    <p class="u-mb-0">{l s='Espace sécurisé' d='Shop.Theme.Global'}</p>
                </div>
                <a href="{$urls.base_url}">
                    <img class="u-img-fluid" src="{$shop.logo}" alt="{$shop.name} {l s='logo' d='Shop.Theme.Global'}">
                </a>
                <div>
                    {widget name="ps_contactinfo" hook="displayNav"}
                </div>
            </div>
        </div>
    {/block}
    {block name='header_top'}
    {/block}
{/block}
