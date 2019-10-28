{extends file="parent:frontend/checkout/header.tpl"}

{* Logo container *}
{block name='frontend_index_logo_container'}
    <div class="logo-main block-group" role="banner">
                
        {* Support Info *}
        {block name='frontend_index_logo_supportinfo'}
            <div class="logo--supportinfo block">
                {s name='RegisterSupportInfo' namespace='frontend/register/index'}{/s}
            </div>
        {/block}

        {* Main shop logo *}
        {block name='frontend_index_logo'}
            <div class="logo--shop block">
                {s name="IndexLinkDefault" namespace="frontend/index/index" assign="snippetIndexLinkDefault"}{/s}
                <a class="logo--link" href="{url controller='index'}" title="{"{config name=shopName}"|escapeHtml} - {$snippetIndexLinkDefault|escape}">
                    <picture>
                        <source srcset="{link file=$theme.desktopLogo}" media="(min-width: 78.75em)">
                        <source srcset="{link file=$theme.tabletLandscapeLogo}" media="(min-width: 64em)">
                        <source srcset="{link file=$theme.tabletLogo}" media="(min-width: 48em)">
                        <img srcset="{link file=$theme.mobileLogo}" alt="{"{config name=shopName}"|escapeHtml} - {$snippetIndexLinkDefault|escape}" />
                    </picture>
                </a>
            </div>
        {/block}

                
        {* Trusted Shops *}
        {block name='frontend_index_logo_trusted_shops'}{/block}
    </div>
{/block}
