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
            console.log(c);
        }
    },

    // Custom Coha Functions and Objects
    playVideo: function() {},
    team: {
        initialized: false,
        members: [],
        labels: [],
        highlight: function() {},
        dehighlight: function() {},
    },

    initSliders: function() {},
    fInitAosClasses: function() {},

};
var debug = coha._debug;

// Initialize Once
coha._initOnce = function() {
};

// Initialize Multiple Times
coha._initMultipleTimes = function() {
    // Initialize Members
    coha._initMembers();

    // Initialize AosClasses
    coha.fInitAosClasses();
};

// Init all Members
coha._initMembers = function() {
    // Members of Coha and Define Variables
    var c = coha;

    // If team is uninitialized and if Members Exist
    if( !initialized(c.team) && exists($('.coha--team .member')) ) {

        // Init / Split Labels first - Build Tags on Labels
        $('.coha--team .member .labels').each(function(i, element) {
            var oLabels = $(element);
            var sTexts = oLabels.text();
            var aTexts = sTexts.split(', ');

            oLabels.empty();
            for (var j = 0; j < aTexts.length; j++) {
                var sLabel = aTexts[j];
                oLabels.append('<span>'+sLabel+'</span>');
            }

        });

        // Define Vars
        c.team.members = $('.coha--team .member');
        c.team.labels = $('.coha--team .member .labels span');

        var labels = c.team.labels;
        var members = c.team.members;

        // On Click
        c.team.labels.on('click', function (e) {
            var rnumber = Math.floor( (Math.random() * 4) + 1);

            // If this is already highlighted
            if($(this).hasClass('highlighted')) {
                c.team.removeHighlightings([labels, members]);
            } 
            // If this is not already highlighted
            else {
                var clickedText = $(this).text();

                // Remove Highlight on all Members
                c.team.dehighlight([labels, members]);

                // Find All matching Labels and the Members and highlight them
                for (var i = 0; i < labels.length; i++) {
                    var label = $(labels[i]);
                    var member = label.closest('.member');

                    if(clickedText === label.text()) {
                        c.team.highlight([label, member]);
                        label.attr('rnumber', rnumber);
                    }

                }
            }

            // Stop every other Click
            e.stopPropagation();
        });

        $('.coha--team .member').on('click', function(e) {

            if($(this).hasClass('highlighted')) {
                // Stop every other Click
                e.stopPropagation();
            }
        });

        $('.coha--team').on('click', function() {
            c.team.removeHighlightings([members, labels]);
        });

        // initialize
        c.team.initialized = true;
    }
};

// Highlight, removeHighlight and Dehighlight
coha.team.highlight = function(elements) {
    for(var i = 0; i < elements.length; i++) {
        elements[i]
            .addClass('highlighted')
            .removeClass('dehighlighted');
    }
};

coha.team.removeHighlightings = function(elements) {
    for(var i = 0; i < elements.length; i++) {
        elements[i].removeClass('highlighted dehighlighted');
    }
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


coha.initSliders = function() {

}


coha.fInitAosClasses = function() {
    var prefix = 'add--';
    //  add--data-aos_fadeUp add--data-aos-duration_2000
    jQuery('*[class*="add--data"]').each(function(i, e) {
        var oElement = jQuery(e);
        var sClasses = oElement.attr('class');
        var aClasses = sClasses.match(/add--.*?\ /g);

        // Go Through Attributes
        for (var i = 0; i < aClasses.length; i++) {
            var sClass = aClasses[i];
            var aAttributes = sClass.split(/_/);
            var sName = aAttributes[0].replace(/ /g,'').replace(prefix, '');
            var sValue = aAttributes[1].replace(/ /g,'').replace(prefix, '');
            // Add Attribute with Value
            oElement.attr(sName, sValue);
            // Remove Class
            oElement.removeClass(sClass);
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
    });
});


// On Resize Document
$( window ).resize(function() {
    // coha.initSliders();
});
