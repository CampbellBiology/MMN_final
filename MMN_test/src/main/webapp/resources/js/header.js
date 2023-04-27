
	function sendRequest2() {
		var httpRequest;
		function createRequest() {
			if (window.XMLHttpRequest) { // 익스플로러 7과 그 이상의 버전, 크롬, 파이어폭스, 사파리,
											// 오페라 등
				return new XMLHttpRequest();
			} else { // 익스플로러 6과 그 이하의 버전
				return new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		function receiveResponse() {
			// XMLHttpRequest 객체의 현재 상태가 요청 완료이고, 서버에 문서가 존재하면 받은 데이터를 출력함.
			if (httpRequest.readyState == XMLHttpRequest.DONE
					&& httpRequest.status == 200) {
				document.getElementById("watchlist_popup").innerHTML = httpRequest.responseText;
			}
		}
		httpRequest = createRequest(); // XMLHttpRequest 객체를 생성함.
		httpRequest.onreadystatechange = receiveResponse; // XMLHttpRequest 객체의 현재
															// 상태를 파악함.
		// GET 방식의 비동기식 요청으로 Http 요청을 생성함.
		httpRequest.open("POST", "watchlist_popup.jsp", true);
		httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		httpRequest.send("userID=<%=userID%>"); // Http 요청을 보냄.
		}
		
		

    function show() {
      document.querySelector(".background").className = "background show";
    }

    function close() {
      document.querySelector(".background").className = "background";
    }

    document.querySelector("#watchlist_button").addEventListener("click", show);
    document.querySelector("#close").addEventListener("click", close);

    
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