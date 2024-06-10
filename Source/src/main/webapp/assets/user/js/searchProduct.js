

function getParameterByName(name, url) {
	if (!url)
		url = window.location.href;
	name = name.replace(/[\[\]]/g, "\\$&");
	var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex
		.exec(url);
	if (!results)
		return null;
	if (!results[2])
		return '';
	return decodeURIComponent(results[2].replace(/\+/g, " "));
}

// Lấy tham số tìm kiếm từ URL nếu có
var urlParams = new URLSearchParams(window.location.search);
var searchValue = urlParams.get('search');

if (searchValue !== null) {
	document.getElementById('search').value = searchValue;
}