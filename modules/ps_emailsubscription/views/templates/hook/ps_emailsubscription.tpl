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

<div class="block_newsletter col-lg-8 col-12">
  <div class="row">
    <p id="block-newsletter-label" class="col-lg-5 col-12">{l s='Get our latest news and special sales' d='Shop.Theme.Global'}</p>
    <div class="col-lg-7 col-12">
      <form action="{$urls.pages.index}#footer" method="post" class="needs-validation">
        <input type="hidden" name="action" value="0">
        <div class="input-group">
          <input
                  name="email"
                  class="form-control{if isset($nw_error) and $nw_error} is-invalid{/if}"
                  type="email"
                  value="{$value}"
                  placeholder="{l s='Your email address' d='Shop.Forms.Labels'}"
                  aria-labelledby="block-newsletter-label"
                  autocomplete="email"
          >
          <div class="input-group-append">
            <button class="btn btn-primary" type="submit" name="submitNewsletter"><span class="d-none d-sm-inline">{l s='Subscribe' d='Shop.Theme.Actions'}</span><span class="d-inline d-sm-none">{l s='OK' d='Shop.Theme.Actions'}</span></button>
          </div>
        </div>

        <div class="clearfix">
            {if $msg}
              <p class="alert mt-2 {if $nw_error}alert-danger{else}alert-success{/if}">
                  {$msg}
              </p>
            {/if}
            {if $conditions}
              <p class="small mt-2">{$conditions}</p>
            {/if}
            {if isset($id_module)}
                {hook h='displayGDPRConsent' id_module=$id_module}
            {/if}
        </div>
      </form>
    </div>
  </div>
</div>
