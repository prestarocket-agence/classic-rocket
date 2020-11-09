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
{block name="header"}
    {include file="customer/_partials/header.tpl"}
{/block}
{block name='page_header_container'}{/block}

{block name='bodyClass'} u-bg-light{/block}
{block name='contentWrapperClass'}{/block}


{block name='page_title_account'}
    <h1 class="u-h3 u-mt-0"><a href="{$urls.pages.my_account}" class="account-link">
            {l s='Your account' d='Shop.Theme.Customeraccount'}</a></h1>
{/block}
{block name='notifications'}{/block}

{block name='page_content_container'}
    <section id="content" class="u-mb-4 {block name='pageContentClass'}page-content {/block}page-content--{$page.page_name}">


        <div class="row">
            <div class="col-12 col-md-4 col-lg-3">
                {include file='customer/_partials/my-account-sidebar.tpl'}
            </div>
            <div class="col-md-8 col-lg-9">
                <div class="{block name='main_account_class'}c-panel c-panel--lg u-p-rel{/block}"{block name="accountImgBg"}{/block}>
                    {block name='page_content_account'}
                        {block name='page_account_heading'}
                            {block name='page_title' hide}
                                <h2 class="{block name='pageHeaderClass'}c-panel__head u-h2 {/block}">{$smarty.block.child}</h2>
                            {/block}

                        {/block}
                        {block name='page_content_top'}
                            {block name='customer_notifications'}
                                {include file='_partials/notifications.tpl'}
                            {/block}
                        {/block}
                        {block name='page_content'}
                            <!-- Page content -->
                        {/block}
                    {/block}

                </div>
            </div>
        </div>

    </section>
{/block}

{block name='page_footer_container'}

{/block}