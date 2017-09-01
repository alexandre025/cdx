Cdx.ready(function () {

    $('.select2-simple').select2({
        minimumResultsForSearch: Infinity
    });

    $('.select2-simple-search').select2({
        minimumResultsForSearch: 1
    });

    $('.select2-multiple').select2({
        minimumResultsForSearch: 1,
        multiple: true
    });

});