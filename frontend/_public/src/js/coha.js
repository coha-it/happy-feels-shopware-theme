/* eslint-disable no-tabs */
/* jslint browser:true */
/* global jQuery */

/*

    Global Functions

*/
function initialized(e) {
    return e.initialized == true;
}

function exists(e) {
    return e.length;
}

/*

    Corporate Happiness

*/
var coha = {
    // Basic Config
    _init: function() {},
    _settings: {
        debug: true
    },
    _debug: function(c) {
        if(coha._settings.debug == true) {
            // console.log(c);
        }
    },

    // Custom Coha Functions and Objects
    playVideo: function() {},
    team: {
        members: [],
        labels: [],
        highlight: function() {},
        dehighlight: function() {},
    },

    // Booleans
    bInitOnceAfterAjax: true,

    // Init Functions
    _initOnce: function() {},
    _initOnceAfterAjax: function() {},
    _initMultipleTimes: function() {},

    // More Initializing Functions
    _initSliders: function() {},
    _initAosClasses: function() {},
    _initStickish: function() {},
    _initTextOverflow: function() {},
    _initPanZoom: function() {},

};
var debug = coha._debug;

// Initialize Once
coha._initOnce = function() {

    // On Screen Resize
    $( window ).resize(function() {
        coha.onScreenResize();
    });

    // On Click Text Overflow
    $(document).on('click', '.text-overflow + .trigger', function(event) {
        coha.textOverflow(event.currentTarget);        
    });

    $(document).on('click', '.text-overflow.cutted', function(event) {
        coha.textOverflow(event.currentTarget);
    });

    $(document).on('click', '.ausbildung--subinfo.trigger', function(event) {
        $('.ausbildung--subinfo').toggleClass('visible');
        coha.windowResize();
    });

    // On Click a Bobble
    $(document).on('click', '.bobble-inside, .bobble-outside', function(event) {
        coha.generateBobbles($('.bobbles'));
    });

    // Init Members Once
    coha._initMembersOnce();

    // Init Multiple Times
    coha._initMultipleTimes();
};

coha._initOnceAfterAjax = function() {
    // Functions
    coha.bInitOnceAfterAjax = false;
};

// Initialize Multiple Times
coha._initMultipleTimes = function() {
    // Initialize Members
    coha._initMembersMultipleTimes();

    // Initialize AosClasses
    coha._initAosClasses();

    // Initialize Pins
    coha._initStickish();

    // Initialize Text-Overflow
    coha._initTextOverflow();

    // Initalize Hash in URL
    coha._initHashInUrl();

    // Coha Init Bobbles
    coha._initBobbles();

    // Init Pan Zoom
    coha._initPanZoom();

    // Init Circle Progress
    coha._initProgressCircles();

    // Init ScrollMagic Elements
    coha._initScrollMagicElements();

    // Fake Window Resize
    coha.windowResize();
};


coha.windowResize = function() {
    $( window ).resize();
};

coha._initScrollMagicElements = function() {

    var oCph = $('.coha--plant-hand')
    var sIc = 'init--scrollmagic';

    if( !oCph.hasClass(sIc) ){
        
        oCph
            .css('transform-origin', '0 0')
            .find('.emotion--banner').css('margin-left','-5px');
            
        var tween0 = TweenMax.from('.coha--plant-hand', 1, {transform: "translate(-5%) scale(.9)", opacity: 1});
        var scene0 = new ScrollMagic.Scene(
            {
                triggerElement: '.coha--plant-hand',
                duration: '35%', 
                /*triggerHook: 0.95*/
            })
            .setTween(tween0)
            .addTo(CohaSmc);

        oCph.addClass(sIc);
    }

};

coha._initProgressCircles = function() {
    if($('.progress-circle').length) {
        $('.progress-circle').each(function(i, c) {
            coha._initProgressCircle($(c));
        })
    }
};

