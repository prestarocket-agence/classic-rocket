{**
  * 2007-2019 PrestaShop.
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
  * @copyright 2007-2019 PrestaShop SA
  * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
  * International Registered Trademark & Property of PrestaShop SA
  *}
<section id="js-active-search-filters" class="{if $activeFilters|count}active_filters{else}hide{/if}">
  {block name='active_filters_title'}
    <p class="h6 {if $activeFilters|count}active-filter__title{else}d--none{/if}">{l s='Active filters' d='Shop.Theme.Global'}</p>
  {/block}

  {if $activeFilters|count}
    <div class="active_filters__list">
      {foreach from=$activeFilters item="filter"}
        {block name='active_filters_item'}
            <a class="js-search-link active_filters__list-item btn btn-sm btn-light" href="{$filter.nextEncodedFacetsURL}"><i class="material-icons">&#xE5CD;</i> {l s='%1$s: ' d='Shop.Theme.Catalog' sprintf=[$filter.facetLabel]}
                <strong>{$filter.label}</strong></a>
        {/block}
      {/foreach}
    </div>
  {/if}
</section>
