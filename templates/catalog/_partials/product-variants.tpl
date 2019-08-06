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
<div class="product-variants">
  {foreach from=$groups key=id_attribute_group item=group}
      {if !empty($group.attributes)}
      <div class="form-group product-variants-item">
      {if $group.group_type == 'select'}
          <label for="group_{$id_attribute_group}">{$group.name}</label>
          <div>
          <select
          class="custom-select w-auto"
          id="group_{$id_attribute_group}"
          data-product-attribute="{$id_attribute_group}"
          name="group[{$id_attribute_group}]">
          {foreach from=$group.attributes key=id_attribute item=group_attribute}
            <option value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} selected="selected"{/if}>{$group_attribute.name}</option>
          {/foreach}
        </select>
          </div>
      {elseif $group.group_type == 'color'}
          <div class="label">{$group.name}</div>
          <div class="clearfix">
          {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <label class="label-color">
                <input class="input-color d--none" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}"{if $group_attribute.selected} checked="checked"{/if}>
                <span
                  {if $group_attribute.html_color_code && !$group_attribute.texture}class="color" style="background-color: {$group_attribute.html_color_code}" {/if}
                  {if $group_attribute.texture}class="color texture" style="background-image: url({$group_attribute.texture})" {/if}
                ><span class="sr-only">{$group_attribute.name}</span></span>
              </label>
          {/foreach}
          </div>

      {elseif $group.group_type == 'radio'}
          <div class="label">{$group.name}</div>
          {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <div class="custom-control custom-radio">
                <input id="r-variant-{$id_attribute_group}-{$id_attribute}" class="custom-control-input" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}"{if $group_attribute.selected} checked="checked"{/if}>
                <label class="custom-control-label" for="r-variant-{$id_attribute_group}-{$id_attribute}">{$group_attribute.name}</label>
              </div>
          {/foreach}
      {/if}
    </div>
    {/if}
  {/foreach}
</div>
