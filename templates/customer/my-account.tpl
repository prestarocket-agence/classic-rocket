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
{extends file='customer/page.tpl'}

{block name="header"}
    {include file="customer/_partials/header.tpl"}
{/block}
{block name='bodyClass'} u-bg-light{/block}
{block name='contentWrapperClass'}{/block}

{*{block name='page_title'}*}
{*{/block}*}

{block name='page_content'}
    <div class="c-account-landing">
        <p class="c-account-landing__title">{l s='Bienvenue dans votre espace' d='Shop.Theme.Global'}</p>
        <p>{l s='Consultez et ajustez vos informations personnelles' d='Shop.Theme.Global'}</p>
    </div>
        <div class="c-account-landing__img">
            <div class="c-account-landing__gradient"></div>
            <img class="u-img-fluid" src="{$urls.img_url}account-placeholder.jpg" alt="Votre compte">
        </div>
{/block}

{block name='page_footer'}
    {block name='my_account_links'}
    {/block}
{/block}
