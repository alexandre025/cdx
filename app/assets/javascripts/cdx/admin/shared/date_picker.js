Cdx.ready(function () {
    $('.input-group.date').each(function () {
        initDatepicker(this);
    });
});

function initDatepicker(elem){
    $(elem).datepicker({
        language: 'fr',
        todayBtn: "linked",
        keyboardNavigation: false,
        forceParse: false,
        calendarWeeks: true,
        autoclose: true,
        format: 'yyyy-mm-dd',
        todayHighlight: true
    });

    if($(elem).find('input').attr('data-start-date') != undefined)
      $(elem).datepicker('setStartDate', $(elem).find('input').attr('data-start-date'));

    if($(elem).find('input').attr('data-end-date') != undefined)
        $(elem).datepicker('setEndDate', $(elem).find('input').attr('data-end-date'));

    $(elem).datepicker().on('show', function(event) {
        $(elem).datepicker.currentDate = event.target.value;
    })
    .on('changeDate', function(event) {
        if($(elem).hasClass('daterange-required')){
            var newDate = event.target.value;

            if (newDate == '' || newDate == null) {
                if(event.target.classList.contains('daterange-start')){
                    $(elem).data('datepicker').pickers[0].setDate($(elem).datepicker.currentDate);
                }
                else if(event.target.classList.contains('daterange-end')){
                    $(elem).data('datepicker').pickers[1].setDate($(elem).datepicker.currentDate);
                }
            }
        }
    });
}
