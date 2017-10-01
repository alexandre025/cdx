Cdx.ready(function () {

    if ($('#pages_index').is('*')) {

        $table = $('#pages-table');

        $table.dataTable({
            "processing": false,
            "serverSide": true,
            "ajax": $table.data('source'),
            "pagingType": "full_numbers",
            "columns": [
                {"data": "title"},
                {"data": "slug", "orderable": false},
                {"data": "state", "orderable": false},
                {"data": "published_on"},
                {"data": "actions", "orderable": false}
            ]
        });

    }

});
