document.addEventListener('DOMContentLoaded', function() {
    // 초기에 mobile_side_nav_area를 닫힌 상태로 설정합니다.
    let mobile_side_nav = document.getElementById("mobile_side_nav_area");
    mobile_side_nav.style.display = "none";

    // 초기 화면 설정을 위해 첫 번째 메뉴인 '프론트'를 선택한 상태로 저장합니다.
    sessionStorage.setItem('lineValue', '프론트');

    // 초기 메뉴 표시를 위해 initMenuDisplay 함수를 호출합니다.
    initMenuDisplay();
});

function FnMobileCheckValue(button) {
    let lineValue = button.value.trim();
    sessionStorage.setItem('lineValue', lineValue); // Store lineValue in session storage
    console.log("생성한 메뉴 세션 " + lineValue);

    // 사이드 네비 타이틀 변경
    let side_menu_title = document.getElementById('menu_title');
    side_menu_title.innerText = lineValue;

    let menuValue = "";
    if (lineValue === "백엔드") menuValue = "back";
    else if (lineValue === "메일") menuValue = "mail";
    else if (lineValue === "결재") menuValue = "payment";
    else menuValue = "front";

    // 모든 메뉴 스타일 초기화
    const menuButtons = document.querySelectorAll('.main_nav_menu_btn');
    menuButtons.forEach(btn => {
        btn.style.fontWeight = 'normal';
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

    // mobile_side_nav_area를 토글합니다.
    toggleMobileSideNav();
}

function toggleMobileSideNav() {
    let mobile_side_nav = document.getElementById("mobile_side_nav_area");
    if (mobile_side_nav.style.display === "none") {
        mobile_side_nav.style.display = "block";
    } else {
        mobile_side_nav.style.display = "none";
    }
}

/*현상태 유지 코드
function toggleMobileSideNav() {
    let mobile_side_nav = document.getElementById("mobile_side_nav_area");
    // 현재 mobile_side_nav의 display 속성을 확인
    let currentDisplay = mobile_side_nav.style.display;

    // mobile_side_nav의 display 속성이 "none"일 때는 열어줍니다.
    if (currentDisplay === "none") {
        mobile_side_nav.style.display = "block";
    } else {
        // 이미 열려 있는 경우에는 아무 작업도 하지 않습니다.
        return;
    }
}

*/