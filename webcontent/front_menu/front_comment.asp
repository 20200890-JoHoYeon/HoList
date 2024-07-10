<span>
	<h2 class="message">인턴 과제 덧글입력 게시판</h2>
</span>
<p1>비동기로 구현된 프로젝트 덧글입력 로직</p1><br><br>
<h5>인풋을 통해 작성한 덧글을 출력</h6><br><br>
<div id="main_con_area_notis">
	<div class="main_con_area_noti ">
		<h2 class="message_noti">인턴 과제 게시글</h2><br>
		<div class="message_noti">
				<img class="comment_img" src="/board/image/execl_img.png">
		</div><br><br>

		<h2 class="message_noti">과제 덧글란</h2><br>
		<div id="main_con_area_notis ">
			<div class="main_con_area_noti" id="introduction">

				<h2 class="message_noti"> # 덧글 리스트 ❗</h2><br>
				<div class="message_noti" id="pop_review_message">
				</div><br>
				<div class="message_noti " id="commentList">
				  
				</div>

				<h2 class="message_noti"># 덧글 작성란 ❗</h2><br>
				<div class="message_noti">
					<input class="multiply_input multiply_input_long popup_input" type="text" value="" id="one_value" name="one_value">
					<button class="star_btn" id="add_comment_btn" onclick="fnAddComment()">작성</button>
				</div><br><br>
			</div><br>
		</div><br><br>
	</div>
</div>
<script src="/board/js/js_front_comment.js"></script>

