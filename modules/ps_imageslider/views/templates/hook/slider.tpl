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
{if $homeslider.slides}
    <div class="c-carousel">
        <div class="c-snap{if $homeslider.slides|count > 1} /js glider js-slider{/if}" data-glider='{strip}
        {ldelim}
        "slidesToShow":1,
        "slidesToScroll":"auto",
        "draggable":false,
        "scrollLock":true,
        "dots":"#hs-dots",
{*        duration:"{$homeslider.speed}",*}
        "arrows": {ldelim}
            "prev": "#hs-arrow-prev",
            "next": "#hs-arrow-next"
        {rdelim}
        {rdelim}
        {/strip}'>
            {foreach from=$homeslider.slides item=slide name='homeslider'}
                <div class="u-p-rel">
                    <a href="{$slide.url}">
                        <img data-src="{$slide.image_url}" alt="{$slide.legend|escape}" class="u-img-fluid lazyload"/>
                        {if $slide.title || $slide.description}
                            <div class="c-carousel__content">
                                <p class="c-carousel__title">{$slide.title}</p>
                                <div class="c-carousel__baseline">{$slide.description nofilter}</div>
                                <a class="btn btn-lg btn-primary"
                                   href="{$slide.url}">{l s='Découvrir plus de détails' d='Shop.Theme.Global'}</a>
                            </div>
                        {/if}
                    </a>
                </div>
            {/foreach}
        </div>
        <div class="u-d-flex u-align-items-center u-mt-2 u-mb-2">
            <button id="hs-arrow-prev" aria-label="{l s='Précédent' d='Shop.Theme.Global'}"
                    class="c-btn--unstyled glider-prev">{include file="_partials/icon.tpl" icon="chevron-left" class="c-icon--20"}</button>
            <button id="hs-arrow-next" aria-label="{l s='Suivant' d='Shop.Theme.Global'}"
                    class="c-btn--unstyled glider-next">{include file="_partials/icon.tpl" icon="chevron-right" class="c-icon--20"}</button>
            <div class="c-slider__dots glider-dots glider-dots--right" id="hs-dots"></div>
        </div>
    </div>
{/if}
