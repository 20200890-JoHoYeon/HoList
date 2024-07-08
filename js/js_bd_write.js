function cancelFunction() {
	
	if (postId == null) {
		if (confirm("등록을 취소 하시겠습니까?") == false) return false;
	} else {
		if (confirm("수정을 취소 하시겠습니까?") == false) return false;
	}
	fnCheckMenu('bd_list');// 취소 버튼 클릭 시 bd_list.asp 페이지로 이동
}

function regFunction() {
	if (document.querySelector('#txtTitle').value === "") {
		alert("제목을 입력해주세요.");
		document.querySelector('#txtTitle').focus();
		return false;
	} else if (document.querySelector('#txtWriter').value === "") {
		alert("작성자를 입력해주세요.");
		document.querySelector('#txtWriter').focus();
		return false;
	} else if (document.querySelector('#txtMessage').value === "") {
		alert("내용을 입력해주세요.");
		document.querySelector('#txtMessage').focus();
		return false;
	}
	
	if (postId == null) {
		alert("등록되었습니다.");
	} else {
		alert("수정하였습니다.");
	}
	console.log(document.querySelector('#txtTitle').value);
	fnCheckMenu('bd_list');
}
document.addEventListener('DOMContentLoaded', function() {
	//let urlParams = new URLSearchParams(window.location.search);
	//postId = urlParams.get('id');

	console.log("postId:", postId);
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
		document.querySelector('input[name="date"]').style.border = 'none';
		document.querySelector('input[name="date"]').setAttribute('readonly', true);
	}
	else 
	{
		
		
		if (document.querySelector('#date_tr') === null) {
			
			return;
		}
		// #one_value 요소가 존재하지 않을 경우 처리
		document.querySelector('#date_tr').style.display = 'none';
	}

	// h2 태그의 텍스트를 변경하는 부분
	let titleElement = document.getElementById("form_title");
	let btnElement = document.querySelector('input[name="reg_submit"]');
	if (postId != null) {
		titleElement.textContent = "게시글 수정하기";
		btnElement.value="완료"

	} else {
		titleElement.textContent = "게시글 작성d하기";
		btnElement.value="등록"
	}
});
