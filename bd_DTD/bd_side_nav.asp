<div id="main_side_nav_area">
	<!-- 프론트 -->
	<span>
		<h2 class="message">SIDE NAV</h2>
	</span>
	<span>
		<h4 class="message">프론트</h4>
	</span>
	<div>
		<a class="l_menu_a">별모양</a>
		<a class="l_menu_a">구구단</a>
		<a class="l_menu_a">탭메뉴</a>
		<a class="l_menu_a">덧글달기</a>
		<a class="l_menu_a">팝업입력</a>
	</div>
	<br>
	<!-- 백엔드 -->
	<span>
		<h4 class="message">백엔드</h4>
	</span>
	<div>
		<a class="l_menu_a">공지사항</a>
		<a class="l_menu_a">일반게시판</a>
		<a class="l_menu_a">파일게시판</a>
		<a class="l_menu_a">덧글게시판</a>
	</div>
	<br>
	<!-- 메일 -->
	<span>
		<h4 class="message">메일</h4>
	</span>
	<div>
		<a class="l_menu_a">새편지</a>
		<a class="accordion">메일함</a>
		<div class="s_menu">
			<a class="s_menu_a">받은메일</a>
			<a class="s_menu_a">보낸메일</a>
			<a class="s_menu_a">임시보관</a>
			<a class="s_menu_a">스팸메일</a>
			<a class="s_menu_a">휴지통</a>
		</div>
		<a class="accordion">메일보관함</a>
		<div class="s_menu">
			<a class="s_menu_a">보관함 관리</a>
			<a class="s_menu_a">보관함1</a>
			<a class="s_menu_a">보관함2</a>
		</div>
		<a class="accordion">환경설정</a>
		<div class="s_menu">
			<a class="s_menu_a">기본설정</a>
			<a class="s_menu_a">스팸정책</a>
		</div>
	</div>
	<br>
	<!-- 결재 -->
	<span>
		<h4 class="message">결재</h4>
	</span>
	<div>
		<a>전체보기</a>
		<a class="accordion">결재문서</a>
		<div class="s_menu">
			<a class="s_menu_a">새문서</a>
			<a class="s_menu_a">임시저장</a>
			<a class="s_menu_a">상신문서</a>
			<a class="s_menu_a">반려문서</a>
			<a class="s_menu_a">결재대기</a>
		</div>
		<a class="accordion">결재완료함</a>
		<div class="s_menu">
			<a class="s_menu_a">상신완료</a>
			<a class="s_menu_a">결재완료</a>
			<a class="s_menu_a">결재완료(협조)</a>
		</div>
		<a class="accordion">결재문서함</a>
		<div class="s_menu">
			<a class="s_menu_a">문서함 설정</a>
			<a class="s_menu_a">문서함1</a>
			<a class="s_menu_a">문서함2</a>
		</div>
		<a class="accordion">환경설정</a>
		<div class="s_menu">
			<a class="s_menu_a">결재 환경설정</a>
			<a class="s_menu_a">서명등록</a>
			<a class="s_menu_a">비밀번호 설정</a>
		</div>
	</div>
</div>

<script>
    // Get all accordion spans
    const accordions = document.querySelectorAll('.accordion');

    // Add click event listener to each accordion
    accordions.forEach(accordion => {
        accordion.addEventListener('click', function() {
            const submenu = this.nextElementSibling;
            const isActive = submenu.style.display === 'block';

            // Close all open submenus
            accordions.forEach(acc => {
                if (acc !== accordion) {
                    const sub = acc.nextElementSibling;
                    sub.style.display = 'none';
                }
            });

            // Toggle the clicked submenu
            submenu.style.display = isActive ? 'none' : 'block';
        });
    });
</script>