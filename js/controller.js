$(document).ready(function () {
    var $body = $('body'),
        $next = $('.nav-next'),
        $prev = $('.nav-prev'),
        $carousel = $('.projects'),
        $items = $carousel.children('li'),
        max = $carousel.outerWidth(),
        width = $items.outerWidth(),
        min = -max + width,
        margin = 10;

    var scroll = function (items) {
        var left = parseInt($carousel.css('left')) + (-items * width),
            $selected = $items.filter('.is-selected'),
            backgroundLeft,
            i;

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

        if (left == 0)
        {
            backgroundLeft = 0;
        }
        else
        {
            backgroundLeft = (left / min) * 100;
        }

        $body.css('background-position', backgroundLeft + '% center');

        if (left == 0) {
            $selected = $items.first();
        }
        else if (left == min) {
            $selected = $items.last();
        }
        else {
            for (i = 0; i < items; i++) {

                $selected = $selected.next();
            }

            for (i = items; i < 0; i++) {
                $selected = $selected.prev();
            }
        }

        $selected.addClass('is-selected').siblings().removeClass('is-selected');
    };

    $next.click(function (e) {
        e.preventDefault();

        scroll(1);

        return false;
    });

    $prev.click(function (e) {
        e.preventDefault();

        scroll(-1);

        return false;
    });

    $next.mouseenter(function () {
        $carousel.css('margin-left', margin);
    });

    $next.mouseleave(function () {
        $carousel.css('margin-left', 0);
    });

    $prev.mouseenter(function () {
        $carousel.css('margin-left', -margin);
    });

    $prev.mouseleave(function () {
        $carousel.css('margin-left', 0);
    });
});