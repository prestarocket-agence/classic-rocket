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
<!doctype html>
<html lang="{$language.iso_code}">

<head>
    {block name='head'}
        {include file='_partials/head.tpl'}
    {/block}
</head>

<body id="{$page.page_name}" class="{$page.body_classes|classnames}">

{block name='hook_after_body_opening_tag'}
    {hook h='displayAfterBodyOpeningTag'}
{/block}

<header id="header" class="l-header">
    {block name='header'}
        {include file='checkout/_partials/header.tpl'}
    {/block}
</header>

{block name='notifications'}
    {include file='_partials/notifications.tpl'}
{/block}

<section id="wrapper" class="l-wrapper l-wrapper--boxed">
    {hook h="displayWrapperTop"}

    {block name='content'}
      <section id="content">
        <div class="row">
          <div id="js-checkout-process" class="col-lg-8 accordion mb-4">
              {block name='checkout_process'}
                  {render file='checkout/checkout-process.tpl' ui=$checkout_process}
              {/block}
          </div>
          <div class="col-lg-4 order-checkout">

              {block name='cart_summary'}
                  {include file='checkout/_partials/cart-summary.tpl' cart = $cart}
              {/block}

              {hook h='displayReassurance'}
          </div>
        </div>
      </section>
    {/block}
    {hook h="displayWrapperBottom"}
</section>

<footer id="footer" class="l-footer">
    {block name='footer'}
        {include file='checkout/_partials/footer.tpl'}
    {/block}
</footer>
{block name='offcanvas_modals'}
    {* offcanvas search filter *}
  <div class="modal fade" id="offcanvas_search_filter" tabindex="-1" role="dialog" data-modal-hide-mobile>
    <div class="modal-dialog modal-dialog__offcanvas modal-dialog__offcanvas--right" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div id="_mobile_search_filters_wrapper"></div>
        </div>
      </div>
    </div>
  </div>
    {* end search filter *}
    {* offcanvas menu *}
  <div class="modal fade" id="mobile_top_menu_wrapper" tabindex="-1" role="dialog" data-modal-hide-mobile>
    <div class="modal-dialog modal-dialog__offcanvas" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
          <div class="js-top-menu-bottom">
            <div id="_mobile_currency_selector"></div>
            <div id="_mobile_language_selector"></div>
            <div id="_mobile_contact_link"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
    {* end offcanvas menu *}
{/block}
{block name='javascript_bottom'}
    {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
{/block}

{block name='hook_before_body_closing_tag'}
    {hook h='displayBeforeBodyClosingTag'}
{/block}

</body>

</html>
