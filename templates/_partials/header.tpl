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
<header id="header" class="c-header">
    {block name='header_banner'}
        <div>
            {hook h='displayBanner'}
        </div>
    {/block}

{*    Top nav *}
    {block name='header_nav'}
        <div class="c-header-top">
            <div class="o-wrapper">
                <div class="o-layout o-layout--center-y">
                    {hook h='displayNav1'}

                    <div class="u-d-flex u-align-items-center u-d-desktop">
                        {hook h='displayNav2'}
                    </div>
                </div>
            </div>
        </div>
    {/block}

{*    Core *}
    {block name='header_top'}
        <div class="o-wrapper">
            <div class="o-layout o-layout--center-y c-header__content">
                <a href="{$urls.base_url}" class="c-header__logo">
                    <img class="u-img-fluid" src="{if isset($modules.prestarockettheme.logo)}{$modules.prestarockettheme.logo.url}{else}{$shop.logo}{/if}" alt="{$shop.name}"{if isset($modules.prestarockettheme.logo)} width="{$modules.prestarockettheme.logo.width}" height="{$modules.prestarockettheme.logo.height}"{/if}>
                </a>
                <div class="c-header__searchbar u-order-2@mobile">
                    {hook h='displaySearch'}
                </div>
                <div class="u-d-flex u-align-items-center u-justify-content-end">
                    {hook h='displayTop'}
                    <div class="u-d-mobile c-header__shortcut-item">
                        <a class="u-txt-black" href="#">
                            {include file="_partials/icon.tpl" icon="list" class="c-icon--28"}
                        </a>
                    </div>
                </div>
            </div>

            {hook h='displayNavFullWidth'}
        </div>
    {/block}
</header>