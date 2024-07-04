<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>구구단</title>
    <link rel="stylesheet" href="/board/css/style.css">   
    <link rel="stylesheet" href="/board/css/front_menu_style.css">
</head>
<body>
    <!-- #include virtual = "/board/DTD/main_nav.asp" --> 
    <div id="main">
        <!-- #include virtual = "/board/DTD/main_side_nav.asp" -->
        <div id="main_con_area">
            <span>
                <h2 class="message">구구단 프로그램</h2>
            </span>
            <p1>n단 출력, n단 ~ m단 출력 기능</p1><br><br>
            <h5>개발자 도구(F12)를 통해 출력</h6><br><br>
            <div id="main_con_area_notis">
                <div class="main_con_area_noti star_con_area">
                    <h2 class="message_noti">n단 출력 (ex: 2 -> 2 x 2 = 4 ··· 2 x 9 = 18)</h2><br>
                    <div class="message_noti">
						<input class="multiply_input multiply_input_long" type="number" value="" id="one_value" name="one_value">
						<button class="star_btn" onclick="FnOnMultiply(document.getElementById('one_value').value)">출력</button>
                    </div><br><br>
                    <h2 class="message_noti">n단 ~ M단 출력 (ex: 2 ~ 5 -> 2 x 2 = 4 ··· 5 x 9 = 45)</h2><br>
                    <div class="message_noti">
						<input class="multiply_input" type="number" value="" id="first_n_value">
						<h2 class="multiply_input_wave">~</h2>
						<input class="multiply_input" type="number" value="" id="last_m_value">
                        <button class="star_btn" onclick="FnMultiply('nm_Multi', document.getElementById('first_n_value').value , document.getElementById('last_m_value').value)">출력</button>
                    </div><br><br>
					<h2 class="message_noti">2단 ~ 9단 출력 (ex: -> 2 x 2 = 4 ··· 9 x 9 = 81)</h2><br>
                    <div class="message_noti">
                        <button class="star_btn star_btn_long" onclick="FnMultiply('two_nine', 2, 9)">2단 ··· 9단 출력</button>
                    </div><br><br>
					<h2 class="message_noti">10단 ~ 19단 출력 (ex: -> 10 x 2 = 20 ··· 19 x 19 = 81)</h2><br>
                    <div class="message_noti">
                        <button class="star_btn star_btn_long" onclick="FnMultiply('ten_nineteen', 10, 19)">10단 ··· 19단 출력</button>
                    </div><br><br>
                </div>
            </div>
        </div>
    </div>
    <script>
		let result = "";
		function FnOnMultiply(oneValue) {
			if(oneValue == "" || oneValue <= 0) {
				alert("잘못된 값을 입력하셨습니다. 다시 입력해주세요");
				oneValue = "";
				document.getElementById('one_value').focus();
				return 0;
			}

			console.log("n단 출력 (ex: 2 -> 2 x 2 = 4 ··· 2 x 9 = 18)");
			// n단 출력 (ex: 2 -> 2 x 2 = 4 ··· 2 x 9 = 18)
			for(let i=2; i<10; i++) {
				result += oneValue + "x" + i + "=" + (oneValue*i) + "\n";
			}
			console.log(result += "\n\n");
			result="";
					
		}
        function FnMultiply(shapeId, startValue, endValue) {
			if(startValue == "" || startValue <= 0) {
				alert("첫 번째 단을 잘못된 값을 입력하셨습니다. 다시 입력해주세요");
				startValue = "";
				document.getElementById('first_n_value').focus();
				return 0;
			}
			else if(endValue == "" || endValue <= 0) {
				alert("두 번째 단을 잘못된 값을 입력하셨습니다. 다시 입력해주세요");
				endValue = "";
				document.getElementById('last_m_value').focus();
				return 0;
			}

            switch (shapeId) {
				case 'nm_Multi':
                    console.log("n단 ~ M단 출력 (ex: 2 ~ 5 -> 2 x 2 = 4 ··· 5 x 9 = 45)");
                    // n단 ~ M단 출력 (ex: 2 ~ 5 -> 2 x 2 = 4 ··· 5 x 9 = 45)
					break;
                case 'two_nine':
                    console.log("2단 ~ 9단 출력 (ex: -> 2 x 2 = 4 ··· 9 x 9 = 81)");
                    // 2단 ~ 9단 출력 (ex: -> 2 x 2 = 4 ··· 9 x 9 = 81)
					break;
                case 'ten_nineteen':
					console.log("10단 ~ 19단 출력 (ex: -> 10 x 2 = 20 ··· 19 x 19 = 81)");
					// 10단 ~ 19단 출력 (ex: -> 10 x 2 = 20 ··· 19 x 19 = 81)
                    break;
            }
			for(let i=2; i<=9; i++) {
				for(let j=startValue; j<=endValue; j++) {
					result += j + "x" + i + "=" + (j*i) + "\t";
				}
				result += "\n"
			}
			console.log(result += "\n\n");
			result="";
        }
    </script>
</body>
</html>
