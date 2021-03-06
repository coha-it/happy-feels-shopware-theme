{extends file='parent:frontend/detail/index.tpl'}

{* Custom header *}
{block name='frontend_index_header_meta_tags_opengraph'}
  {$smarty.block.parent}


  {assign var=sTmpEventDate value=$sArticle.attributes.core.coha_event_date}

  {if $sTmpEventDate}

    {* GOOGLE EVENTS / SNIPPETS!!! *}

    {* {$sArticle|@var_dump} *}
    {* {$sArticle.attributes|@var_dump} *}
    {* {$sArticle.sProperties|@var_dump} *}

    {* Get Locations from Attributes*}
    {assign var=sTmpOrt value=''}
    {assign var=sTmpAdresse value=''}
    {assign var=sTmpStock value=''}
    {assign var=sTmpPerformer value=''}
    {assign var=sTmpPrice value=''}

    {if $sArticle.attributes.core.coha_as_details_hide_prices == "0" || true}
      {* Price Unhidden? *}
      {assign var=sTmpPrice value=$sArticle.price_numeric}
    {else}
      {* Price hidden *}
      {assign var=sTmpPrice value=false}
    {/if}

    {foreach from=$sArticle.sProperties item=group}
      {if strtolower($group['name']) == 'ort'}
         {$sTmpOrt = $group['value']}
      {/if}

      {if strtolower($group['name']) == 'adresse'}
         {$sTmpAdresse = $group['value']}
      {/if}

      {if strtolower($group['name']) == 'adresse'}
         {$sTmpAdresse = $group['value']}
      {/if}

      {if strtolower($group['name']) == 'vortragende(r)'}
        {$sTmpPerformer = $group['value']}
      {/if}
    {/foreach}

    {assign var=aTmpImages value=[]}
    {* Get Image *}
    {foreach from=$sArticle.image key=key item=item}
      {if $key == 'source'}
        {array_push($aTmpImages, $item) && false}
      {/if}
    {/foreach}

    {* Get Images *}
    {foreach from=$sArticle.images key=key item=item}
      {if $key == 'source'}
        {array_push($aTmpImages, $item['source']) && false}
      {/if}
    {/foreach}

    {if $sArticle.isAvailable}
      {assign var=sTmpStock value="InStock"}
    {else}
      {assign var=sTmpStock value="SoldOut"}
    {/if}

    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Event",
      "name": {json_encode($sArticle['articleName'], true)},
      "startDate": "{date("Y-m-d\TH:i:s", strtotime($sTmpEventDate))}",
      "location": {
        "@type": "Place",
        "name": {json_encode($sTmpOrt, true)},
        "address": {json_encode($sTmpAdresse, true)}
      },
      "image": {json_encode($aTmpImages, true)},
      "description": {json_encode($sArticle.description, true)},
      "offers": {
        "@type": "Offer",
        "url": "{$sArticle.linkDetailsRewrited}",
        {if $sTmpPrice}
        "price": {json_encode($sTmpPrice, true)},
        "priceCurrency": "EUR",
        {/if}
        "availability": {json_encode($sTmpStock, true)}
      },
      "performer": {
        "@type": "PerformingGroup",
        "name": {json_encode($sTmpPerformer, true)}
      }
    }
    </script>
  {/if}
{/block}

