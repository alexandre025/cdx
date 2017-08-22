$(document).ready(function () {

    if ($('#taxonomies_edit').is('*')) {

        $('a[data-tree-action=create_node]').click(function (e) {
            e.preventDefault();
        });

        Rails.ajax({
            url: $('#taxonomy_tree').data('tree-url'),
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
    var create_or_update_url = data['create_or_update_url'];

    $('#taxonomy_tree').jstree({
        core: {
            check_callback: function (op, node, par, pos, more) {
                if (op === 'delete_node') {
                    return confirm('Are you sure ?');
                }
                return true;
            },
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
        .bind('delete_node.jstree', handle_delete)
        .bind('rename_node.jstree', handle_rename)
        .bind('loaded.jstree', handle_loaded);

    function handle_move(e, data) {
        console.log(data);
        Rails.ajax({
            url: data.node.data.update_position_url,
            type: 'POST',
            dataType: 'json',
            data: $.param({
                node: data.node
            }),
            error: function (response, statusText, xhr) {
                handle_ajax_error(response, statusText, xhr);
            }
        });
    }

    function handle_delete(e, data) {
        Rails.ajax({
            url: data.node.data.destroy_url,
            type: 'DELETE',
            dataType: 'json',
            data: $.param({
                node: {
                    id: data.node.id
                }
            }),
            success: function (response, statusText, xhr) {
            },
            error: function (response, statusText, xhr) {
                handle_ajax_error(response, statusText, xhr)
            }
        });
    }

    function handle_rename(e, data) {
        Rails.ajax({
            url: create_or_update_url,
            type: 'POST',
            dataType: 'json',
            data: $.param({
                node: {
                    id: data.node.id,
                    text: data.node.text,
                    parent: data.node.parent
                }
            }),
            success: function (response, statusText, xhr) {
                $('#taxonomy_tree').jstree().set_id(data.node, response['id'])
            },
            error: function (response, statusText, xhr) {
                // handle_ajax_error(response, statusText, xhr)
            }
        });
    }

    function handle_loaded(e) {
        $this = $(this);
        $('a[data-tree-action=create_node]').click(function (e) {
            e.preventDefault();
            $this.jstree().create_node('#', 'New node', 'last', function (node) {
                Rails.ajax({
                    url: create_or_update_url,
                    type: 'POST',
                    dataType: 'json',
                    data: $.param({
                        node: {
                            id: node.id,
                            text: node.text,
                            parent: node.parent
                        }
                    }),
                    success: function (response, statusText, xhr) {
                        $('#taxonomy_tree').jstree().set_id(node.id, response['id'])
                    },
                    error: function (response, statusText, xhr) {
                        handle_ajax_error(response, statusText, xhr)
                    }
                });
            });
        });
    }

    function handle_ajax_error(response, statusText, xhr) {
        alert(statusText);
    }
}