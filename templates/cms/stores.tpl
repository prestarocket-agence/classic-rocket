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
{extends file='page.tpl'}

{block name='page_title'}
    {l s='Our stores' d='Shop.Theme.Global'}
{/block}

{block name='page_content_container'}
    <section id="content" class="page-content page-stores">
        {block name='page_content_top_stores'}
        {/block}
        {foreach $stores as $store}
            <article id="store-{$store.id}" class="c-panel c-panel--rounded">
                <div class="">
                    <div class="row">
                        <div class="col-md-3 store-picture u-d-desktop">
                            <img src="{$store.image.bySize.stores_default.url}" alt="{$store.image.legend}"
                                 title="{$store.image.legend}" class="u-img-fluid">
                        </div>
                        <div class="col-md-5 col-sm-7 col-12 col-lg-4 store-description">
                            <p class="h3 card-title">{$store.name}</p>
                            <address>{$store.address.formatted nofilter}</address>
                            {if $store.note || $store.phone || $store.fax || $store.email}
                                <div class="c-panel c-panel--sm c-panel--rounded c-panel--border">
                                    <p class="u-font-weight-bold u-mb-1">{l s='About and Contact' d='Shop.Theme.Global'}</p>
                                    <div id="about-{$store.id}">
                                        {if $store.note}
                                        <p class="u-txt-center">{$store.note}<p>
                                            {/if}
                                        <ul>
                                            {if $store.phone}
                                                <li>
                                                    <a class="u-txt-black u-txt-underline" href="tel:+{$store.phone}">{include file="_partials/icon.tpl" icon="telephone-fill" class='u-mr-1'}{$store.phone}</a>
                                                </li>
                                            {/if}
                                            {if $store.fax}
                                                <li>
                                                    <a class="u-txt-black u-txt-underline" href="fax:+{$store.fax}">{include file="_partials/icon.tpl" icon="printer" class='u-mr-1'}{$store.fax}</a>
                                                </li>
                                            {/if}
                                            {if $store.email}
                                                <li>
                                                    <a class="u-txt-black u-txt-underline" href="mailto:{$store.email}">{include file="_partials/icon.tpl" icon="envelope" class='u-mr-1'}{$store.email}</a>
                                                </li>
                                            {/if}
                                        </ul>
                                    </div>
                                </div>
                            {/if}
                        </div>
                        <div class="col-md-4 col-sm-5 col-12 col-lg-3 border-left">
                            <table class="table table-borderless table-sm">
                                {foreach $store.business_hours as $day}
                                    <tr>
                                        <th>{$day.day|truncate:4:'.'}</th>
                                        <td>
                                            <ul>
                                                {foreach $day.hours as $h}
                                                    <li>{$h}</li>
                                                {/foreach}
                                            </ul>
                                        </td>
                                    </tr>
                                {/foreach}
                            </table>
                        </div>
                    </div>
            </article>
        {/foreach}

    </section>
{/block}
