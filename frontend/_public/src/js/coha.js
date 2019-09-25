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

    // Init Members Once
    coha._initMembersOnce();
};

coha._initOnceAfterAjax = function() {
    // Functions
    coha.bInitOnceAfterAjax = false;
}


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

    // Fake Window Resize
    coha.windowResize();
};


coha.windowResize = function() {
    $( window ).resize();
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
    console.log('generate Bobbles');

    // Clear Bobbles
    var oBobbles = oContainer.prev('.bobbles-wrapper').find('.bobbles-inner');
    oBobbles.empty();

    // Generate New Bobbles
    var iBobbleCount = coha.random(8,15);
    var aColors = [
        '#54656c', 
        '#727e85', 
        '#afc5cb', // Light Blue
        '#cf6035', // Red
        '#efd84e', // Yellow
        '#efefef', // gery
    ];

    for (var i = 0; i < iBobbleCount; i++) {
        var oBobbleOutside = $('<div class="bobble-outside"></div>').appendTo(oBobbles);
            oBobbleOutside
                .css('left', coha.random(-25,125) + '%')
                // .css('left', coha.random(-100,2000) + 'px')
                .css('top',  coha.random(-25,125) + '%')
                // .css('top',  coha.random(-100,2000) + 'px')
                ;
        var oBobbleInside  = $('<div class="bobble-inside"></div>' ).appendTo(oBobbleOutside);
            oBobbleInside
                // .css('padding', coha.random(5,120))
                .css('padding', 'calc('+coha.random(100,1000)+'vw / 100)')
                .css('background-color', coha.getRandomFromArray(aColors));
    }
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
});
