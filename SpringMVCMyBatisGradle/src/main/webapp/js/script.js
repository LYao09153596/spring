/**
 *
 */
$(document).ready(function () {
    $('.spinner .btn:first-of-type').on('click', function () {
        $('.spinner input').val(parseInt($('.spinner input').val(), 10) + 1);
    });
    $('.spinner .btn:last-of-type').on('click', function () {
        $('.spinner input').val(parseInt($('.spinner input').val(), 10) - 1);
    });
});
//写在document外面
function clickHidden(event){
	$('.trHidden').eq(event).toggle();
}