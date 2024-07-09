document.addEventListener('DOMContentLoaded', function() {
    //초기값 설정
	let lineValue = sessionStorage.getItem('lineValue') || '프론트';
    let menuValue = "";

    console.log("선택 값: " + lineValue + " / 변환 값: " + menuValue); // 수정: console.log() 사용 방법 수정
	
    if (lineValue === "백엔드") menuValue = "back";
    else if (lineValue === "메일") menuValue = "mail";
    else if (lineValue === "결재") menuValue = "payment";
    else menuValue = "front";
    initMenuDisplay(); // 수정: DOMContentLoaded 이벤트 리스너 밖에서 한 번만 등록

	//초기값 설정함수
    function initMenuDisplay() {
		//클릭한 메인메뉴 식별 스타일 지정(굵은)
		fnBtnClickStyle(lineValue);
        
		const submenuToShow = document.querySelectorAll(`#${menuValue} .l_menu_a, #${menuValue} .accordion`);
        submenuToShow.forEach(menu => {
            menu.style.display = 'block';
        });
	
        // 사이드 네비 타이틀 변경
        let side_menu_title = document.getElementById('menu_title');
        side_menu_title.innerText = lineValue;
		
		// 모바일 사이드 네비 초기화 (전부 닫힌 상태 구현)
		const menuIds = ['#front', '#back', '#mail', '#payment'];
		const mobileSideNavArea = document.getElementById('mobile_side_nav_area');

		menuIds.forEach(menuId => {
			const menu = document.querySelector(menuId);
			if (menu) {
				menu.style.display = 'none';
			}
		});

		mobileSideNavArea.style.backgroundColor = "#fff";

    }

    // FnCheckValue 함수는 버튼 클릭 시 호출되는 함수로, 해당 부분은 별도로 수정하지 않았습니다.
});

function FnCheckValue(button) {
    let lineValue = button.value.trim(); // 버튼의 값에서 공백을 제거한 값을 가져옵니다.

    sessionStorage.setItem('lineValue', lineValue); // Store lineValue in session storage


    // 사이드 네비 타이틀 변경
    let side_menu_title = document.getElementById('menu_title');
    side_menu_title.innerText = lineValue;

    let menuValue = ""; // FnCheckValue 내에서 menuValue를 다시 정의

    if (lineValue === "백엔드") menuValue = "back";
    else if (lineValue === "메일") menuValue = "mail";
    else if (lineValue === "결재") menuValue = "payment";
    else menuValue = "front";

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
	
	fnBtnClickStyle(lineValue);
}

//클릭한 메인메뉴 식별 스타일 지정 함수(굵은)
function fnBtnClickStyle(lineValue) {

	// 모든 메뉴 스타일 초기화
    const menuButtons = document.querySelectorAll('.main_nav_menu_btn');
    menuButtons.forEach(btn => {
        btn.style.fontWeight = 'normal'; // 모든 버튼의 스타일을 일반(굵지 않음)으로 설정
    });
	
	 // front-menu id를 가진 인풋 버튼의 값을 가져옵니다.
    const frontMenu = document.querySelectorAll('input[name="front-menu"]');
	const backMenu = document.querySelectorAll('input[name="back-menu"]');
	const mailMenu = document.querySelectorAll('input[name="mail-menu"]');
	const paymentMenu = document.querySelectorAll('input[name="payment-menu"]');
	let clickButton ="";

    if (lineValue === document.getElementById('front-menu').value) {
        clickButton = frontMenu;
    } else if(lineValue ===  document.getElementById('back-menu').value) {
        clickButton = backMenu;
    }
	else if(lineValue === document.getElementById('mail-menu').value) {
        clickButton = mailMenu;
    }
	else if(lineValue === document.getElementById('payment-menu').value) {
        clickButton = paymentMenu;
    }

    // 클릭된 버튼에만 굵은 스타일을 적용
    clickButton.forEach(btnMenu => {
		 btnMenu.style.fontWeight = 'bold';
    });
  

}
