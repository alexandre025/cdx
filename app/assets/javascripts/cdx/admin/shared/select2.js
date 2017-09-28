Cdx.ready(function () {

    $('.select2-simple').select2({
        width: '100%',
        minimumResultsForSearch: Infinity
    });

    $('.select2-simple-search').select2({
        width: '100%',
        minimumResultsForSearch: 1
    });

    $('.select2-multiple').select2({
        width: '100%',
        minimumResultsForSearch: 1,
        multiple: true
    });

});