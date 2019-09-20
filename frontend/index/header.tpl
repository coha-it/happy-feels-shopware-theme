{extends file="parent:frontend/index/header.tpl"}

{* Stylesheets *}
{block name="frontend_index_header_css_print"}
    {$smarty.block.parent}

    {* Font Awesome *}
    <link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/fontawesome.min.css">
    <link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/brands.min.css">

    {* Tmp Custom.css *}
    <link type="text/css" rel="stylesheet" href="{link file='frontend/_public/src/css/coha-happy-feels.css'}">
{/block}
