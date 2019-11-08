{extends file="parent:documents/index_ls.tpl"}


{block name="document_index_body"}
    {block name="document_index_selectAdress"}
        {assign var="address" value="shipping"}
    {/block}

<div id="head_sender">

        {block name="document_index_address_sender"}
            <p class="sender">{$Containers.Header_Sender.value}</p>
        {/block}
        {block name="document_index_address_base"}
            {if $User.$address.company}{$User.$address.company}<br />{/if}
            {if $User.$address.department}{$User.$address.department}<br />{/if}
            {$User.$address.salutation|salutation}
            {if {config name="displayprofiletitle"}}
                {$User.$address.title}<br/>
            {/if}
            {$User.$address.firstname} {$User.$address.lastname}<br />
            {$User.$address.street}<br />
        {/block}
        {block name="document_index_address_additionalAddressLines"}
            {if {config name=showAdditionAddressLine1}}
                {$User.$address.additional_address_line1}<br />
            {/if}
            {if {config name=showAdditionAddressLine2}}
                {$User.$address.additional_address_line2}<br />
            {/if}
        {/block}
        {block name="document_index_address_cityZip"}
            {if {config name=showZipBeforeCity}}
                {$User.$address.zipcode} {$User.$address.city}<br />
            {else}
                {$User.$address.city} {$User.$address.zipcode}<br />
            {/if}
        {/block}
        {block name="document_index_address_countryData"}
            {if $User.$address.state.shortcode}{$User.$address.state.shortcode} - {/if}{$User.$address.country.countryen}<br />
        {/block}

</div>
{/block}
