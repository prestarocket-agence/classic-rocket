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
  <div id="search_filters" class="search_filters">

    {block name='facets_title'}
      <p class="text-uppercase h6 d-none d-md-block">{l s='Filter By' d='Shop.Theme.Actions'}</p>
    {/block}

    {block name='facets_clearall_button'}
      <div id="_desktop_search_filters_clear_all" class="d-none d-md-block clear-all-wrapper">
        <button data-search-url="{$clear_all_link}" class="btn btn-secondary btn-block js-search-filters-clear-all mb-3">
          <i class="material-icons">&#xE14C;</i>
          {l s='Clear all' d='Shop.Theme.Actions'}
        </button>
      </div>
    {/block}
    {foreach from=$facets item="facet"}
      {if $facet.displayed}
        <div class="facet clearfix facet-block">
          <p class="h6 facet-title d-none d-md-block">{$facet.label}</p>
          {assign var=_expand_id value=10|mt_rand:100000}
          {assign var=_collapse value=true}
          {foreach from=$facet.filters item="filter"}
            {if $filter.active}{assign var=_collapse value=false}{/if}
          {/foreach}
          <div class="title d-md-none d-flex justify-content-between" data-target="#facet_{$_expand_id}" data-toggle="collapse"{if !$_collapse} aria-expanded="true"{/if}>
            <p class="h6 facet-title">{$facet.label}</p>
            <span>
              <span class="navbar-toggler collapse-icons">
                <i class="material-icons add">&#xE313;</i>
                <i class="material-icons remove">&#xE316;</i>
              </span>
            </span>
          </div>

          {if $facet.widgetType !== 'dropdown'}

            {block name='facet_item_other'}
              <div id="facet_{$_expand_id}" class="collapse show " data-collapse-hide-mobile>
                {foreach from=$facet.filters key=filter_key item="filter"}
                    {if $filter.displayed}
                    <div class="custom-control custom-{if $facet.multipleSelectionAllowed}checkbox{else}radio{/if}{if isset($filter.properties.color) || isset($filter.properties.texture)} custom-color{/if}">
                        <input
                                id="facet_input_{$_expand_id}_{$filter_key}"
                                data-search-url="{$filter.nextEncodedFacetsURL}"
                                type="{if $facet.multipleSelectionAllowed}checkbox{else}radio{/if}"
                                class="custom-control-input"
                                {if $filter.active } checked{/if}
                        >
                        <label class="custom-control-label" for="facet_input_{$_expand_id}_{$filter_key}">
                            {if isset($filter.properties.color)}
                                <span class="color" style="background-color:{$filter.properties.color}"></span>
                            {elseif isset($filter.properties.texture)}
                                <span class="color texture" style="background-image:url({$filter.properties.texture})"></span>
                            {/if}
                            {$filter.label}
                            {if $filter.magnitude}
                                <span class="magnitude">({$filter.magnitude})</span>
                            {/if}
                        </label>
                    </div>
                  {/if}
                {/foreach}
              </div>
            {/block}

          {else}

            {block name='facet_item_dropdown'}
              <div id="facet_{$_expand_id}" class="collapse show" data-collapse-hide-mobile>
                  <select class="custom-select">
                      <option value="">---</option>
                      {foreach from=$facet.filters item="filter"}
                          <option value="{$filter.nextEncodedFacetsURL}" {if $filter.active} selected="selected"{/if}>
                              {$filter.label}
                              {if $filter.magnitude}
                                  ({$filter.magnitude})
                              {/if}
                          </option>
                      {/foreach}
                  </select>

              </div>
            {/block}

          {/if}
        </div>
      {/if}
    {/foreach}
  </div>
