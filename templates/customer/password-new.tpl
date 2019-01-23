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

{block name='page_title'}
  {l s='Reset your password' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
    <form action="{$urls.pages.password}" method="post" class="needs-validation" novalidate autocomplete="false">
    <ul class="ps-alert-error">
      {foreach $errors as $error}
        <li class="item">
          <i>
            <svg viewBox="0 0 24 24">
              <path fill="#fff" d="M11,15H13V17H11V15M11,7H13V13H11V7M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20Z"></path>
            </svg>
          </i>
          <p>{$error}</p>
        </li>
      {/foreach}
    </ul>
      <section class="form-fields renew-password">

        <div class="email form-group">
          {l
            s='Email address: %email%'
            d='Shop.Theme.Customeraccount'
            sprintf=['%email%' => $customer_email|stripslashes]}
        </div>

          <div class="form-group">
            <label for="new_password">{l s='New password' d='Shop.Forms.Labels'}</label>
              <input id="new_password" class="form-control" type="password" data-validate="isPasswd" name="passwd" value="" required pattern=".{literal}{{/literal}5,{literal}}{/literal}">
            <small class="form-text text-muted">{l s='Your password must be at least %min% characters long.' d='Shop.Forms.Help' sprintf=['%min%' => 5]}</small>
            <div class="invalid-feedback js-invalid-feedback-browser"></div>


          </div>

          <div class="form-group">
            <label for="new_password_validation">{l s='Confirmation' d='Shop.Forms.Labels'}</label>
              <input id="new_password_validation" class="form-control" type="password" data-validate="isPasswd" name="confirmation" value="" required pattern=".{literal}{{/literal}5,{literal}}{/literal}">
            <small class="form-text text-muted">{l s='Your password must be at least %min% characters long.' d='Shop.Forms.Help' sprintf=['%min%' => 5]}</small>
            <div class="invalid-feedback js-invalid-feedback-browser"></div>
          </div>

          <input type="hidden" name="token" id="token" value="{$customer_token}">
          <input type="hidden" name="id_customer" id="id_customer" value="{$id_customer}">
          <input type="hidden" name="reset_token" id="reset_token" value="{$reset_token}">

          <button class="btn btn-primary" type="submit" name="submit">
            {l s='Change Password' d='Shop.Theme.Actions'}
          </button>

      </section>
    </form>
{/block}

{block name='page_footer'}
  <ul>
    <li><a href="{$urls.pages.authentication}">{l s='Back to Login' d='Shop.Theme.Actions'}</a></li>
  </ul>
{/block}
