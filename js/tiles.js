$(document).ready(function ()
{
    var TILE_SIZE = 200,
        CLASS_LOADING = 'is-loading',
        $tiles = $('.tiles'),
        $loading = $('.tile.is-loading');

    imagesLoaded($loading, function (instance)
    {
        $tiles.removeClass(CLASS_LOADING);
        $loading.removeClass(CLASS_LOADING);
    });
});