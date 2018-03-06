$(function () {
	$('.delRepeatItem').on('click', function () {
		var item = $(this);
		if (confirm('Do you want to delete?')) {
			item.closest('.repeatItem').remove();
		}
	})
	$('.addRepeatItem').on('click', function () {
		var item = $(this);
		var clean = $('.repeatItem').eq(0);
		var newBox = clean.clone();
		var newIndex = $('.repeatItem').length;
		$('[name]', newBox).each(function () {
			var name = $(this).attr('name');
			name = name.replace('[0]', '[' + newIndex + ']');
			$(this).attr('name', name);
		})
		clean.after(newBox)
		newBox.show();
	})

	$('.del').click(function () {
		var item = $(this);

		if (confirm(item.data('msg'))) {
			return true;
		}
		return false;
	})
})
