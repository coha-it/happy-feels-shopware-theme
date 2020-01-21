{if !$sCampaignContainer.data.image}
<div style="color:#494949; line-height:1.25;font-family:Arial,Helvetica;font-size:16px; padding:15px; background-color: #fff;">
  {include file="string:{$sCampaignContainer.data.html|replace:'<h2':'<h2 style="font-size:16px;color:#e14900; text-transform:uppercase;line-height: 1.25;" '}"}
  <div style="height: 25px;">&nbsp;</div>
</div>
{else}
<div style="padding: 25px;">
    {if $sCampaignContainer.description && $sCampaignContainer.description!="none"}
    <h2 style="color:#000; font-size:18px; font-weight:bold; margin:15px 0 15px 0px;text-transform:uppercase;">{include file="string:`$sCampaignContainer.description`"}</h2>
    {/if}
    {if $sCampaignContainer.data.alignment=="left"}
    <table border="0" cellspacing="0" cellpadding="0" style="font-family:Arial,Helvetica;background-color: #fff;">
    <tbody style="margin:0;padding:0;">
      <tr>
        <td width="180" align="center" height="120" valign="top" style="padding:0;">
        <a target="_blank" href="{$sCampaignContainer.data.link}">
        <img src="{$sCampaignContainer.data.image}" alt="Banner" border="0" align="middle" style="height:120px" height="120" />
        </a>
        </td>
       <td height="120" valign="top" style="padding:0px;font-size:11px;color:#e14900;">

       <table width="100%" height="100%" border="0" cellspacing="10" cellpadding="0" style="padding:0px;font-size:16px;color:#494949;font-family:Arial,Helvetica;">
       <tr>
       <td>
       {include file="string:{$sCampaignContainer.data.html|replace:'<h2':'<h2 style="font-size:16px;color:#e14900; text-transform:uppercase;line-height: 1.25;" '}"}
       </td>
       </tr>
       </table>
       </td>
      </tr>
      </tbody>
    </table>
    <div style="height:25px;">&nbsp;</div>
    {else}
    <table border="0" cellspacing="0" cellpadding="0" style="font-family:Arial,Helvetica;background-color: #fff;">
      <tr>
        <td height="120" valign="top" style="padding:0px;font-size:16px;color:#494949;">
        <table width="100%" height="100%" border="0" cellspacing="10" cellpadding="0" style="padding:0px;font-size:16px;color:#494949;">
       <tr>
       <td>
       {include file="string:{$sCampaignContainer.data.html|replace:'<h2':'<h2 style="font-size:16px;color:#e14900; text-transform:uppercase;line-height: 1.25;" '}"}
        </td>
        </tr>
        </table>
        <td width="180" align="center" height="120" valign="top" style="padding:0;">
        <a target="_blank" href="{$sCampaignContainer.data.link}">
        <img src="{$sCampaignContainer.data.image}" alt="Banner" border="0" align="middle" style="height:120px" height="120" />
        </a>
        </td>
      </tr>
    </table>
    <div style="height:25px;">&nbsp;</div>
    {/if}
</div>
{/if}