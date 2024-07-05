<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>레이어팝업</title>
    <link rel="stylesheet" href="/board/css/style.css">   
    <link rel="stylesheet" href="/board/css/front_menu_style.css">
	<script src="/board/js/js_front_popup.js"></script>
</head>
<body>
    <!-- #include virtual = "/board/DTD/main_nav.asp" --> 
    <div id="main">
        <!-- #include virtual = "/board/DTD/main_side_nav.asp" -->
        <div id="main_con_area">
            <span>
                <h2 class="message">포트폴리오 팝업 메뉴</h2>
            </span>
            <p1>배너형 버튼을 통해 레이어 상세 팝업을 출력하는 로직</p1><br><br>
            <h5>클릭을 통해 레이어 팝업으로 출력</h6><br><br>
            <div id="main_con_area_notis">
                <div class="main_con_area_noti star_con_area pop_con_area">
                    <h2 class="message_noti">포트폴리오 팝업 배너</h2><br>
                    <div class="message_noti pop_btn_area">
                        <button class="pop_btn" data-tab="project_a" onclick="fntogglePopup('project_a')">
							<img class="pop_img" src="/board/image/pp1_banner_img.png">
						</button>
                        <button class="pop_btn" data-tab="project_b" onclick="fntogglePopup('project_b')">
							<img class="pop_img" src="/board/image/pp2_banner_img.png">
                        </button>


                    </div><br><br>

					<h2 class="message_noti">프로필 소개 배너</h2><br>
                    <div id="main_con_area_notis ">
                        <div class="main_con_area_noti pop_con_view " id="introduction">
                            <h2 class="message_noti">Introduction</h2><br>
                            <div class="message_noti">
                                👋 Hi, I’m @20200890-JoHoYeon<br>
                                👀 I am currently interested in web development<br>
                                🌱 I'm studying my major knowledge while going to school<br>
                                💞️ I'm going to cooperate on joint development<br>
                                📫 For more information, contact akftjd100@naver.com<br>
                            </div><br><br>
                            <h2 class="message_noti">
                                # Notice ❓
                            </h2><br>
                            <div class="message_noti">
                                Recently, I have also become interested in the backend field, <br> so I am working on projects centered on ASP. 👍 <br>
                                And I will study ASP in depth to complete and finish the project 👍 <br>
                            </div><br><br>
                            
                            <h2 class="message_noti">
                                # My dream ❗
                            </h2><br>
                            <div class="message_noti">
                                Step 1. front-end developer <br>
                                Step 2. back-end developer <br>
                                Step 3. Full Stack Developer
                            </div><br><br>
							<h2 class="message_noti">💻 Tech Stack 💻</h2><br>
                            <div class="message_noti">
                                <img src="https://skillicons.dev/icons?i=html,css,js,react,mysql,figma">
                            </div><br><br>

                            <h2 class="message_noti">
                                # Roadmap 🏃‍♂️
                            </h2><br>
                            <div class="message_noti">
                                FrontEnd  <br><br>
                                 ️1️⃣  JavaScript <br>
                                 2️⃣  React <br>
                                 3️⃣‍  TypeScript <br>
                                 4️⃣  React Native <br>
                                 5️⃣  Next.js <br><br>
                            
                                BackEnd  <br><br>
                                 1️⃣  ASP, JSP <br>
                                 2️⃣  Node.js
                            </div><br><br>
							<h2 class="message_noti">
                                # Recently studied projects 🔖️
                            </h2><br>
							<div class="message_noti">
								말레이시아 영어캠프 프로젝트  <br><br>
								워니토퍼 프로젝트 <br><br>
								폴리 프로젝트			
                            </div><br>


                        <div class="main_con_area_noti pop_con_view popup" id="project_a">
                            
                            <h2 class="message_noti">MalaysiaEG</h2><br>
                            <div class="message_noti">
                                Development of the Malaysian English Camp Company's homepage
                            </div><br><br>
                            <h2 class="message_noti"># development stack ❓</h2><br>
                            <div class="message_noti">
                                Front-End: HTML, CSS, JavaScript <br>
                                Back-End: Node.js
                            </div><br><br>
                            <h2 class="message_noti"># MalaysiaEG Project Results ❗</h2><br>
                            <div class="message_noti">
                                MalaysiaEG Project = Complete <br>
                            </div><br><br>
                            <img class="tab_project_img" src="/board/image/pp1.png">
                        </div>
                        
                        <div class="main_con_area_noti pop_con_view popup" id="project_b">
                            
                            <h2 class="message_noti">wonnytopper</h2><br>
                            <div class="message_noti">
                                Development of the balloon event company's website
                            </div><br><br>
                            <h2 class="message_noti"># development stack ❓</h2><br>
                            <div class="message_noti">
                                Front-End: HTML, CSS, JavaScript <br>
                                Back-End: Node.js
                            </div><br><br>
                            <h2 class="message_noti"># wonnytopper Project Results ❗</h2><br>
                            <div class="message_noti">
                                wonnytopper Project = Complete <br>
                            </div><br><br>
                            <img class="tab_project_img" src="/board/image/pp2.png">
                        </div>
                    </div><br><br>
                </div>
            </div>
        </div>
    </div>

	<!-- Overlay for background click close -->
    <div class="popup-overlay" onclick="fncloseAllPopups()"> <span class="popup-close" onclick="fntogglePopup('project_a')">&times;</span></div>
</body>
</html>
