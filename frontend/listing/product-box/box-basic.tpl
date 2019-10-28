{extends file="parent:frontend/listing/product-box/box-basic.tpl"}

{* Product name *}
{block name='frontend_listing_box_article_name'}
    <a href="{$sArticle.linkDetails}"
       class="product--title"
       title="{$sArticle.articleName|escapeHtml}">
        {$sArticle.articleName|truncate:150|escapeHtml}
    </a>
{/block}
