{extends file="parent:frontend/blog/comment/form.tpl"}
{namespace name="frontend/blog/comments"}

{block name='frontend_blog_comments_form_headline'}
    <div class="comments--actions">
        <a class="btn is--secondary is--icon-right btn--create-entry"
           title="{s name="BlogHeaderWriteComment"}{/s}"
           rel="nofollow"
           data-collapse-panel="true"
           data-collapseTarget=".comment--collapse-target">
            {s name="BlogHeaderWriteComment"}{/s}
            <i class="icon--arrow-right"></i>
        </a>
    </div>
{/block}
