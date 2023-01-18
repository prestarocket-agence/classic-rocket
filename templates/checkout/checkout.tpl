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

<header id="header" class="c-header-checkout">
    {block name='header'}
        {include file='checkout/_partials/header.tpl'}
    {/block}
</header>

{block name='notifications'}
    {include file='_partials/notifications.tpl'}
{/block}

<section id="wrapper" class="o-wrapper">
    {hook h="displayWrapperTop"}

    {block name='content'}
      <section id="content">
        <div class="row">

          <div id="js-checkout-process" class="col-lg-8 /js accordion">
              {block name='checkout_process'}
                  {render file='checkout/checkout-process.tpl' ui=$checkout_process}
              {/block}
          </div>

          <div class="col-lg-4">
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
{block name='offcanvas_cart_summary'}
  <div class="modal fade" id="js-cart-summary-product-list" tabindex="-1" role="dialog" data-modal-hide-mobile>
    <div class="modal-dialog modal-dialog__offcanvas modal-dialog__offcanvas--right" role="document">
      <div class="modal-content">
        <div class="modal-header c-modal-header u-bg-primary">
          <div class="u-d-flex u-align-items-center">
          <p class="h3 u-mb-0 u-txt-white">{$cart.summary_string}</p>
          <button type="button" class="modal-btn__close close" data-dismiss="modal"
                  aria-label="{l s='Close' d='Shop.Theme.Global'}">
              {include file="_partials/icon.tpl" icon="x" class="c-icon--24"}
          </button>
          </div>
        </div>
        <div class="modal-body">
            {block name='cart_summary_product_list'}
                    {foreach from=$cart.products item=product}
                      {include file='checkout/_partials/cart-summary-product-line.tpl' product=$product}
                    {/foreach}
            {/block}
        </div>
        <div class="modal-footer">
          <a href="{$urls.pages.cart}?action=show" class="btn u-txt-primary" >{l s='Voir mon panier' d='Shop.Theme.Global'}</a>
          <button type="button" class="btn btn-primary" data-dismiss="modal">{l s='Close' d='Shop.Theme.Global'}</button>
        </div>

      </div>
    </div>
  </div>
{/block}
{block name='javascript_bottom'}
    {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
{/block}

{block name='hook_before_body_closing_tag'}
    {hook h='displayBeforeBodyClosingTag'}
{/block}

</body>

</html>