coha.checkProgressCircles = function(y, yh) {
    $('.progress-circle').each(function(i, elem) {
        var c = $(elem)
        var cy = c.offset().top;
        var cyh = cy + c.outerHeight();
        
        // They are visible!
        if(yh < cy || cyh < y) {
            // Unvisible Circle
            coha._terminateProgressCircle(c);
        } else {
            // Visible Circle!
            coha._initProgressCircle(c);          
        }
    });
};

coha._initProgressCircle = function(elem) {
    if(!elem.hasClass('circle-init')) {
        elem.circleProgress({
            startAngle: -Math.PI / 4 * 2,
            size: 500,
            thickness: 40
        });

        if(elem.hasClass('a')) {
            elem.circleProgress({
                fill: {color: '#efd84d'},
                emptyFill: '#A9ACB0',
                animation: { duration: 1500, easing: "circleProgressEasing" }
            }).on('circle-animation-progress', function(event, progress, stepValue) {
                $(this).find('p').html(Math.round( ( (stepValue*100) ))  + '<i>%</i>');
            });
        }

        if(elem.hasClass('b')) {
            elem.circleProgress({
                // fill: {color: '#cab017'},
                fill: {gradient: [['#cab017', .5], ['#efd84d', .5]], gradientAngle: Math.PI},
                // fill: {gradient: [['#ff0000', .5], ['#00ff00', .5]], gradientAngle: Math.PI},
                emptyFill: '#A9ACB0',
                animation: { duration: 1400, easing: "circleProgressEasing" },
            }).on('circle-animation-progress', function(event, progress, stepValue) {
                $(this).find('p').html('+'+Math.round( ( (stepValue*100) ))  + '<i>%</i>');
            });
        }

        if(elem.hasClass('c')) {
            elem.circleProgress({
                fill: {color: '#efd84d'},
                emptyFill: '#A9ACB0',
                animation: { duration: 2200, easing: "circleProgressEasing" }
            }).on('circle-animation-progress', function(event, progress, stepValue) {
                $(this).find('p').html('+'+Math.round( ( (stepValue*100*5) ))  + '<i>%</i>');
            });
        }

        if(elem.hasClass('d')) {
            elem.circleProgress({
                fill: {color: '#efd84d'},
                emptyFill: '#A9ACB0',
                animation: { duration: 1700, easing: "circleProgressEasing" }
            }).on('circle-animation-progress', function(event, progress, stepValue) {
                $(this).find('p').html('+'+Math.round( ( (stepValue*100) ))  + '<i>%</i>');
            });
        }

        elem.addClass('circle-init');
    }
};

coha._terminateProgressCircle = function(c) {
    c.removeClass('circle-init');
}

coha._initPanZoom = function() {
    // Pan Zoom
    $(".emotion--element.pan .banner-slider--item:not(.pan--init), .emotion--element.pan .banner--image:not(.pan--init)").each(function() {
        var oElement = $(this);
        var sSrc = oElement.find('.banner--image-src, .banner-slider--image');
        oElement.attr('src', sSrc.attr('src'));

        oElement.pan();
        oElement.addClass('pan--init');
    });
};

coha._initBobbles = function() {
    // Go Through all Emotion Containers
    $('.emotion--container-wrapper').each(function(i, e) 
    {
        var emoWrapper = $(e);
        var emo = emoWrapper.find('.emotion--container.bobbles');

        // If Emo Bobbles exist but no Bobble Container Exists
        if(emo.length > 0 && emoWrapper.find('.bobbles-wrapper').length <= 0)
        {
            // Create Bobble Container
            emoWrapper.prepend('<div class="bobbles-wrapper"><div class="bobbles-inner"></div></div>');

            // Generate Bobbles!
            coha.generateBobbles(emo);
        }
    });
};

coha.onScroll = function() {
    var y = $(document).scrollTop();
    var yh = y + $(window).height();

    // Check Progress Circles
    coha.checkProgressCircles(y, yh);
};

coha.random = function(min, max) {
    if(typeof max === 'undefined') {
        max = min;
        min = 0;
    }
    return Math.floor(Math.random() * (max - min + 1)) + min;
};

