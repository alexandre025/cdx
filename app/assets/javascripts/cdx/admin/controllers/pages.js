Cdx.ready(function () {
  $('#pages-table').dataTable({
    "processing": false,
    "serverSide": true,
    "ajax": $('#pages-table').data('source'),
    "pagingType": "full_numbers",
    "columns": [
      {"data": "title"},
      {"data": "slug", "orderable": false},
      {"data": "state", "orderable": false},
      {"data": "published_on"},
      {"data": "actions", "orderable": false}
    ]
  });
});
