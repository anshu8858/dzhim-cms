function setKcf(dir) {
	if (dir) {
		ckConfig[ 'filebrowserBrowseUrl' ] = '/kcf/browse.php?type=file&dir=file/' + dir;
		ckConfig[ 'filebrowserImageBrowseUrl' ] = '/kcf/browse.php?type=image&dir=image/' + dir;
		ckConfig[ 'filebrowserFlashBrowseUrl' ] = '/kcf/browse.php?type=flash&dir=flash/' + dir;
		ckConfig[ 'filebrowserUploadUrl' ] = '/kcf/upload.php?type=file&dir=file/' + dir;
		ckConfig[ 'filebrowserImageUploadUrl' ] = '/kcf/upload.php?type=image&dir=image/' + dir;
		ckConfig[ 'filebrowserFlashUploadUrl' ] = '/kcf/upload.php?type=flash&dir=flash/' + dir;
	}
}