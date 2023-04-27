
function keepClick(ii) {
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

function onHover(ii) {
	var keepImg = document.getElementById("keepImg"+ii);
	var str = keepImg.src;
	const arr = str.split("/");

	if (arr[arr.length - 1] == 'star_gray.png') {
		keepImg.src = "https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/star_lightyellow.png";
	}
}

function offHover(ii) {
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

function brandClick(){
	var doc1 = document.getElementById("main_page");
	doc1.src="Main_0427.jsp";
}

function forPopup(storeCode){
	var doc1 = document.getElementById("main_page");
	doc1.src= "Store_0427.jsp?storeCode="+storeCode;
//	var doc1 = document.getElementById("a_store"+ii);
	
//	doc1.href="../../Store.jsp?storeCode="+storeCode;
}