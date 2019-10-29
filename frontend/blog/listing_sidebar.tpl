{extends file="parent:frontend/blog/listing_sidebar.tpl"}

{* Blog filter *}
{block name='frontend_blog_index_filter'}{/block}

{* Subscribe Atom + RSS *}
{block name='frontend_blog_index_subscribe'}
    {if !$sCategoryInfo.hideFilter}
        {include file="frontend/blog/filter.tpl"}
    {/if}
    
    {* {$smarty.block.parent} *}

    {block name="frontend_blog_index_subscribe_entry_atom"}
        <a target="_blank" style="display: block; font-size: 0.8rem; opacity: 0.85; text-align: right;" href="{$sCategoryContent.atomFeed}" title="{$sCategoryContent.description|escape}">{s namespace="frontend/blog/index" name="BlogLinkAtom"}{/s}</a>
    {/block}

    {block name="frontend_blog_index_subscribe_entry_rss"}
        <a target="_blank" style="display: block; font-size: 0.8rem; opacity: 0.85; text-align: right;" href="{$sCategoryContent.rssFeed}" title="{$sCategoryContent.description|escape}">{s namespace="frontend/blog/index" name="BlogLinkRSS"}{/s}</a>
    {/block}

{/block}
