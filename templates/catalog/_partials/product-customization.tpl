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
<section class="product-customization">
    {if !$configuration.is_catalog}
        <div class="card card-block">
            <p class="h4 card-title">{l s='Product customization' d='Shop.Theme.Catalog'}</p>
            <p>{l s='Don\'t forget to save your customization to be able to add to cart' d='Shop.Forms.Help'}</p>
            {block name='product_customization_form'}
                <form class="needs-validation" method="post" action="{$product.url}" enctype="multipart/form-data"
                      novalidate autocomplete="false">
                    {foreach from=$customizations.fields item="field"}
                        <div class="form-group">
                        <label for="field-{$field.id_customization_field}"> {$field.label}{if !$field.required}<small class="text-muted"> ({l s='Optional' d='Shop.Forms.Labels'})</small>{/if}</label>
                        {if $field.type == 'text'}
                            <textarea placeholder="{l s='Your message here' d='Shop.Forms.Help'}"
                                      class="product-message form-control"
                                      maxlength="250" {if $field.required} required {/if} name="{$field.input_name}"
                                      id="field-{$field.id_customization_field}"></textarea>
                            <div class="invalid-feedback js-invalid-feedback-browser"></div>

                            <small class="form-text text-muted">{l s='250 char. max' d='Shop.Forms.Help'}</small>
                            {if $field.text !== ''}
                                <strong class="customization-message">{l s='Your customization:' d='Shop.Theme.Catalog'}
                                    <label>{$field.text}</label>
                                </strong>
                            {/if}
                        {elseif $field.type == 'image'}
                            {if $field.is_customized}
                                <div class="my-2">
                                    <img src="{$field.image.small.url}" class="border">
                                    <a class="remove-image btn btn-sm btn-outline-danger"
                                       href="{$field.remove_image_url}"
                                       rel="nofollow">{l s='Remove Image' d='Shop.Theme.Actions'}</a>
                                </div>
                            {/if}
                            <div class="custom-file">
                                <input class="custom-file-input" {if $field.required} required {/if} type="file"
                                       name="{$field.input_name}" id="field-{$field.id_customization_field}">
                                <label class="custom-file-label"
                                       for="field-{$field.id_customization_field}" data-browse="{l s='Choose file' d='Shop.Theme.Actions'}">{l s='Choose file' d='Shop.Theme.Actions'}</label>
                                <div class="invalid-feedback js-invalid-feedback-browser"></div>

                            </div>
                            <small class="form-text text-muted">{l s='.png .jpg .gif' d='Shop.Forms.Help'}</small>

                        {/if}
                        </div>
                    {/foreach}
                    <button class="btn btn-primary" type="submit" name="submitCustomizedData">{l s='Save Customization' d='Shop.Theme.Actions'}</button>
                </form>
            {/block}
        </div>
    {/if}
</section>
