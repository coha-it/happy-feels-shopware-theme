{extends file="parent:frontend/detail/content/buy_container.tpl"}

{block name="frontend_detail_rich_snippets_brand"}
    {block name='frontend_detail_index_header'}
        {include file="frontend/detail/content/header.tpl"}
    {/block}

    {$smarty.block.parent}
{/block}

{* Product - Base information *}
{block name='frontend_detail_index_buy_container_base_info'}{/block}
