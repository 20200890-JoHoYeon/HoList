<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>별모양</title>
    <link rel="stylesheet" href="/board/css/style.css">   
    <link rel="stylesheet" href="/board/css/front_menu_style.css">
</head>
<body>
    <!-- #include virtual = "/board/DTD/main_nav.asp" --> 
    <div id="main">
        <!-- #include virtual = "/board/DTD/main_side_nav.asp" -->
        <div id="main_con_area">
            <span>
                <h2 class="message">다각형 스캐너</h2>
            </span>
            <p1>다각형을 콘솔에 찍는 프로그램</p1><br><br>
            <h5>개발자 도구(F12)를 통해 출력</h6><br><br>
            <div id="main_con_area_notis">
                <div class="main_con_area_noti star_con_area">
                    <h2 class="message_noti">사각형</h2><br>
                    <div class="message_noti">
                        <button class="star_btn" onclick="FnStarScanner('rectangle')">출력</button>
                    </div><br><br>
                    <h2 class="message_noti">삼각형 (위)</h2><br>
                    <div class="message_noti">
                        <button class="star_btn" onclick="FnStarScanner('triangle_top_left')">좌 출력</button>
                        <button class="star_btn" onclick="FnStarScanner('triangle_top_center')">중 출력</button>
                        <button class="star_btn" onclick="FnStarScanner('triangle_top_right')">우 출력</button>
                    </div><br><br>
                    <h2 class="message_noti">삼각형 (아래)</h2><br>
                    <div class="message_noti">
                        <button class="star_btn" onclick="FnStarScanner('triangle_bottom_left')">아래 좌 출력</button>
                        <button class="star_btn" onclick="FnStarScanner('triangle_bottom_center')">아래 중 출력</button>
                        <button class="star_btn" onclick="FnStarScanner('triangle_bottom_right')">아래 우 출력</button>
                    </div><br><br>
                    <div class="message_noti">
                        <h2 class="message_noti">마름모</h2><br>
                        <button class="star_btn" onclick="FnStarScanner('diamond')">사각형 출력</button>
                    </div><br><br>
                </div>
            </div>
        </div>
    </div>
    <script>
        function FnStarScanner(shapeId) {
			let star="";
            switch (shapeId) {
                case 'rectangle':
                    console.log("사각형 출력");
                    // 여기에 사각형 출력을 위한 코드 추가
					for(let i=0; i<4; i++) {
						star+="****"+"\n"
					}
					console.log(star+"\n");
                    break;
                case 'triangle_top_left':
                    console.log("삼각형 (위) 좌 출력");
                    // 여기에 삼각형 (위) 좌 출력을 위한 코드 추가
					for(let i=0; i<4; i++) {
						star+="*"
						for(let j=0; j<i; j++){
							star+="*"
						}
						star+="\n"
					}
					console.log(star+"\n");
                    break;
                case 'triangle_top_center':
                    console.log("삼각형 (위) 중 출력");
                    // 여기에 삼각형 (위) 중 출력을 위한 코드 추가
					for(let i=0; i<4; i++) {
						for(let j=0; j<Math.abs(i-3); j++){
							star += " ";
						}
						for(let j=0; j<2*i+1; j++){
							star += "*";
						}
						star += "\n";
					}
					console.log(star);
					break;
                case 'triangle_top_right':
				// 여기에 삼각형 (위) 우 출력을 위한 코드 추가
					console.log("삼각형 (위) 우 출력");
					for(let i=0; i<4; i++) {
						for(let j=0; j<3-i; j++){
							star += " ";
						}
						for(let j=0; j<=i; j++){
							star += "*";
						}
						star += "\n";
					}
					console.log(star);
					break;
                case 'triangle_bottom_left':
                    console.log("삼각형 (아래) 좌 출력");
                    // 여기에 삼각형 (아래) 좌 출력을 위한 코드 추가
					for(let i=0; i<4; i++) {
						star+=" "
						for(let j=4; j>i; j--){
							star+="*"
						}
						star+="\n"
					}
					console.log(star+"\n");
                    break;
				case 'triangle_bottom_center':
				// 여기에 삼각형 (아래) 중 출력을 위한 코드 추가
					console.log("삼각형 (아래) 중 출력");
					for(let i=3; i>=0; i--) {
						for(let j=0; j<3-i; j++){
							star += " ";
						}
						for(let j=0; j<2*i+1; j++){
							star += "*";
						}
						star += "\n";
					}
					console.log(star);
					break;
				case 'triangle_bottom_right':
				// 여기에 삼각형 (아래) 우 출력을 위한 코드 추가
					console.log("삼각형 (아래) 우 출력");
					for(let i=0; i<4; i++) {
						for(let j=0; j<i; j++){
							star += " ";
						}
						for(let j=4; j>i; j--){
							star += "*";
						}
						star += "\n";
					}
					console.log(star);
					break;
				case 'diamond':
					console.log("마름모 출력");
					// 윗 부분 삼각형
					for(let i=0; i<4; i++) {
						for(let j=0; j<3-i; j++){
							star += " ";
						}
						for(let j=0; j<2*i+1; j++){
							star += "*";
						}
						star += "\n";
					}
					// 아랫 부분 삼각형
					for(let i=2; i>=0; i--) {
						for(let j=0; j<3-i; j++){
							star += " ";
						}
						for(let j=0; j<2*i+1; j++){
							star += "*";
						}
						star += "\n";
					}
					console.log(star);
					break;
                default:
                    console.log("알 수 없는 형태입니다.");
                    break;
            }
        }
    </script>
</body>
</html>
