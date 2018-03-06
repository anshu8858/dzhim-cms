$(function () {
	$('.selAllCb').on('click', function () {
		var item = $(this);
		var checked = false;
		var rows = $('.rowCb');
		if (item.is(':checked')) {
			checked = true;
		}
		item.attr('checked', checked);
		rows.attr('checked', checked);
	})

	$('.rowCb').click(function () {
		$('.selAllCb').attr('checked', false);
	})
})