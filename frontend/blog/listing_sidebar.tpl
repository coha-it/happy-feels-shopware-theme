{extends file="parent:frontend/blog/listing_sidebar.tpl"}

{* Blog filter *}
{block name='frontend_blog_index_filter'}{/block}

{* Subscribe Atom + RSS *}
{block name='frontend_blog_index_subscribe'}

    {* Spotify *}
    <div class=" is--rounded filter--group block spotify-block">  <a href="www.google.de" target="_blank" class="inner"><i class="fab fa-spotify"></i>Hier geht’s zu unserem Corporate Happiness® Podcast.<p></p></a> </div>

    {if !$sCategoryInfo.hideFilter}
        {include file="frontend/blog/filter.tpl"}
    {/if}
    
    {* {$smarty.block.parent} *}

    <div class="subcribe_entries">
        {block name="frontend_blog_index_subscribe_entry_atom"}
            {$smarty.block.parent}
            {* <a target="_blank" style="display: block; font-size: 0.8rem; opacity: 0.85; text-align: right;" href="{$sCategoryContent.atomFeed}" title="{$sCategoryContent.description|escape}">{s namespace="frontend/blog/index" name="BlogLinkAtom"}{/s}</a> *}
        {/block}

        {block name="frontend_blog_index_subscribe_entry_rss"}
            {$smarty.block.parent}
            {* <a target="_blank" style="display: block; font-size: 0.8rem; opacity: 0.85; text-align: right;" href="{$sCategoryContent.rssFeed}" title="{$sCategoryContent.description|escape}">{s namespace="frontend/blog/index" name="BlogLinkRSS"}{/s}</a> *}
        {/block}
    </div>

{/block}
