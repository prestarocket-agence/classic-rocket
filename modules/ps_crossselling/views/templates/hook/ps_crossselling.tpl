<section class="c-pdtlistsection u-mb-spacing-lg">
  <div class="c-pdtlistsection__heading">
    <p class="c-pdtlistsection__title">
    {l s='Customers who bought this product also bought:' d='Shop.Theme.Catalog'}
    </p>
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
        "dots":"#cs-dots",
        "arrows": {ldelim}

            "prev": "#cs-arrow-prev",
            "next": "#cs-arrow-next"

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
    <div class="c-slider__dots" id="cs-dots"></div>
    <button id="cs-arrow-prev" class="c-btn-arrow c-btn-arrow--prev">{include file="_partials/icon.tpl" icon="chevron-left" class="c-icon--20"}</button>
    <button id="cs-arrow-next" class="c-btn-arrow c-btn-arrow--next">{include file="_partials/icon.tpl" icon="chevron-right" class="c-icon--20"}</button>
  </div>
</section>

