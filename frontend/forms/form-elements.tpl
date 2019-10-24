{extends file="parent:frontend/forms/form-elements.tpl"}
{namespace name="frontend/forms/elements"}


{block name='frontend_forms_form_elements_form_description'}{/block}

{block name='frontend_forms_form_elements_form_builder'}
    {if $sElement.note}
        <p class="forms--description">
            {$sElement.note}
        </p>
    {/if}
    <div {if $sSupport.sElements[$sKey].typ eq 'textarea'}class="textarea"{elseif $sSupport.sElements[$sKey].typ eq 'checkbox'}class="forms--checkbox"{elseif $sSupport.sElements[$sKey].typ eq 'select'}class="field--select select-field"{/if}>
        {s name="RequiredField" namespace="frontend/register/index" assign="snippetRequiredField"}{/s}
        {$sSupport.sFields[$sKey]|replace:'%*%':''}
        {if $sSupport.sElements[$sKey].typ eq 'checkbox'}
            {$sSupport.sLabels.$sKey|replace:':':''}
        {/if}
    </div>
{/block}
