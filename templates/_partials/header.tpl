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
  <nav class="header-nav border-bottom">
    <div class="container header__container">
      <div class="row visible--desktop displayNav1">
        <div class="col-md-4">
            {hook h='displayNav1'}
        </div>
        <div class="col-md-8 displayNav2 right-nav">
            {hook h='displayNav2'}
        </div>
      </div>
      <div class="visible--mobile header--mobile no-gutters">
        <div class="col-4">
          <button id="menu-icon" class="btn" data-toggle="modal" data-target="#mobile_top_menu_wrapper">
            <i class="material-icons d-inline">&#xE5D2;</i>
          </button>
        </div>
        <div class="col-4">
          <div class="top-logo" id="_mobile_logo"></div>
        </div>
        <div class="col-4 mobile-user right-nav">
          <div id="_mobile_user_info"></div>
          <div id="_mobile_cart" class="mobile-cart"></div>
        </div>

      </div>
    </div>
  </nav>
{/block}

{block name='header_top'}
  <div class="header-top border-bottom">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-md-2 visible--desktop" id="_desktop_logo">
          <a href="{$urls.base_url}">
            <img class="logo img-fluid" src="{$shop.logo}" alt="{$shop.name}">
          </a>
        </div>
        <div class="col-md-10 col-sm-12 displayTop">
            {hook h='displayTop'}
        </div>
      </div>
    </div>
  </div>
    {hook h='displayNavFullWidth'}
{/block}
