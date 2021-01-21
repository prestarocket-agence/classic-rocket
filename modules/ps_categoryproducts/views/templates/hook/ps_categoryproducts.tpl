<section class="c-pdtlistsection u-mb-spacing-lg">
  <div class="c-pdtlistsection__heading">
    <p class="c-pdtlistsection__title">
        {if $products|@count == 1}
            {l s='%s other product in the same category:' sprintf=[$products|@count] d='Shop.Theme.Catalog'}
        {else}
            {l s='%s other products in the same category:' sprintf=[$products|@count] d='Shop.Theme.Catalog'}
        {/if}</p>
  </div>
    {assign var="productscount" value=$products|count}
  <div class="row">
    <div class="c-snap{if $productscount > 1} /js glider js-slider{/if}" data-glider='{strip}
        {ldelim}
        "slidesToShow":1.25,
        "slidesToScroll":"auto",
        "draggable":false,
        "scrollLock":false,
        "itemWidth":150,
        "dots":"#cp-dots",
        "arrows": {ldelim}

            "prev": "#cp-arrow-prev",
            "next": "#cp-arrow-next"

        {rdelim},
        "responsive": [
        {ldelim}
            "breakpoint": 992,
                "settings": {ldelim}
                     "slidesToShow":4.25
                {rdelim}
            {rdelim},
            {ldelim}
            "breakpoint": 500,
                "settings": {ldelim}
                     "slidesToShow":2.25
                {rdelim}
            {rdelim}
        ]
        {rdelim}
        {/strip}'>
        {foreach from=$products item="product"}
            {include file="catalog/_partials/miniatures/product.tpl" product=$product col="col-lg-3 col-md-4 col-6 c-snap__item"}
        {/foreach}
    </div>
  </div>
  <div class="u-d-flex u-align-items-center">
    <div class="c-slider__dots" id="cp-dots"></div>
    <button id="cp-arrow-prev" aria-label="{l s='Précédent' d='Shop.Theme.Global'}"
            class="c-slider__arrow c-slider__arrow--left btn btn-link u-txt-black">{include file="_partials/icon.tpl" icon="chevron-left" class="c-icon--20"}</button>
    <button id="cp-arrow-next" aria-label="{l s='Suivant' d='Shop.Theme.Global'}"
            class="c-slider__arrow c-slider__arrow--right btn btn-link u-txt-black">{include file="_partials/icon.tpl" icon="chevron-right" class="c-icon--20"}</button>
  </div>
</section>


