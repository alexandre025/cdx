$(document).ready(function () {

    if ($('#taxonomies_edit').is('*')) {

        Rails.ajax({
            url: $('#taxonomy_tree').data('init-url'), // Self
            type: 'GET',
            dataType: 'json',
            success: function (response, statusText, xhr) {
                taxons_jstree(response)
            },
            error: function (response, statusText, xhr) {
                alert(statusText);
            }
        });
    }

});

function taxons_jstree(data) {
    var last_rollback = null;

    var create_or_update_url = data['create_or_update_url'];

    $('#taxonomy_tree').jstree({
        core: {
            check_callback: true,
            data: function (obj, cb) {
                cb.call(this, data['tree']);
            },
            themes: {
                name: 'proton',
                responsive: true
            }
        },
        plugins: ['contextmenu', 'dnd', 'json_data']
    })
        .bind('move_node.jstree', handle_move)
        .bind('remove_node.jstree', handle_delete)
        .bind('create_node.jstree', handle_create)
        .bind('rename_node.jstree', handle_rename);

    function handle_move(e, data) {
        console.log(data);
        Rails.ajax({
            url: data.node.data.update_position_url,
            type: 'POST',
            dataType: 'json',
            data: $.param({
                node: data.node
            }),
            success: function (response, statusText, xhr) {

            },
            error: function (response, statusText, xhr) {
                // handle_ajax_error(response, statusText, xhr)
            }
        });
    }

    function handle_create(e, data) {

    }

    function handle_delete(e, data) {

    }

    function handle_rename(e, data) {
        Rails.ajax({
            url: create_or_update_url,
            type: 'POST',
            dataType: 'json',
            data: $.param({
                node: data.node
            }),
            success: function (response, statusText, xhr) {
                $('#taxonomy_tree').jstree().set_id(data.node, response['id'])
            },
            error: function (response, statusText, xhr) {
                // handle_ajax_error(response, statusText, xhr)
            }
        });
    }

    function handle_ajax_error(response, statusText, xhr) {
        $.jstree.rollback(last_rollback)
    }
}