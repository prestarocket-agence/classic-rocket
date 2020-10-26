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
{block name='header_banner'}
    <div class="c-topbanner">
        {hook h='displayBanner'}
    </div>
{/block}

{block name='header_nav'}
    <div class="c-top-header">
        <div class="o-wrapper">
            <div class="o-layout o-layout--center-y">
                {hook h='displayNav1'}

                <div class="c-top-header__selects">
                    {hook h='displayNav2'}
                </div>
            </div>
        </div>
    </div>
{/block}

{block name='header_top'}
    <div class="o-wrapper">
        <div class="o-layout o-layout--center-y c-header__content">
            <a href="{$urls.base_url}" class="c-header__logo">
                <img class="logo img-fluid" src="{$shop.logo}" alt="{$shop.name}">
            </a>
            <div class="c-header__searchbar u-order-mobile-2">
                {hook h='displaySearch'}
            </div>
            <div class="c-header__shortcut">
                {hook h='displayTop'}
                <div class="u-d-mobile c-header__shortcut-item">
                <a class="" href="#">
                    {include file="_partials/icon.tpl" icon="list" class="c-icon--28"}
                </a>
                </div>
            </div>
        </div>
        {hook h='displayNavFullWidth'}
    </div>
{/block}
