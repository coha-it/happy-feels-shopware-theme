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

        // jQuery Circle Progress
        '../../node_modules/jquery-circle-progress/dist/circle-progress.min.js',

        // Coha Stickish
        'src/js/coha.stickish.js',

        // Coha JS
        'src/js/coha.js',
    ];

    protected $css = [
        //'src/css/aos/aos.css'


        // Materialize CSS - disabled
        // 'src/assets/materialize-css-coha/materialize/bin/materialize.css',

        // OWL
        '../../node_modules/owl.carousel/dist/assets/owl.carousel.min.css',
        '../../node_modules/owl.carousel/dist/assets/owl.theme.default.min.css',

        // jquery PanZoom
        'src/assets/jquery.pan/jquery.pan/dist/css/jquery.pan.css',


        // Coha Happy Feels
        'src/css/coha-happy-feels.css',
    ];

    // function __construct()
    // {

    // }

    /**
     * @param Form\Container\TabContainer $container
     */
    public function createConfig(Form\Container\TabContainer $container)
    {

        // Create the fieldset which is the container of our field
        $fieldset = $this->createFieldSet(
            'my_custom_settings',
            'My custom settings'
        );
        
        // Create the color picker field
        $checkbox = $this->createCheckboxField(
            'is_live_compile',
            'Compile CSS',
            0
        );

        // Adding the fields to the fieldset
        $fieldset->addElement($checkbox);

        // Create the tab which will be named "My custom colors"
        $tab = $this->createTab(
            'my_custom_tab',
            'My custom tab'
        );

        // ...add the fieldset to the tab
        $tab->addElement($fieldset);

        // ...last but not least add the tab to the container, which is a tab panel.
        $container->addTab($tab);


        // Test
        // Shopware()->PluginLogger()->error('jo 1');

        // array_push(
        //     $this->css, 
        //     'src/assets/jquery.pan/jquery.pan/dist/css/jquery.pan.css'
        // );
    }

}
