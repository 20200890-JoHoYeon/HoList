document.addEventListener('DOMContentLoaded', function() {
    const itemsPerPage = 5; // 페이지 당 표시할 게시물 수
    let currentPage = 1; // 현재 페이지 번호
   

    function displayData() {
        let tbody = document.getElementById('boardTableBody');
        
        // tbody가 null인지 확인
        if (!tbody) {
            console.error("tbody 요소를 찾을 수 없습니다.");
            return;
        }
        
        tbody.innerHTML = ''; // 기존 행 삭제

        // 현재 페이지에 표시할 데이터 계산
        let startIndex = (currentPage - 1) * itemsPerPage;
        let endIndex = startIndex + itemsPerPage;
        let displayItems = dummyData.slice(startIndex, endIndex);

        // 데이터를 테이블에 추가
        displayItems.forEach(function(data) {
            let row = document.createElement('tr');

            let cell1 = document.createElement('td');
            cell1.textContent = data['번호'];
            row.appendChild(cell1);

            let cell2 = document.createElement('td');
            let titleLink = document.createElement('a');
            titleLink.textContent = data['제목'];
            titleLink.href = '#'; // 실제 링크로 변경 또는 클릭 이벤트 추가
            cell2.appendChild(titleLink);
            row.appendChild(cell2);

            let cell3 = document.createElement('td');
            cell3.textContent = data['작성자'];
            row.appendChild(cell3);

            let cell4 = document.createElement('td');
            cell4.textContent = data['작성일'];
            row.appendChild(cell4);

            tbody.appendChild(row);

            // 제목 링크 클릭 시 이벤트 처리
            titleLink.addEventListener('click', function(event) {
                event.preventDefault();
                let postId = data['번호'];
                console.log('클릭된 게시물 번호:', postId);
                fnCheckMenu('bd_view', postId); // 실제 처리할 동작 추가
                // window.location.href = '/board/webcontent/back_menu/bd_view.asp?id=' + postId;
            });
        });
    }

    function setupPagination() {
        let prevBtn = document.getElementById('prevBtn');
        let nextBtn = document.getElementById('nextBtn');

        // 이전 버튼 클릭 시
        prevBtn.addEventListener('click', function() {
            if (currentPage > 1) {
                currentPage--;
                displayData();
            }
        });

        // 다음 버튼 클릭 시
        nextBtn.addEventListener('click', function() {
            if (currentPage < Math.ceil(dummyData.length / itemsPerPage)) {
                currentPage++;
                displayData();
            }
        });
    }

    // 초기화
    displayData(); // 초기 데이터 표시
    setupPagination(); // 페이지네이션 설정
});
