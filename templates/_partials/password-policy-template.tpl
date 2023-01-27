
{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
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
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}

<template id="password-feedback">
  <div
    class="password-strength-feedback mt-3"
    style="display: none;"
  >
    <div class="progress-container">
      <div class="progress mb-1">
        <div class="progress-bar" role="progressbar" value="50" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
    </div>
    <script type="text/javascript" class="js-hint-password">
      {if !empty($page['password-policy']['feedbacks'])}
        {$page['password-policy']['feedbacks']|@json_encode nofilter}
      {/if}
    </script>

    <div class="password-strength-text"></div>
    <div class="password-requirements">
      <div class="password-requirements-length" data-translation="{l s='Enter a password between %s and %s characters' d='Shop.Theme.Customeraccount'}">
        <i class="material-icons close-icon">close</i><i class="material-icons text-success check-icon">check</i>
        <span></span>
      </div>
      <div class="password-requirements-score" data-translation="{l s='The minimum score must be: %s' d='Shop.Theme.Customeraccount'}">
        <i class="material-icons close-icon">close</i><i class="material-icons text-success check-icon">check</i>
        <span></span>
      </div>
    </div>
  </div>
</template>
