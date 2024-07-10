//메뉴바 초기설정
document.addEventListener('DOMContentLoaded', function() {
	
	let lineValue = sessionStorage.getItem('lineValue') || '프론트';
	let menuValue = "";

	console.log("초기 선택 값: " + lineValue + " / 초기 변환 값: " + menuValue); // 수정: console.log() 사용 방법 수정

	if (lineValue === "백엔드") menuValue = "back";
	else if (lineValue === "메일") menuValue = "mail";
	else if (lineValue === "결재") menuValue = "payment";
	else menuValue = "front";
	
	let menuName = sessionStorage.getItem('menuName') || 'front_star';
	fnCheckMenu(menuName);

});