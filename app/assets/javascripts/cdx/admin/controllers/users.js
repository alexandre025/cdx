Cdx.ready(function () {
  $('#users-table').dataTable({
    "processing": false,
    "serverSide": true,
    "ajax": $('#users-table').data('source'),
    "pagingType": "full_numbers",
    "columns": [
      {"data": "email"},
      {"data": "first_name"},
      {"data": "last_name"},
      {"data": "actions", "orderable": false}
    ]
  });
});
