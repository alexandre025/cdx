$(document).ready(function () {

    if ($('#taxons_index').is('*')) {

        Rails.ajax({
            url: '', // Self
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
    var last_rollback = null;

    $('#taxonomy_tree').jstree({
        core: {
            check_callback: true,
            data: function (obj, cb) {
                cb.call(this, data);
            },
            themes: {
                name: 'proton',
                responsive: true
            }
        },
        plugins: ['contextmenu', 'dnd', 'json_data']
    })
        .bind('move_node.jstree', handle_move)
        .bind('remove.jstree', handle_delete)
        .bind('create.jstree', handle_create)
        .bind('rename.jstree', handle_rename);

    function handle_move(e, data) {
        console.log(data);
        last_rollback = data.old_instance;

        Rails.ajax({
            url: 'update_position',
            type: 'POST',
            dataType: 'json',
            data: {
                 data: data
            },
            success: function(response, statusText, xhr) {

            },
            error: function (response, statusText, xhr) {

            }
        });
    }

    function handle_delete(e, data) {

    }

    function handle_create(e, data) {

    }

    function handle_rename(e, data) {

    }

    function handle_ajax_error(response, statusText, xhr) {
        $.jstree.rollback(last_rollback)
    }
}