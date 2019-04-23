{extends file="parent:frontend/index/header.tpl"}

{* Stylesheets *}
{block name="frontend_index_header_css_print"}
    {$smarty.block.parent}

    {* Tmp Custom.css *}
    <link type="text/css" rel="stylesheet" href="{link file='frontend/_public/src/css/coha-happy-feels.css'}">
{/block}
