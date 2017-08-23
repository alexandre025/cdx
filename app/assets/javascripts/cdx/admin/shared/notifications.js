Cdx.ready(function () {

    $('div[data-toastr]').each(function () {
        element = $(this);

        message = element.html();

        console.log(element.data('toastr'));

        switch (element.data('toastr')) {
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
    });

});