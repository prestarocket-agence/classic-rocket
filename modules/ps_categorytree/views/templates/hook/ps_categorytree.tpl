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

{function name="categories" nodes=[] depth=0}
  {strip}
    {if $nodes|count}
      <ul class="category-sub-menu">
        {foreach from=$nodes item=node}
          <li data-depth="{$depth}" class="category-sub__item category-sub__item--{$depth}{if $depth===0} clearfix{/if}">
            {if $depth===0}
              <a href="{$node.link}" {if $node.children}class="float-left"{/if}>{$node.name}</a>
              {if $node.children}
                <div class="float-right navbar-toggler collapse-icons" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="material-icons add">&#xE145;</i>
                  <i class="material-icons remove">&#xE15B;</i>
                </div>
                <div class="collapse float-left clearfix w-100" id="exCollapsingNavbar{$node.id}">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}
            {else}
              <a class="category-sub-link" href="{$node.link}">{$node.name}</a>
              {if $node.children}
                <i class="material-icons icon-collapse cursor-pointer" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">&#xE313;</i>
                <div class="collapse float-left clearfix w-100" id="exCollapsingNavbar{$node.id}">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}
            {/if}
          </li>
        {/foreach}
      </ul>
    {/if}
  {/strip}
{/function}

<div class="block-categories visible--desktop">
  <ul class="category-top-menu">
    <li><a class="text-uppercase h5" href="{$categories.link nofilter}">{$categories.name}</a></li>
    <li>{categories nodes=$categories.children}</li>
  </ul>
    <div class="clearfix"></div>
</div>
