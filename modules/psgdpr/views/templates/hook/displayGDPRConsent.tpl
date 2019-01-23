{*
* 2007-2018 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2018 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div id="gdpr_consent" class="gdpr_module_{$psgdpr_id_module|escape:'htmlall':'UTF-8'}">
    <div class="custom-control custom-checkbox">
        <input class="custom-control-input" id="psgdpr_consent_checkbox_{$psgdpr_id_module|escape:'htmlall':'UTF-8'}" name="psgdpr_consent_checkbox" type="checkbox" value="1" required>
        <label class="custom-control-label" for="psgdpr_consent_checkbox_{$psgdpr_id_module|escape:'htmlall':'UTF-8'}">{$psgdpr_consent_message nofilter}</label>
    </div>
</div>
{literal}
<script type="text/javascript">
    var psgdpr_front_controller = "{/literal}{$psgdpr_front_controller|escape:'htmlall':'UTF-8'}{literal}";
    psgdpr_front_controller = psgdpr_front_controller.replace(/\amp;/g,'');
    var psgdpr_id_customer = "{/literal}{$psgdpr_id_customer|escape:'htmlall':'UTF-8'}{literal}";
    var psgdpr_customer_token = "{/literal}{$psgdpr_customer_token|escape:'htmlall':'UTF-8'}{literal}";
    var psgdpr_id_guest = "{/literal}{$psgdpr_id_guest|escape:'htmlall':'UTF-8'}{literal}";
    var psgdpr_guest_token = "{/literal}{$psgdpr_guest_token|escape:'htmlall':'UTF-8'}{literal}";

    document.addEventListener('DOMContentLoaded', function() {
        let psgdpr_id_module = "{/literal}{$psgdpr_id_module|escape:'htmlall':'UTF-8'}{literal}";
        let parentForm = $('.gdpr_module_' + psgdpr_id_module).closest('form');

        let toggleFormActive = function() {
            let checkbox = $('#psgdpr_consent_checkbox_' + psgdpr_id_module);
            let element = $('.gdpr_module_' + psgdpr_id_module);
            let iLoopLimit = 0;

            // Look for parent elements until we find a submit button, or reach a limit
            while(0 === element.nextAll('[type="submit"]').length &&  // Is there any submit type ?
                element.get(0) !== parentForm.get(0) &&  // the limit is the form
                element.length &&
                iLoopLimit != 1000) { // element must exit
                    element = element.parent();
                    iLoopLimit++;
            }

            if (checkbox.prop('checked') === true) {
                if (element.find('[type="submit"]').length > 0) {
                    element.find('[type="submit"]').removeAttr('disabled');
                } else {
                    element.nextAll('[type="submit"]').removeAttr('disabled');
                }
            } else {
                if (element.find('[type="submit"]').length > 0) {
                    element.find('[type="submit"]').attr('disabled', 'disabled');
                } else {
                    element.nextAll('[type="submit"]').attr('disabled', 'disabled');
                }
            }
        }

        // Triggered on page loading
        toggleFormActive();

        $('body').on('change', function(){
            // Triggered after the dom might change after being loaded
            toggleFormActive();

            // Listener ion the checkbox click
            $(document).on("click" , "#psgdpr_consent_checkbox_"+psgdpr_id_module, function() {
                toggleFormActive();
            });

            $(document).on('submit', parentForm, function(event) {
                $.ajax({
                    data: 'POST',
                    //dataType: 'JSON',
                    url: psgdpr_front_controller,
                    data: {
                        ajax: true,
                        action: 'AddLog',
                        id_customer: psgdpr_id_customer,
                        customer_token: psgdpr_customer_token,
                        id_guest: psgdpr_id_guest,
                        guest_token: psgdpr_guest_token,
                        id_module: psgdpr_id_module,
                    },
                    success: function (data) {
                        // parentForm.submit();
                    },
                    error: function (err) {
                        console.log(err);
                    }
                });
            });
        });
    });
</script>
{/literal}
