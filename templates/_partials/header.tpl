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
    <div class="header-banner">
        {hook h='displayBanner'}
    </div>
{/block}

{block name='header_nav'}
    <div class="header-nav u-bor-bot">
        <div class="header__container container">
            <div class="u-a-i-c d--flex-between visible--desktop">
                <div class="small">
                    {hook h='displayNav1'}
                </div>
                <div class="header-nav__right">
                    {hook h='displayNav2'}
                </div>
            </div>
        </div>
    </div>
{/block}

{block name='header_top'}
    <div class="container header-top d--flex-between u-a-i-c">
        <button class="visible--mobile btn" id="menu-icon" data-toggle="modal" data-target="#mobile_top_menu_wrapper">
            <i class="material-icons d-inline">&#xE5D2;</i>
        </button>
        <a href="{$urls.base_url}" class="header__logo header-top__col">
            <img class="logo img-fluid" src="{$shop.logo}" alt="{$shop.name}">
        </a>
        <div class="header__search">
            {hook h='displaySearch'}
        </div>
        <div class="header__right header-top__col">
            {hook h='displayTop'}
        </div>
    </div>
    <div class="container">
        {hook h='displayNavFullWidth'}
    </div>
{/block}
