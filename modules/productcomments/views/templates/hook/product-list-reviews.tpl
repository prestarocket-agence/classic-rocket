{**
 * 2007-2019 PrestaShop and Contributors
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
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}



{if $nb_comments != 0}
{* Rich snippet rating is displayed via php/smarty meaning it will be cached (for example on homepage) *}
<div>
  <div id="product-list-reviews-{$product.id}" class="product-list-reviews">
    <div class="grade-stars small-stars">
      {** full icon **}
        {section name="i" start=0 loop=5 step=1}
            {strip}
          <div class="star">
            <i class="material-icons">
            {if $average_grade lte $smarty.section.i.index}
              {* empty *}
               &#xE83A;
            {elseif $average_grade gt $smarty.section.i.index && $average_grade lt ($smarty.section.i.index+1)}
              {* half *}
               &#xE839;
            {else}
              {* full *}
               &#xE838;
            {/if}
            </i>
          </div>
            {/strip}
        {/section}
    </div>
  </div>
  {*<meta itemprop="reviewCount" content="{$nb_comments}" />*}
  {*<meta itemprop="ratingValue" content="{$average_grade}" />*}
</div>
{/if}
