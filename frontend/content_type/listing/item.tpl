{extends file="parent:frontend/content_type/listing/item.tpl"}

{* Date *}
{block name='frontend_content_type_col_meta_data_date'}
    <span class="blog--metadata-date blog--metadata is--nowrap is--first">{$sItem.created_at|date:"DATE_SHORT"}</span>
{/block}
