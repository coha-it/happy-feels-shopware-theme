{extends file="parent:frontend/_includes/cookie_permission_note.tpl"}
{namespace name="frontend/cookiepermission/index"}

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
            <a class="btn is--small is--secondary cookie-permission--accept-button is--center">{s name="cookiePermission/buttonText"}{/s}</a>
            <a class="btn is--small cookie-permission--close-button is--center">{s name="cookiePermission/close"}{/s}</a>
        </div>
    </div>
{/block}

{block name="cookie_permission_accept_button"}
    <div class="cookie-permission--button">

        {block name="cookie_permission_decline_button_fixed"}
            {if {config name="cookie_note_mode"} == 1}
                {block name="cookie_permission_decline_button"}
                    <a href="#" class="cookie-permission--decline-button btn is--small is--center">
                        <i class="icon--cross"></i>
                        {s name="cookiePermission/declineText"}{/s}
                    </a>
                {/block}
            {/if}
        {/block}

        {block name="cookie_permission_accept_button_fixed"}
            <a href="#" class="cookie-permission--accept-button btn is--primary is--small is--center">
                <i class="icon--check"></i>
                {s name="cookiePermission/buttonText"}{/s}
            </a>
        {/block}

    </div>
{/block}