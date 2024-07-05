<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>탭메뉴</title>
    <link rel="stylesheet" href="/board/css/style.css">   
    <link rel="stylesheet" href="/board/css/front_menu_style.css">
	<script src="/board/js/js_front_tab.js"></script>
</head>
<body>
    <!-- #include virtual = "/board/DTD/main_nav.asp" --> 
    <div id="main">
        <!-- #include virtual = "/board/DTD/main_side_nav.asp" -->
        <div id="main_con_area">
            <span>
                <h2 class="message">포트폴리오 탭 메뉴</h2>
            </span>
            <p1>메뉴를 통해 컨텐츠 레이어를 교체하는 로직</p1><br><br>
            <h5>클릭을 통해 화면에 출력</h6><br><br>
            <div id="main_con_area_notis">
                <div class="main_con_area_noti star_con_area tab_con_area">
                    <h2 class="message_noti">컨텐츠 뷰</h2><br>
                    <div class="message_noti">
                        <button class="tab_btn active" data-tab="introduction" onclick="fntabSChange('introduction')">자기소개</button>
                        <button class="tab_btn" data-tab="stack" onclick="fntabSChange('stack')">기술스택</button>
                        <button class="tab_btn" data-tab="project_a" onclick="fntabSChange('project_a')">프로젝트 - 1</button>
                        <button class="tab_btn" data-tab="project_b" onclick="fntabSChange('project_b')">프로젝트 - 2</button>
                        <button class="tab_btn" data-tab="project_c" onclick="fntabSChange('project_c')">프로젝트 - 3</button>
                        <button class="tab_btn" data-tab="sns" onclick="fntabSChange('sns')">메신저 링크</button>
                    </div><br><br>
                    
                    <div id="main_con_area_notis">
                        <div class="main_con_area_noti tab_con_view" id="introduction">
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
                        </div>
                        <div class="main_con_area_noti tab_con_view" id="stack">
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
                            </div><br>
                        </div>
                        <div class="main_con_area_noti tab_con_view" id="project_a">
                            <h2 class="message_noti">MalaysiaEG</h2><br>
                            <div class="message_noti">
                                Development of the Malaysian English Camp Company's homepage
                            </div><br><br>
                            <h2 class="message_noti">
                                # development stack ❓
                            </h2><br>
                            <div class="message_noti">
                                Front-End: HTML, CSS, JavaScript <br>
                                Back-End: Node.js
                            </div><br><br>
                            <h2 class="message_noti">
                                # MalaysiaEG Project Results ❗
                            </h2><br>
                            <div class="message_noti">
                                MalaysiaEG Project = Complete <br>
                            </div><br><br>
                            <img class="tab_project_img" src="/board/image/pp1.png">
                        </div>
                        <div class="main_con_area_noti tab_con_view" id="project_b">
                            <h2 class="message_noti">wonnytopper</h2><br>
                            <div class="message_noti">
                                Development of the balloon event company's website
                            </div><br><br>
                            <h2 class="message_noti">
                                # development stack ❓
                            </h2><br>
                            <div class="message_noti">
                                Front-End: HTML, CSS, JavaScript <br>
                                Back-End: Node.js
                            </div><br><br>
                            <h2 class="message_noti">
                                # wonnytopper Project Results ❗
                            </h2><br>
                            <div class="message_noti">
                                wonnytopper Project = Complete <br>
                            </div><br><br>
                            <img class="tab_project_img" src="/board/image/pp2.png">
                        </div>
                        <div class="main_con_area_noti tab_con_view" id="project_c">
                            <h2 class="message_noti">poli</h2><br>
                            <div class="message_noti">
                                Development of a website for recording memories consisting of Polaroid pictures Key features include.
                            </div><br><br>
                            <h2 class="message_noti">
                                # development stack ❓
                            </h2><br>
                            <div class="message_noti">
                                Front-End: HTML, CSS, JavaScript <br>
                                Back-End: JSP
                            </div><br><br>
                            <h2 class="message_noti">
                                # poli Project Results ❗
                            </h2><br>
                            <div class="message_noti">
                                poli Project = Complete <br>
                            </div><br><br>
                            <img class="tab_project_img" src="/board/image/pp3.png">
                        </div>
                        <div class="main_con_area_noti tab_con_view" id="sns">
                            <h2 class="message_noti">
                                🧷 Collect links 🔗
                            </h2><br>
                            <div class="message_noti tab_link">
                                <a href="https://akftjd100.tistory.com"><img src="http://img.shields.io/badge/-Tech%20Blog-655ced?style-square&logo=github&link=https://akftjd100.tistory.com"></a>
                                <a href="mailto:akftjd100@gmail.com"><img src="https://img.shields.io/badge/Gmail-d14836?style-square&logo=Gmail&logoColor=white&link=mailto:akftjd100@gmail.com"></a>
                                <a href="https://www.facebook.com/SiLan1129"><img src="https://img.shields.io/badge/-Facebook-1877f2?style-square&logo=facebook&logoColor=white&link=https://www.facebook.com/SiLan1129"></a>
                                <a href="https://www.instagram.com/akftjd100"><img src="https://img.shields.io/badge/-Instagram-dd2a7b?style-square&logo=instagram&logoColor=white&link=https://www.instagram.com/akftjd100"></a>
                                <a href="https://www.instagram.com/hottak_snap"><img src="https://img.shields.io/badge/Instagram-black?style-square&logo=Instagram&link=https://www.instagram.com/hottak1129"></a>
                            </div><br><br>
                        </div>
                        
                        <span>
                            <h2 class="message">세원아토스 사이트</h2>
                        </span>
                        <p1>공식 사이트 바로가기</p1><br><br>

                        <div class="main_con_area_img tab_img_view">
                            <div><a href="https://www.sewonatos.co.kr/"><img src="/board/image/meta_img.jpg"></a></div><br>
                        </div>
                        <div class="main_con_area_img tab_img_view">
                            <div><a href="http://www.sellic.co.kr/"><img src="/board/image/meta_img2.png"></a></div><br>
                        </div>
                    </div><br><br>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
