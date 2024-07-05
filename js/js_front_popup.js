function fntogglePopup(projectId) {
	var popup = document.getElementById(projectId);
	var overlay = document.querySelector('.popup-overlay');

	if (popup.style.display === 'block') {
		popup.style.display = 'none';
		overlay.style.display = 'none';
	} else {
		// Hide all popups and overlay
		fncloseAllPopups();
		// Show selected popup and overlay
		popup.style.display = 'block';
		overlay.style.display = 'block';
	}
}

function fncloseAllPopups() {
	var popups = document.querySelectorAll('.popup');
	var overlay = document.querySelector('.popup-overlay');
	popups.forEach(function(popup) {
		popup.style.display = 'none';
	});
	overlay.style.display = 'none';
}