document.write("<script src='/resources/common/js/common.js'></script>");
document.write("<script src='/resources/xdmin/js/constantsXdmin.js'></script>");
document.write("<script src='/resources/xdmin/js/validationXdmin.js'></script>");


divSearchControl = function() {
    var screenWidth = $(window).width();
    if (screenWidth < bootstrap5_sm_dimensions) {
        $('#divSearch').hide();
        $('#iSearchControlUp').hide();
        $('#iSearchControlDown').show();
    } else {
        // by pass
    }
}
 
 
$('#divSearchControl').on('click', function() {
    if ($('#divSearch').is(':visible')) {
         $('#divSearch').hide();
         $('#iSearchControlUp').hide();
         $('#iSearchControlDown').show();
    } else {
         $('#divSearch').show();
         $('#iSearchControlUp').show();
         $('#iSearchControlDown').hide();
    }
 });


