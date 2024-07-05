let result = "";
function fnOnMultiply(oneValue) {
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
function fnMultiply(shapeId, startValue, endValue) {
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