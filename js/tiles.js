var rand = function (min, max)
{
    return Math.floor(Math.random() * (max - min) + min);
};

$(document).ready(function ()
{
    var TILE_SIZE = 200,
        CLASS_LOADING = 'is-loading',
        $tiles = $('.tiles'),
        $loading = $('.tile.is-loading');

    imagesLoaded($loading, function ()
    {
        $tiles.removeClass(CLASS_LOADING);
        $loading.removeClass(CLASS_LOADING);
    });

    setInterval(function ()
    {
        var i,
            $replaceable = $tiles.children('.tile:not(.is-permanent):not(.is-flipping)'),
            data = {
                exclude: []
            };

        $replaceable.each(function ()
        {
            data.exclude.push($(this).children('a').attr('href'));
        });

        $.get('tile.php', data, function (response)
        {
            if (!response)
            {
                return;
            }

            var $back = $(response),
                $tile = $replaceable.eq(rand(0, $replaceable.length)),
                $front = $tile.children('a');

            $back.addClass('is-flipped');

            $tile.append($back);

            imagesLoaded($back, function()
            {
                $tile.addClass('is-flipping');

                setTimeout(function ()
                {
                    $front.remove();
                    $tile.toggleClass('is-flipping');
                    $back.toggleClass('is-flipped');
                }, 500);
            });
        });
    }, 2000);
});