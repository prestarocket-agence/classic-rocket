
<?php
/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.splitprice.php
 * Type:     function
 * Name:     splitprice
 * Purpose:  split currency and amount from a string
 * -------------------------------------------------------------
 */
function smarty_function_splitprice($params, &$smarty)
{
    return $params['price'];
}