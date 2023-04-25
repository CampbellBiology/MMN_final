$(document).on('ready', function() {

	$(".center").slick({
		dots : true,
		infinite : true,
		centerMode : true,
		slidesToShow : 7,
		slidesToScroll : 3
	});
});

var selectedColor;

window.onload = function() {
	init();
}

function init() {
//	var backgroundURL = [ "../UI/UI/keep_btn.png", "../UI/storeImgSub/1-2.jpg",
//			"../UI/storeImgSub/1-1.jpg", "../UI/storeImgSub/2-1.jpg",
//			"../UI/storeImgSub/2-2.jpg", "../UI/storeImgSub/2-23jpg",
//			"../UI/storeImgSub/3-1.jpg", "../UI/storeImgSub/3-2.jpg",
//			"../UI/storeImgSub/3-3.jpg", "../UI/storeImgSub/4-1.jpg",
//			"../UI/storeImgSub/4-2.jpg", "../UI/storeImgSub/5-1.jpg",
//			"../UI/storeImgSub/5-2.jpg" ]; // 색상코드를 원하는 만큼 넣어주세요~!

	 var backgroundURL = ["http://192.168.250.44/ImageTest/storeImgSub/abcd.jpg","https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/storeImgSub/1-1.jpg"];

	var tag = "";

	// 배열 길이만큼 div를 동적으로 생성함
	for (i = 0; i < backgroundURL.length; i++) {
		tag += "<img id=" + backgroundURL[i]
				+ " class='colorBox' onclick='colorSet(this)'>";
	}

	// 만들어진 div에 클래스명과 onclick함수 부여
	var colorBox = document.getElementById("colorList");
	document.getElementById("colorList").innerHTML = tag;

	// colorBox.style.backgroundSize = "100%";
	// colorBox.style.backgroundRepeat = "no-repeat";

	// 만들어진 div들을 List로 담기
	var colorBoxList = document.getElementsByClassName("colorBox");

	// 각 배열 요소에 백그라운드 url 부여
	for (i = 0; i < colorBoxList.length; i++) {
		// colorBoxList[i].style.backgroundImage = colorBoxList[i].id;
		var str = colorBoxList[i].id;
		//alert(str);
		colorBoxList[i].src = str;
	}

}

function colorSet(colorPick) {
	// document.querySelector("body").style.backgroundImage = colorPick.id;

	// 메인으로 보여줄 div에 백그라운드 url 동적으로 부여
	document.getElementById("mainImage").style.backgroundImage = `url(${colorPick.id})`;

	// 셀렉트된 div의 url 가져오기
	if (selectedColor != null) {
		document.getElementById(selectedColor).className = document
				.getElementById(selectedColor).className.replace(" selected",
				"");
	}
	document.getElementById(colorPick.id).className += " selected";
	selectedColor = colorPick.id;
}

function show_create_review() {
	document.getElementById("create_riview").style.display = "block";
	document.getElementById("show_btn").style.display = "none";
	document.getElementById("remove_btn").style.display = "block";
}

function remove_create_review() {
	document.getElementById("create_riview").style.display = "none";
	document.getElementById("show_btn").style.display = "block";
	document.getElementById("remove_btn").style.display = "none";
}

function cancel_create_review() {
	alert("작성된 리뷰 내용이 초기화될 수 있습니다. 리뷰 작성을 취소하시겠습니까?");
}
