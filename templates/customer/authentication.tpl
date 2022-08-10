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
{block name='bodyClass'} u-bg-light{/block}
{block name='contentWrapperClass'}{if isset($modules.rocketfunnel.cookie_redirect_checkout) && $modules.rocketfunnel.cookie_redirect_checkout} u-mb-6{else} c-panel c-panel--lg c-panel--center u-mb-6{/if}{/block}
{block name='pageHeaderClass'} u-h2 u-txt-center{/block}
{block name='page_title'}
    {if isset($modules.rocketfunnel.cookie_redirect_checkout) && $modules.rocketfunnel.cookie_redirect_checkout}
    {else}
        {l s='Log in to your account' d='Shop.Theme.Customeraccount'}
    {/if}
{/block}
{block name='page_title_account'}
    {if isset($modules.rocketfunnel.cookie_redirect_checkout) && $modules.rocketfunnel.cookie_redirect_checkout}
            {l s='Secured step' d='Shop.Theme.Global'}
    {/if}
{/block}
{block name='page_content'}
    {block name='login_form_container'}
        {if isset($modules.rocketfunnel.cookie_redirect_checkout) && $modules.rocketfunnel.cookie_redirect_checkout}
            <div class="row">

                <div class="col-lg-5{block name='class_panel_checkout_auth'}{/block}">
                    <div class="c-panel c-panel--lg u-h-100">
                        <p class="u-h3 u-txt-center u-mb-3">{l s='Log in to your account' d='Shop.Theme.Customeraccount'}</p>
                        {block name='after_title_checkout_auth'}
                            <p class="u-txt-sm u-txt-center u-mb-3">
                                {l s='Connectez-vous pour passer commande plus rapidement.' d='Shop.Theme.Global'}
                            </p>
                        {/block}
                        <section class="login-form s-login-form-checkout">
                            {render file='customer/_partials/login-form.tpl' ui=$login_form class="c-form__mw-450"}
                        </section>
                        {block name='display_after_login_form'}
                            {hook h='displayCustomerLoginFormAfter'}
                        {/block}
                    </div>
                </div>

                <div class="col-lg-2">
                    <div class="c-funnel__separator">
                        <span>{l s='ou' d='Shop.Theme.Global'}</span>
                    </div>
                </div>

                <div class="col-lg-5{block name='class_panel_checkout_noaccount'}{/block}">
                    <div class="c-panel c-panel--lg u-txt-center u-h-100">
                        <p class="u-h3 u-txt-center u-mb-3">{l s='Nouveau client' d='Shop.Theme.Customeraccount'}</p>
                        {block name='after_title_checkout_noaccount'}
                            <p class="u-txt-sm u-mb-3">
                                {l s='Créez un compte pour commander et accéder à nos services.' d='Shop.Theme.Global'}
                            </p>
                        {/block}
                        <div class="u-txt-center">
                            <a class="btn btn-outline-primary" href="{$urls.pages.register}">
                                {l s='Continue' d='Shop.Theme.Actions'}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        {else}
            <section class="login-form">
                {render file='customer/_partials/login-form.tpl' ui=$login_form class="c-form__mw-450"}
            </section>
            {block name='display_after_login_form'}
                {hook h='displayCustomerLoginFormAfter'}
            {/block}
        {/if}
    {/block}
{/block}
{block name='page_footer'}
    {if isset($modules.rocketfunnel.cookie_redirect_checkout) && $modules.rocketfunnel.cookie_redirect_checkout}
        {block name='page_footer_auth_checkout'}
        {/block}
    {else}
        <div class="no-account u-txt-center">
            <a class="btn btn-outline-primary" href="{$urls.pages.register}" data-link-action="display-register-form">
                {l s='No account? Create one here' d='Shop.Theme.Customeraccount'}
            </a>
        </div>
    {/if}
{/block}

{block name="footer"}
{/block}

