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

{foreach from=$linkBlocks item=$linkBlock name=linkBlocks}
    {if $smarty.foreach.linkBlocks.first}
        <div class="offset-0 offset-lg-1 col-12 col-lg-3 c-footer-item">
            {assign var=_expand_id value=10|mt_rand:100000}

            <a href="#footer_sub_menu_{$_expand_id}" class=""
               data-toggle="collapse">
                <p class="c-footer-item__title">{$linkBlock.title}</p>
            </a>
            <ul id="footer_sub_menu_{$_expand_id}" class="collapse show" data-collapse-hide-mobile>
                {foreach $linkBlock.links as $link}
                    <li class="u-mb-1">
                        <a
                                id="{$link.id}-{$linkBlock.id}"
                                class="{$link.class} u-txt-black"
                                href="{$link.url}"
                                title="{$link.description}"
                                {if !empty($link.target)} target="{$link.target}" {/if}
                        >
                            {$link.title}
                        </a>
                    </li>
                {/foreach}
            </ul>
        </div>
    {/if}
{/foreach}

