/*!
 * Stickish v.1.0.1
 * Randell Quitain [@cprjk]
 * Licensed under the MIT license
 */
 
var STKSH = {
    _init: function () {
        return this.each(function(i) {
            var currSticky = $(this);

            currSticky
                .addClass('stickish-item')
                .unwrap('.sticky-wrapper')
                .wrap('<div class="sticky-wrapper" />')
                .parent()
                .height(currSticky.outerHeight());

            $(window).on('scroll.stickish', function() {
                STKSH._scrolling('.stickish-item');
            });

            $(window).resize(function() {
                STKSH._onResize(currSticky);
            });
            $(window).resize();
        });
    },

    _onResize: function(currSticky) {
        // Check something
        var $ = jQuery;
        var bFixed = false;
        var sTop = currSticky.css('top');

        if(currSticky.hasClass('fixed')) {
            currSticky.removeClass('fixed');
            bFixed = true;
        }

        currSticky.css('top', '');

        $.data(currSticky[0], 'pos', currSticky.offset().top);

        if(bFixed) currSticky.addClass('fixed');

        currSticky.css('top', sTop);
    },

    _scrolling: function (element) {
        $(element).each(function (i) {
            var $ = jQuery,
                currSticky = $(this),
                nextSticky = $(element).eq(i + 1),
                prevSticky = $(element).eq(i - 1),
                pos = $.data(currSticky[0], 'pos'),
                nextPos, prevPos;

            if (pos <= $(window).scrollTop()) {
                currSticky.addClass('fixed');
                if(typeof nextSticky[0] != 'undefined') {
                    nextPos = $.data(nextSticky[0], 'pos') - currSticky.outerHeight();
                    if (nextSticky.length > 0 && currSticky.offset().top >= nextPos) {
                        currSticky.addClass('absolute').css('top', nextPos - pos);
                    }
                }
            } else {
                currSticky.removeClass('fixed');
                prevPos = $.data(currSticky[0], 'pos') - prevSticky.outerHeight();
                if (prevSticky.length > 0 && $(window).scrollTop() <= prevPos) {
                    prevSticky.removeClass('absolute').removeAttr('style');
                }
            }
        });

    },

};

$.fn.stickish = function() {
    var options;
    var method = arguments[0];
    if (STKSH[method]) {
        method = STKSH[method];
        options = Array.prototype.slice.call(arguments, 1);
    } else if (typeof(method) === 'object' || !method) {
        method = STKSH._init;
        options = arguments;
    } else {
        $.error('Method ' +  method + ' does not exist in the stickish plugin');
        return this;
    }
    return method.apply(this, options);
};