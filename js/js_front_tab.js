document.addEventListener('DOMContentLoaded', function() {
	 fntabSChange("introduction")
});
function fntabSChange(shapeId) {

	// 모든 tab_content 숨기기
	let tabContents = document.querySelectorAll('.tab_con_view');
	tabContents.forEach(content => {
		content.style.display = 'none';
	});

	// 선택한 shapeId에 해당하는 tab_content 보이기
	let selectedTab = document.getElementById(shapeId);
	if (selectedTab) {
		selectedTab.style.display = 'block';
	} else {
		console.log("해당하는 ID의 요소가 없습니다.");
	}   
	
	// 모든 버튼의 active 클래스 제거
	let tabButtons = document.querySelectorAll('.tab_btn');
	tabButtons.forEach(button => {
		button.classList.remove('active');
	});

	// 클릭된 버튼에 active 클래스 추가
	let clickedButton = document.querySelector(`.tab_btn[data-tab="${shapeId}"]`);
	if (clickedButton) {
		clickedButton.classList.add('active');
	}
}