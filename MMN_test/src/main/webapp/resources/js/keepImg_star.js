
function keepClick2(ii) {
	var keepImg = document.getElementById("keepImg"+ii);
	var str = keepImg.src;
	const arr = str.split("/");

	if (arr[arr.length - 1] == 'star_gray.png'
			|| arr[arr.length - 1] == 'star_lightyellow.png') {
		keepImg.src = "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/star_yellow.png";
	} else {
		keepImg.src = "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/star_gray.png";
	}
}

function onHover2(ii) {
	var keepImg = document.getElementById("keepImg"+ii);
	var str = keepImg.src;
	const arr = str.split("/");

	if (arr[arr.length - 1] == 'star_gray.png') {
		keepImg.src = "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/star_lightyellow.png";
	}
}

function offHover2(ii) {
	var keepImg = document.getElementById("keepImg"+ii);
	var str = keepImg.src;
	const arr = str.split("/");

	if(arr[arr.length-1] == 'star_gray.png' || arr[arr.length - 1] == 'star_lightyellow.png'){
		keepImg.src = "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/star_gray.png";		
	}
	else{
		keepImg.src = "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/star_yellow.png";
	}
}

