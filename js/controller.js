$(document).ready(function () {
    var CLASS_SELECTED = 'is-selected',
        $body = $('body'),
        $next = $('.nav-next'),
        $prev = $('.nav-prev'),
        $carousel = $('.projects'),
        $links = $('nav a'),
        $items = $carousel.children('li'),
        max = $carousel.outerWidth(),
        width = $items.outerWidth(),
        min = -max + width,
        margin = 10;

    var scroll = function (event, items) {
        var $link = $links.filter('.' + CLASS_SELECTED),
            $item = $items.filter('.' + CLASS_SELECTED),
            left = -$item.position().left + (-items * width),
            backgroundLeft,
            i;

        event.preventDefault();
        event.stopPropagation();

        if (left < min) {
            left = 0;
        }

        if (left > 0) {
            left = min;
        }

        $carousel.css({
            'left': left,
            'margin-left': 0
        });

        if (left == 0) {
            backgroundLeft = 0;
        }
        else {
            backgroundLeft = (left / min) * 100;
        }

        $body.css('background-position', backgroundLeft + '% center');

        if (left == 0) {
            $link = $links.first();
            $item = $items.first();
        }
        else if (left == min) {
            $link = $links.last();
            $item = $items.last();
        }
        else {
            for (i = 0; i < items; i++) {
                $link = $link.next();
                $item = $item.next();
            }

            for (i = items; i < 0; i++) {
                $link = $link.prev();
                $item = $item.prev();
            }
        }

        $link.addClass(CLASS_SELECTED).siblings().removeClass(CLASS_SELECTED);
        $item.addClass(CLASS_SELECTED).siblings().removeClass(CLASS_SELECTED);

        return false;
    };

    var scrollTo = function(event, target) {
        var current = $links.filter('.' + CLASS_SELECTED).index();

        return scroll(event, target - current);
    };

    $links.click(function(event) {
        event.preventDefault();

        return scrollTo(event, $(this).index());
    });

    $next.click(function (event) {
        return scroll(event, 1);
    });

    $prev.click(function (event) {
        return scroll(event, -1);
    });

    $next.mouseenter(function () {
        $carousel.css('margin-left', -margin);
    });

    $next.mouseleave(function () {
        $carousel.css('margin-left', 0);
    });

    $prev.mouseenter(function () {
        $carousel.css('margin-left', margin);
    });

    $prev.mouseleave(function () {
        $carousel.css('margin-left', 0);
    });

    $next.on('touchstart', function (event) {
        $next.click();

        return false;
    });

    $prev.on('touchstart', function (event) {
        $prev.click();

        return false;
    });
});