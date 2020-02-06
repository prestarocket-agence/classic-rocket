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
<section class="contact-form">
  <form class="js-customer-form needs-validation" action="{$urls.pages.contact}" method="post" {if $contact.allow_file_upload}enctype="multipart/form-data"{/if} novalidate autocomplete="false">

      {if $notifications}
        <div class="notifications-container alert {if $notifications.nw_error}alert-danger{else}alert-success{/if}">
          <ul>
              {foreach $notifications.messages as $notif}
                <li>{$notif}</li>
              {/foreach}
          </ul>
        </div>
      {/if}

      {if !$notifications || $notifications.nw_error}
        <section class="form-fields">
          <h1 class="text-center">{l s='Contact us' d='Shop.Theme.Global'}</h1>


          <div class="form-group">
            <label for="id_contact">{l s='Subject' d='Shop.Forms.Labels'}</label>
              <select name="id_contact" class="custom-select" id="id_contact">
                  {foreach from=$contact.contacts item=contact_elt}
                    <option value="{$contact_elt.id_contact}">{$contact_elt.name}</option>
                  {/foreach}
              </select>
          </div>

          <div class="form-group">
            <label for="from">{l s='Email address' d='Shop.Forms.Labels'}</label>
              <input
                      class="form-control"
                      name="from"
                      type="email"
                      id="from"
                      value="{$contact.email}"
                      placeholder="{l s='your@email.com' d='Shop.Forms.Help'}"
                      autocomplete="email"
                      required
              >
            <div class="invalid-feedback js-invalid-feedback-browser"></div>
          </div>

            {if $contact.orders}
              <div class="form-group">
                <label for="id_order">{l s='Order reference' d='Shop.Forms.Labels'}<small class="text-muted"> ({l s='Optional' d='Shop.Forms.Labels'})</small>
                </label>
                  <select name="id_order" class="custom-select" id="id_order">
                    <option value="">{l s='Select reference' d='Shop.Forms.Help'}</option>
                      {foreach from=$contact.orders item=order}
                        <option value="{$order.id_order}">{$order.reference}</option>
                      {/foreach}
                  </select>
              </div>
            {/if}

            {if $contact.allow_file_upload}
              <div class="form-group">
                <label for="fileUpload">{l s='Attachment' d='Shop.Forms.Labels'}<small class="text-muted"> ({l s='Optional' d='Shop.Forms.Labels'})</small>
                </label>
                  <div class="custom-file">
                    <input name="fileUpload" type="file" class="custom-file-input" id="fileUpload">
                    <label class="custom-file-label" for="fileUpload" data-browse="{l s='Choose file' d='Shop.Theme.Actions'}"><span class="sr-only">{l s='Choose file' d='Shop.Theme.Actions'}</span></label>
                  </div>
              </div>
            {/if}

          <div class="form-group">
            <label for="message">{l s='Message' d='Shop.Forms.Labels'}</label>
            <textarea
                    class="form-control"
                    name="message"
                    placeholder="{l s='How can we help?' d='Shop.Forms.Help'}"
                    rows="3"
                    required
                    id="message"
            >{if $contact.message}{$contact.message}{/if}</textarea>
            <div class="invalid-feedback js-invalid-feedback-browser"></div>

          </div>
          {if isset($id_module)}
            <div class="form-group">
                  {hook h='displayGDPRConsent' id_module=$id_module}
            </div>
          {/if}
          <style>
            input[name=url] {
              display: none !important;
            }
          </style>
          <input type="text" name="url" value=""/>
          <input type="hidden" name="token" value="{$token}" />
          <input class="btn btn-primary" type="submit" name="submitMessage" value="{l s='Send' d='Shop.Theme.Actions'}">
        </section>

      {/if}
  </form>
</section>
