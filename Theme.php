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

    public function createConfig(Form\Container\TabContainer $container)
    {
    }
}
