{extends file="parent:newsletter/index/index.tpl"}

{block name="newsletter_index_index_head"}
    <meta charset="UTF-8" />
    <title>Newsletter</title>
    <style type="text/css">
        body {
            font-family:Arial,Helvetica;
        }
        a:link, a:visited {
            color:#8c8c8c;
            text-decoration:none;
        }
        a:hover, a:active {
            color:#fff;
            text-decoration:none;
        }
        a:hover {
            color:#fff;
            text-decoration:none;
        }
        div#navi_unten a {
            color:#8c8c8c;
            font-size: 14px !important;
            text-decoration:none;
        }
    </style>
{/block}

{block name="newsletter_index_body_attributes"}style="height:100%; font-family:Arial, Helvetica, sans-serif; padding:0; background-color:#E9EBED;" background="#ffffff;margin:0;padding:0;" leftmargin="0" topmargin="0"{/block}

{block name="newsletter_index_table"}

    {block name="newsletter_index_table_inner"}
        {block name="newsletter_index_table_inner_content"}{/block}

        {$path = ""}

        {foreach from=$sCampaign.containers item=sCampaignContainer}
            {if $sCampaignContainer.type == "ctBanner"}
                {$path = "newsletter/container/banner.tpl"}
            {elseif $sCampaignContainer.type == "ctText"}
                {$path = "newsletter/container/text.tpl"}
            {elseif $sCampaignContainer.type == "ctSuggest"}
                {$path = "newsletter/container/suggest.tpl"}
            {elseif $sCampaignContainer.type == "ctArticles"}
                {$path = "newsletter/container/article.tpl"}
            {elseif $sCampaignContainer.type == "ctLinks"}
                {$path = "newsletter/container/link.tpl"}
            {elseif isset($sCampaignContainer.templateName) }
                {$path = "newsletter/container/{$sCampaignContainer.templateName}.tpl"}
            {/if}

            {if $path != ""}
                {if $sCampaignContainer.type == "ctSuggest"}
                    {include file=$path sCampaignContainer=$sRecommendations}
                {else}
                    {include file=$path}
                {/if}
            {/if}
        {/foreach}

        {block name="newsletter_index_table_inner_footer"}
        <div style=" text-align: center; color:#8c8c8c; font-size: 14px; line-height: 1.55; font-family:Arial,Helvetica;padding: 25px 15px 0;">
            {include file="newsletter/index/footer.tpl"}
        </div>
        {/block}
    {/block}

    {block name="newsletter_index_log"}
        <img src="{url module='backend' controller='newsletter' action='log' mailing=$sMailing.id mailaddress=$sUser.mailaddressID fullPath}" style="width:1px;height:1px">
    {/block}
{/block}
</body>
</html>