//메뉴바 초기설정
document.addEventListener('DOMContentLoaded', function() {
	
	let line_value = sessionStorage.getItem('line_value') || '프론트';
	let menu_value = "";

	console.log("초기 선택 값: " + line_value + " / 초기 변환 값: " + menu_value); // 수정: console.log() 사용 방법 수정

	if (line_value === "백엔드") menu_value = "back";
	else if (line_value === "메일") menu_value = "mail";
	else if (line_value === "결재") menu_value = "payment";
	else menu_value = "front";
	
	let menu_name = sessionStorage.getItem('menu_name') || 'front_star';
	fnCheckMenu(menu_name);

});