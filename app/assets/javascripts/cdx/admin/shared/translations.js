Cdx.ready(function(){

    $('.select-translation').on('select2:select', function(e){
        var locale = e.params.data.id;

        $('[data-translation-for-locale]').parents('.form-group').addClass('hidden-translation');
        $('[data-translation-for-locale='+locale+']').parents('.form-group').removeClass('hidden-translation');
    });

});