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
