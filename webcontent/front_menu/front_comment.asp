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
					<input class="multiply_input multiply_input_long popup_input" onkeydown="handleKeyDown(event)" type="text" value="" id="one_value" name="one_value">
					<input class="star_btn" id="add_comment_btn" type="button" onclick="fnAddComment()" value="작성">
				</div><br><br>
			</div><br>
		</div><br><br>
	</div>
</div>
<script>
	function handleKeyDown(event) {
		if (event.key === "Enter") {
			event.preventDefault(); // 엔터 키 기본 동작 방지 (폼 제출 방지)
			fnAddComment();
		}
	}

	function fnAddComment() {
		//작성자 임의로 세션 생성
		let username = "조호연";
		sessionStorage.setItem("username", username);

		let now = new Date();
		let year = now.getFullYear();
		let month = now.getMonth() + 1;
		let date = now.getDate();
		let hours = now.getHours();
		let minutes = now.getMinutes();
		let seconds = now.getSeconds();

		// 시, 분, 초를 두 자리 숫자로 표시하기 위해 필요한 처리
		hours = (hours < 10 ? "0" : "") + hours;
		minutes = (minutes < 10 ? "0" : "") + minutes;
		seconds = (seconds < 10 ? "0" : "") + seconds;   
			 
		 

		// 날짜와 시간 문자열 생성
		dateString = year + "-" + month + "-" + date;
		timeString = hours + ":" + minutes + ":" + seconds;

		let commentInput = document.getElementById("one_value");
		let comment = commentInput.value.trim(); // 앞뒤 공백 제거

		if (comment === "") {
			alert("내용을 입력해주세요.");
			commentInput.focus();
			return;
		}

		let writer = sessionStorage.getItem("username");

		// Create elements for new comment
		let commentElementDiv = document.createElement("div");
		let timeElementDiv = document.createElement("div");
		let writerElementDiv = document.createElement("div");
		let breakElement = document.createElement("br");

		writerElementDiv.textContent = writer;
		timeElementDiv.textContent = dateString + " " + timeString;
		commentElementDiv.textContent = comment;
		commentElementDiv.classList.add("comment");

		// Add elements to comment list
		let commentList = document.getElementById("commentList");
		commentList.appendChild(writerElementDiv);
		commentList.appendChild(timeElementDiv);
		commentList.appendChild(commentElementDiv);
		commentList.appendChild(breakElement);
		commentList.appendChild(breakElement);

		// Clear input field after adding comment
		commentInput.value = "";
		commentInput.focus();
	}
</script>
