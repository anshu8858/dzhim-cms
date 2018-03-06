ckConfig['toolbar'] = [
	{
		name: 'clipboard',
		items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo']
	},
	{
		name: 'basicstyles',
		items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
	},
	{
		name: 'paragraph',
		items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv',
			'-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
	},
	{
		name: 'insert',
		items: ['Link', 'Unlink', 'Image', 'Table']
	},
	'/',
	{
		name: 'styles',
		items: ['Styles', 'Format', 'Font', 'FontSize', 'TextColor', 'BGColor']
	}
];
//ckConfig['width'] = 400;

$('textarea.ck').ckeditor(function () {}, ckConfig);