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

    {assign var=paddingbottom value=($homeslider.slides[0]['sizes'][1]/$homeslider.slides[0]['sizes'][0]*100)}
    <div id="carousel" class="o-wrapper u-mb-spacing-lg /js carousel slick__arrow-large" {if $homeslider.slides|count > 1}data-slick={strip}
    '{literal}{
"autoplay": true,
"slidesToShow": 1,
"autoplaySpeed":{/literal}{$homeslider.speed}{literal}
}{/literal}'{/strip}{/if}>
        {foreach from=$homeslider.slides item=slide name='homeslider'}
            <a href="{$slide.url}">
                <div class="u-p-rel">
                    <img data-src="{$slide.image_url}" alt="{$slide.legend|escape}" class="u-img-fluid lazyload">
                    <noscript>
                        <img src="{$slide.image_url}" alt="{$slide.legend|escape}">
                    </noscript>
                    {if $slide.title || $slide.description}
                        <div class="c-carousel__content">
                            <p class="c-carousel__title">{$slide.title}</p>
                            <div class="c-carousel__baseline">{$slide.description nofilter}</div>
                            <a class="btn btn-lg btn-primary" href="{$slide.url}">{l s='Découvrir plus de détails' d='Shop.Theme.Global'}</a>
                        </div>
                    {/if}
                </div>
            </a>
        {/foreach}
    </div>
{/if}
