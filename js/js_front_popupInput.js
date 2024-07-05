function fnOnClickReviewMessage() {
	let reviewMessage = document.querySelector(".popup_input").value;
	console.log(reviewMessage);
	let popup = document.getElementById("pop_review_message");
	popup.textContent=reviewMessage;
}
function fntogglePopup(projectId) {
	let popup = document.getElementById(projectId);
	let overlay = document.querySelector('.popup-overlay');

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
	let popups = document.querySelectorAll('.popup');
	let overlay = document.querySelector('.popup-overlay');
	popups.forEach(function(popup) {
		popup.style.display = 'none';
	});
	overlay.style.display = 'none';
}