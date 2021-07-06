{extends file="parent:documents/index.tpl"}

{*
    Add "Leistungszeitraum" / Service Period to the invoice Details 
    for each product with event_date and event_date_end
*}
{block name="document_index_head_bottom_wrapper"}
    {$smarty.block.parent}
    {foreach from=$positions item=position key=number}
        {$coha_core = $position.meta.attributes.core}
        {$coha_start = $coha_core['coha_event_date']}
        {$coha_end = $coha_core['coha_event_date_end']}

        {if $coha_start && $coha_end}
            {s name="DocumentIndexServicePeriodStartStop"}<p>Der Leistungszeitraum für den Artikel "{$position.name}" (Artikel-Nummer: {$position.articleordernumber}) läuft zwischen {$coha_start} und {$coha_end}.</p>{/s}
        {elseif $coha_start}
            {s name="DocumentIndexServicePeriodStart"}<p>Der Leistungszeitraum für den Artikel "{$position.name}" (Artikel-Nummer: {$position.articleordernumber}) beginnt ab dem {$coha_start}.</p>{/s}
        {elseif $coha_end}
            {s name="DocumentIndexServicePeriodStop"}<p>Der Leistungszeitraum für den Artikel "{$position.name}" (Artikel-Nummer: {$position.articleordernumber}) endet ab dem {$coha_start}.</p>{/s}
        {/if}
    {/foreach}
{/block}
