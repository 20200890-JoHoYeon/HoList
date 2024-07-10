	<span>
		<h2 class="message">Poli 프로젝트 리뷰 팝업 입력</h2>
	</span>
	<p1>인풋 팝업을 통해 작성한 리뷰를 출력하는 로직</p1><br><br>
	<h5>클릭을 통해 인풋 팝업을 나타내고 리뷰를 작성하여 출력</h6><br><br>
	<div id="main_con_area_notis">
		<div class="main_con_area_noti star_con_area pop_con_area">
			<h2 class="message_noti">Poli 프로젝트 리뷰 작성 배너</h2><br>
			<div class="message_noti pop_btn_area">
				<button class="pop_btn" data-tab="project_a" onclick="fntogglePopup('project_a')">
					<img class="pop_img pop_input_img" src="/board/image/pp3.png">
				</button>
			</div><br><br>

			<h2 class="message_noti">Poli 프로젝트 리뷰</h2><br>
			<div id="main_con_area_notis ">
				<div class="main_con_area_noti pop_con_view  " id="introduction">
					<h2 class="message_noti"> # 리뷰 작성 ❗</h2><br>
					<div class="message_noti" id="pop_review_message">
					</div><br><br>
					<h2 class="message_noti"> # 프로젝트 후기 ❗</h2><br>
					<h2 class="message_noti">
					</h2><br>
					<div class="message_noti ">
						Recently, I have also become interested in the backend field, <br> so I am working on projects centered on ASP. 👍 <br>
						And I will study ASP in depth to complete and finish the project 👍 <br>
					</div><br><br>

				</div><br>


				<div class="main_con_area_noti pop_con_view popup" id="project_a">
					<h2 class="message_noti">Poli Project Review</h2><br>
					<div class="message_noti">
						Please write a review of the project
					</div><br><br>
					<h2 class="message_noti"># Feedback Keywords ❓</h2><br>
					<div class="message_noti">
						Front-End: HTML, CSS, JavaScript <br>
						Back-End: JSP
					</div><br><br>
					<h2 class="message_noti"># Writing a Review ❗</h2><br>
					<div class="message_noti">
						<input class="multiply_input multiply_input_long popup_input" type="text" value="" id="one_value" name="one_value">
						<button class="star_btn" onclick="fnOnClickReviewMessage()">작성</button>
					</div><br><br>
				</div>
				
			</div><br><br>
		</div>
	</div>
<!-- Overlay for background click close -->
<div class="popup-overlay" onclick="fncloseAllPopups()"> <span class="popup-close" onclick="fntogglePopup('project_a')">&times;</span></div>
<script src="/board/js/js_front_popupInput.js"></script>