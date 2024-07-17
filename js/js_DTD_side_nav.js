//모든 서브 메뉴들 불러오기
accordions = document.querySelectorAll('.accordion');

//모든 서브 메뉴에 클릭 이벤트 생성 
accordions.forEach(accordion => {

	accordion.addEventListener('click', function() {
			
		const sub_menu = this.nextElementSibling;
		const is_active = sub_menu.style.display === 'block';
		
		//모든 서브메뉴 비활성화(토글 구현)
		accordions.forEach(acc => {
			if (acc !== accordion) {
				const sub = acc.nextElementSibling;
				sub.style.display = 'none';
			}
		});

		//토글된 서브메뉴 활성화(토글 구현)
		sub_menu.style.display = is_active ? 'none' : 'block';
	});
});