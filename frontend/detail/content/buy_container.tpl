{extends file="parent:frontend/detail/content/buy_container.tpl"}

{block name="frontend_detail_rich_snippets_brand"}
    {block name='frontend_detail_index_header'}
        {include file="frontend/detail/content/header.tpl"}
    {/block}

    {$smarty.block.parent}
{/block}

{* Product - Base information *}
{block name='frontend_detail_index_buy_container_base_info'}

    {* Product SKU *}
    {block name='frontend_detail_data_ordernumber'}
        <li class="base-info--entry entry--sku" style="font-size: 0 !important; pointer-events: none !important;">
            {* Product SKU - Content *}
            {block name='frontend_detail_data_ordernumber_content'}
                <meta itemprop="productID" content="{$sArticle.articleDetailsID}"/>
                <span class="entry--content" itemprop="sku">
                    {$sArticle.ordernumber}
                </span>
            {/block}
        </li>
    {/block}

{/block}
