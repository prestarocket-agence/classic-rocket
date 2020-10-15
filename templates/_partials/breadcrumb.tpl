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
{if isset($breadcrumb.links[1])}
    <nav data-depth="{$breadcrumb.count}" class="">
        <div class="o-layout o-layout--start o-layout--center-y c-catalog-breadcrumb">
            {foreach from=$breadcrumb.links item=path name=breadcrumb}
                {block name='breadcrumb_item'}
                    {if $smarty.foreach.breadcrumb.last}
                        <p class="c-catalog-breadcrumb__item">{$path.title}</p>
                    {else}
                        <a class="c-catalog-breadcrumb__item" itemprop="item" href="{$path.url}">{$path.title}</a>
                        {include "_partials/icon.tpl" icon="chevron-right-sharp" class="u-icon--16 u-ml-1 u-mr-1"}
                    {/if}
                {/block}
            {/foreach}
        </div>
    </nav>
{/if}
