{extends file="parent:frontend/blog/box.tpl"}

{* Date *}
{block name='frontend_blog_col_meta_data_date'}
    {if $sArticle.displayDate}
        <span class="blog--metadata-date blog--metadata is--nowrap{if !$sArticle.author.name} is--first{/if}">{$sArticle.displayDate|date:"DATE_SHORT"}</span>
    {/if}
{/block}
