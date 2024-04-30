// Ngay sau khi load xong trang làm những điều này
window.addEventListener("load", function() {
	// Đặt mã của bạn ở đây
	var alertElements = document.querySelectorAll(".alert");
	setTimeout(function() {
		alertElements.forEach(function(alertElement) {
			alertElement.style.display = "none";
		})
	}, 3000);
});