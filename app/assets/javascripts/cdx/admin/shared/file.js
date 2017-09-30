Cdx.ready(function () {
    uploadInput();

    $(document).on("cocoon:after-insert", function() {
        uploadInput();
    });
});

function uploadInput(){
    $('.file-upload').change(function(e, data){
        $(this).find(".filename").html($(this).find(" input").val().split('\\').pop(-1));
    });
}
