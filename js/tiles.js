$(document).ready(function ()
{
    var TILE_SIZE = 200,
        CLASS_LOADING = 'is-loading',
        $tiles = $('.tiles'),
        $window = $(window),
        load = function ()
        {
            var cols = Math.floor($window.width() / TILE_SIZE),
                rows = Math.floor($window.height() / TILE_SIZE),
                tiles = (cols * rows) - 1,
                $loaded = $tiles.children(':not(.is-permanent)');

            if (tiles < $loaded.length)
            {
                console.log(tiles);
                console.log($loaded.length);
                $loaded.filter(':nth-last-child(-n+' + ($loaded.length - tiles) + ')').remove();

                return;
            }

            $tiles.addClass(CLASS_LOADING);
            $loaded.remove();

            $.get('tiles-ajax.php', { tiles: tiles }, function (response)
            {
                var $loading;

                $tiles.append(response);

                $loading = $tiles.children('.is-loading');

                imagesLoaded($loading, function (instance)
                {
                    $tiles.removeClass(CLASS_LOADING);
                    $loading.removeClass(CLASS_LOADING);

//                    $tiles.css('padding-top', ($window.height() - rows * $loading.outerHeight(true)) / 2);
//                    $tiles.css('padding-left', ($window.width() - cols * $loading.outerWidth(true)) / 2);
                });
            });
        };

    load();

    $window.resize(function ()
    {
        load();
    });
});