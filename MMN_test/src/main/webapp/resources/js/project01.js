
function keepClick() {
	var keepImg = document.getElementById("keepImg");
	var str = keepImg.src;
	const arr = str.split("/");

	if (arr[arr.length - 1] == 'keep_btn.png'
			|| arr[arr.length - 1] == 'keep_btn_hover.png') {
		keepImg.src = "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn_sel.png";
	} else {
		keepImg.src = "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn.png";
	}
}

function onHover() {
	var keepImg = document.getElementById("keepImg");
	var str = keepImg.src;
	const arr = str.split("/");

	if (arr[arr.length - 1] == 'keep_btn.png') {
		keepImg.src = "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn_hover.png";
	}
}

function offHover() {
	var keepImg = document.getElementById("keepImg");
	var str = keepImg.src;
	const arr = str.split("/");

	if(arr[arr.length-1] == 'keep_btn.png' || arr[arr.length - 1] == 'keep_btn_hover.png'){
		keepImg.src = "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn.png";		
	}
	else{
		keepImg.src = "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/keep_btn_sel.png";
	}
}