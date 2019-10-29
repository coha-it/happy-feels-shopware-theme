{extends file="parent:frontend/_includes/cookie_permission_note.tpl"}

{block name="cookie_removal_container_footer"}
    <div class="cookie-removal--footer">
        {$privacyLink = {config name="data_privacy_statement_link"}}
        {if $privacyLink}
            <a title="{s name="cookiePermission/linkText"}{/s}"
               class="privacy--notice"
               href="{$privacyLink}">
                {s name="cookiePermission/linkText"}{/s}
            </a>
        {/if}

        <div class="cookie-removal--buttons">
            <a class="btn cookie-permission--close-button is--center">{s name="cookiePermission/close"}{/s}</a>
            <a class="btn is--secondary cookie-permission--accept-button is--center">{s name="cookiePermission/buttonText"}{/s}</a>
        </div>
    </div>
{/block}
