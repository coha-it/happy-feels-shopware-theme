{extends file="parent:frontend/checkout/ajax_cart_item.tpl"}

{* Article actions *}
{block name='frontend_checkout_ajax_cart_actions'}
    <div class="action--container">
        {$deleteUrl = {url controller="checkout" action="ajaxDeleteArticleCart" sDelete=$basketItem.id}}
        {if $basketItem.modus == 2}
            {$deleteUrl = {url controller="checkout" action="ajaxDeleteArticleCart" sDelete="voucher"}}
        {/if}
        {if $basketItem.modus != 4 && $basketItem.modus != 3}
            <form action="{$deleteUrl}" method="post">
                <button type="submit" class="btn is--small action--remove" title="{s name="AjaxCartRemoveArticle"}{/s}">
                    <i class="material-icons">close</i>
                </button>
            </form>
        {/if}
    </div>
{/block}

{block name="frontend_checkout_ajax_cart_articlename_price"}{/block}

{block name='frontend_checkout_ajax_cart_essential_features'}
    <span class="item--price">{if $basketItem.amount}{$basketItem.amount|currency}{else}{s name="AjaxCartInfoFree"}{/s}{/if}{s name="Star"}{/s}</span>
    {$smarty.block.parent}
{/block}