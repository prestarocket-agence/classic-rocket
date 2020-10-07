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
<div class="row">
{*  <div class="small col-lg-4">*}
{*    {block name='pagination_summary'}*}
{*      {l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=['%from%' => $pagination.items_shown_from ,'%to%' => $pagination.items_shown_to, '%total%' => $pagination.total_items]}*}
{*    {/block}*}
{*  </div>*}

  <nav class="col-lg-4 c-pagination">
    {block name='pagination_page_list'}
     {if $pagination.should_be_displayed}
        <ul class="o-layout o-layout--center-y o-layout--center-x">
          {foreach from=$pagination.pages item="page"}
            <li class="c-pagination__item">
              {if $page.type === 'spacer'}
                <span class="" aria-hidden="true">...</span>
              {else}
                <a
                  rel="{if $page.type === 'previous'}prev{elseif $page.type === 'next'}next{else}nofollow{/if}"
                  href="{if $page.page == 1}{$page.url|replace:'?page=1':''|replace:'&page=1':''}{else}{$page.url}{/if}"
                  class="u-txt-black u-txt-sm {if $page.type === 'previous'}previous {elseif $page.type === 'next'}next {/if}{['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}"{if !$page.clickable} tabindex="-1"{/if}
                >
                  {if $page.type === 'previous'}
                      {include '_partials/icon.tpl' icon="arrow-back-sharp" class="c-icon--md"}
                  {elseif $page.type === 'next'}
                      {include '_partials/icon.tpl' icon="arrow-forward-sharp" class="c-icon--md"}
                  {else}
                    {$page.page}
                  {/if}
                </a>
              {/if}
            </li>
          {/foreach}
        </ul>
      {/if}
    {/block}
  </nav>

</div>
