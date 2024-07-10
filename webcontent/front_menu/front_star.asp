<span>
	<h2 class="message">다각형 스캐너</h2>
</span>
<p1>다각형을 콘솔에 찍는 프로그램</p1><br><br>
<h5>개발자 도구(F12)를 통해 출력</h6><br><br>
<div id="main_con_area_notis">
	<div class="main_con_area_noti">
		<h2 class="message_noti">사각형</h2><br>
		<div class="message_noti">
			<button class="star_btn" onclick="fnStarScanner('rectangle')">출력</button>
		</div><br><br>
		<h2 class="message_noti">삼각형 (위)</h2><br>
		<div class="message_noti">
			<button class="star_btn" onclick="fnStarScanner('triangle_top_left')">좌 출력</button>
			<button class="star_btn" onclick="fnStarScanner('triangle_top_center')">중 출력</button>
			<button class="star_btn" onclick="fnStarScanner('triangle_top_right')">우 출력</button>
		</div><br><br>
		<h2 class="message_noti">삼각형 (아래)</h2><br>
		<div class="message_noti">
			<button class="star_btn" onclick="fnStarScanner('triangle_bottom_left')">아래 좌 출력</button>
			<button class="star_btn" onclick="fnStarScanner('triangle_bottom_center')">아래 중 출력</button>
			<button class="star_btn" onclick="fnStarScanner('triangle_bottom_right')">아래 우 출력</button>
		</div><br><br>
		<div class="message_noti">
			<h2 class="message_noti">마름모</h2><br>
			<button class="star_btn" onclick="fnStarScanner('diamond')">사각형 출력</button>
		</div><br><br>
	</div>
</div>
<script src="/board/js/js_front_star.js"></script>