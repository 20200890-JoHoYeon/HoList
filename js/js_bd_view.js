
function cancelFunction() {
	fnCheckMenu('bd_list');// 취소 버튼 클릭 시 bd_list.asp 페이지로 이동
}
function regFunction() {
	//window.location.href = 'bd_write.asp?id=' + postId; // 등록 버튼 클릭 시 bd_write.asp 페이지로 postId 값 가지고 이동
}
function deleteFunction() {	
	if (confirm("삭제하시겠습니까?") == false) return false;
	fnCheckMenu('bd_list');// 취소 버튼 클릭 시 bd_list.asp 페이지로 이동
}
/*
let = postId; // 문제 있어보임
document.addEventListener('DOMContentLoaded', function() {
	
	// URL에서 id 값을 가져옵니다.
	let urlParams = new URLSearchParams(window.location.search);
	postId = urlParams.get('id');

	// postId로 해당 게시물 데이터를 찾습니다.
	let postData = dummyData.find(function(data) {
		return data['번호'] == postId;
	});
	
	// 만약 해당 게시물 데이터를 찾았다면, 폼에 데이터를 채웁니다.
	if (postData) {
		document.querySelector('input[name="title"]').value = postData['제목'];
		document.querySelector('input[name="date"]').value = postData['작성일'];
		document.querySelector('input[name="writer"]').value = postData['작성자'];
		document.querySelector('textarea[name="detail"]').value = postData['내용'];
		
		document.querySelector('textarea').classList.add("readinput");
		document.querySelectorAll(".view_input").forEach(function(input) {
			input.style.border = "0"; // 예시로 border 스타일 추가
		});
	console.log("postId:", postId);
	}
});
*/