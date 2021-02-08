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

<meta property="og:title" content="{$page.meta.title}"/>
<meta property="og:description" content="{$page.meta.description}"/>
<meta property="og:type" content="website"/>
<meta property="og:url" content="{$urls.current_url}"/>
<meta property="og:site_name" content="{$shop.name}"/>

{if isset($product) && $page.page_name == 'product'}
  <meta property="og:type" content="product"/>
  {if $product.images|count > 0}
    {foreach from=$product.images item=p_img name="p_img_list"}
      <meta property="og:image" content="{$p_img.large.url}"/>
    {/foreach}
    <meta property="og:image:height" content="{$p_img.large.height}"/>
    <meta property="og:image:width" content="{$p_img.large.width}"/>

  {/if}
  {if $product.show_price}
    <meta property="product:price:amount" content="{$product.price_amount}" />
    <meta property="product:price:currency" content="{$currency.iso_code}" />
    {if $product.has_discount}
      <meta property="product:price:standard_amount" content="{$product.regular_price_amount}" />
    {/if}
  {/if}
  {if $product_manufacturer->name}
    <meta property="product:brand" content="{$product_manufacturer->name|escape:'html':'UTF-8'}" />
  {/if}
  <meta property="og:availability" content="{if $product.quantity_all_versions > 0 || $product.allow_oosp > 0}instock{else}out of stock{/if}" />
{elseif $page.page_name === 'category' && isset($category) && $category.image.large.url}
    <meta property="og:image" content="{$category.image.large.url}"/>
{else}
    <meta property="og:image" content="{$urls.shop_domain_url}{$shop.logo}"/>
{/if}
<script type="application/ld+json">
{
    "@context" : "http://schema.org",
    "@type" : "Organization",
    "name" : "{$shop.name}",
    "url" : "{$urls.pages.index}",
    "logo" : {
        "@type":"ImageObject",
        "url":"{$urls.shop_domain_url}{$shop.logo}"
    }
}

</script>

<script type="application/ld+json">
{
    "@context":"http://schema.org",
    "@type":"WebPage",
    "isPartOf": {
        "@type":"WebSite",
        "url":  "{$urls.pages.index}",
        "name": "{$shop.name}"
    },
    "name": "{$page.meta.title}",
    "url":  "{$urls.current_url}"
}


</script>
{if $page.page_name =='index'}
    <script type="application/ld+json">
{
	"@context":	"http://schema.org",
	"@type": "WebSite",
    "url" : "{$urls.pages.index}",
	"image": {
	"@type": "ImageObject",
    "url":"{$urls.shop_domain_url}{$shop.logo}"
	},
    "potentialAction": {
    "@type": "SearchAction",
    "target": "{'--search_term_string--'|str_replace:'{search_term_string}':$link->getPageLink('search',true,null,['search_query'=>'--search_term_string--'])}",
     "query-input": "required name=search_term_string"
	 }
}


    </script>
{/if}
{if isset($product) && $page.page_name == 'product'}
    <script type="application/ld+json">
    {
    "@context": "http://schema.org/",
    "@type": "Product",
    "name": "{$product.name}",
    "description": "{$page.meta.description}",
    "category": "{$product.category_name}",
    {if isset($product.cover)}"image" :"{$product.cover.bySize.home_default.url}",{/if}
    {if $product.reference}"sku": "{$product.reference}",{/if}
    {if $product.ean13}
      "gtin13": "{$product.ean13}",
    {else if $product.upc}
      "gtin13": "0{$product.upc}",
    {else if $product.isbn}
      "isbn": "{$product.isbn}",
    {else if $product.reference}
      "mpn": "{$product.reference}",
    {/if}
    {if $product_manufacturer->name OR $shop.name}"brand": {
        "@type": "Thing",
        "name": "{if $product_manufacturer->name}{$product_manufacturer->name|escape:'html':'UTF-8'}{else}{$shop.name}{/if}"
    },{/if}
    {if isset($nbComments) && $nbComments && $ratings.avg}"aggregateRating": {
        "@type": "AggregateRating",
        "ratingValue": "{$ratings.avg|round:1|escape:'html':'UTF-8'}",
        "reviewCount": "{$nbComments|escape:'html':'UTF-8'}"
    },{/if}
    {if isset($product.weight) && ($product.weight != 0)}
    "weight": {
        "@context": "https://schema.org",
        "@type": "QuantitativeValue",
        "value": "{$product.weight}",
        "unitCode": "{$product.weight_unit}"
    },{/if}
    {*{if empty($combinations)}*}
  {if $product.show_price}
    "offers": {
        "@type": "Offer",
        "priceCurrency": "{$currency.iso_code}",
        "name": "{$product.name|strip_tags:false}",
        "price": "{$product.price_amount}",
        "url": "{$product.url}",
        "priceValidUntil": "{($smarty.now + (int) (60*60*24*15))|date_format:"%Y-%m-%d"}",
        {if $product.images|count > 0}
        "image": {strip}[
        {foreach from=$product.images item=p_img name="p_img_list"}
        "{$p_img.large.url}"{if not $smarty.foreach.p_img_list.last},{/if}
        {/foreach}
        ]{/strip},
        {/if}
        {if $product.ean13}
        "gtin13": "{$product.ean13}",
        {else if $product.upc}
        "gtin13": "0{$product.upc}",
        {else if $product.isbn}
          "isbn": "{$product.isbn}",
        {else if $product.reference}
          "mpn": "{$product.reference}",
        {/if}
        "sku": "{$product.reference}",
        {if $product.condition == 'new'}"itemCondition": "http://schema.org/NewCondition",{/if}
        {if $product.show_condition > 0}
        {if $product.condition == 'used'}"itemCondition": "http://schema.org/UsedCondition",{/if}
        {if $product.condition == 'refurbished'}"itemCondition": "http://schema.org/RefurbishedCondition",{/if}
        {/if}
        "availability":{if $product.quantity > 0 || $product.allow_oosp > 0} "http://schema.org/InStock"{else} "http://schema.org/OutOfStock"{/if},
        "seller": {
            "@type": "Organization",
            "name": "{$shop.name}"
        }
    }
    {/if}

}


    </script>
{/if}
{if isset($breadcrumb.links[1])}
<script type="application/ld+json">
    {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
    {foreach from=$breadcrumb.links item=path name=breadcrumb}
    {
    "@type": "ListItem",
    "position": {$smarty.foreach.breadcrumb.iteration},
    "name": "{$path.title}",
    "item": "{$path.url}"
    }{if !$smarty.foreach.breadcrumb.last},{/if}
    {/foreach}]
    }
    </script>
{/if}
