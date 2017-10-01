Cdx.ready(function () {

    if ($('#users_index').is('*')) {

        $table = $('#users-table');

        $table.dataTable({
            "processing": false,
            "serverSide": true,
            "ajax": $table.data('source'),
            "pagingType": "full_numbers",
            "columns": [
                {"data": "email"},
                {"data": "first_name"},
                {"data": "last_name"},
                {"data": "actions", "orderable": false}
            ]
        });

    }
});