coha.getRandomFromArray = function(arr) {
    return arr[Math.floor(Math.random()*arr.length)];
};


coha.generateBobbles = function(oContainer) {
    // Clear Bobbles
    var oBobblesWrapper = oContainer.prev('.bobbles-wrapper').find('.bobbles-inner');
    // oBobblesWrapper.empty();

    // Generate New Bobbles
    var iBobbleCount = coha.random(8,15);

    if(oContainer.hasClass('few')) {
        iBobbleCount = coha.random(5,8);
    }

    var aColors = [
        '#54656c', 
        '#727e85', 
        '#afc5cb', // Light Blue
        '#cf6035', // Red
        '#efd84e', // Yellow
        '#efefef', // gery
    ];

    for (var i = 0; i < iBobbleCount; i++) {
        var oBobbleOutside,
            oBobbleInside;

        if(oBobblesWrapper.find('.bobble-outside').eq(i).length) {
            // Move
            oBobbleOutside = oBobblesWrapper.find('.bobble-outside').eq(i);
            oBobbleInside = oBobbleOutside.find('.bobble-inside').eq(i);
        } else {
            // Create
            oBobbleOutside = $('<div class="bobble-outside"></div>').appendTo(oBobblesWrapper);
            oBobbleInside  = $('<div class="bobble-inside"></div>' ).appendTo(oBobbleOutside);
        }

        oBobbleOutside
            .css('left', coha.random(-25,125) + '%')
            .css('top',  coha.random(-25,125) + '%')
            .css('transition', coha.random(200, 1500) + 'ms');
            ;
        oBobbleInside
            .css('padding', 'calc('+coha.random(100,1000)+'vw / 100)')
            .css('background-color', coha.getRandomFromArray(aColors))
            .css('transition', coha.random(200, 1500) + 'ms');
            ;
    }
    
    oBobblesWrapper
        .find('.bobble-outside')
        .eq(iBobbleCount)
        .nextAll()
        .find('.bobble-inside')
        .css('transform', 'scale(0) !important')
        .hide({
            padding: 0,
        }, coha.random(500,1750), function() {
            $(this).parent().remove();
        });
};


coha._initHashInUrl = function() {
    if(window.location.hash) {
        var oGoal = $(window.location.hash);
        var sClass = 'scrolledTo';

        if(oGoal.length > 0 && !oGoal.hasClass(sClass)) {

            oGoal.addClass(sClass);

            $('html, body').animate({
                scrollTop: oGoal.offset().top
            }, 750);

        }

    }
};

// Init Pins
coha._initStickish = function() {
    $('.stickish').stickish();
};

coha.textOverflow = function(e) {
    var trigger = $(e);
    var textOverflow = trigger.prev('.text-overflow');

    textOverflow.toggleClass('cutted');

    coha.windowResize();
};


coha._initTextOverflow = function() {
    $('.text-overflow:not(.init)').each(function(i) {
        var textOverflow = $(this);
        var trigger = textOverflow.after('<div class="trigger"><span>Mehr erfahren</span><span>Weniger</span></div>');

        textOverflow.addClass('init cutted');
    });
};

// When Screen Resize
coha.onScreenResize = function() {
};


// Init all Members Once
coha._initMembersOnce = function() {

    // On Click on Labels
    $(document).on('click', '.coha--team .members .blog--entry .labels span', function (e) {
        var rnumber = Math.floor( (Math.random() * 4) + 1);

        // If this is already highlighted
        if($(this).hasClass('highlighted')) {
            coha.team.removeHighlightings();
        } 
        // If this is not already highlighted
        else {
            var clickedText = $(this).text();
            var labels = $('.coha--team .members .blog--entry .labels span');
            var members = $('.coha--team .members .blog--entry');

            // Remove Highlight on all Members
            coha.team.dehighlight([labels, members]);

            // Find All matching Labels and the Members and highlight them
            for (var i = 0; i < labels.length; i++) {
                var label = $(labels[i]);
                var member = label.closest('.blog--entry');

                if(clickedText === label.text()) {
                    // console.log('highlight!');
                    coha.team.highlight([
                        label, member
                    ]);
                    label.attr('rnumber', rnumber);
                }
            }
        }

        // Stop every other Click
        e.stopPropagation();
    });

    $(document).on('click', '.coha--team .members .blog--entry', function(e) {
        if($(this).hasClass('highlighted')) {
            // Stop every other Click
            e.stopPropagation();
        }
    });

    $(document).on('click', '.coha--team', function() {
        coha.team.removeHighlightings();
    });

};

