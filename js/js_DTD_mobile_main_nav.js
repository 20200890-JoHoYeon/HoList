function mobileFnCheckValue(button) {
    let line_value = button.value.trim(); // 버튼의 값에서 공백을 제거한 값을 가져옵니다.
	
    sessionStorage.setItem('line_value', line_value); // Store line_value in session storage
	console.log("생성한 메뉴 세션(모바일 메인 네비바 페이지): " + line_value);

    // 사이드 네비 타이틀 변경
    let side_menu_title = document.getElementById('menu_title');
    side_menu_title.innerText = line_value;

    let menu_value = ""; // FnCheckValue 내에서 menu_value를 다시 정의

    if (line_value === "백엔드") menu_value = "back";
    else if (line_value === "메일") menu_value = "mail";
    else if (line_value === "결재") menu_value = "payment";
    else menu_value = "front";

    // 모든 메뉴 스타일 초기화
    const menuButtons = document.querySelectorAll('.main_nav_menu_btn');
    menuButtons.forEach(btn => {
        btn.style.fontWeight = 'normal'; // 모든 버튼의 스타일을 일반(굵지 않음)으로 설정
    });

    // 모든 서브메뉴를 숨깁니다.
    const sub_menus = document.querySelectorAll('.s_menu, .l_menu_a, .accordion');
    sub_menus.forEach(menu => {
        menu.style.display = 'none';
    });


    // line_value에 해당하는 서브메뉴를 표시합니다.
    const sub_menu_to_show = document.querySelectorAll(`#${menu_value} .l_menu_a, #${menu_value} .accordion`);
    sub_menu_to_show.forEach(menu => {
        menu.style.display = 'block';
    });

	//클릭한 메인메뉴 식별 스타일 지정(굵은) js_DTD_main_nav 하단부 위치
	fnBtnClickStyle(line_value);
	//사이드 메뉴 아코디언 속성 추가(모바일 전용)
	mobileFnCheckAccordion(line_value);
}



function mobileFnCheckAccordion(line_value) {
    // front-menu id를 가진 인풋 버튼의 값을 가져옵니다.
    const frontMenu = document.querySelector('#front');
    const backMenu = document.querySelector('#back');
    const mailMenu = document.querySelector('#mail');
    const paymentMenu = document.querySelector('#payment');

    // 해당하는 line_value에 따라 클릭된 메뉴를 설정합니다.
    if (line_value === document.getElementById('front-menu').value) {
        clickmenu = frontMenu;
    } else if (line_value === document.getElementById('back-menu').value) {
        clickmenu = backMenu;
    } else if (line_value === document.getElementById('mail-menu').value) {
        clickmenu = mailMenu;
    } else if (line_value === document.getElementById('payment-menu').value) {
        clickmenu = paymentMenu;
    }

    console.log('clickmenu 변수의 값:', clickmenu);
	let mobileSideNavArea = document.getElementById('mobile_side_nav_area');
	// 모바일 사이드 네비 초기화 (전부 닫힌 상태 구현)

	//클릭된 메뉴에 해당하는 사이드 메뉴를 제외한 나머지 사이드 메뉴 초기화 (네비바 메뉴 이동 시 사이드 바 올바르게 열리는 동작)
	const menuIds = ['#front', '#back', '#mail', '#payment'];
	menuIds.forEach(menuId => {
		if (menuId !== `#${clickmenu.id}`) {
			// 클릭된 메뉴를 제외한 나머지 메뉴 닫기
			let menu = document.querySelector(menuId);
			// 메뉴를 닫는 처리 (예: 특정 클래스 추가 등)
			// 여기서는 닫힌 상태로 예시를 드리겠습니다.
			menu.style.display = 'none'; // 예시: display를 none으로 설정하여 숨김 처리
		}
	});


	mobileSideNavArea.style.backgroundColor = "#fff";
	// mobile_side_nav_area의 배경색 변경
	
    // 클릭된 메뉴 버튼에 대한 토글 기능 구현
    if (clickmenu) {
        if (clickmenu.style.display === 'block') {
            clickmenu.style.display = 'none';
			mobileSideNavArea.style.backgroundColor = "#fff"; 
        } else {
            clickmenu.style.display = 'block';
			mobileSideNavArea.style.backgroundColor = "#333"; 
        }
    }

}
