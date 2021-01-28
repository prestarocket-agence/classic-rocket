
<?php
/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.urlsocial.php
 * Type:     function
 * Name:     urlsocial
 * Purpose:  clean url for social sharing
 * -------------------------------------------------------------
 * Example : {urlsocial url=$product.name} / {urlsocial url=$product.url}
 */
function smarty_function_urlsocial($params, &$smarty)
{
    $url = $params['url'];

    return urlencode(addcslashes($url, "'"));
}
