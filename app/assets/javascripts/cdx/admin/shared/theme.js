Cdx.ready(function () {

    $('.theme-selector').on('select2:select', function (e) {
        var theme = e.params.data.id;

        var $body = $('body');

        $body.removeClass(function (index, className) {
            return className.indexOf('skin-') >= 0 ? className : ''
        });

        $body.addClass('skin-'+theme);
    });

});