{extends file="parent:frontend/listing/product-box/box-minimal.tpl"}

{namespace name="frontend/listing/box_article"}

{* Product description *}
{block name='frontend_listing_box_article_description'}
    <div class="product--description">
        {$sArticle.description_long|strip_tags|truncate:240}
    </div>
{/block}

{* Default price *}
{block name='frontend_listing_box_article_price_default'}
    <span class="price--default is--nowrap{if $sArticle.has_pseudoprice} is--discount{/if}">
        {if $sArticle.priceStartingFrom}
            {s name='ListingBoxArticleStartsAt'}{/s} 
            {* Take smallest instead of largest price! *}
            {$sArticle.prices[ count($sArticle.prices)-1 ].price|currency}
        {else}
            {$sArticle.price|currency}
        {/if}
        {s name="Star"}{/s}
    </span>
{/block}

{block name="frontend_listing_box_article_content"}
    <div class="box--content is--rounded">
                        
        {* Product Minimal *}
        {block name='frontend_listing_box_article_info_container'}

            {* Product image *}
            {block name='frontend_listing_box_article_picture'}
                {include file="frontend/listing/product-box/product-image.tpl"}
            {/block}

            <div class="product--info">

                {* Customer rating for the product *}
                {block name='frontend_listing_box_article_rating'}
                    {if !{config name=VoteDisable}}
                        <div class="product--rating-container">
                            {if $sArticle.sVoteAverage.average}
                                {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage.average type="aggregated" label=false microData=false}
                            {/if}
                        </div>
                    {/if}
                {/block}

                {* Product name *}
                {block name='frontend_listing_box_article_name'}
                    <a href="{$sArticle.linkDetails}"
                        class="product--title"
                        title="{$sArticle.articleName|escapeHtml}">
                        {$sArticle.articleName|truncate:50|escapeHtml}
                    </a>
                {/block}

                {* Variant description *}
                {block name='frontend_listing_box_variant_description'}
                    {if $sArticle.attributes.swagVariantConfiguration}
                        <div class="variant--description">
                            <span title="
                                {foreach $sArticle.attributes.swagVariantConfiguration->get('value') as $group}
                                        {$group.groupName}: {$group.optionName}
                                {/foreach}
                                ">
                                {foreach $sArticle.attributes.swagVariantConfiguration->get('value') as $group}
                                    <span class="variant--description--line">
                                        <span class="variant--groupName">{$group.groupName}:</span> {$group.optionName} {if !$group@last}|{/if}
                                    </span>
                                {/foreach}
                            </span>
                        </div>
                    {/if}
                {/block}

                {* Product description *}
                {block name='frontend_listing_box_article_description'}{/block}

                {block name='frontend_listing_box_article_price_info'}
                    <div class="product--price-info">
                        {* Product price - Default and discount price *}
                        {block name='frontend_listing_box_article_price'}
                            {include file="frontend/listing/product-box/product-price.tpl"}
                        {/block}
                    </div>
                {/block}

            </div>

            {* Product Badges *}
            {block name='frontend_listing_box_article_badges'}
                {include file='frontend/listing/product-box/product-badges.tpl'}
            {/block}

            {block name="frontend_listing_box_article_buy"}
                {if {config name="displayListingBuyButton"}}
                    <div class="product--btn-container">
                        {if $sArticle.allowBuyInListing}
                            {include file="frontend/listing/product-box/button-buy.tpl"}
                        {else}
                            {include file="frontend/listing/product-box/button-detail.tpl"}
                        {/if}
                    </div>
                {/if}
            {/block}

        {/block}
    </div>
{/block}

{* {block name="frontend_listing_product_box_button_buy_button_text"}
    {s namespace="frontend/listing/box_article" name="ListingBuyActionAdd"}{/s}<i class="icon--basket"></i>
{/block}

{block name="frontend_listing_product_box_button_detail_text"}
    {$label}
{/block} *}
