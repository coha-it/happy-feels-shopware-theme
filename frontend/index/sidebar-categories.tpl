{extends file="parent:frontend/index/sidebar-categories.tpl"}

{block name="frontend_index_categories_left_before"}
    {$smarty.block.parent}

    {block name="frontend_index_categories_left_entry"}
		{if $level < 1}
			{* Home Mobile *}
			{if $Controller|lower == 'index'}
				{$bHome = true}
			{/if}
			<li class="navigation--entry {if $bHome}is--active{/if}" role="menuitem">
				<a class="navigation--link {if $bHome}is--active{/if}" 
					href="https://{$Shop->getHost()}" 
					title="{s name="IndexLinkHome" namespace="frontend/index/categories_top"}Home{/s}">
					{s name="IndexLinkHome" namespace="frontend/index/categories_top"}Home{/s}
				</a>
			</li>
		{/if}
    {/block}
{/block}