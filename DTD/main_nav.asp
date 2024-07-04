<div id="main_nav_area">
    <h1 class="title main_logo_a"> HOLIST </h1>
    <input class="main_nav_menu main_nav_menu_btn" name="menu" type="button" value="프론트" onclick="FnCheckValue(this)">
    <input class="main_nav_menu main_nav_menu_btn" name="menu" type="button" value="백엔드" onclick="FnCheckValue(this)">
    <input class="main_nav_menu main_nav_menu_btn" name="menu" type="button" value="메일" onclick="FnCheckValue(this)">
    <input class="main_nav_menu main_nav_menu_btn" name="menu" type="button" value="결재" onclick="FnCheckValue(this)">
    <hr>

    <script>
        let lineValue = sessionStorage.getItem('lineValue') || '프론트'; 
		let menuValue = ""; 
		if (lineValue == "백엔드") menuValue = "back";
		else if (lineValue == "메일") menuValue = "mail";
		else if(lineValue == "결재") menuValue = "payment";
		else menuValue = "front";
		
	    document.addEventListener('DOMContentLoaded', function() {
			initMenuDisplay(); 
        });

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

			//사이드 네비 타이틀 변경
			let side_menu_title = document.getElementById('menu_title');
			side_menu_title.innerText = lineValue;
				
        }

        function FnCheckValue(button) {
            let lineValue = button.value.trim(); // 버튼의 값에서 공백을 제거한 값을 가져옵니다.
            
            sessionStorage.setItem('lineValue', lineValue); // Store lineValue in session storage
			
			//사이드 네비 타이틀 변경
			let side_menu_title = document.getElementById('menu_title');
			side_menu_title.innerText = lineValue;

			if (lineValue == "백엔드") menuValue = "back";
			else if (lineValue == "메일") menuValue = "mail";
			else if(lineValue == "결재") menuValue = "payment";
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
    </script>
</div>
