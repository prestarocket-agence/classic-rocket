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

<script type="text/javascript">
    var productCommentPostErrorMessage = '{l s='Sorry, your review cannot be posted.' d='Modules.Productcomments.Shop' js=1}';
</script>

<div id="post-product-comment-modal" class="modal fade product-comment-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="h1">{l s='Write your review' d='Modules.Productcomments.Shop'}</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="post-product-comment-form" action="{$post_comment_url nofilter}" method="POST">
                    <div class="row">
                        <div class="col-sm-2">
                            {if isset($product) && $product}
                                {block name='product_flags'}
                                    <ul class="product-flags">
                                        {foreach from=$product.flags item=flag}
                                            <li class="product-flag {$flag.type}">{$flag.label}</li>
                                        {/foreach}
                                    </ul>
                                {/block}

                                {block name='product_cover'}
                                    <div class="product-cover">
                                        {if $product.cover}
                                            <img class="js-qv-product-cover"
                                                 src="{$product.cover.bySize.medium_default.url}"
                                                 alt="{$product.cover.legend}" title="{$product.cover.legend}"
                                                 style="width:100%;" itemprop="image">
                                        {else}
                                            <img src="{$urls.no_picture_image.bySize.large_default.url nofilter}"
                                                 style="width:100%;">
                                        {/if}
                                    </div>
                                {/block}
                            {/if}
                        </div>
                        <div class="col-sm-4">
                            <p class="h3">{$product.name}</p>
                        </div>
                        <div class="col-sm-6">
                            {if $criterions|@count > 0}
                                <div id="criterions_list">
                                    {foreach from=$criterions item='criterion' name="criterion_list"}
                                        <fieldset>
                                            <div class="product-criterion">
                                                <legend class="product-criterion__name">{$criterion.name|escape:'html':'UTF-8'}
                                                    :
                                                </legend>
                                                <div class="starability-basic">
                                                    {section name="i" start=1 loop=6 step=1}
                                                        <input type="radio"
                                                               id="c{$criterion.id_product_comment_criterion}-rate{$smarty.section.i.index}"
                                                               name="criterion[{$criterion.id_product_comment_criterion}]"
                                                               value="{$smarty.section.i.index}" {if $smarty.section.i.index == 4} checked="checked"{/if}/>
                                                        <label for="c{$criterion.id_product_comment_criterion}-rate{$smarty.section.i.index}"
                                                               title="{$smarty.section.i.index}/5">{$smarty.section.i.index}</label>
                                                    {/section}
                                                </div>
                                            </div>
                                        </fieldset>
                                    {/foreach}
                                </div>
                            {/if}
                        </div>
                    </div>
                    <hr>
                    {if !$logged}
                        <div class="form-row">
                            <div class="form-group col">
                                <label for="comment_title">{l s='Title' d='Modules.Productcomments.Shop'}<sup class="required">*</sup></label>
                                <input name="comment_title" class="form-control" type="text" value=""/>
                            </div>
                            <div class="form-group col">
                                <label for="customer_name">{l s='Your name' d='Modules.Productcomments.Shop'}<sup class="required">*</sup></label>
                                <input name="customer_name" class="form-control" type="text" value=""/>
                            </div>
                        </div>
                    {else}
                        <div class="form-group">
                            <label for="comment_title">{l s='Title' d='Modules.Productcomments.Shop'}<sup class="required">*</sup></label>
                            <input name="comment_title" class="form-control" type="text" value=""/>
                        </div>
                    {/if}

                    <div class="form-group">
                        <label for="comment_content">{l s='Review' d='Modules.Productcomments.Shop'}<sup
                                    class="required">*</sup></label>
                        <textarea name="comment_content" class="form-control"></textarea>
                    </div>
                    <div>
                    </div>
                    <p class="required small"><sup>*</sup> {l s='Required fields' d='Modules.Productcomments.Shop'}</p>
                    <div class="modal-footer post-comment-buttons">
                        <button type="button" class="btn btn-comment-inverse btn-comment-big btn-outline-secondary" data-dismiss="modal"
                                aria-label="{l s='Cancel' d='Modules.Productcomments.Shop'}">
                            {l s='Cancel' d='Modules.Productcomments.Shop'}
                        </button>
                        <button type="submit" class="btn btn-comment btn-comment-big btn-primary">
                            {l s='Send' d='Modules.Productcomments.Shop'}
                        </button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

{* Comment posted modal *}
{if $moderation_active}
    {assign var='comment_posted_message' value={l s='Your comment has been submitted and will be available once approved by a moderator.' d='Modules.Productcomments.Shop'}}
{else}
    {assign var='comment_posted_message' value={l s='Your comment has been added!' d='Modules.Productcomments.Shop'}}
{/if}
{include file='module:productcomments/views/templates/hook/alert-modal.tpl'
modal_id='product-comment-posted-modal'
modal_title={l s='Review sent' d='Modules.Productcomments.Shop'}
modal_message=$comment_posted_message
}

{* Comment post error modal *}
{include file='module:productcomments/views/templates/hook/alert-modal.tpl'
modal_id='product-comment-post-error'
modal_title={l s='Your review cannot be sent' d='Modules.Productcomments.Shop'}
icon='error'
}