// Init all Members
coha._initMembersMultipleTimes = function() {
    // Init / Split Labels first - Build Tags on Labels
    $('.coha--team .members .blog--entry').each(function(i, hMember) {
        var oMember = $(hMember);

        if( !oMember.hasClass('initialized') ) {
            var oLabels = oMember.find('.labels');
            var sTexts = oLabels.text();
            var aTexts = sTexts.split(/\,\ |\,\&nbsp\;/g);

            // If there are no Labels
            if(oLabels.length <= 0) {
                oMember.addClass('no-labels');
            }

            oLabels.empty();
            for (var j = 0; j < aTexts.length; j++) {
                var sLabel = aTexts[j];
                oLabels.append('<span>'+sLabel+'</span>');
            }

            oMember.addClass('initialized');
        }
    });
};

// Highlight, removeHighlight and Dehighlight
coha.team.highlight = function(elements) {
    for(var i = 0; i < elements.length; i++) {
        elements[i]
            .addClass('highlighted')
            .removeClass('dehighlighted');
    }
};

coha.team.removeHighlightings = function() {
    $('.coha--team .members .blog--entry').removeClass('highlighted dehighlighted');
    $('.coha--team .members .blog--entry .labels span').removeClass('highlighted dehighlighted');
};

coha.team.dehighlight = function(elements) {
    for(var i = 0; i < elements.length; i++) {
        elements[i]
            .addClass('dehighlighted')
            .removeClass('highlighted');
    }
};

// Play the Coha-Videos (not activated)
coha.playVideo = function() {
    $('video[autoplay]').each(function(i, video) {
        var $vid = $(video);
        var vid = $vid[0];
        $vid.off('ended');
        vid.load();
        vid.play();
    });
};


coha._initSliders = function() {

}


coha._initAosClasses = function() {
    var prefix = 'add--';
    //  add--data-aos_fadeUp add--data-aos-duration_2000
    jQuery('*[class*="add--data"]').each(function(i, e) {
        var oElement = jQuery(e);
        var sClasses = oElement.attr('class');
            sClasses = sClasses + ' ';
        var aClasses = sClasses.match(/add--.*?\ /g);
        var bFoundAos   = false;

        // Go Through Attributes
        for (var i = 0; i < aClasses.length; i++) {
            var sClass = aClasses[i];
            var aAttributes = sClass.split(/_/);
            var sName =  aAttributes[0].replace(/ /g,'').replace(prefix, '');
            var sValue = aAttributes[1].replace(/ /g,'').replace(prefix, '');
            // Add Attribute with Value
            oElement.attr(sName, sValue);
            // Remove Class
            oElement.removeClass(sClass);

            // If Including AOS
            if(!bFoundAos && sName.includes('aos')) {
                bFoundAos = true;
            }
        }

        if(bFoundAos) {
            aos_init();
        }
    });

}


// On Document Ready
jQuery(document).ready(function ($) {
    'use strict';

    // Initialize Coha!
    coha._initOnce();

    // On Ajax-Complete
    $(document).ajaxComplete(function() {
        // Initialize Coha Multiple Times
        coha._initMultipleTimes();

        // 
        if(coha.bInitOnceAfterAjax) coha._initOnceAfterAjax();
    });

    // On Scroll
    $(window).scroll(function() {
        coha.onScroll();
    });
});
