{extends file="parent:frontend/index/shop-navigation.tpl"}

{* Menu (Off canvas left) trigger *}
{block name='frontend_index_offcanvas_left_trigger'}
    <li class="navigation--entry entry--menu-left" role="menuitem">
        <a class="entry--link entry--trigger" href="#offcanvas--left" data-offcanvas="true" data-offCanvasSelector=".sidebar-main">
            <img class="thin-icon menu" src="{link file='frontend/_public/src/img/icons/menu.svg'}" alt="" />
            <span class="subtext menu">{s namespace='frontend/index/menu_left' name="IndexLinkMenu"}{/s}</span>
        </a>
    </li>
{/block}