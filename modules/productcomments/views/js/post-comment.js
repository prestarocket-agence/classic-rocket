/**
 * 2007-2019 PrestaShop SA and Contributors
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */

jQuery(document).ready(function () {
  const $ = jQuery;
  $('body').on('click', '.post-product-comment', function (event) {
    event.preventDefault();
    showPostCommentModal();
  });

  const postCommentModal = $('#post-product-comment-modal');
  postCommentModal.on('hidden.bs.modal', function () {
    postCommentModal.modal('hide');
    clearPostCommentForm();
  });

  const commentPostedModal = $('#product-comment-posted-modal');
  const commentPostErrorModal = $('#product-comment-post-error');

  function showPostCommentModal() {
    commentPostedModal.modal('hide');
    commentPostErrorModal.modal('hide');
    postCommentModal.modal('show');
  }

  function showCommentPostedModal() {
    postCommentModal.modal('hide');
    commentPostErrorModal.modal('hide');
    clearPostCommentForm();
    commentPostedModal.modal('show');
  }

  function showPostErrorModal(errorMessage) {
    postCommentModal.modal('hide');
    commentPostedModal.modal('hide');
    clearPostCommentForm();
    $('#product-comment-post-error-message').html(errorMessage);
    commentPostErrorModal.modal('show');
  }

  function clearPostCommentForm() {
    $('#post-product-comment-form input[type="text"]').val('');
    $('#post-product-comment-form input[type="text"]').removeClass('valid error');
    $('#post-product-comment-form textarea').val('');
    $('#post-product-comment-form textarea').removeClass('valid error');
    $('#post-product-comment-form .criterion-rating input').val(3).change();
  }

  function initCommentModal() {
    // $('#post-product-comment-modal .grade-stars').rating();
    $('body').on('click', '.post-product-comment', function (event) {
      event.preventDefault();
      showPostCommentModal();
    });

    $('#post-product-comment-form').submit(submitCommentForm);
  }

  function submitCommentForm(event) {
    event.preventDefault();
    var formData = $(this).serializeArray();
    if (!validateFormData(formData)) {
      return;
    }
    $.post($(this).attr('action'), $(this).serialize(), function(jsonResponse) {
      var jsonData = false;
      try {
        jsonData = JSON.parse(jsonResponse);
      } catch (e) {
      }
      if (jsonData) {
        if (jsonData.success) {
          clearPostCommentForm();
          showCommentPostedModal();
        } else {
          if (jsonData.errors) {
            var errorList = '<ul>';
            for (var i = 0; i < jsonData.errors.length; ++i) {
              errorList += '<li>' + jsonData.errors[i] + '</li>';
            }
            errorList += '</ul>';
            showPostErrorModal(errorList);
          } else {
            const decodedErrorMessage = $("<div/>").html(jsonData.error).text();
            showPostErrorModal(decodedErrorMessage);
          }
        }
      } else {
        showPostErrorModal(productCommentPostErrorMessage);
      }
    }).fail(function() {
      showPostErrorModal(productCommentPostErrorMessage);
    });
  }

  function validateFormData(formData) {
    var isValid = true;
    formData.forEach(function(formField) {
      const fieldSelector = '#post-product-comment-form [name="'+formField.name+'"]';
      if (!formField.value) {
        $(fieldSelector).addClass('is-invalid');
        $(fieldSelector).removeClass('is-valid');
        isValid = false;
      } else {
        $(fieldSelector).removeClass('is-invalid');
        $(fieldSelector).addClass('is-valid');
      }
    });

    return isValid;
  }

  initCommentModal();
});
