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
<section class="c-pdtlistsection c-featured-pdt u-mb-spacing-lg">
    <div class="c-pdtlistsection__heading">
    <p class="c-pdtlistsection__title">
        {l s='Popular Products' d='Shop.Theme.Catalog'}
    </p>
    </div>
    {assign var="productscount" value=$products|count}
    <div class="row">
    <div class="c-slider{if $productscount > 1} /js glider js-slider{/if}" data-glider='{strip}
        {ldelim}
        "slidesToShow":1.25,
        "slidesToScroll":"auto",
        "draggable":true,
        "scrollLock":false,
        "itemWidth":150,
        "dots":"#fp-dots",
        "arrows": {ldelim}

            "prev": "#fp-arrow-prev",
            "next": "#fp-arrow-next"

        {rdelim},
        "responsive": [
        {ldelim}
            "breakpoint": 992,
                "settings": {ldelim}
                     "slidesToShow":4.25
                {rdelim}
            {rdelim},
            {ldelim}
            "breakpoint": 500,
                "settings": {ldelim}
                     "slidesToShow":2.25
                {rdelim}
            {rdelim}
        ]
        {rdelim}
        {/strip}'>
        {foreach from=$products item="product"}
            {include file="catalog/_partials/miniatures/product.tpl" product=$product col="col-lg-3 col-md-4 col-6"}
        {/foreach}
    </div>
    </div>
    <div class="c-slider__dots" id="fp-dots"></div>
    <button id="fp-arrow-prev" aria-label="{l s='Précédent' d='Shop.Theme.Global'}"
            class="c-slider__arrow c-slider__arrow--left btn btn-link">{include file="_partials/icon.tpl" icon="chevron-left" class="c-icon--28"}</button>
    <button id="fp-arrow-next" aria-label="{l s='Suivant' d='Shop.Theme.Global'}"
            class="c-slider__arrow c-slider__arrow--right btn btn-link">{include file="_partials/icon.tpl" icon="chevron-right" class="c-icon--28"}</button>
</section>
