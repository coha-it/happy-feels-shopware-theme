{extends file="parent:frontend/blog/listing_sidebar.tpl"}

{* Blog filter *}
{block name='frontend_blog_index_filter'}{/block}

{* Subscribe Atom + RSS *}
{block name='frontend_blog_index_subscribe'}

    {* Spotify *}
    <div class=" is--rounded filter--group block spotify-block">
        <a href="https://open.spotify.com/show/5ANpmgwDLJOe9tIb66KOgm" target="_blank" class="inner">
            <i class="fab fa-spotify"></i>
            {s namespace="frontend/blog/box" name="BlogGoToSpotify"}Hier geht&rsquo;s zu unserem Corporate Happiness &copy; Podcast auf Spotify{/s}
        </a>
    </div>

    {if !$sCategoryInfo.hideFilter}
        {include file="frontend/blog/filter.tpl"}
    {/if}
    
    {* {$smarty.block.parent} *}

    <div class="subscribe_feed_entries">
        {block name="frontend_blog_index_subscribe_entry_atom"}
            <a target="_blank" href="{$sCategoryContent.atomFeed}" title="{$sCategoryContent.description|escape}">{s namespace="frontend/blog/index" name="BlogLinkAtom"}{/s}</a>
        {/block}

        <br>

        {block name="frontend_blog_index_subscribe_entry_rss"}
            <a target="_blank" href="{$sCategoryContent.rssFeed}" title="{$sCategoryContent.description|escape}">{s namespace="frontend/blog/index" name="BlogLinkRSS"}{/s}</a>
        {/block}
    </div>

{/block}
