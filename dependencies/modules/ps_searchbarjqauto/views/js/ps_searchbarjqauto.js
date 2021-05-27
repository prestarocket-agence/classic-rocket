$(document).ready(function () {
    var $searchWidget = $('[data-search-widget]'),
        $searchBox    = $searchWidget.find('input[type=text]'),
        searchURL     = $searchWidget.attr('data-search-controller-url');

    $searchBox.autoComplete({
        minChars: 3,
        source: function (query, response) {
            $.post(searchURL, {
                s: query,
                resultsPerPage: 10
            }, null, 'json')
                .then(function (resp) {
                    response(resp.products);
                })
                .fail(response);
        },
        renderItem: function (product, search) {

            return '<div class="media autocomplete-suggestion" data-url="' + product.url + '">' +
                '<img class="mr-1" src="' + product.cover.bySize.small_default.url + '" width="' + product.cover.bySize.small_default.width + '" height="' + product.cover.bySize.small_default.height + '">' +
                '<div class="media-body">' + product.name + '</div>' +
                '</div>';
        },
        onSelect: function (e, term, item) {
            e.preventDefault();
            window.location.href = item.data('url');
        }
    });
});
