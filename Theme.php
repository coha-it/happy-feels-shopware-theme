<?php

namespace Shopware\Themes\CohaHappyFeelsTheme;

use Shopware\Components\Form as Form;

class Theme extends \Shopware\Components\Theme
{
    protected $extend = 'Responsive';

    protected $name = <<<'SHOPWARE_EOD'
Happy Feels
SHOPWARE_EOD;

    protected $description = <<<'SHOPWARE_EOD'
The Corporate Happiness - Happy Feels Theme
SHOPWARE_EOD;

    protected $author = <<<'SHOPWARE_EOD'
Corporate Happiness
SHOPWARE_EOD;

    protected $license = <<<'SHOPWARE_EOD'

SHOPWARE_EOD;

    protected $css = [
        //'src/css/aos/aos.css'


        // Materialize CSS - disabled
        // 'src/assets/materialize-css-coha/materialize/bin/materialize.css',

        // OWL
        '../../node_modules/owl.carousel/dist/assets/owl.carousel.min.css',
        '../../node_modules/owl.carousel/dist/assets/owl.theme.default.min.css',

	// jquery PanZoom
	'src/assets/jquery.pan/jquery.pan/dist/css/jquery.pan.css',

	// Pie Charts
	'../../node_modules/jquery-asPieProgress/dist/css/asPieProgress.min.css'
    ];

    protected $javascript = [

        // Material Design JS - disabled
        // 'src/assets/materialize-css-coha/materialize/bin/materialize.js',

        // Scrollmagic - Disabled
        // 'src/js/assets/js/lib/greensock/TweenMax.min.js',
        // 'src/js/scrollmagic/minified/ScrollMagic.min.js',
        // 'src/js/scrollmagic/minified/plugins/animation.gsap.min.js',
        // // 'src/js/scrollmagic/minified/plugins/debug.addIndicators.min.js',

        // Animation on Scroll - Disabled
        // 'src/js/aos/aos.js',

        // OWL
        '../../node_modules/owl.carousel/dist/owl.carousel.js',

	// jQuery PanZoom
	'src/assets/jquery.pan/jquery.pan/dist/jquery.pan.min.js',

	// Pie chart
	'../../node_modules/jquery-asPieProgress/dist/jquery-asPieProgress.min.js',

        // Coha Stickish
        'src/js/coha.stickish.js',
    ];

    public function createConfig(Form\Container\TabContainer $container)
    {


    }
}
