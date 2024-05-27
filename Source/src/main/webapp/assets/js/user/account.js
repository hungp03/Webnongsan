// Ngay sau khi load xong trang làm những điều này
window.addEventListener("load", function() {
	var alertElements = document.querySelectorAll(".alert");
	setTimeout(function() {
		alertElements.forEach(function(alertElement) {
			alertElement.style.display = "none";
		})
	}, 3000);
});