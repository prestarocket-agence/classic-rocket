
<?php
/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.olink.php
 * Type:     function
 * Name:     olink
 * Purpose:  obfuscation
 * -------------------------------------------------------------
 * Example : data-b for link target _blank
 *  <span data-dfg="{olink url=['entity'=>'product','id'=>1127]}" data-b=1>test</span>
 * <span data-dfg="{olink url=urls.pages.contact}">test</span>
 */
function smarty_function_olink($params, &$smarty)
{
    $url = $params['url'];

    if(is_array($params['url'])){
        $url = Link::getUrlSmarty($params['url']);
    }
    $url = preg_replace("(^https?:)", "", $url );
    $url = base64_encode($url);
    $url = strrev($url);
    return $url;
}
