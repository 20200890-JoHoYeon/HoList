function fnStarScanner(shapeId) {
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
