{extends file="parent:newsletter/index/footer.tpl"}

{block name="newsletter_footer_table_upper"}
<div>
    <div>
      {block name="newsletter_footer_table_navigation"}
        <div id="navi_unten">{s name='NewsletterFooterNavigation'}{/s}</div>
      {/block}
      {block name="newsletter_footer_table_tax_notice"}
          <div>
              {if $sUserGroupData.tax}
                  {s name='NewsletterFooterInfoIncludeVat'}{/s}
              {else}
                  {s name='NewsletterFooterInfoExcludeVat'}{/s}
              {/if}
          </div>
      {/block}

      <div>
          {s name='NewsletterFooterCopyright'}{/s}
      </div>
    </div>
</div>
{/block}

{block name="newsletter_footer_table_lower"}
    <div>
        {block name="newsletter_footer_table_lower_links"}
            <div style="text-align: center;">
              <div>
                  <a href="{url module='frontend' controller='newsletter' sUnsubscribe=1}" target="_blank">
                      {s name='NewsletterFooterLinkUnsubscribe'}{/s}
                  </a>
              </div>
              <div>
                  <a href="{$sStart}/backend/newsletter?campaign={$sCampaign.id}&mailaddress={$sUser.mailaddressID}&hash={$sCampaignHash}" target="_blank">
                      {s name='NewsletterFooterLinkNewWindow'}{/s}
                  </a>
              </div>
            </div>
        {/block}
    </div>
{/block}
