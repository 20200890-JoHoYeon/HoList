<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="/board/image/h-square.ico">
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>HoList</title>
    <link rel="stylesheet" href="/board/css/style.css">   
    <link rel="stylesheet" href="/board/css/front_menu_style.css">
    <link rel="stylesheet" href="/board/css/back_menu_style.css">
</head>
<body>
    <!-- #include virtual = "/board/DTD/main_nav.asp" --> 
	<!-- #include virtual = "/board/DTD/mobile_side_nav.asp" -->
    <div id="main">
        <!-- #include virtual = "/board/DTD/main_side_nav.asp" -->
        <div id="main_con_area">
            <script>
				// js_DTD_side_nav.js
				function fnCheckMenu(menuName, postId) {
					console.log("PostId(디폴트 페이지): " + postId)
					sessionStorage.setItem('menuName', menuName); 
					console.log("선택한 서브 메뉴 세션(디폴트 페이지): " + menuName);
					let mainConArea = document.getElementById('main_con_area');
					mainConArea.innerHTML = ''; // Clear existing content
					console.log(menuName);
					switch(menuName) {
						case 'front_star':
							loadContent('/board/webcontent/front_menu/front_star.asp');
							break;
						case 'front_multiply':
							loadContent('/board/webcontent/front_menu/front_multiply.asp');
							break;
						case 'front_tab':
							loadContent('/board/webcontent/front_menu/front_tab.asp');
							break;
						case 'front_popup':
							loadContent('/board/webcontent/front_menu/front_popup.asp');
							break;
						case 'front_comment':
							loadContent('/board/webcontent/front_menu/front_comment.asp');
							break;
						case 'front_popupInput':
							loadContent('/board/webcontent/front_menu/front_popupInput.asp');
							break;			
						case 'bd_noti':
							loadContent('/board/webcontent/back_menu/bd_noti.asp');
							break;
						case 'bd_list':
							loadContent('/board/webcontent/back_menu/bd_list.asp');
							break;
						// 게시판 리스트(조회) 내부 메뉴 -> (상세조회) (작성, 수정)
						case 'bd_write':
							loadContent('/board/webcontent/back_menu/bd_write.asp');
							break;
						case 'bd_view':
							loadContent('/board/webcontent/back_menu/bd_view.asp');
							break;
						default:
							loadContent('/board/webcontent/front_menu/front_star.asp');
							break;
						}
					}

					function loadContent(url) {
						let xhr = new XMLHttpRequest();
						xhr.onreadystatechange = function() {
							if (xhr.readyState === XMLHttpRequest.DONE) {
								if (xhr.status === 200) {
									let content = xhr.responseText;
									let mainConArea = document.getElementById('main_con_area');
									mainConArea.innerHTML = ''; 
									let newContent = document.createElement('div');
									newContent.innerHTML = content;
									newContent.classList.add('main_content_div');
									mainConArea.appendChild(newContent);
								} else {
									console.error('Failed to load content: ' + xhr.status);
								}
							}
						};
						xhr.open('GET', url, true);
						xhr.send();
					}

            </script>
        </div>
    </div>
	<!--네비바 (최상단 메인 네비바, 사이드 네비바, 모바일 전용 사이드 네비바)-->
	<script src="/board/js/js_DTD_main_nav.js"></script>
	<script src="/board/js/js_DTD_side_nav.js"></script>
	<script src="/board/js/js_DTD_mobile_main_nav.js"></script>
	<!--백엔드 메뉴 (게시판 더미 데이터, 리스트 조회 페이지, 상세 조회 페이지, 등록 페이지)-->
	<script src="/board/js/js_bd_dummyData.js"></script>
	<script src="/board/js/js_bd_list.js"></script>
	<script src="/board/js/js_bd_view.js"></script>
	<script src="/board/js/js_bd_write.js"></script>
	<!--프론트 메뉴 (별모양 페이지, 구구단 페이지, 탭메뉴 페이지, 레이어팝업 페이지, 덧글달기 페이지, 팝업입력 페이지)-->
	<script src="/board/js/js_front_star.js"></script>
	<script src="/board/js/js_front_multuply.js"></script>
	<script src="/board/js/js_front_tab.js"></script>
	<script src="/board/js/js_front_popup.js"></script>
	<script src="/board/js/js_front_comment.js"></script>
	<script src="/board/js/js_front_popupInput.js"></script>
	<!--초기값 설정 스크립트 (네비바 초기값 세팅)-->
	<script src="/board/js/js_Initial_value_settings.js"></script>
</body>
</html>
