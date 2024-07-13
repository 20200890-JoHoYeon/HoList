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
				function fnCheckMenu(menuName) {
					sessionStorage.setItem('menuName', menuName); 
					console.log("선택한 서브 메뉴 세션(디폴트 페이지): " , menuName);
					let mainConArea = document.getElementById('main_con_area');
					mainConArea.innerHTML = ''; // 초기화
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
					fetch(url)
						.then(response => {
							if (!response.ok) {
								throw new Error('Network response was not ok');
							}
							return response.text();
						})
						.then(content => {
							let mainConArea = document.getElementById('main_con_area');
							mainConArea.innerHTML = '';
							mainConArea.innerHTML = content;

							// Remove existing scripts
							const existingScripts = document.querySelectorAll('body > script');
							existingScripts.forEach(script => script.remove());

							// Execute new scripts
							const scripts = mainConArea.getElementsByTagName('script');
							Array.from(scripts).forEach(script => {
								const newScript = document.createElement('script');
								if (script.src) {
									newScript.src = script.src;
								} else {
									newScript.text = script.innerText;
								}
								document.body.appendChild(newScript);
							});
						})
						.catch(error => {
							console.error('Error fetching content:', error);
						});
				}	
            </script>

        </div>
    </div>
    <!-- 네비바 (최상단 메인 네비바, 사이드 네비바, 모바일 전용 사이드 네비바) -->
    <script src="/board/js/js_DTD_main_nav.js" ></script>
    <script src="/board/js/js_DTD_side_nav.js" ></script>
    <script src="/board/js/js_DTD_mobile_main_nav.js" ></script>
    <!--  백엔드 메뉴 (게시판 더미 데이터, 게시판 공통 사용 변수) -->
    <script src="/board/js/js_bd_value_settings.js" ></script>
	<!--  초기값 설정 스크립트 (네비바 초기값 세팅) -->
    <script src="/board/js/js_Initial_value_settings.js"></script>
</body>
</html>