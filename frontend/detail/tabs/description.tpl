{extends file="parent:frontend/detail/tabs/description.tpl"}

{block name='frontend_detail_description_downloads_content_link'}
    <li class="list--entry">
        {* {s name="DetailDescriptionLinkDownload" assign="snippetDetailDescriptionLinkDownload"}{/s} *}
        <a href="{$download.filename}" target="_blank" class="content--link link--download btn is--secondary" title="{$snippetDetailDescriptionLinkDownload|escape} {$download.description|escape}">
            <i class="icon--download"></i> {s name="DetailDescriptionLinkDownload"}{/s} {$download.description}
        </a>
    </li>
{/block}