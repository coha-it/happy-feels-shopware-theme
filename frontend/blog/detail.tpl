{extends file="parent:frontend/blog/detail.tpl"}

{* Date *}
{block name='frontend_blog_detail_date'}
    <span class="blog--metadata-date blog--metadata{if !$sArticle.author.name} is--first{/if}" itemprop="datePublished" content="{$sArticle.displayDate->format(DateTime::ATOM)|escapeHtml}">{$sArticle.displayDate|date:"DATE_SHORT"}</span>
{/block}
