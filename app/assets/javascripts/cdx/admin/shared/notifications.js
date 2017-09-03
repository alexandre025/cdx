Cdx.ready(function () {

    $('div[data-toastr]').each(function () {
        var element = $(this);
        triggerToastr(element.html(), element.data('toastr'));

    });

    $('[data-flash=true]').on('ajax:success', function (event) {
        var data = event.detail[0];
        triggerToastr(data['flash']['type'], data['flash']['message']);
    });

});

function triggerToastr(type, message) {
    switch (type) {
        case 'success':
            toastr.success(message);
            break;
        case 'error':
            toastr.error(message);
            break;
        case 'warning':
            toastr.warning(message);
            break;
        default:
            toastr.info(message);
    }
}