document.addEventListener('DOMContentLoaded', function() {
    const itemsPerPage = 10; // Number of items to display per page
    let currentPage = 1; // Current page number

    function displayData() {
        let start = (currentPage - 1) * itemsPerPage;
        let end = start + itemsPerPage;
        let paginatedData = dummyData.slice(start, end);

        let tbody = document.getElementById('boardTableBody');
        tbody.innerHTML = ''; // Clear existing rows

        paginatedData.forEach(function(data) {
            let row = document.createElement('tr');
            let cell1 = document.createElement('td');
            cell1.textContent = data['번호'];
            row.appendChild(cell1);

            let cell2 = document.createElement('td');
            let link = document.createElement('a');
            link.textContent = data['제목'];
            link.href = '#'; // Replace with actual link or use click event
            cell2.appendChild(link);
            row.appendChild(cell2);
            
            let cell3 = document.createElement('td');
            cell3.textContent = data['작성자'];
            row.appendChild(cell3);

            let cell4 = document.createElement('td');
            cell4.textContent = data['작성일'];
            row.appendChild(cell4);

            tbody.appendChild(row);

            // Click event for link
            link.addEventListener('click', function(event) {
                event.preventDefault();
                let postId = data['번호'];
                console.log('클릭된 게시물 번호:', postId);
                window.location.href = '/board/webcontent/back_menu/bd_view.asp?id=' + postId;
            });
        });
    }

    function setupPagination() {
        // Previous button
        let prevBtn = document.getElementById('prevBtn');
        prevBtn.addEventListener('click', function() {
            if (currentPage > 1) {
                currentPage--;
                displayData();
            }
        });

        // Next button
        let nextBtn = document.getElementById('nextBtn');
        nextBtn.addEventListener('click', function() {
            if (currentPage < Math.ceil(dummyData.length / itemsPerPage)) {
                currentPage++;
                displayData();
            }
        });
    }

    // Initial setup
    displayData();
    setupPagination();
});
