var Cdx = {

    ready: function (callback) {

        $(document).on('turbolinks:load', function () {
            callback.call(this);
        });

    }

};