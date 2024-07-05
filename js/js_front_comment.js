//작성자 임의로 세션 생성
let username = "조호연";
sessionStorage.setItem("username", username);

// 1초 간격으로 현재 시간 업데이트
setInterval(displayCurrentTime, 1000);

function displayCurrentTime() {
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
}

document.addEventListener("DOMContentLoaded", function() {
  let commentInput = document.getElementById("one_value");
  commentInput.addEventListener('keypress', function(event) {
    if (event.key === 'Enter') {
      event.preventDefault(); // 기본 동작(폼 제출) 방지
      fnAddComment(); // 작성 버튼 클릭 함수 호출
    }
  });
});


function fnAddComment() {
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