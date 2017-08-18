$(document).ready(function () {

    if ($('#taxons_index').is('*')) {

        Rails.ajax({
            url: '/admin/taxonomies/1/taxons',
            type: 'GET',
            dataType: 'json',
            success: function (response, statusText, xhr) {
                taxons_jstree(response['tree'])
            },
            error: function (response, statusText, xhr) {
                alert(statusText);
            }
        });
    }

});

function taxons_jstree(data) {
    $('#taxonomy_tree').jstree({
        core: {
            themes: {
                name: 'proton',
                responsive: true
            },
            data: function(obj, cb) {
                cb.call(this, data);
            }
        }
    });
}