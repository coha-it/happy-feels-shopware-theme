{extends file="parent:frontend/blog/box.tpl"}

{* Date *}
{block name='frontend_blog_col_meta_data_date'}
    {if $sArticle.displayDate}
        <span class="blog--metadata-date blog--metadata is--nowrap{if !$sArticle.author.name} is--first{/if}">{$sArticle.displayDate|date:"DATE_SHORT"}</span>
    {/if}
{/block}

{* Tags *}
{block name='frontend_blog_col_tags'}
    <div class="blog--box-tags">
        {if $sArticle.tags|@count > 1}
            {foreach $sArticle.tags as $tag}
                <a href="{$tag.link}" title="{$tag.name|escape}">{$tag.name}</a>
            {/foreach}
        {/if}
    </div>
{/block}

{* Read more button *}
{block name='frontend_blog_col_read_more'}
    <div class="blog--box-readmore">
        <a href="{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}" title="{$sArticle.title|escape}" class="btn is--primary is--small">{s name="BlogLinkMore"}{/s}</a>

        {* Spotify Button *}
        {if $spotify = $sArticle.attribute.spotify}
            <a href="{$spotify}" title="{$sArticle.title|escape} auf Spotify" class="btn is--secondary is--small spotify" target="_blank">
                {s namespace="frontend/blog/box" name="BlogListenOnSpotifyText"}<i class="fab fa-spotify"></i>Auf spotify hören{/s}
            </a>
        {/if}
    </div>
{/block}