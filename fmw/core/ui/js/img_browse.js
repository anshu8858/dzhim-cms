function openKCFinder(item, tab) {
	window.KCFinder = {
		callBack: function (url) {
			window.KCFinder = null;
			var img = new Img();
			img.Init(item)
			img.Add(url);
		}
	};
	window.open('/kcf/browse.php?type=image&dir=image/' + tab,
			'kcfinder_image', 'status=0, toolbar=0, location=0, menubar=0, ' +
			'directories=0, resizable=1, scrollbars=0, width=800, height=600'
			);
}
/*
 * div.innerHTML = '<div style="margin:5px">Loading...</div>';
 var img = new Image();
 img.src = url;
 img.onload = function() {
 div.innerHTML = '<img id="img" src="' + url + '" />';
 var img = document.getElementById('img');
 var o_w = img.offsetWidth;
 var o_h = img.offsetHeight;
 var f_w = div.offsetWidth;
 var f_h = div.offsetHeight;
 if ((o_w > f_w) || (o_h > f_h)) {
 if ((f_w / f_h) > (o_w / o_h))
 f_w = parseInt((o_w * f_h) / o_h);
 else if ((f_w / f_h) < (o_w / o_h))
 f_h = parseInt((o_h * f_w) / o_w);
 img.style.width = f_w + "px";
 img.style.height = f_h + "px";
 } else {
 f_w = o_w;
 f_h = o_h;
 }
 img.style.marginLeft = parseInt((div.offsetWidth - f_w) / 2) + 'px';
 img.style.marginTop = parseInt((div.offsetHeight - f_h) / 2) + 'px';
 img.style.visibility = "visible";
 }
 */