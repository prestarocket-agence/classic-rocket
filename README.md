
# PrestaShop Classic Rocket
Classic Rocket is a rework of "classic theme". It has been built keeping in  mind : performance, accessibility and SEO.

Contributed by [Prestarocket](//www.prestarocket.com/blog/) (Twitter: [@prestarocket](https://twitter.com/prestarocket))

Demo : [https://demoprestashop.prestarocket.com/](https://demoprestashop.prestarocket.com/)

Main features :
- last version of Twitter Bootstrap
- lazy loading images
- offcanvas for main menu and filter menu
- less css and less js
- form accessibility and better validation
- SEO: Hn, rel prev/next for pagination...
- font performance
- better responsive

We use [Dareboost](https://www.dareboost.com/) to test and improve our work.
## Contributing
PR on branch develop please

## Main differences with Classic Theme
### Performance
With the same server (gzip, PrestaShop performance settings properly adjusted)
- CSS: from 80 Ko (with Classic theme) to 33 Ko
- JS: 155 Ko (with Classic theme) to 86 Ko

You can also see the web quality and performance comparison report on [Dareboost](https://www.dareboost.com/en/comparison/d_5b51dc70e967906045fd3683/d_5b51dc70e967906045fd3684)
### Twitter Bootstrap 4.4.x

- Almost all tpl files are edited to use new BS classes (ex: col-xs-12 => col-12)
- For retrocompatibility and third modules, we keep some important old classes in bs_alpha.scss      
- Scss variables are split in 2 files: 1 file for overriding default Twitter Bootstrap variables and 1 file for custom scss variables for Classic Rocket theme (ex: $regular-price-font-size)
- Only usefull BS plugin are added individually in _dev/theme.js (carousel and scrollspy are not loaded). 


### New Js files
- [Lazysizes](https://github.com/aFarkas/lazysizes) is a fast, SEO-friendly and self-initializing lazyloader for images
- [Slick Carousel](http://kenwheeler.github.io/slick/) is used for homepage slider and product images in product detail page; it's ligther than owl carousel and offers a lots of interesting features (touch, responsive options, data attribute settings)
- [HoverIntent](https://github.com/briancherne/jquery-hoverIntent) is a plug-in that attempts to determine the user's intent (for main menu)


### Js file deleted (in _dev folder)
- tether.js (we use popper with last version of BS)
- velocity.js (we use slick)
- bootstrap-filestyle.min.js (BS provide a custom file input)
- drop-down.js (done with BS dropdown)
- product-miniature.js (done with css)
- product-select.js (we use slick)
- jquery.scrollbox.min.js


### New module(s)
- ps_searchbarjqauto (for use jQuery autoComplete v1.0.7 )
    
### New smarty blocks
- layoutWrapperClass
- contentWrapperClass
- pageHeaderClass
- pageContentClass
- pageFooterClass

### New image sizes
We use srcset in product-cover-thumbnails.tpl for responsive images.

    pdt_180:
      width: 180
      height: 180
      scope: [products]
    pdt_300:
      width: 300
      height: 300
      scope: [products]
    pdt_360:
      width: 360
      height: 360
      scope: [products]
    pdt_540:
      width: 540
      height: 540
      scope: [products]

## SEO
- Better pagination with link rel next/prev (in templates/_partials/pagination-seo.tpl)
- name="robots" content="none" for ordered listing page
- Open Graph and JSON-LD structured data (in templates/_partials/microdata-jsonld.tpl)
- font load from Google (in templates/_partials/font.tpl)

## Offcanvas menu
We simply extend bootstrap modal with custom class:
- .modal-dialog__offcanvas class in modal-dialog
- add .modal-dialog__offcanvas--right for right offcanvas

```html
<!-- Button trigger offcanvas -->
<button type="button" id="search_filter_toggler" class="btn btn-secondary d-md-none" data-target="#offcanvas_search_filter" data-toggle="modal">
Filter
</button>
<!-- Modal Offcanvas-->
<div class="modal fade" id="offcanvas_search_filter" tabindex="-1" role="dialog" data-modal-hide-mobile>
    <div class="modal-dialog modal-dialog__offcanvas modal-dialog__offcanvas--right" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="_mobile_search_filters_wrapper"></div>
            </div>
        </div>
    </div>
</div>
```

## Compatibility
PrestaShop 1.7.3.2 to 1.7.6.x

## Download
- [classic-rocket](https://github.com/PrestaShop/classic-rocket/releases)

## Misc
You can also use gulp to work faster during development (gulpfile.js => gulp watch)

## To do (you can help!):
- test rtl
- more BEM
- add more custom scss variables
- more data in jsonld
- PWA
