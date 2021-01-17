{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
  {if $nodes|count}
    <ul {if $depth === 0}class="c-mainnav__list" id="top-menu" role="navigation"{else} class="c-mainnav__sublist c-mainnav__sublist--{$depth}"{/if} data-depth="{$depth}">
      {foreach from=$nodes item=node}
        {if $node.children|count}
          {assign var=_expand_id value=10|mt_rand:100000}
        {/if}
        <li class="c-mainnav__item--{$depth} {$node.type} c-mainnav__item {if $depth === 0}c-mainnav__item--top{else}c-mainnav__item--sub{/if}{if $node.current} c-mainnav__item--current{/if}"
          id="{$node.page_identifier}" {if $node.children|count}aria-haspopup="true" aria-expanded="false"
          aria-owns="top_sub_menu_{$_expand_id}" aria-controls="top_sub_menu_{$_expand_id}"{/if}>
          {assign var=_counter value=$_counter+1}

          {if $node.children|count}
          <div class="c-mainnav__itemheader">
          {/if}
            <a
              class="c-mainnav__sublink {if $depth === 0}c-mainnav__sublink--top{else}c-mainnav__sublink--sub c-mainnav__sublink--{$depth}{/if} {if $node.children|count}c-mainnav__sublink--hassubmenu{else}c-mainnav__sublink--nosubmenu{/if}"
              href="{$node.url}" data-depth="{$depth}"
              {if $node.open_in_new_window} target="_blank" {/if}
            >
              <span class="">{$node.label}</span>
            </a>
            {if $node.children|count}
            {* Cannot use page identifier as we can have the same page several times *}
            {assign var=_expand_id value=10|mt_rand:100000}
            <span class="visible--mobile">
                <span data-target="#top_sub_menu_{$_expand_id}" data-toggle="collapse"
                      class="d-block navbar-toggler icon-collapse">
                </span>
              </span>
          </div>
          {/if}
          {if $node.children|count}
            <div class="{if $depth === 0}c-mainnav__sub {/if} collapse show" data-collapse-hide-mobile
                 id="top_sub_menu_{$_expand_id}" role="group" aria-labelledby="{$node.page_identifier}"
                 aria-expanded="false" aria-hidden="true">
              <div{if $depth === 0} class="c-mainnav__subcontent"{/if}>
                {menu nodes=$node.children depth=$node.depth parent=$node}
              </div>
            </div>
          {/if}
        </li>
      {/foreach}
    </ul>
  {/if}
{/function}

<nav class="c-mainnav visible--desktop" id="_desktop_top_menu">
  {menu nodes=$menu.children}
</nav>
