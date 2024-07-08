document.addEventListener('DOMContentLoaded', function() {
    let lineValue = sessionStorage.getItem('lineValue') || '프론트';
    let menuValue = "";

    console.log("선택 값 " + lineValue + "변환 값" + menuValue); // 수정: console.log() 사용 방법 수정

    if (lineValue === "백엔드") menuValue = "back";
    else if (lineValue === "메일") menuValue = "mail";
    else if (lineValue === "결재") menuValue = "payment";
    else menuValue = "front";
	//let mobile_side_nav = document.getElementById("#mobile_side_nav_area");
	//mobile_side_nav.style.display = "none";
    //initMenuDisplay(); // 수정: DOMContentLoaded 이벤트 리스너 밖에서 한 번만 등록

    function initMenuDisplay() {
        const submenuToShow = document.querySelectorAll(`#${menuValue} .l_menu_a, #${menuValue} .accordion`);
        submenuToShow.forEach(menu => {
            menu.style.display = 'block';
        });

        const nav_btns = document.querySelectorAll('input[name="menu"]');
        nav_btns.forEach(btn => {
            if (btn.value === lineValue) {
                btn.style.fontWeight = 'bold';
            } else {
                btn.style.fontWeight = 'normal';
            }
        });

        // 사이드 네비 타이틀 변경
        let side_menu_title = document.getElementById('menu_title');
        side_menu_title.innerText = lineValue;
    }

    // FnCheckValue 함수는 버튼 클릭 시 호출되는 함수로, 해당 부분은 별도로 수정하지 않았습니다.
});

function FnCheckValue(button) {
    let lineValue = button.value.trim(); // 버튼의 값에서 공백을 제거한 값을 가져옵니다.
	let btnValue = button.value.trim(); // 버튼의 값에서 공백을 제거한 값을 가져옵니다.
    sessionStorage.setItem('lineValue', lineValue); // Store lineValue in session storage
	console.log("생성한 메뉴 세션" + lineValue);

    // 사이드 네비 타이틀 변경
    let side_menu_title = document.getElementById('menu_title');
    side_menu_title.innerText = lineValue;

    let menuValue = ""; // FnCheckValue 내에서 menuValue를 다시 정의

    if (lineValue === "백엔드") menuValue = "back";
    else if (lineValue === "메일") menuValue = "mail";
    else if (lineValue === "결재") menuValue = "payment";
    else menuValue = "front";

    // 모든 메뉴 스타일 초기화
    const menuButtons = document.querySelectorAll('.main_nav_menu_btn');
    menuButtons.forEach(btn => {
        btn.style.fontWeight = 'normal'; // 모든 버튼의 스타일을 일반(굵지 않음)으로 설정
    });

    // 클릭된 버튼에만 굵은 스타일을 적용
    button.style.fontWeight = 'bold';

    // 모든 서브메뉴를 숨깁니다.
    const subMenus = document.querySelectorAll('.s_menu, .l_menu_a, .accordion');
    subMenus.forEach(menu => {
        menu.style.display = 'none';
    });

    // lineValue에 해당하는 서브메뉴를 표시합니다.
    const submenuToShow = document.querySelectorAll(`#${menuValue} .l_menu_a, #${menuValue} .accordion`);
    submenuToShow.forEach(menu => {
        menu.style.display = 'block';
    });
}
