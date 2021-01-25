<section class="c-pdtlistsection u-mb-spacing-lg">
    <div class="c-pdtlistsection__heading">
        <p class="c-pdtlistsection__title">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
    </div>
    {assign var="accessoriescount" value=$accessories|count}
    <div class="row">
        <div class="c-snap{if $accessoriescount > 1} /js glider js-slider{/if}" data-glider='{strip}
        {ldelim}
        "slidesToShow":1.25,
        "slidesToScroll":"auto",
        "draggable":false,
        "scrollLock":false,
        "itemWidth":150,
        "dots":"#acc-dots",
        "arrows": {ldelim}

            "prev": "#acc-arrow-prev",
            "next": "#acc-arrow-next"

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
            {foreach from=$accessories item="product"}
                {include file="catalog/_partials/miniatures/product.tpl" product=$product col="col-lg-3 col-md-4 col-6 c-snap__item"}
            {/foreach}
        </div>
    </div>
    <div class="u-d-flex u-align-items-center">
        <div class="c-slider__dots" id="acc-dots"></div>
        <button id="acc-arrow-prev" aria-label="{l s='Précédent' d='Shop.Theme.Global'}"
                class="c-slider__arrow c-slider__arrow--left btn btn-link u-txt-black">{include file="_partials/icon.tpl" icon="chevron-left" class="c-icon--20"}</button>
        <button id="acc-arrow-next" aria-label="{l s='Suivant' d='Shop.Theme.Global'}"
                class="c-slider__arrow c-slider__arrow--right btn btn-link u-txt-black">{include file="_partials/icon.tpl" icon="chevron-right" class="c-icon--20"}</button>
    </div>
</section>


