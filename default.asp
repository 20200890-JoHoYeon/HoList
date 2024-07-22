<%
    Dim root
    root = "/board/"
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="<%= root %>image/h-square.ico">
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>HoList</title>
    <link rel="stylesheet" href="<%= root %>css/style.css">   
    <link rel="stylesheet" href="<%= root %>css/front_menu_style.css">
    <link rel="stylesheet" href="<%= root %>css/back_menu_style.css">
</head>
<body>
    <!-- #include virtual = "/board/DTD/main_nav.asp" --> 
	<!-- #include virtual = "/board/DTD/mobile_side_nav.asp" -->
    <div id="main">
        <!-- #include virtual = "/board/DTD/main_side_nav.asp" -->
        <div id="main_con_area">
            <script>
				//함수: main_side_nav(네비게이션바)를 통해 선택된 서브 메뉴의 value 값을 fn_load_content 함수의 매개변수로 전달
				function fnCheckMenu(menu_name) {
					sessionStorage.setItem('menu_name', menu_name); //선택한 서브 메뉴의 value 값을 세션으로 남겨서 페이지 리로드 시에도 해당 페이지를 유지하도록 동작
					switch(menu_name) {
						case 'front_star':
							fn_load_content('<%= root %>webcontent/front_menu/front_star.asp');
							
							break;
						case 'front_multiply':
							fn_load_content('<%= root %>webcontent/front_menu/front_multiply.asp');
			
							break;
						case 'front_tab':
							fn_load_content('<%= root %>webcontent/front_menu/front_tab.asp');
					
							break;
						case 'front_popup':
							fn_load_content('<%= root %>webcontent/front_menu/front_popup.asp');
		
							break;
						case 'front_comment':
							fn_load_content('<%= root %>webcontent/front_menu/front_comment.asp');
					
							break;
						case 'front_popupInput':
							fn_load_content('<%= root %>webcontent/front_menu/front_popupInput.asp');
						
							break;            
						case 'bd_noti':
							fn_load_content('<%= root %>webcontent/back_menu/bd_noti.asp');
							
							break;
						case 'bd_list':
							fn_load_content('<%= root %>webcontent/back_menu/bd_list.asp');
							//document.location.herf = '<%= root %>webcontent/back_menu/bd_list.asp';
		
							break;
						case 'bd_write':
							fn_load_content('<%= root %>webcontent/back_menu/bd_write.asp');
							//document.location.herf = '<%= root %>webcontent/back_menu/bd_write.asp';

							break;
						case 'bd_view':
							fn_load_content('<%= root %>webcontent/back_menu/bd_view.asp');
							//document.location.herf = '<%= root %>webcontent/back_menu/bd_view.asp';
				
							break;
						default:
							fn_load_content('<%= root %>webcontent/front_menu/front_star.asp');
							
							break;
					}
				}

				
				
				
				
				//함수: main_con_area 내부에 자식 요소로 페이지를 생성 
				function fn_load_content(url) {
					fetch(url)
						.then(response => {
							if (!response.ok) {
								throw new Error('Network response was not ok');
							}
							return response.text();
						})
						.then(content => {
							let main_con_area = document.getElementById('main_con_area');
							main_con_area.innerHTML = '';
							main_con_area.innerHTML = content;

							//생성된 content의 내장형 or 외장형(src) 스크립트를 읽어와서 body 하단부에서 실행
							const scripts = main_con_area.getElementsByTagName('script');
							Array.from(scripts).forEach(script => {
								const load_script = document.createElement('script');
								if (script.src) {
									load_script.src = script.src;
								} else {
									load_script.text = script.innerText;
								}
								document.body.appendChild(load_script);
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
    <script src="<%= root %>js/js_DTD_main_nav.js" ></script>
    <script src="<%= root %>js/js_DTD_side_nav.js" ></script>
    <script src="<%= root %>js/js_DTD_mobile_main_nav.js" ></script>
    
	<!--  초기값 설정 스크립트 (네비바 초기값 세팅) -->
    <script src="<%= root %>js/js_Initial_value_settings.js"></script>
</body>
</html>