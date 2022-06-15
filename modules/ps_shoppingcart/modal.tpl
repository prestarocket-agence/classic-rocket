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
{*<div id="blockcart-modal" data-close-on-click="true">*}
{*  <div>*}
{*    <section>*}
{*      <h1>{l s='Product Successfully Added to Your Shopping Cart' d='Shop.Theme.Checkout'}</h1>*}
{*      {$product.name}*}
{*      TODO: product image*}
{*      TODO: cross-selling*}
{*    </section>*}
{*  </div>*}
{*</div>*}

<div id="blockcart-modal" class="modal fade blockcart-modal" tabindex="-1" role="dialog"
     aria-labelledby="blockcart-modal-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog__offcanvas modal-dialog__offcanvas--right" role="document">
        <div class="modal-content">
            <div class="modal-header c-modal-header u-bg-primary">
                <div class="u-d-flex u-align-items-start">
                    <div>
                        <div class="u-mb-2">
                            <p class="u-h4">{$product.name} (x{$product.cart_quantity})</p>
                            <span>{l s='a été ajouté au panier' d='Shop.Theme.Global'}</span>
                        </div>
                        <a class="c-modal__btn-link--white" href="{$urls.pages.cart}?action=show">
                            {l s='Voir mon panier' d='Shop.Theme.Global'}
                            {include file="_partials/icon.tpl" icon="chevron-right" class="u-ml-1"}
                        </a>
                    </div>

                    <button type="button" class="modal-btn__close close" data-dismiss="modal"
                            aria-label="{l s='Close' d='Shop.Theme.Global'}">
                        {include file="_partials/icon.tpl" icon="x" class="c-icon--24"}
                    </button>
                </div>
            </div>
            <div class="modal-body">
{*                {widget name="rocketcrosselling" id_product=$product.id type="highlighted_products" tpl_name='offcanvas'}*}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-link"
                        data-dismiss="modal">{l s='Continue shopping' d='Shop.Theme.Actions'}</button>
                <a href="{$cart_url}"
                   class="btn btn-primary">{l s='Proceed to checkout' d='Shop.Theme.Actions'}</a>
            </div>
        </div>
    </div>
</div>

